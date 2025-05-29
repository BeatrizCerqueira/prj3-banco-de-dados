import os
import time
import statistics
import psycopg2
from pathlib import Path
import pandas as pd
from tabulate import tabulate
import sys
import traceback

# Determina o ambiente com base na variável de ambiente CONTEXT
CONTEXT = os.getenv('CONTEXT', 'local')  # Default para 'local' se não definida

if CONTEXT == 'DOCKER':
    DB_HOST = 'prj3-database'
    SUMMARY_PATH_BASE = Path('/app/resultados')
else:
    DB_HOST = 'localhost'
    SUMMARY_PATH_BASE = Path('./avaliacao_de_desempenho/resultados')

SUMMARY_PATH = SUMMARY_PATH_BASE / "resumo.csv"

# Parâmetros de conexão com o banco de dados
DB_PARAMS = {
    'dbname': 'base-de-dados',
    'user': 'usuario',
    'password': '',
    'host': DB_HOST,
    'port': '5432'
}

def read_sql_file(file_path):
    with open(file_path, 'r') as file:
        return file.read()

def execute_query(query, cursor):
    start_time = time.time()
    cursor.execute(query)
    cursor.fetchall()  # Busca todos os resultados para garantir execução completa
    end_time = time.time()
    return end_time - start_time

def measure_query_performance(query_path, num_executions=20):
    query = read_sql_file(query_path)
    execution_times = []

    with psycopg2.connect(**DB_PARAMS) as conn:
        with conn.cursor() as cursor:

            # Medições
            for _ in range(num_executions):
                execution_time = execute_query(query, cursor)
                execution_times.append(execution_time)

            avg_time = statistics.mean(execution_times)
            std_dev = statistics.stdev(execution_times) if len(execution_times) > 1 else 0

            return {
                'query_name': os.path.basename(query_path),
                'avg_time_ms': round(avg_time * 1000, 2),
                'std_dev_ms': round(std_dev * 1000, 2),
                'min_time_ms': round(min(execution_times) * 1000, 2),
                'max_time_ms': round(max(execution_times) * 1000, 2)
            }

def validate_arguments():
    if len(sys.argv) != 2:
        print("Uso: python script.py <nome_da_pasta>")
        sys.exit(1)
    return sys.argv[1]

def setup_output_directory(pasta):
    # O caminho base para 'resultados' dentro do contêiner ou localmente
    if CONTEXT == 'DOCKER':
        base_output_path = Path('/app/resultados')
    else:
        base_output_path = Path('./resultados')

    output_path = base_output_path / pasta / "execucoes.csv"
    output_path.parent.mkdir(parents=True, exist_ok=True)
    return output_path

def get_sql_files():
    # O caminho base para 'sql/consultas' dentro do contêiner ou localmente
    if CONTEXT == 'DOCKER':
        consultas_dir = Path('/app/sql/consultas')
    else:
        consultas_dir = Path('./sql/consultas')
    return sorted(consultas_dir.glob('*.sql'))

def measure_all_queries(sql_files):
    results = []
    for sql_file in sql_files:
        result = measure_query_performance(sql_file)
        if result:
            results.append(result)
    return results

def create_results_dataframe(results):
    df = pd.DataFrame(results)
    return df.sort_values('avg_time_ms', ascending=False)

def display_results(df):
    print("\nResultados de Desempenho das Consultas:")
    print(tabulate(df, headers='keys', tablefmt='psql', showindex=False, floatfmt='.2f'))

def save_results(df, output_path):
    df.to_csv(output_path, index=False)
    print(f"\nResultados foram salvos em '{output_path}'")

def calculate_plan_summary(df, plan_name):
    return {
        'plano': plan_name,
        'media_geral_ms': round(df['avg_time_ms'].mean(), 2),
        'desvio_padrao_geral_ms': round(df['std_dev_ms'].mean(), 2)
    }

def update_summary(summary_data, pasta):
    # Cria DataFrame com o novo resumo
    new_summary = pd.DataFrame([summary_data])

    # Garante que o diretório pai do arquivo de resumo exista
    SUMMARY_PATH.parent.mkdir(parents=True, exist_ok=True)

    # Se o arquivo já existe, lê e concatena
    if SUMMARY_PATH.exists():
        existing_summary = pd.read_csv(SUMMARY_PATH)
        updated_summary = pd.concat([existing_summary, new_summary], ignore_index=True)
    else:
        updated_summary = new_summary

    # Salva o arquivo atualizado
    updated_summary.to_csv(SUMMARY_PATH, index=False)
    print(f"\nResumo atualizado em '{SUMMARY_PATH}'")

def main():
    try:
        pasta = validate_arguments()
        output_path = setup_output_directory(pasta)

        sql_files = get_sql_files()
        results = measure_all_queries(sql_files)

        if not results:
            return

        df = create_results_dataframe(results)
        if not df.empty:
            display_results(df)
            save_results(df, output_path)

            plan_name = os.path.basename(pasta)
            summary_data = calculate_plan_summary(df, plan_name)
            update_summary(summary_data, pasta)
    except Exception as e:
        traceback.print_exc()

if __name__ == "__main__":
    main()
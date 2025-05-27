import os
import time
import statistics
import psycopg2
from pathlib import Path
import pandas as pd
from tabulate import tabulate
import sys

# Parâmetros de conexão com o banco de dados
DB_PARAMS = {
    'dbname': 'base-de-dados',
    'user': 'usuario',
    'password': '',
    'host': 'prj3-database',
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
    
    try:
        with psycopg2.connect(**DB_PARAMS) as conn:
            with conn.cursor() as cursor:
                # Execução de aquecimento
                execute_query(query, cursor)
                
                # Medições reais
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
    except Exception as e:
        print(f"Erro ao executar {query_path}: {str(e)}")
        return None

def validate_arguments():
    if len(sys.argv) != 2:
        print("Uso: python script.py <nome_da_pasta>")
        sys.exit(1)
    return sys.argv[1]

def setup_output_directory(pasta):
    output_path = Path(f"./resultados/{pasta}/execucoes.csv")
    output_path.parent.mkdir(parents=True, exist_ok=True)
    return output_path

def get_sql_files():
    consultas_dir = Path('./consultas')
    return sorted(consultas_dir.glob('*.sql'))

def measure_all_queries(sql_files):
    results = []
    for sql_file in sql_files:
        print(f"Medindo desempenho para {sql_file.name}...")
        result = measure_query_performance(sql_file)
        if result:
            results.append(result)
    return results

def create_results_dataframe(results):
    df = pd.DataFrame(results)
    return df.sort_values('avg_time_ms', ascending=False)

def display_results(df):
    print("\nResultados de Desempenho das Consultas:")
    print(tabulate(df, headers='keys', tablefmt='psql', showindex=False))

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
    summary_path = Path("./resultados/resumo.csv")
    
    # Cria DataFrame com o novo resumo
    new_summary = pd.DataFrame([summary_data])
    
    # Se o arquivo já existe, lê e concatena
    if summary_path.exists():
        existing_summary = pd.read_csv(summary_path)
        updated_summary = pd.concat([existing_summary, new_summary], ignore_index=True)
    else:
        updated_summary = new_summary
    
    # Salva o arquivo atualizado
    updated_summary.to_csv(summary_path, index=False)
    print(f"\nResumo atualizado")

def main():
    pasta = validate_arguments()
    output_path = setup_output_directory(pasta)
    
    sql_files = get_sql_files()
    results = measure_all_queries(sql_files)
    
    df = create_results_dataframe(results)
    display_results(df)
    save_results(df, output_path)
    
    # Gera e salva o resumo
    plan_name = os.path.basename(pasta)
    summary_data = calculate_plan_summary(df, plan_name)
    update_summary(summary_data, pasta)

if __name__ == "__main__":
    main() 
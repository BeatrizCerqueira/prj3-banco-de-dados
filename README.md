# mata60-banco-de-dados

## Descrição
[TODO]

## Modelo de Dados

### Entidades

**Horário (TB_HORARIO)**
- ID_HORARIO (PK)
- CD_DIA_SEMANA
- DH_INICIO
- DH_FIM

**Equipamento (TB_EQUIPAMENTO)**
- ID_EQUIPAMENTO (PK)
- NO_EQUIPAMENTO

**Sala (TB_SALA)**
- ID_SALA (PK)
- CD_SALA
- QT_CAPACIDADE
- IS_ACESSIVEL

**Aluno (TB_ALUNO)**
- ID_ALUNO (PK)
- NO_ALUNO
- IS_PESSOA_COM_DEFICIENCIA

**Professor (TB_PROFESSOR)**
- ID_PROFESSOR (PK)
- NO_PROFESSOR

**Disciplina (TB_DISCIPLINA)**
- ID_DISCIPLINA (PK)
- CD_DISCIPLINA
- NO_DISCIPLINA

**Turma (TB_TURMA)**
- ID_TURMA (PK)
- CD_TURMA
- ID_DISCIPLINA (FK)
- ID_HORARIO (FK)
- ID_PROFESSOR (FK)
- ID_SALA (FK)

### Relacionamentos

**Sala-Equipamento (RL_SALA_EQUIPAMENTO)**
- ID_SALA (FK)
- ID_EQUIPAMENTO (FK)

**Disciplina-Equipamento (RL_DISCIPLINA_EQUIPAMENTO)**
- ID_DISCIPLINA (FK)
- ID_EQUIPAMENTO (FK)

**Turma-Aluno (RL_TURMA_ALUNO)**
- ID_TURMA (FK)
- ID_ALUNO (FK)

## Requisitos/Consultas

### Originais

1. **Gerenciar disciplinas, horários e matrículas**
   * Consultas:
      1. Consultar quantidade de matrículas em uma turma
      2. Consultar horários com mais salas livres

2. **Alocar salas conforme demanda e requisitos técnicos**
   * Consultas:
      1. [Demanda] Consultar capacidade da sala vs número de alunos matriculados
      2. [Requisitos técnicos] Consultar quais salas têm todos os equipamentos necessários para uma disciplina
   * Requisitos estendidos:
      <ol start="3">
         <li>[Demanda] Só permitir matrícula de um aluno em uma turma caso a sala não esteja na capacidade máxima</li>
         <li>[Requisitos técnicos] Só permitir alocação de uma turma em uma sala caso a sala contenha todos os equipamentos necessários para aquela disciplina</li>
      </ol>

3. **Controlar disponibilidade de professores**
   * Consultas:
      1. Consultar horários disponíveis de um professor
      2. Consultar dias da semana com maior carga horária de um professor 
   * Requisitos estendidos:
      <ol start="3">
         <li>Só permitir vincular um professor a uma turma caso ele não tenha outra turma no mesmo horário</li>
      </ol>

4. **Gerenciar equipamentos disponíveis em cada sala**
   * Consultas:
      1. Consultar equipamentos com maior estoque
      2. Consultar disponibilidade de equipamentos em um horário

5. **Gerar relatórios de ocupação**
   * Consultas:
      1. Consultar quantidade de turmas em uma sala
      2. Consultar horários ocupados em uma sala

6. **Evitar conflitos de horário e superlotação**
   * Consultas:
      1. [Conflitos de horário] Consultar horários mais requisitados (com mais turmas alocadas)
      2. [Superlotação] Consultar turmas próximas da capacidade máxima
   * Requisitos estendidos:
      <ol start="3">
         <li>[Conflitos de horário] Só permitir vincular um professor a uma turma caso ele não tenha outra turma no mesmo horário (mesmo que o 3.3)</li>
         <li>[Conflitos de horário] Só permitir matricular um aluno em uma turma caso ele não tenha outra turma no mesmo horário</li>
         <li>[Conflitos de horário] Só permitir alocar uma sala para uma turma caso a sala não tenha outra turma no mesmo horário</li>
         <li>[Superlotação] Só permitir matrícula de um aluno em uma turma caso a sala não esteja na capacidade máxima (mesmo que o 2.3)</li>
      </ol>

### Estendidos

7. **Limitar para que alunos não estejam matriculados em mais de uma turma da mesma disciplina**
   * Consultas:
      1. Consultar disciplinas com múltiplas turmas
      2. Consultar todas as turmas de um aluno
   * Requisitos estendidos:
      <ol start="3">
         <li>Só permitir matrícula de um aluno em uma turma caso ele não esteja matriculado em outra turma da mesma disciplina</li>
      </ol>

8. **Matricular alunos com deficiência apenas em salas com acessibilidade**
   * Consultas:
      1. Consultar disponibilidade de turmas alocadas em salas acessíveis
      2. Consultar porcentagem de alunos com deficiência de uma turma
   * Requisitos estendidos:
      <ol start="3">
         <li>Só permitir matrícula de um aluno com deficiência em uma turma caso ela seja acessível</li>
      </ol>

9. **Gerenciar a distribuição de carga horária dos professores**
   * Consultas:
      1. Consultar carga horária de um professor
      2. Consultar distribuição de disciplinas de um professor

10. **Gerenciar a distribuição de carga horária dos alunos**
   * Consultas:
      1. Consultar carga horária de um aluno
      2. Consultar dias da semana com maior carga horária de um aluno

## Configuração do Banco de Dados

### Requisitos

- Docker
- Docker Compose

### Configuração Inicial

1. Clone o repositório:
```bash
git clone git@github.com:BeatrizCerqueira/mata60-banco-de-dados.git
cd mata60-banco-de-dados
```

2. Inicie o banco de dados usando Docker:
```bash
make run-db
```

Este comando irá:
- Buildar a imagem do PostgreSQL
- Criar e iniciar o container
- Executar os scripts de criação das tabelas
- Popular o banco com dados iniciais

### Executando Consultas

1. Conecte ao banco de dados:
```bash
docker exec -it prj3-database psql -U usuario -d base-de-dados
```

2. No terminal do container que irá abrir, execute a consulta desejada:
```bash
\i /docker-entrypoint-initdb.d/C1_matriculas_por_turma.sql
```
O mesmo se aplica às demais consulta.

### Parâmetros de Conexão

- Host: localhost
- Porta: 5432
- Banco: base-de-dados
- Usuário: usuario
- Senha: (vazia)

### Comandos Úteis

- Iniciar o banco: `make run-db`
- Parar o banco: `make run-down`
- Reiniciar o banco: `make restart`

## Avaliação de Desempenho

Para avaliar o desempenho das consultas SQL, foi criado um script Python que mede o tempo de execução de cada consulta. O script executa cada consulta 20 vezes e calcula estatísticas como tempo médio, desvio padrão, tempo mínimo e máximo.

O script inclui uma execução de aquecimento antes das medições para garantir resultados mais consistentes e trata erros de forma adequada, continuando a medir outras consultas mesmo se uma falhar.

### Requisitos

- Docker
- Docker Compose

### Execução

Para executar a avaliação de desempenho:

```bash
make avaliar-desempenho
```

O script irá:
1. Para cada configuração (sem indexação e planos 1, 2 e 3):
   - Aplicar o plano de indexação (exceto para sem indexação)
   - Executar cada consulta 20 vezes
   - Calcular tempo médio, desvio padrão, tempos mínimo e máximo
   - Salvar os resultados em `resultados/<plano>/execucoes.csv`
2. Gerar resumo comparativo com métricas gerais de cada plano em `resultados/resumo.csv`

### Resultados

Os resultados são salvos em dois arquivos:

1. `execucoes.csv` (em cada pasta de plano):
   - Nome da consulta
   - Tempo médio de execução (em milissegundos)
   - Desvio padrão (em milissegundos)
   - Tempo mínimo de execução (em milissegundos)
   - Tempo máximo de execução (em milissegundos)

2. `resumo.csv` (na pasta resultados):
   - Nome do plano
   - Média geral de tempo de execução
   - Desvio padrão geral


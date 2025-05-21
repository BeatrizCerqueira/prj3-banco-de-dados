## Descrição

## Modelo de Dados

### Entidades

**Alocação**
- ID
- Turma_ID
- Sala_ID
- Horário_ID
- Professor_ID

**Turma**
- ID
- Nome

**Sala**
- ID
- Número/Identificação
- Capacidade
- Acessível (boolean)

**Horário**
- ID
- Dia da Semana
- Horário Início
- Horário Fim

**Professor**
- ID
- Nome
- Horários_Disponíveis (relação muitos-para-muitos com Horário)
- Carga Horária Máxima
- Departamento_ID

**Disciplina**
- ID
- Nome
- Código
- Equipamentos Necessários
- Capacidade Máxima de Alunos
- Departamento_ID

**Departamento**
- ID
- Nome

**Equipamento**
- ID
- Nome
- Sala_ID

**Matrícula**
- ID
- Aluno_ID
- Turma_ID

**Aluno**
- ID
- Nome
- Horários_Disponíveis (relação muitos-para-muitos com Horário)
- Carga Horária Máxima
- É Pessoa Com Deficiência (boolean)


## Requisitos/Queries

### Originais

1. **Gerenciar disciplinas, horários e matrículas**
   1. Consultar quantidade de matrículas em uma turma
   2. Consultar horários com mais salas livres

2. **Alocar salas conforme demanda e requisitos técnicos**
   1. Consultar se uma sala tem todos os equipamentos necessários para uma disciplina
   2. Consultar capacidade da sala vs número de alunos matriculados

3. **Controlar disponibilidade de professores**
   1. Consultar carga horária atual de um professor
   2. Consultar horários disponíveis de um professor

4. **Gerenciar equipamentos disponíveis em cada sala**
   1. Consultar equipamentos com maior estoque
   2. Consultar disponibilidade de equipamentos em um horário

5. **Gerar relatórios de ocupação**
   1. Consultar quantidade de turmas em uma sala
   2. Consultar horários ocupados em uma sala

6. **Evitar conflitos de horário e superlotação**
   1. Consultar horários mais requisitados (com mais turmas alocadas)
   2. Consultar turmas próximas da capacidade máxima

### Estendidos

7. **Limitar alunos para que não estejam matriculados em mais de uma turma da mesma disciplina**
   - Consultar turmas de uma disciplina
   - Consultar alunos matriculados em uma disciplina
   - Verificar se um aluno já está matriculado em outra turma da mesma disciplina
   - Consultar disciplinas com múltiplas turmas

8. **Matricular alunos com deficiência apenas em salas com acessibilidade**
    - Consultar salas acessíveis
    - Consultar alunos com deficiência
    - Consultar turmas em salas acessíveis
    - Consultar disponibilidade de salas acessíveis
    - Consultar distribuição de alunos com deficiência por sala

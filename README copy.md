## Descrição

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

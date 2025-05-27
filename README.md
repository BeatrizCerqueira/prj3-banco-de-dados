# mata60-banco-de-dados

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
   * Queries:
      1. Consultar quantidade de matrículas em uma turma
      2. Consultar horários com mais salas livres

2. **Alocar salas conforme demanda e requisitos técnicos**
   * Queries:
      1. [Demanda] Consultar capacidade da sala vs número de alunos matriculados
      2. [Requisitos técnicos] Consultar quais salas têm todos os equipamentos necessários para uma disciplina
   * Requisitos estendidos:
      <ol start="3">
         <li>[Demanda] Só permitir matrícula de um aluno em uma turma caso a sala não esteja na capacidade máxima</li>
         <li>[Requisitos técnicos] Só permitir alocação de uma turma em uma sala caso a sala contenha todos os equipamentos necessários para aquela disciplina</li>
      </ol>

3. **Controlar disponibilidade de professores**
   * Queries:
      1. Consultar horários disponíveis de um professor
      2. Consultar dias da semana com maior carga horária de um professor 
   * Requisitos estendidos:
      <ol start="3">
         <li>Só permitir vincular um professor a uma turma caso ele não tenha outra turma no mesmo horário</li>
      </ol>

4. **Gerenciar equipamentos disponíveis em cada sala**
   * Queries:
      1. Consultar equipamentos com maior estoque
      2. Consultar disponibilidade de equipamentos em um horário

5. **Gerar relatórios de ocupação**
   * Queries:
      1. Consultar quantidade de turmas em uma sala
      2. Consultar horários ocupados em uma sala

6. **Evitar conflitos de horário e superlotação**
   * Queries:
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
   * Queries:
      1. Consultar disciplinas com múltiplas turmas
      2. Consultar todas as turmas de um aluno
   * Requisitos estendidos:
      <ol start="3">
         <li>Só permitir matrícula de um aluno em uma turma caso ele não esteja matriculado em outra turma da mesma disciplina</li>
      </ol>

8. **Matricular alunos com deficiência apenas em salas com acessibilidade**
   * Queries:
      1. Consultar disponibilidade de turmas alocadas em salas acessíveis
      2. Consultar porcentagem de alunos com deficiência de uma turma
   * Requisitos estendidos:
      <ol start="3">
         <li>Só permitir matrícula de um aluno com deficiência em uma turma caso ela seja acessível</li>
      </ol>

9. **Gerenciar a distribuição de carga horária dos professores**
   * Queries:
      1. Consultar carga horária de um professor
      2. Consultar distribuição de disciplinas de um professor

10. **Gerenciar a distribuição de carga horária dos alunos**
   * Queries:
      1. Consultar carga horária de um aluno
      2. Consultar dias da semana com maior carga horária de um aluno

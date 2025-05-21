## Descrição

## Requisitos

### Originais
1. Gerenciar disciplinas, horários e matrículas.
2. Alocar salas conforme demanda e requisitos técnicos.
3. Controlar disponibilidade de professores.
4. Gerenciar equipamentos disponíveis em cada sala.
5. Gerar relatórios de ocupação.
6. Evitar conflitos de horário e superlotação.

### Estendidos
7. Alocar professores apenas para disciplinas do seu departamento.
8. Limitar alunos para que não estejam matriculados em mais de uma turma da mesma disciplina.
9. Matricular alunos com deficiência apenas em salas com acessibilidade.
10. Controlar mínimo de turmas ofertadas por cada departamento.


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


## Queries

1. **Gerenciar disciplinas, horários e matrículas**
   1. Consultar quantidade de matrículas por turma
   2. Consultar horários com mais salas livres

2. **Alocar salas conforme demanda e requisitos técnicos**
   - Consultar salas disponíveis em um horário específico
   - Consultar se uma sala tem todos os equipamentos necessários para uma disciplina
   - Consultar salas que atendem aos requisitos técnicos de uma disciplina
   - Consultar capacidade da sala vs número de alunos matriculados
   - Consultar alocações de uma sala em um período

3. **Controlar disponibilidade de professores**
   - Consultar horários disponíveis de um professor
   - Consultar carga horária atual de um professor
   - Consultar professores disponíveis em um horário específico
   - Consultar disciplinas que um professor pode lecionar

4. **Gerenciar equipamentos disponíveis em cada sala**
   - Consultar equipamentos de uma sala
   - Consultar salas com um equipamento específico
   - Consultar disponibilidade de equipamentos em um horário
   - Consultar equipamentos necessários vs disponíveis em uma sala

5. **Gerar relatórios de ocupação**
   - Consultar ocupação por sala
   - Consultar ocupação por período
   - Consultar taxa de ocupação
   - Consultar salas mais utilizadas
   - Consultar horários mais demandados
   - Consultar salas subutilizadas

6. **Evitar conflitos de horário e superlotação**
   - Consultar horários já alocados em uma sala
   - Consultar horários já alocados de um professor
   - Consultar horários já alocados de um aluno
   - Consultar lotação atual de uma sala
   - Consultar lotação atual de uma turma
   - Consultar turmas próximas da capacidade máxima

7. **Alocar professores apenas para disciplinas do seu departamento**
   - Consultar disciplinas de um departamento
   - Consultar professores de um departamento
   - Consultar alocações de professores por departamento
   - Verificar se uma alocação respeita a restrição de departamento

8. **Limitar alunos para que não estejam matriculados em mais de uma turma da mesma disciplina**
   - Consultar turmas de uma disciplina
   - Consultar alunos matriculados em uma disciplina
   - Verificar se um aluno já está matriculado em outra turma da mesma disciplina
   - Consultar disciplinas com múltiplas turmas

9. **Matricular alunos com deficiência apenas em salas com acessibilidade**
    - Consultar salas acessíveis
    - Consultar alunos com deficiência
    - Consultar turmas em salas acessíveis
    - Consultar disponibilidade de salas acessíveis
    - Consultar distribuição de alunos com deficiência por sala

10. **Controlar mínimo de turmas ofertadas por cada departamento**
    - Consultar quantidade de turmas ofertadas por departamento
    - Consultar mínimo de turmas definido para cada departamento
    - Verificar se um departamento está atendendo seu mínimo de turmas
    - Consultar disciplinas que podem ser ofertadas para atingir o mínimo
    - Consultar distribuição de turmas por departamento
    - Consultar departamentos abaixo do mínimo de turmas

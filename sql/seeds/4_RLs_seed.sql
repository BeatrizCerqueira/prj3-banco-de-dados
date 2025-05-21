INSERT INTO
    RL_SALA_EQUIPAMENTO (ID_SALA, ID_EQUIPAMENTO)
VALUES
    (1, 1), -- Sala A, Projetor
    (1, 2), -- Sala A, Computador
    (1, 3), -- Sala A, Quadro Branco
    (2, 2), -- Sala B, Computador
    (2, 4), -- Sala B, Microscópio
    (3, 1), -- Sala C, Projetor
    (3, 5), -- Sala C, Tablet
    (4, 2), -- Sala D, Computador
    (4, 3), -- Sala D, Quadro Branco
    (5, 4);

-- Sala E, Microscópio
INSERT INTO
    RL_DISCIPLINA_EQUIPAMENTO (ID_DISCIPLINA, ID_EQUIPAMENTO)
VALUES
    (1, 1), -- Cálculo I, Projetor
    (1, 2), -- Cálculo I, Computador
    (2, 1), -- Cálculo II, Projetor
    (2, 3), -- Cálculo II, Quadro Branco
    (4, 3), -- POO, Quadro Branco
    (4, 5), -- POO, Tablet
    (5, 1), -- BD, Projetor
    (5, 5), -- BD, Tablet
    (6, 2), -- SO, Computador
    (6, 5), -- SO, Tablet
    (7, 3), -- Redes, Quadro Branco
    (7, 2), -- Redes, Computador
    (8, 1), -- Biologia Molecular, Projetor
    (8, 4), -- Biologia Molecular, Microscópio
    (9, 4);

-- Genética, Microscópio
INSERT INTO
    RL_TURMA_ALUNO (ID_TURMA, ID_ALUNO)
VALUES
    (1, 1), -- Turma 1, Ana Costa
    (3, 1), -- Turma 3, Ana Costa
    (2, 2), -- Turma 2, Bruno Lima
    (4, 2), -- Turma 4, Bruno Lima
    (3, 3), -- Turma 3, Carlos Ferreira
    (5, 3), -- Turma 5, Carlos Ferreira
    (4, 4), -- Turma 4, Daniela Oliveira
    (5, 4), -- Turma 5, Daniela Oliveira
    (1, 5), -- Turma 1, Eduardo Lima
    (5, 5), -- Turma 5, Eduardo Lima
    (2, 6), -- Turma 2, Gabriel Oliveira
    (5, 6), -- Turma 5, Gabriel Oliveira
    (3, 7), -- Turma 3, João da Silva
    (4, 7), -- Turma 4, João da Silva
    (1, 8), -- Turma 1, Kauã Oliveira
    (5, 8), -- Turma 5, Kauã Oliveira
    (2, 9), -- Turma 2, Luana Lima
    (5, 9), -- Turma 5, Luana Lima
    (3, 10), -- Turma 3, Maria Oliveira
    (4, 10);

-- Turma 4, Maria Oliveira
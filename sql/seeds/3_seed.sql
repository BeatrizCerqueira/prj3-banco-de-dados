INSERT INTO
    TB_EQUIPAMENTO (NO_EQUIPAMENTO)
VALUES
    ('Projetor'),
    ('Computador'),
    ('Quadro Branco'),
    ('Microscópio'),
    ('Tablet'),
    ('Impressora');

INSERT INTO
    TB_DISCIPLINA (CD_DISCIPLINA, NO_DISCIPLINA)
VALUES
    ('MAT-101', 'Cálculo I'),
    ('MAT-102', 'Cálculo II'),
    ('MAT-103', 'Cálculo III'),
    ('CMP-101', 'Programação Orientada a Objetos'),
    ('CMP-102', 'Banco de Dados'),
    ('CMP-103', 'Sistemas Operacionais'),
    ('CMP-104', 'Redes de Computadores'),
    ('BIO-101', 'Biologia Molecular'),
    ('BIO-102', 'Genética');

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
    TB_SALA (CD_SALA, QT_CAPACIDADE, IS_ACESSIVEL)
VALUES
    ('SALA-A', 3, FALSE),
    ('SALA-B', 4, FALSE),
    ('SALA-C', 5, TRUE),
    ('SALA-D', 6, TRUE),
    ('SALA-E', 7, TRUE),
    ('SALA-F', 8, TRUE),
    ('SALA-G', 9, TRUE),
    ('SALA-H', 10, TRUE);

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
    TB_HORARIO (CD_DIA_SEMANA, DH_INICIO, DH_FIM)
VALUES
    ('SEGUNDA', '10:00:00', '12:00:00'),
    ('SEGUNDA', '13:00:00', '15:00:00'),
    ('QUARTA', '16:00:00', '18:00:00'),
    ('SEXTA', '19:00:00', '21:00:00');

INSERT INTO
    TB_PROFESSOR (NO_PROFESSOR)
VALUES
    ('Ana Souza'),
    ('Beatriz Lima'),
    ('Carlos Silva'),
    ('Daniela Oliveira');

INSERT INTO
    TB_ALUNO (NO_ALUNO, IS_PESSOA_COM_DEFICIENCIA)
VALUES
    ('Ana Costa', TRUE),
    ('Bruno Lima', TRUE),
    ('Carlos Ferreira', TRUE),
    ('Daniela Oliveira', TRUE),
    ('Eduardo Lima', FALSE),
    ('Gabriel Oliveira', FALSE),
    ('João da Silva', FALSE),
    ('Kauã Oliveira', FALSE),
    ('Luana Lima', FALSE),
    ('Maria Oliveira', FALSE),
    ('Pedro Santos', FALSE),
    ('Rafaela Oliveira', FALSE),
    ('Samuel Costa', FALSE),
    ('Thiago Lima', FALSE),
    ('Vanessa Souza', FALSE);

INSERT INTO
    TB_TURMA (
        CD_TURMA,
        ID_DISCIPLINA,
        ID_HORARIO,
        ID_PROFESSOR,
        ID_SALA
    )
VALUES
    ('TURMA-001', 1, 1, 1, 1), -- Turma 1, Cálculo I, SEG 10:00-12:00, Ana Souza, Sala A
    ('TURMA-002', 1, 2, 1, 2), -- Turma 2, Cálculo I, SEG 13:00-15:00, Ana Souza, Sala B
    ('TURMA-003', 2, 3, 2, 3), -- Turma 3, Cálculo II, QUA 16:00-18:00, Beatriz Lima, Sala C
    ('TURMA-004', 4, 4, 2, 3), -- Turma 4, POO, SEX 19:00-21:00, Beatriz Lima, Sala D
    ('TURMA-005', 4, 1, 3, 4), -- Turma 5, POO, SEG 10:00-12:00, Carlos Silva, Sala E
    ('TURMA-006', 4, 2, 3, 4), -- Turma 6, POO, SEG 13:00-15:00, Carlos Silva, Sala F
    ('TURMA-007', 8, 3, 2, 1), -- Turma 7, Biologia Molecular, QUA 16:00-18:00, Beatriz Lima, Sala A
    ('TURMA-008', 9, 1, 1, 2);

-- Turma 8, Cálculo I, SEG 10:00-12:00, Ana Souza, Sala B
INSERT INTO
    RL_TURMA_ALUNO (ID_TURMA, ID_ALUNO)
VALUES
    (1, 1), -- Turma 1, Ana Costa
    (3, 1), -- Turma 3, Ana Costa
    (1, 2), -- Turma 1, Bruno Lima
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
    -- (1, 8), -- Turma 1, Kauã Oliveira // Problema de superlotação!
    (5, 8), -- Turma 5, Kauã Oliveira
    (2, 9), -- Turma 2, Luana Lima
    (5, 9), -- Turma 5, Luana Lima
    (3, 10), -- Turma 3, Maria Oliveira
    (4, 10);

-- Turma 4, Maria Oliveira
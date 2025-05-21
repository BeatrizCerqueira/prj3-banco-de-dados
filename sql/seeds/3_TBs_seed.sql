INSERT INTO
    TB_HORARIO (CD_DIA_SEMANA, DH_INICIO, DH_FIM)
VALUES
    ('SEGUNDA', '10:00:00', '12:00:00'),
    ('SEGUNDA', '13:00:00', '15:00:00'),
    ('QUARTA', '16:00:00', '18:00:00'),
    ('SEXTA', '19:00:00', '21:00:00');

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
    TB_PROFESSOR (NO_PROFESSOR)
VALUES
    ('Ana Souza'),
    ('Beatriz Lima'),
    ('Carlos Silva'),
    ('Daniela Oliveira');

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
    TB_TURMA (CD_TURMA, ID_DISCIPLINA, ID_HORARIO, ID_PROFESSOR, ID_SALA)
VALUES
    ('TURMA-001', 1, 1, 1, 1), -- Turma 1, Cálculo I, SEG 10:00-12:00, Ana Souza, Sala A
    ('TURMA-002', 1, 2, 1, 1), -- Turma 2, Cálculo I, SEG 13:00-15:00, Ana Souza, Sala B
    ('TURMA-003', 2, 3, 2, 2), -- Turma 3, Cálculo II, QUA 16:00-18:00, Beatriz Lima, Sala C
    ('TURMA-004', 4, 4, 2, 2), -- Turma 4, POO, SEX 19:00-21:00, Beatriz Lima, Sala D
    ('TURMA-005', 4, 1, 3, 3), -- Turma 5, POO, SEG 10:00-12:00, Carlos Silva, Sala E
    ('TURMA-006', 4, 2, NULL, 4), -- Turma 6, POO, SEG 13:00-15:00, Sem Professor, Sala F
    ('TURMA-007', 8, 3, 2, NULL), -- Turma 7, Biologia Molecular, QUA 16:00-18:00, Beatriz Lima, Sem Sala
    ('TURMA-008', 9, 1, NULL, NULL); -- Turma 8, Cálculo I, SEG 10:00-12:00, Sem Professor, Sem Sala
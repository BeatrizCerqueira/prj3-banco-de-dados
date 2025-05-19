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
    TB_PROFESSOR (NO_PROFESSOR)
VALUES
    ('Ana Souza'),
    ('Beatriz Lima'),
    ('Carlos Silva');

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
    TB_TURMA (CD_TURMA)
VALUES
    ('TURMA-001'),
    ('TURMA-002'),
    ('TURMA-003'),
    ('TURMA-004'),
    ('TURMA-005'),
    ('TURMA-006');

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
    TB_HORARIO (CD_DIA_SEMANA, DH_INICIO, DH_FIM)
VALUES
    ('SEGUNDA', '10:00:00', '12:00:00'),
    ('SEGUNDA', '13:00:00', '15:00:00'),
    ('QUARTA', '16:00:00', '18:00:00'),
    ('SEXTA', '19:00:00', '21:00:00');

INSERT INTO
    TB_DEPARTAMENTO (NO_DEPARTAMENTO, QT_MINIMA_TURMAS)
VALUES
    ('Departamento de Exatas', 2),
    ('Departamento de Computação', 3),
    ('Departamento de Biologia', 1);
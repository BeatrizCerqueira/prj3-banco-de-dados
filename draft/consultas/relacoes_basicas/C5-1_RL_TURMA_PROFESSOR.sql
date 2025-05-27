-- Consulta para visualizar os professores de cada turma
SELECT
    t.CD_TURMA as Turma,
    p.NO_PROFESSOR as Professor
FROM
    TB_TURMA t
    LEFT JOIN TB_PROFESSOR p ON t.ID_PROFESSOR = p.ID_PROFESSOR
ORDER BY
    t.CD_TURMA,
    p.NO_PROFESSOR;
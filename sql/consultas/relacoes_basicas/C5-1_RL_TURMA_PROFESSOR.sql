-- Consulta para visualizar os professores de cada turma
SELECT
    t.CD_TURMA as Turma,
    p.NO_PROFESSOR as Professor
FROM
    TB_TURMA t
    LEFT JOIN RL_PROFESSOR_TURMA rpt ON t.ID_TURMA = rpt.ID_TURMA
    LEFT JOIN TB_PROFESSOR p ON p.ID_PROFESSOR = rpt.ID_PROFESSOR
ORDER BY
    t.CD_TURMA,
    p.NO_PROFESSOR;
-- Consulta para visualizar as turmas de cada professor
SELECT
    p.NO_PROFESSOR as Professor,
    t.CD_TURMA as Turma
FROM
    TB_PROFESSOR p
    LEFT JOIN RL_PROFESSOR_TURMA rpt ON p.ID_PROFESSOR = rpt.ID_PROFESSOR
    LEFT JOIN TB_TURMA t ON t.ID_TURMA = rpt.ID_TURMA
ORDER BY
    p.NO_PROFESSOR,
    t.CD_TURMA;
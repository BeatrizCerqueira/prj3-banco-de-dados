-- Consulta para visualizar as turmas lecionadas por cada professor
SELECT
    p.NO_PROFESSOR as Professor,
    t.CD_TURMA as Turma
FROM
    TB_PROFESSOR p
    LEFT JOIN TB_TURMA t ON p.ID_PROFESSOR = t.ID_PROFESSOR
ORDER BY
    p.NO_PROFESSOR,
    t.CD_TURMA;
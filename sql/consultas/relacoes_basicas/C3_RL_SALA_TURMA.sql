-- Consulta para visualizar as turmas alocadas em cada sala
SELECT
    s.CD_SALA as Sala,
    t.CD_TURMA as Turma
FROM
    TB_SALA s
    LEFT JOIN TB_TURMA t ON s.ID_SALA = t.ID_SALA
ORDER BY
    s.CD_SALA,
    t.CD_TURMA; 
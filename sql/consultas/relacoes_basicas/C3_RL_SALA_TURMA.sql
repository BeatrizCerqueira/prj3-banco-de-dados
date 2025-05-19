-- Consulta para visualizar as turmas alocadas em cada sala
SELECT
    s.CD_SALA as Sala,
    t.CD_TURMA as Turma
FROM
    TB_SALA s
    LEFT JOIN RL_SALA_TURMA rst ON s.ID_SALA = rst.ID_SALA
    LEFT JOIN TB_TURMA t ON t.ID_TURMA = rst.ID_TURMA
ORDER BY
    s.CD_SALA,
    t.CD_TURMA; 
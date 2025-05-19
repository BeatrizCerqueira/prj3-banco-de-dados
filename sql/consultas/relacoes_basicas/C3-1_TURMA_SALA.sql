-- Consulta para visualizar as salas alocadas para cada turma
SELECT
    t.CD_TURMA as Turma,
    s.CD_SALA as Sala
FROM
    TB_TURMA t
    LEFT JOIN RL_SALA_TURMA rst ON t.ID_TURMA = rst.ID_TURMA
    LEFT JOIN TB_SALA s ON s.ID_SALA = rst.ID_SALA
ORDER BY
    t.CD_TURMA,
    s.CD_SALA; 
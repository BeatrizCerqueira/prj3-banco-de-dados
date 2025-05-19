-- Consulta para visualizar as salas alocadas para cada turma
SELECT
    t.CD_TURMA as Turma,
    s.CD_SALA as Sala
FROM
    TB_TURMA t
    LEFT JOIN TB_SALA s ON t.ID_SALA = s.ID_SALA
ORDER BY
    t.CD_TURMA,
    s.CD_SALA; 
-- Consulta para visualizar as salas de cada equipamento
SELECT
    e.NO_EQUIPAMENTO as Equipamento,
    s.CD_SALA as Sala
FROM
    TB_EQUIPAMENTO e
    LEFT JOIN RL_SALA_EQUIPAMENTO rse ON e.ID_EQUIPAMENTO = rse.ID_EQUIPAMENTO
    LEFT JOIN TB_SALA s ON s.ID_SALA = rse.ID_SALA
ORDER BY
    e.NO_EQUIPAMENTO,
    s.CD_SALA;
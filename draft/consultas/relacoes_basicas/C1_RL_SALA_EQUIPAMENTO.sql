-- Consulta para visualizar os equipamentos disponíveis em cada sala
SELECT
    s.CD_SALA as Sala,
    e.NO_EQUIPAMENTO as Equipamento
FROM
    TB_SALA s
    LEFT JOIN RL_SALA_EQUIPAMENTO rse ON s.ID_SALA = rse.ID_SALA
    LEFT JOIN TB_EQUIPAMENTO e ON e.ID_EQUIPAMENTO = rse.ID_EQUIPAMENTO
ORDER BY
    s.CD_SALA,
    e.NO_EQUIPAMENTO;
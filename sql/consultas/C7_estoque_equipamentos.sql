-- Requisito 4.1: Consultar equipamentos com maior estoque
SELECT
    e.NO_EQUIPAMENTO as equipamento,
    COUNT(DISTINCT s.ID_SALA) as total_salas,
    STRING_AGG (s.CD_SALA, ', ') as salas
FROM
    TB_EQUIPAMENTO e
    JOIN RL_SALA_EQUIPAMENTO rse ON rse.ID_EQUIPAMENTO = e.ID_EQUIPAMENTO
    JOIN TB_SALA s ON s.ID_SALA = rse.ID_SALA
GROUP BY
    e.NO_EQUIPAMENTO
ORDER BY
    total_salas DESC,
    e.NO_EQUIPAMENTO;
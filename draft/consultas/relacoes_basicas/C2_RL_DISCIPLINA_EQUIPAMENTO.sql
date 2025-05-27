-- Consulta para visualizar os equipamentos necessários para cada disciplina
SELECT
    d.CD_DISCIPLINA as Codigo,
    d.NO_DISCIPLINA as Disciplina,
    e.NO_EQUIPAMENTO as Equipamento
FROM
    TB_DISCIPLINA d
    LEFT JOIN RL_DISCIPLINA_EQUIPAMENTO rde ON d.ID_DISCIPLINA = rde.ID_DISCIPLINA
    LEFT JOIN TB_EQUIPAMENTO e ON e.ID_EQUIPAMENTO = rde.ID_EQUIPAMENTO
ORDER BY
    d.CD_DISCIPLINA,
    e.NO_EQUIPAMENTO;
-- Consulta para visualizar as disciplinas de cada equipamento
SELECT
    e.NO_EQUIPAMENTO as Equipamento,
    d.CD_DISCIPLINA as Codigo,
    d.NO_DISCIPLINA as Disciplina
FROM
    TB_EQUIPAMENTO e
    LEFT JOIN RL_DISCIPLINA_EQUIPAMENTO rde ON e.ID_EQUIPAMENTO = rde.ID_EQUIPAMENTO
    LEFT JOIN TB_DISCIPLINA d ON d.ID_DISCIPLINA = rde.ID_DISCIPLINA
ORDER BY
    e.NO_EQUIPAMENTO,
    d.CD_DISCIPLINA; 
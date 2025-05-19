-- Consulta para visualizar os departamentos de cada disciplina
SELECT
    disc.CD_DISCIPLINA as Codigo,
    disc.NO_DISCIPLINA as Disciplina,
    d.NO_DEPARTAMENTO as Departamento
FROM
    TB_DISCIPLINA disc
    LEFT JOIN RL_DEPARTAMENTO_DISCIPLINA rdd ON disc.ID_DISCIPLINA = rdd.ID_DISCIPLINA
    LEFT JOIN TB_DEPARTAMENTO d ON d.ID_DEPARTAMENTO = rdd.ID_DEPARTAMENTO
ORDER BY
    disc.CD_DISCIPLINA,
    d.NO_DEPARTAMENTO; 
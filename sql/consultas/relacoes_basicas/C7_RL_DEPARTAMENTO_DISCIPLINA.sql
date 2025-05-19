-- Consulta para visualizar as disciplinas de cada departamento
SELECT
    d.NO_DEPARTAMENTO as Departamento,
    disc.CD_DISCIPLINA as Codigo,
    disc.NO_DISCIPLINA as Disciplina
FROM
    TB_DEPARTAMENTO d
    LEFT JOIN RL_DEPARTAMENTO_DISCIPLINA rdd ON d.ID_DEPARTAMENTO = rdd.ID_DEPARTAMENTO
    LEFT JOIN TB_DISCIPLINA disc ON disc.ID_DISCIPLINA = rdd.ID_DISCIPLINA
ORDER BY
    d.NO_DEPARTAMENTO,
    disc.CD_DISCIPLINA; 
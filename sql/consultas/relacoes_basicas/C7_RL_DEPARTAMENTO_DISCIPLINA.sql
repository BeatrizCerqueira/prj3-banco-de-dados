-- Consulta para visualizar as disciplinas de cada departamento
SELECT
    d.NO_DEPARTAMENTO as Departamento,
    disc.CD_DISCIPLINA as Codigo,
    disc.NO_DISCIPLINA as Disciplina
FROM
    TB_DEPARTAMENTO d
    LEFT JOIN TB_DISCIPLINA disc ON d.ID_DEPARTAMENTO = disc.ID_DEPARTAMENTO
ORDER BY
    d.NO_DEPARTAMENTO,
    disc.CD_DISCIPLINA; 
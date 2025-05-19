-- Consulta para visualizar os departamentos de cada disciplina
SELECT
    disc.CD_DISCIPLINA as Codigo,
    disc.NO_DISCIPLINA as Disciplina,
    d.NO_DEPARTAMENTO as Departamento
FROM
    TB_DISCIPLINA disc
    LEFT JOIN TB_DEPARTAMENTO d ON disc.ID_DEPARTAMENTO = d.ID_DEPARTAMENTO
ORDER BY
    disc.CD_DISCIPLINA,
    d.NO_DEPARTAMENTO; 
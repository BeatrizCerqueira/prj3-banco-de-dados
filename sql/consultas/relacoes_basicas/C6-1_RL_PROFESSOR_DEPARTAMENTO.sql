-- Consulta para visualizar o departamento de cada professor
SELECT
    p.NO_PROFESSOR as Professor,
    d.NO_DEPARTAMENTO as Departamento
FROM
    TB_PROFESSOR p
    LEFT JOIN TB_DEPARTAMENTO d ON p.ID_DEPARTAMENTO = d.ID_DEPARTAMENTO
ORDER BY
    p.NO_PROFESSOR,
    d.NO_DEPARTAMENTO; 
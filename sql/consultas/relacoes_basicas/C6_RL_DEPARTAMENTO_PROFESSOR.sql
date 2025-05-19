-- Consulta para visualizar os professores de cada departamento
SELECT
    d.NO_DEPARTAMENTO as Departamento,
    p.NO_PROFESSOR as Professor
FROM
    TB_DEPARTAMENTO d
    LEFT JOIN TB_PROFESSOR p ON d.ID_DEPARTAMENTO = p.ID_DEPARTAMENTO
ORDER BY
    d.NO_DEPARTAMENTO,
    p.NO_PROFESSOR; 
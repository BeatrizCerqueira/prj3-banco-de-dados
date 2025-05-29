-- Requisito 3.2: Consultar dias da semana com maior carga horária de um professor
WITH
    carga_total_professor AS (
        SELECT
            p.ID_PROFESSOR,
            COUNT(DISTINCT t.ID_TURMA) * 2 as carga_total
        FROM
            TB_PROFESSOR p
            LEFT JOIN TB_TURMA t ON p.ID_PROFESSOR = t.ID_PROFESSOR
        GROUP BY
            p.ID_PROFESSOR
    )
SELECT
    p.NO_PROFESSOR as professor,
    h.CD_DIA_SEMANA as dia_semana,
    COUNT(DISTINCT t.ID_TURMA) * 2 as carga_horaria_dia,
    STRING_AGG (DISTINCT d.NO_DISCIPLINA, ', ') as disciplinas,
    ROUND(
        (
            COUNT(DISTINCT t.ID_TURMA) * 2.0 / NULLIF(ctp.carga_total, 0)
        ) * 100,
        2
    ) as porcentagem_carga_dia
FROM
    TB_PROFESSOR p
    LEFT JOIN TB_TURMA t ON p.ID_PROFESSOR = t.ID_PROFESSOR
    LEFT JOIN TB_DISCIPLINA d ON t.ID_DISCIPLINA = d.ID_DISCIPLINA
    LEFT JOIN TB_HORARIO h ON t.ID_HORARIO = h.ID_HORARIO
    LEFT JOIN carga_total_professor ctp ON p.ID_PROFESSOR = ctp.ID_PROFESSOR
GROUP BY
    p.NO_PROFESSOR,
    h.CD_DIA_SEMANA,
    ctp.carga_total
ORDER BY
    p.NO_PROFESSOR,
    carga_horaria_dia DESC;

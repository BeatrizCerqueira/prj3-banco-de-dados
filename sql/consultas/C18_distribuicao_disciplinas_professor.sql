-- Requisito 9.2: Consultar distribuição de disciplinas de um professor
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
    d.NO_DISCIPLINA as disciplina,
    COUNT(t.ID_TURMA) as quantidade_turmas,
    ROUND(
        (
            COUNT(t.ID_TURMA) * 2.0 / NULLIF(ctp.carga_total, 0)
        ) * 100,
        2
    ) as porcentagem_carga_horaria
FROM
    TB_PROFESSOR p
    JOIN TB_TURMA t ON p.ID_PROFESSOR = t.ID_PROFESSOR
    JOIN TB_DISCIPLINA d ON t.ID_DISCIPLINA = d.ID_DISCIPLINA
    JOIN carga_total_professor ctp ON p.ID_PROFESSOR = ctp.ID_PROFESSOR
GROUP BY
    p.NO_PROFESSOR,
    d.NO_DISCIPLINA,
    ctp.carga_total
ORDER BY
    p.NO_PROFESSOR,
    porcentagem_carga_horaria DESC;

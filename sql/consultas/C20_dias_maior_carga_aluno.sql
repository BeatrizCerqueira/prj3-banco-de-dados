-- Requisito 10.2: Consultar dias da semana com maior carga horária de um aluno
WITH
    carga_total_aluno AS (
        SELECT
            a.ID_ALUNO,
            COUNT(DISTINCT t.ID_TURMA) * 2 as carga_total
        FROM
            TB_ALUNO a
            LEFT JOIN RL_TURMA_ALUNO rta ON a.ID_ALUNO = rta.ID_ALUNO
            LEFT JOIN TB_TURMA t ON rta.ID_TURMA = t.ID_TURMA
        GROUP BY
            a.ID_ALUNO
    )
SELECT
    a.NO_ALUNO as aluno,
    h.CD_DIA_SEMANA as dia_semana,
    COUNT(DISTINCT t.ID_TURMA) * 2 as carga_horaria_dia,
    STRING_AGG (DISTINCT d.NO_DISCIPLINA, ', ') as disciplinas,
    ROUND(
        (
            COUNT(DISTINCT t.ID_TURMA) * 2.0 / NULLIF(cta.carga_total, 0)
        ) * 100,
        2
    ) as porcentagem_carga_dia
FROM
    TB_ALUNO a
    LEFT JOIN RL_TURMA_ALUNO rta ON a.ID_ALUNO = rta.ID_ALUNO
    LEFT JOIN TB_TURMA t ON rta.ID_TURMA = t.ID_TURMA
    LEFT JOIN TB_DISCIPLINA d ON t.ID_DISCIPLINA = d.ID_DISCIPLINA
    LEFT JOIN TB_HORARIO h ON t.ID_HORARIO = h.ID_HORARIO
    LEFT JOIN carga_total_aluno cta ON a.ID_ALUNO = cta.ID_ALUNO
GROUP BY
    a.NO_ALUNO,
    h.CD_DIA_SEMANA,
    cta.carga_total
ORDER BY
    a.NO_ALUNO,
    carga_horaria_dia DESC;

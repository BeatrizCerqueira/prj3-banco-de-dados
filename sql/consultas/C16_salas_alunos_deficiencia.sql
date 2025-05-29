-- Requisito 8.2: Consultar porcentagem de alunos com deficiência de uma turma
SELECT
    t.CD_TURMA,
    d.CD_DISCIPLINA,
    d.NO_DISCIPLINA,
    COUNT(rta.ID_ALUNO) as QT_TOTAL_ALUNOS,
    COUNT(
        CASE
            WHEN a.IS_PESSOA_COM_DEFICIENCIA = true THEN 1
        END
    ) as QT_ALUNOS_DEFICIENCIA,
    ROUND(
        (
            CAST(
                COUNT(
                    CASE
                        WHEN a.IS_PESSOA_COM_DEFICIENCIA = true THEN 1
                    END
                ) AS numeric
            ) / NULLIF(COUNT(rta.ID_ALUNO), 0)
        ) * 100,
        2
    ) as PORCENTAGEM_ALUNOS_DEFICIENCIA
FROM
    TB_TURMA t
    JOIN TB_DISCIPLINA d ON t.ID_DISCIPLINA = d.ID_DISCIPLINA
    LEFT JOIN RL_TURMA_ALUNO rta ON t.ID_TURMA = rta.ID_TURMA
    LEFT JOIN TB_ALUNO a ON rta.ID_ALUNO = a.ID_ALUNO
GROUP BY
    t.CD_TURMA,
    d.CD_DISCIPLINA,
    d.NO_DISCIPLINA
ORDER BY
    PORCENTAGEM_ALUNOS_DEFICIENCIA DESC NULLS LAST,
    d.CD_DISCIPLINA;

-- Requisito 6.2: [Superlotação] Consultar turmas próximas da capacidade máxima
SELECT
    t.CD_TURMA as turma,
    s.CD_SALA as sala,
    s.QT_CAPACIDADE as capacidade_sala,
    COUNT(DISTINCT rta.ID_ALUNO) as alunos_matriculados,
    s.QT_CAPACIDADE - COUNT(DISTINCT rta.ID_ALUNO) as vagas_disponiveis,
    ROUND(
        (
            COUNT(DISTINCT rta.ID_ALUNO)::numeric / NULLIF(s.QT_CAPACIDADE, 0)
        ) * 100,
        2
    ) as percentual_ocupacao
FROM
    TB_TURMA t
    LEFT JOIN TB_SALA s ON t.ID_SALA = s.ID_SALA
    LEFT JOIN RL_TURMA_ALUNO rta ON t.ID_TURMA = rta.ID_TURMA
GROUP BY
    t.CD_TURMA,
    s.CD_SALA,
    s.QT_CAPACIDADE
ORDER BY
    percentual_ocupacao DESC NULLS LAST;
-- Requisito 5.2: Consultar horários ocupados em uma sala
SELECT
    s.CD_SALA as sala,
    h.CD_DIA_SEMANA as dia_semana,
    h.DH_INICIO as hora_inicio,
    h.DH_FIM as hora_fim,
    CASE
        WHEN t.ID_TURMA IS NULL THEN 'Livre'
        ELSE 'Ocupada'
    END as status,
    COUNT(DISTINCT rta.ID_ALUNO) as quantidade_alunos
FROM
    TB_SALA s
    CROSS JOIN TB_HORARIO h
    LEFT JOIN TB_TURMA t ON s.ID_SALA = t.ID_SALA
    AND t.ID_HORARIO = h.ID_HORARIO
    LEFT JOIN RL_TURMA_ALUNO rta ON t.ID_TURMA = rta.ID_TURMA
GROUP BY
    s.CD_SALA,
    h.CD_DIA_SEMANA,
    h.DH_INICIO,
    h.DH_FIM,
    t.ID_TURMA
ORDER BY
    s.CD_SALA,
    h.CD_DIA_SEMANA,
    h.DH_INICIO;
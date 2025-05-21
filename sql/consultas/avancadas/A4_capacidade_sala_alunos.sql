-- Requisito 2.2: Consultar capacidade da sala vs número de alunos matriculados
SELECT
    s.CD_SALA,
    h.CD_DIA_SEMANA,
    h.DH_INICIO,
    h.DH_FIM,
    s.QT_CAPACIDADE,
    COUNT(rta.ID_ALUNO) as alunos_matriculados,
    s.QT_CAPACIDADE - COUNT(rta.ID_ALUNO) as vagas_disponiveis
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
    s.QT_CAPACIDADE
ORDER BY
    s.CD_SALA,
    h.CD_DIA_SEMANA,
    h.DH_INICIO;
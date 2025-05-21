-- Requisito 2.2: Consultar capacidade da sala vs número de alunos matriculados
SELECT
    s.CD_SALA,
    h.CD_DIA_SEMANA,
    h.DH_INICIO,
    h.DH_FIM,
    t.CD_TURMA,
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
    t.CD_TURMA,
    s.QT_CAPACIDADE
ORDER BY
    s.CD_SALA,
    CASE h.CD_DIA_SEMANA
        WHEN 'SEGUNDA' THEN 1
        WHEN 'TERCA' THEN 2
        WHEN 'QUARTA' THEN 3
        WHEN 'QUINTA' THEN 4
        WHEN 'SEXTA' THEN 5
        WHEN 'SABADO' THEN 6
        WHEN 'DOMINGO' THEN 7
    END,
    h.DH_INICIO,
    t.CD_TURMA;
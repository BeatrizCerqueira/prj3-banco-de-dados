-- Requisito 6.1: Consultar horários mais requisitados (com mais turmas alocadas)
SELECT
    h.CD_DIA_SEMANA as dia_semana,
    h.DH_INICIO as hora_inicio,
    h.DH_FIM as hora_fim,
    COUNT(DISTINCT t.ID_TURMA) as quantidade_turmas,
    STRING_AGG (DISTINCT t.CD_TURMA, ', ') as turmas
FROM
    TB_HORARIO h
    LEFT JOIN TB_TURMA t ON h.ID_HORARIO = t.ID_HORARIO
GROUP BY
    h.CD_DIA_SEMANA,
    h.DH_INICIO,
    h.DH_FIM
ORDER BY
    quantidade_turmas DESC;
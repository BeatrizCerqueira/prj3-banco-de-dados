-- Consulta para visualizar as turmas de cada horário
SELECT
    h.CD_DIA_SEMANA as Dia,
    h.DH_INICIO as Inicio,
    h.DH_FIM as Fim,
    t.CD_TURMA as Turma
FROM
    TB_HORARIO h
    LEFT JOIN RL_TURMA_HORARIO rth ON h.ID_HORARIO = rth.ID_HORARIO
    LEFT JOIN TB_TURMA t ON t.ID_TURMA = rth.ID_TURMA
ORDER BY
    h.CD_DIA_SEMANA,
    h.DH_INICIO,
    t.CD_TURMA; 
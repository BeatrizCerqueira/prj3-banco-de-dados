-- Consulta para visualizar os horários de cada turma
SELECT
    t.CD_TURMA as Turma,
    h.CD_DIA_SEMANA as Dia,
    h.DH_INICIO as Inicio,
    h.DH_FIM as Fim
FROM
    TB_TURMA t
    LEFT JOIN RL_TURMA_HORARIO rth ON t.ID_TURMA = rth.ID_TURMA
    LEFT JOIN TB_HORARIO h ON h.ID_HORARIO = rth.ID_HORARIO
ORDER BY
    t.CD_TURMA,
    h.CD_DIA_SEMANA,
    h.DH_INICIO; 
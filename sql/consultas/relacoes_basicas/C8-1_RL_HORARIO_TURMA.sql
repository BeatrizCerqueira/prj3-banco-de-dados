-- Consulta para visualizar as turmas de cada horário
SELECT
    h.CD_DIA_SEMANA as Dia,
    h.DH_INICIO as Inicio,
    h.DH_FIM as Fim,
    t.CD_TURMA as Turma
FROM
    TB_HORARIO h
    LEFT JOIN TB_TURMA t ON h.ID_HORARIO = t.ID_HORARIO
ORDER BY
    h.CD_DIA_SEMANA,
    h.DH_INICIO,
    t.CD_TURMA; 
-- Requisito 4.2: Consultar disponibilidade de equipamentos em um horário
WITH salas_disponiveis AS (
    SELECT 
        e.ID_EQUIPAMENTO,
        e.NO_EQUIPAMENTO,
        h.CD_DIA_SEMANA,
        h.DH_INICIO,
        h.DH_FIM,
        s.CD_SALA,
        CASE 
            WHEN t.ID_TURMA IS NULL THEN 'Sim'
            ELSE 'Não'
        END as disponivel
    FROM 
        TB_EQUIPAMENTO e
        JOIN RL_SALA_EQUIPAMENTO rse ON rse.ID_EQUIPAMENTO = e.ID_EQUIPAMENTO
        JOIN TB_SALA s ON s.ID_SALA = rse.ID_SALA
        CROSS JOIN TB_HORARIO h
        LEFT JOIN TB_TURMA t ON t.ID_SALA = s.ID_SALA 
            AND t.ID_HORARIO = h.ID_HORARIO
)
SELECT 
    NO_EQUIPAMENTO as equipamento,
    CD_DIA_SEMANA as dia_semana,
    DH_INICIO as hora_inicio,
    DH_FIM as hora_fim,
    COUNT(DISTINCT CD_SALA) as total_salas_com_equipamento,
    COUNT(CASE WHEN disponivel = 'Sim' THEN 1 END) as total_salas_disponiveis,
    STRING_AGG(
        CASE 
            WHEN disponivel = 'Sim' THEN CD_SALA 
        END,
        ', '
    ) as salas_disponiveis
FROM 
    salas_disponiveis
GROUP BY 
    NO_EQUIPAMENTO,
    CD_DIA_SEMANA,
    DH_INICIO,
    DH_FIM
ORDER BY 
    NO_EQUIPAMENTO,
    CD_DIA_SEMANA,
    DH_INICIO;
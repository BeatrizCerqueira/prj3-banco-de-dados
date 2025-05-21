-- Requisito 1.2: Consultar horários com mais salas livres
SELECT 
    h.CD_DIA_SEMANA,
    h.DH_INICIO,
    h.DH_FIM,
    COUNT(s.ID_SALA) as total_salas,
    COUNT(t.ID_TURMA) as salas_ocupadas,
    COUNT(s.ID_SALA) - COUNT(t.ID_TURMA) as salas_livres,
    STRING_AGG(
        CASE 
            WHEN t.ID_TURMA IS NULL THEN s.CD_SALA 
        END,
        ', '
    ) as salas_livres_lista
FROM 
    TB_HORARIO h
    CROSS JOIN TB_SALA s
    LEFT JOIN TB_TURMA t ON s.ID_SALA = t.ID_SALA AND h.ID_HORARIO = t.ID_HORARIO
GROUP BY 
    h.CD_DIA_SEMANA,
    h.DH_INICIO,
    h.DH_FIM
ORDER BY 
    salas_livres DESC;
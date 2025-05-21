-- Requisito 3.1: Consultar carga horária atual de um professor
SELECT 
    p.NO_PROFESSOR as professor,
    COALESCE(COUNT(DISTINCT t.ID_HORARIO) * 2, 0) as carga_horaria
FROM 
    TB_PROFESSOR p
    LEFT JOIN TB_TURMA t ON p.ID_PROFESSOR = t.ID_PROFESSOR
GROUP BY 
    p.NO_PROFESSOR
ORDER BY 
    p.NO_PROFESSOR; 
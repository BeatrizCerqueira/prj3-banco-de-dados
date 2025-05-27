-- Consulta para visualizar a disciplina de cada turma
SELECT 
    t.CD_TURMA as Turma,
    d.CD_DISCIPLINA as Codigo_Disciplina,
    d.NO_DISCIPLINA as Nome_Disciplina
FROM 
    TB_TURMA t
    LEFT JOIN TB_DISCIPLINA d ON t.ID_DISCIPLINA = d.ID_DISCIPLINA
ORDER BY 
    t.CD_TURMA;
-- Consulta para visualizar as turmas de cada disciplina
SELECT 
    d.CD_DISCIPLINA as Codigo_Disciplina,
    d.NO_DISCIPLINA as Nome_Disciplina,
    t.CD_TURMA as Turma
FROM 
    TB_DISCIPLINA d
    LEFT JOIN TB_TURMA t ON d.ID_DISCIPLINA = t.ID_DISCIPLINA
ORDER BY 
    d.CD_DISCIPLINA,
    t.CD_TURMA;
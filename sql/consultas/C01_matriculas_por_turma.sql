-- Requisito 1.1: Consultar quantidade de matrículas em uma turma
SELECT
    t.CD_TURMA as Turma,
    d.CD_DISCIPLINA as Codigo_Disciplina,
    d.NO_DISCIPLINA as Nome_Disciplina,
    COUNT(rta.ID_ALUNO) as Total_Matriculas
FROM
    TB_TURMA t
    JOIN TB_DISCIPLINA d ON t.ID_DISCIPLINA = d.ID_DISCIPLINA
    LEFT JOIN RL_TURMA_ALUNO rta ON t.ID_TURMA = rta.ID_TURMA
    LEFT JOIN TB_ALUNO a ON rta.ID_ALUNO = a.ID_ALUNO
GROUP BY
    t.CD_TURMA,
    d.CD_DISCIPLINA,
    d.NO_DISCIPLINA
ORDER BY
    t.CD_TURMA;

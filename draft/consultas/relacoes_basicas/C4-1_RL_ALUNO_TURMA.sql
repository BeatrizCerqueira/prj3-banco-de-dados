-- Consulta para visualizar as turmas em que cada aluno está matriculado
SELECT
    a.NO_ALUNO as Aluno,
    t.CD_TURMA as Turma
FROM
    TB_ALUNO a
    LEFT JOIN RL_TURMA_ALUNO rta ON a.ID_ALUNO = rta.ID_ALUNO
    LEFT JOIN TB_TURMA t ON t.ID_TURMA = rta.ID_TURMA
ORDER BY
    a.NO_ALUNO,
    t.CD_TURMA; 
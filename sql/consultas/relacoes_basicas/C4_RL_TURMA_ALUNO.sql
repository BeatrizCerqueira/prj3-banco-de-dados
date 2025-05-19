-- Consulta para visualizar os alunos matriculados em cada turma
SELECT
    t.CD_TURMA as Turma,
    a.NO_ALUNO as Aluno
FROM
    TB_TURMA t
    LEFT JOIN RL_TURMA_ALUNO rta ON t.ID_TURMA = rta.ID_TURMA
    LEFT JOIN TB_ALUNO a ON a.ID_ALUNO = rta.ID_ALUNO
ORDER BY
    t.CD_TURMA,
    a.NO_ALUNO; 
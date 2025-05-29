-- Requisito 7.1: Consultar disciplinas com múltiplas turmas
SELECT
    d.CD_DISCIPLINA,
    d.NO_DISCIPLINA,
    COUNT(t.ID_TURMA) as QT_TURMAS,
    STRING_AGG (DISTINCT t.CD_TURMA, ', ') as turmas,
    COUNT(DISTINCT rta.ID_ALUNO) as total_alunos_matriculados
FROM
    TB_DISCIPLINA d
    LEFT JOIN TB_TURMA t ON d.ID_DISCIPLINA = t.ID_DISCIPLINA
    LEFT JOIN RL_TURMA_ALUNO rta ON t.ID_TURMA = rta.ID_TURMA
GROUP BY
    d.CD_DISCIPLINA,
    d.NO_DISCIPLINA
ORDER BY
    COUNT(t.ID_TURMA) DESC,
    d.CD_DISCIPLINA;

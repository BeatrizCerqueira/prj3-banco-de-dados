-- Requisito 10.1: Consultar carga horária de um aluno
SELECT
    a.NO_ALUNO as aluno,
    COUNT(DISTINCT t.ID_TURMA) as quantidade_turmas,
    COUNT(DISTINCT t.ID_TURMA) * 2 as carga_horaria_semanal,
    STRING_AGG (DISTINCT d.NO_DISCIPLINA, ', ') as disciplinas
FROM
    TB_ALUNO a
    LEFT JOIN RL_TURMA_ALUNO rta ON a.ID_ALUNO = rta.ID_ALUNO
    LEFT JOIN TB_TURMA t ON rta.ID_TURMA = t.ID_TURMA
    LEFT JOIN TB_DISCIPLINA d ON t.ID_DISCIPLINA = d.ID_DISCIPLINA
GROUP BY
    a.NO_ALUNO
ORDER BY
    carga_horaria_semanal DESC;
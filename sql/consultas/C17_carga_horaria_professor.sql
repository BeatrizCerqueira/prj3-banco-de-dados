-- Requisito 9.1: Consultar carga horária de um professor
SELECT
    p.NO_PROFESSOR as professor,
    COALESCE(COUNT(DISTINCT t.ID_TURMA), 0) as quantidade_turmas,
    COALESCE(COUNT(DISTINCT t.ID_TURMA) * 2, 0) as carga_horaria_semanal,
    STRING_AGG(DISTINCT d.NO_DISCIPLINA, ', ') as disciplinas
FROM
    TB_PROFESSOR p
    LEFT JOIN TB_TURMA t ON p.ID_PROFESSOR = t.ID_PROFESSOR
    LEFT JOIN TB_DISCIPLINA d ON t.ID_DISCIPLINA = d.ID_DISCIPLINA
GROUP BY
    p.NO_PROFESSOR
ORDER BY
    carga_horaria_semanal DESC; 
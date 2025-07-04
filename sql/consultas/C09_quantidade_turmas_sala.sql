-- Requisito 5.1: Consultar quantidade de turmas por sala
SELECT
    s.CD_SALA as sala,
    COUNT(DISTINCT t.ID_TURMA) as quantidade_turmas,
    STRING_AGG (DISTINCT t.CD_TURMA, ', ') as turmas,
    STRING_AGG (DISTINCT d.NO_DISCIPLINA, ', ') as disciplinas
FROM
    TB_SALA s
    LEFT JOIN TB_TURMA t ON s.ID_SALA = t.ID_SALA
    LEFT JOIN TB_DISCIPLINA d ON t.ID_DISCIPLINA = d.ID_DISCIPLINA
GROUP BY
    s.CD_SALA
ORDER BY
    s.CD_SALA;

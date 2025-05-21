-- Requisito 2.1: Consultar capacidade da sala vs número de alunos matriculados
SELECT
    s.CD_SALA,
    t.CD_TURMA,
    s.QT_CAPACIDADE,
    COUNT(rta.ID_ALUNO) as alunos_matriculados,
    s.QT_CAPACIDADE - COUNT(rta.ID_ALUNO) as vagas_disponiveis
FROM
    TB_SALA s
    LEFT JOIN TB_TURMA t ON s.ID_SALA = t.ID_SALA
    LEFT JOIN RL_TURMA_ALUNO rta ON t.ID_TURMA = rta.ID_TURMA
GROUP BY
    s.CD_SALA,
    t.CD_TURMA,
    s.QT_CAPACIDADE
ORDER BY
    s.CD_SALA,
    t.CD_TURMA;
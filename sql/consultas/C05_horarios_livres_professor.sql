-- Requisito 3.2: Consultar horários disponíveis de um professor
WITH
    contagem_alunos AS (
        SELECT
            t.ID_TURMA,
            COUNT(m.ID_ALUNO) as total_alunos
        FROM
            TB_TURMA t
            LEFT JOIN RL_TURMA_ALUNO m ON m.ID_TURMA = t.ID_TURMA
        GROUP BY
            t.ID_TURMA
    )
SELECT
    p.NO_PROFESSOR as professor,
    h.CD_DIA_SEMANA as dia_semana,
    h.DH_INICIO as hora_inicio,
    h.DH_FIM as hora_fim,
    CASE
        WHEN t.ID_TURMA IS NULL THEN 'Sim'
        ELSE 'Não'
    END as disponivel,
    CASE
        WHEN t.ID_TURMA IS NOT NULL THEN t.CD_TURMA
        ELSE NULL
    END as turma,
    COALESCE(c.total_alunos, 0) as alunos_matriculados
FROM
    TB_PROFESSOR p
    CROSS JOIN TB_HORARIO h
    LEFT JOIN TB_TURMA t ON t.ID_PROFESSOR = p.ID_PROFESSOR
    AND t.ID_HORARIO = h.ID_HORARIO
    LEFT JOIN contagem_alunos c ON c.ID_TURMA = t.ID_TURMA
ORDER BY
    p.NO_PROFESSOR,
    h.CD_DIA_SEMANA,
    h.DH_INICIO;

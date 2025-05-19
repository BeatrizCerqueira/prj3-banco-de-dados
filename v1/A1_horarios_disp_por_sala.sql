-- Consulta de Horários Disponíveis de uma Sala
WITH
    TURMAS_OCUPANDO AS (
        SELECT
            RTS.ID_SALA,
            RTH.ID_HORARIO,
            STRING_AGG (T.CD_TURMA, ', ') AS TURMA
        FROM
            RL_TURMA_SALA RTS
            JOIN TB_TURMA T ON RTS.ID_TURMA = T.ID_TURMA
            JOIN RL_TURMA_HORARIO RTH ON T.ID_TURMA = RTH.ID_TURMA
        GROUP BY
            RTS.ID_SALA,
            RTH.ID_HORARIO
    )
SELECT
    S.CD_SALA,
    H.CD_DIA_SEMANA,
    H.DH_INICIO,
    H.DH_FIM,
    CASE
        WHEN EXISTS (
            SELECT
                1
            FROM
                TURMAS_OCUPANDO TO2
            WHERE
                TO2.ID_SALA = S.ID_SALA
                AND TO2.ID_HORARIO = H.ID_HORARIO
        ) THEN 'Ocupada'
        ELSE 'Disponível'
    END AS STATUS_SALA,
    (
        SELECT
            TO2.TURMA
        FROM
            TURMAS_OCUPANDO TO2
        WHERE
            TO2.ID_SALA = S.ID_SALA
            AND TO2.ID_HORARIO = H.ID_HORARIO
    ) AS TURMA_OCUPANDO
FROM
    TB_SALA S
    CROSS JOIN TB_HORARIO H
ORDER BY
    S.CD_SALA,
    CASE H.CD_DIA_SEMANA
        WHEN 'SEG' THEN 1
        WHEN 'TER' THEN 2
        WHEN 'QUA' THEN 3
        WHEN 'QUI' THEN 4
        WHEN 'SEX' THEN 5
        WHEN 'SAB' THEN 6
        WHEN 'DOM' THEN 7
    END,
    H.DH_INICIO;
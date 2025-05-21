-- Requisito 2.2: Consultar se uma sala tem todos os equipamentos necessários para uma disciplina
WITH
    EQUIPAMENTOS_SALA AS (
        SELECT
            s.ID_SALA,
            STRING_AGG (DISTINCT e.NO_EQUIPAMENTO, ', ') as equipamentos
        FROM
            TB_SALA s
            LEFT JOIN RL_SALA_EQUIPAMENTO rse ON s.ID_SALA = rse.ID_SALA
            LEFT JOIN TB_EQUIPAMENTO e ON rse.ID_EQUIPAMENTO = e.ID_EQUIPAMENTO
        GROUP BY
            s.ID_SALA
    )
SELECT
    d.CD_DISCIPLINA,
    d.NO_DISCIPLINA,
    STRING_AGG (DISTINCT e.NO_EQUIPAMENTO, ', ') as equipamentos_necessarios,
    s.CD_SALA,
    es.equipamentos as equipamentos_sala,
    CASE
        WHEN NOT EXISTS (
            SELECT
                rde.ID_EQUIPAMENTO
            FROM
                RL_DISCIPLINA_EQUIPAMENTO rde
            WHERE
                rde.ID_DISCIPLINA = d.ID_DISCIPLINA
                AND NOT EXISTS (
                    SELECT
                        rse.ID_EQUIPAMENTO
                    FROM
                        RL_SALA_EQUIPAMENTO rse
                    WHERE
                        rse.ID_SALA = s.ID_SALA
                        AND rse.ID_EQUIPAMENTO = rde.ID_EQUIPAMENTO
                )
        ) THEN 'Sim'
        ELSE 'Não'
    END as sala_atende
FROM
    TB_DISCIPLINA d
    JOIN RL_DISCIPLINA_EQUIPAMENTO rde ON d.ID_DISCIPLINA = rde.ID_DISCIPLINA
    JOIN TB_EQUIPAMENTO e ON rde.ID_EQUIPAMENTO = e.ID_EQUIPAMENTO
    CROSS JOIN TB_SALA s
    LEFT JOIN EQUIPAMENTOS_SALA es ON s.ID_SALA = es.ID_SALA
GROUP BY
    d.CD_DISCIPLINA,
    d.NO_DISCIPLINA,
    d.ID_DISCIPLINA,
    s.CD_SALA,
    s.ID_SALA,
    es.equipamentos
ORDER BY
    d.CD_DISCIPLINA,
    s.CD_SALA;
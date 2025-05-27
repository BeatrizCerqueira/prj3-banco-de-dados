-- Requisito 2.2: [Requisitos técnicos] Consultar quais salas têm todos os equipamentos necessários para uma disciplina
WITH
    equipamentos_faltantes AS (
        SELECT
            d.ID_DISCIPLINA,
            s.ID_SALA,
            rde.ID_EQUIPAMENTO
        FROM
            TB_DISCIPLINA d
            CROSS JOIN TB_SALA s
            JOIN RL_DISCIPLINA_EQUIPAMENTO rde ON d.ID_DISCIPLINA = rde.ID_DISCIPLINA
            LEFT JOIN RL_SALA_EQUIPAMENTO rse ON s.ID_SALA = rse.ID_SALA
            AND rse.ID_EQUIPAMENTO = rde.ID_EQUIPAMENTO
        WHERE
            rse.ID_EQUIPAMENTO IS NULL
    )
SELECT
    d.CD_DISCIPLINA,
    d.NO_DISCIPLINA,
    STRING_AGG (DISTINCT e.NO_EQUIPAMENTO, ', ') as equipamentos_necessarios,
    s.CD_SALA,
    STRING_AGG (DISTINCT es.NO_EQUIPAMENTO, ', ') as equipamentos_sala,
    CASE
        WHEN NOT EXISTS (
            SELECT
                1
            FROM
                equipamentos_faltantes ef
            WHERE
                ef.ID_DISCIPLINA = d.ID_DISCIPLINA
                AND ef.ID_SALA = s.ID_SALA
        ) THEN 'Sim'
        ELSE 'Não'
    END as sala_atende
FROM
    TB_DISCIPLINA d
    JOIN RL_DISCIPLINA_EQUIPAMENTO rde ON d.ID_DISCIPLINA = rde.ID_DISCIPLINA
    JOIN TB_EQUIPAMENTO e ON rde.ID_EQUIPAMENTO = e.ID_EQUIPAMENTO
    CROSS JOIN TB_SALA s
    LEFT JOIN RL_SALA_EQUIPAMENTO rse ON s.ID_SALA = rse.ID_SALA
    LEFT JOIN TB_EQUIPAMENTO es ON rse.ID_EQUIPAMENTO = es.ID_EQUIPAMENTO
GROUP BY
    d.CD_DISCIPLINA,
    d.NO_DISCIPLINA,
    d.ID_DISCIPLINA,
    s.CD_SALA,
    s.ID_SALA
ORDER BY
    d.CD_DISCIPLINA,
    s.CD_SALA;
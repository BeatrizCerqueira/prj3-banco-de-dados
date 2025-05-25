-- -- Requisito 2: Alocar salas conforme demanda e requisitos técnicos

-- -- Função para garantir que a sala tenha todos os equipamentos necessários para a disciplina
-- CREATE OR REPLACE FUNCTION cumprir_requisitos_tecnicos()
-- RETURNS TRIGGER AS $$
-- DECLARE
--     equipamentos_faltantes TEXT;
--     codigo_turma VARCHAR;
--     codigo_sala VARCHAR;
-- BEGIN
--     -- Obtém o código da turma e da sala
--     SELECT t.CD_TURMA, s.CD_SALA INTO codigo_turma, codigo_sala
--     FROM TB_TURMA t
--     JOIN TB_SALA s ON t.ID_SALA = s.ID_SALA
--     WHERE t.ID_TURMA = NEW.ID_TURMA;

--     -- Verifica se existem equipamentos necessários para a disciplina que não estão na sala
--     SELECT STRING_AGG(e.NO_EQUIPAMENTO, ', ')
--     INTO equipamentos_faltantes
--     FROM RL_DISCIPLINA_EQUIPAMENTO de
--     JOIN TB_EQUIPAMENTO e ON de.ID_EQUIPAMENTO = e.ID_EQUIPAMENTO
--     WHERE de.ID_DISCIPLINA = NEW.ID_DISCIPLINA
--     AND NOT EXISTS (
--         SELECT 1
--         FROM RL_SALA_EQUIPAMENTO se
--         WHERE se.ID_SALA = NEW.ID_SALA
--         AND se.ID_EQUIPAMENTO = de.ID_EQUIPAMENTO
--     );

--     -- Se houver equipamentos faltantes, impede a criação da turma
--     IF equipamentos_faltantes IS NOT NULL THEN
--         RAISE EXCEPTION 'Não é possível criar a turma %. A sala % não possui os seguintes equipamentos necessários: %', codigo_turma, codigo_sala, equipamentos_faltantes;
--     END IF;

--     RETURN NEW;
-- END;
-- $$ LANGUAGE plpgsql;

-- -- Trigger que executa a verificação antes de inserir uma nova turma
-- CREATE TRIGGER trg_verificar_equipamentos_sala
--     BEFORE INSERT OR UPDATE ON TB_TURMA
--     FOR EACH ROW
--     EXECUTE FUNCTION cumprir_requisitos_tecnicos(); 
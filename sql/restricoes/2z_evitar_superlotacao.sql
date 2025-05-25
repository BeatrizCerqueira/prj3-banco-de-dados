-- Requisito 6: Evitar conflitos de horário e superlotação

-- Função para verificar se a sala tem capacidade para mais um aluno
CREATE OR REPLACE FUNCTION verificar_capacidade_sala()
RETURNS TRIGGER AS $$
DECLARE
    capacidade_sala INTEGER;
    alunos_matriculados INTEGER;
BEGIN
    -- Obtém a capacidade da sala da turma
    SELECT s.QT_CAPACIDADE INTO capacidade_sala
    FROM TB_TURMA t
    JOIN TB_SALA s ON t.ID_SALA = s.ID_SALA
    WHERE t.ID_TURMA = NEW.ID_TURMA;

    -- Conta quantos alunos já estão matriculados na turma
    SELECT COUNT(*) INTO alunos_matriculados
    FROM RL_TURMA_ALUNO
    WHERE ID_TURMA = NEW.ID_TURMA;

    -- Se a sala já está na capacidade máxima, impede a matrícula
    IF alunos_matriculados >= capacidade_sala THEN
        RAISE EXCEPTION 'Não é possível matricular mais alunos. A turma já está na capacidade máxima de % alunos.', capacidade_sala;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger que executa a verificação antes de inserir uma nova matrícula
CREATE TRIGGER trg_verificar_capacidade_sala
    BEFORE INSERT ON RL_TURMA_ALUNO
    FOR EACH ROW
    EXECUTE FUNCTION verificar_capacidade_sala(); 
-- Requisito 6: Evitar conflitos de horário e superlotação

-- Função para garantir que a sala tenha capacidade para mais um aluno
CREATE OR REPLACE FUNCTION evitar_superlotacao()
RETURNS TRIGGER AS $$
DECLARE
    capacidade_sala INTEGER;
    alunos_matriculados INTEGER;
    nome_aluno VARCHAR;
    codigo_turma VARCHAR;
    codigo_sala VARCHAR;
BEGIN
    -- Obtém o nome do aluno, código da turma e código da sala
    SELECT a.NO_ALUNO, t.CD_TURMA, s.CD_SALA 
    INTO nome_aluno, codigo_turma, codigo_sala
    FROM TB_ALUNO a
    JOIN TB_TURMA t ON t.ID_TURMA = NEW.ID_TURMA
    JOIN TB_SALA s ON t.ID_SALA = s.ID_SALA
    WHERE a.ID_ALUNO = NEW.ID_ALUNO;

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
        RAISE EXCEPTION 'Não é possível matricular o(a) aluno(a) %. A turma % já está na capacidade máxima da sala % (% alunos).', nome_aluno, codigo_turma, codigo_sala, capacidade_sala;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger que executa a verificação antes de inserir uma nova matrícula
CREATE TRIGGER trg_verificar_capacidade_sala
    BEFORE INSERT ON RL_TURMA_ALUNO
    FOR EACH ROW
    EXECUTE FUNCTION evitar_superlotacao(); 
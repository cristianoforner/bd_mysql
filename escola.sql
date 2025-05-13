-- ATIVIDADE 03: Sistema de Registro Escolar

-- 1. Criação do banco de dados
CREATE DATABASE IF NOT EXISTS escola;
USE escola;

-- 2. Criação da tabela de estudantes com 5 atributos
CREATE TABLE estudantes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    turma VARCHAR(20) NOT NULL,
    nota_media DECIMAL(3,1) NOT NULL,
    frequencia_percentual INT NOT NULL
);

-- 3. Inserção de 8 registros na tabela
INSERT INTO estudantes (nome, data_nascimento, turma, nota_media, frequencia_percentual) VALUES
('Pedro Almeida', '2005-05-12', '3º Ano A', 8.5, 95),
('Maria Souza', '2006-03-25', '2º Ano B', 7.8, 90),
('Felipe Santos', '2005-11-10', '3º Ano A', 6.5, 85),
('Larissa Oliveira', '2006-07-15', '2º Ano A', 9.2, 98),
('Gabriel Pereira', '2005-09-30', '3º Ano B', 5.6, 75),
('Juliana Costa', '2006-01-20', '2º Ano B', 7.0, 88),
('Lucas Ferreira', '2005-08-18', '3º Ano A', 8.8, 92),
('Isabela Martins', '2006-04-05', '2º Ano A', 6.7, 80);

-- 4. SELECT para estudantes com nota maior que 7.0
SELECT * FROM estudantes WHERE nota_media > 7.0;

-- 5. SELECT para estudantes com nota menor que 7.0
SELECT * FROM estudantes WHERE nota_media < 7.0;

-- 6. Atualização de um registro
UPDATE estudantes SET nota_media = 7.2, frequencia_percentual = 83 WHERE nome = 'Felipe Santos';

-- Verificação da atualização
SELECT * FROM estudantes;
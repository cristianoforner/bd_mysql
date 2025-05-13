-- ATIVIDADE 01: Sistema de RH de uma empresa

-- 1. Criação do banco de dados
CREATE DATABASE empresa_rh;
USE empresa_rh;

-- 2. Criação da tabela de colaboradores com 5 atributos
CREATE TABLE colaboradores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50) NOT NULL,
    departamento VARCHAR(50) NOT NULL,
    data_contratacao DATE NOT NULL,
    salario DECIMAL(10,2) NOT NULL
);

-- 3. Inserção de 5 registros na tabela
INSERT INTO colaboradores (nome, cargo, departamento, data_contratacao, salario) VALUES
('Ana Silva', 'Analista de RH', 'Recursos Humanos', '2020-03-15', 2500.00),
('Carlos Oliveira', 'Desenvolvedor', 'TI', '2021-05-10', 3200.00),
('Mariana Santos', 'Assistente Administrativo', 'Administração', '2022-01-20', 1800.00),
('João Costa', 'Estagiário', 'Marketing', '2022-07-05', 1200.00),
('Patricia Lima', 'Gerente de Projetos', 'TI', '2019-11-12', 4500.00);

-- 4. SELECT para colaboradores com salário maior que 2000
SELECT * FROM colaboradores WHERE salario > 2000;

-- 5. SELECT para colaboradores com salário menor que 2000
SELECT * FROM colaboradores WHERE salario < 2000;

-- 6. Atualização de um registro
UPDATE colaboradores SET salario = 2100.00 WHERE nome = 'Mariana Santos';

-- Verificação da atualização
SELECT * FROM colaboradores;
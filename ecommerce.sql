-- ATIVIDADE 02: Sistema de E-commerce

-- 1. Criação do banco de dados
CREATE DATABASE IF NOT EXISTS ecommerce;
USE ecommerce;

-- 2. Criação da tabela de produtos com 5 atributos
CREATE TABLE produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    quantidade_estoque INT NOT NULL,
    data_cadastro DATE NOT NULL
);

-- 3. Inserção de 8 registros na tabela
INSERT INTO produtos (nome, categoria, preco, quantidade_estoque, data_cadastro) VALUES
('Smartphone Galaxy S21', 'Eletrônicos', 3200.00, 15, '2023-01-10'),
('Notebook Dell Inspiron', 'Informática', 4500.00, 8, '2023-02-05'),
('Camiseta Básica', 'Vestuário', 49.90, 100, '2023-01-15'),
('Tênis Nike Air', 'Calçados', 450.00, 20, '2023-03-01'),
('Cafeteira Elétrica', 'Eletrodomésticos', 189.90, 30, '2023-02-20'),
('Fone de Ouvido Bluetooth', 'Eletrônicos', 299.90, 40, '2023-01-25'),
('Smart TV 50"', 'Eletrônicos', 2799.00, 10, '2023-03-10'),
('Livro "O Senhor dos Anéis"', 'Livros', 79.90, 50, '2023-02-15');

-- 4. SELECT para produtos com valor maior que 500
SELECT * FROM produtos WHERE preco > 500;

-- 5. SELECT para produtos com valor menor que 500
SELECT * FROM produtos WHERE preco < 500;

-- 6. Atualização de um registro
UPDATE produtos SET preco = 2999.90, quantidade_estoque = 12 WHERE nome = 'Smart TV 50"';

-- Verificação da atualização
SELECT * FROM produtos;
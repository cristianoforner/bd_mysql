-- Cria o Banco de dados
CREATE DATABASE db_farmacia_bem_estar;
 
-- Seleciona o Banco de dados para uso
USE db_farmacia_bem_estar;
 
-- Cria a tabela Categorias
CREATE TABLE tb_categorias (
    id BIGINT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    descricao VARCHAR(255),
    restricao_idade BOOLEAN,
    PRIMARY KEY (id)
);
 
-- Insere dados na tabela Categorias
INSERT INTO tb_categorias (nome, descricao, restricao_idade) 
VALUES ("Medicamentos", "Produtos para tratamento de doenças com prescrição médica", TRUE);

INSERT INTO tb_categorias (nome, descricao, restricao_idade) 
VALUES ("Medicamentos de Venda Livre", "Produtos para tratamento de doenças sem prescrição médica", FALSE);

INSERT INTO tb_categorias (nome, descricao, restricao_idade) 
VALUES ("Cosméticos", "Produtos para cuidados com a pele e beleza", FALSE);

INSERT INTO tb_categorias (nome, descricao, restricao_idade) 
VALUES ("Higiene Pessoal", "Produtos para limpeza e higiene corporal", FALSE);

INSERT INTO tb_categorias (nome, descricao, restricao_idade) 
VALUES ("Suplementos", "Vitaminas e complementos nutricionais", FALSE);
 
-- Lista todas as Categorias
SELECT * FROM tb_categorias;
 
-- Cria a tabela Produtos
CREATE TABLE tb_produtos (
    id BIGINT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    descricao VARCHAR(500),
    preco DECIMAL(10,2) NOT NULL,
    estoque INT,
    validade DATE,
    categoria_id BIGINT,
    PRIMARY KEY (id),
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias (id)
);
 
-- Insere dados na tabela Produtos
INSERT INTO tb_produtos (nome, descricao, preco, estoque, validade, categoria_id)
VALUES ("Cetirizina", "Anti-histamínico para alergias - 10mg com 30 comprimidos", 25.90, 120, "2025-06-15", 2);
 
INSERT INTO tb_produtos (nome, descricao, preco, estoque, validade, categoria_id)
VALUES ("Cloridrato de Sertralina", "Antidepressivo - 50mg com 30 comprimidos", 52.50, 75, "2025-08-10", 1);
 
INSERT INTO tb_produtos (nome, descricao, preco, estoque, validade, categoria_id)
VALUES ("Creme Facial Antissinais", "Creme facial nutritivo para pele madura - 50g", 89.90, 45, "2026-01-20", 3);
 
INSERT INTO tb_produtos (nome, descricao, preco, estoque, validade, categoria_id)
VALUES ("Protetor Solar FPS 60", "Proteção UVA/UVB para todos os tipos de pele - 120ml", 69.90, 60, "2025-11-30", 3);
 
INSERT INTO tb_produtos (nome, descricao, preco, estoque, validade, categoria_id)
VALUES ("Escova Dental Macia", "Cerdas macias e cabo emborrachado - Unidade", 8.50, 200, "2027-12-31", 4);
 
INSERT INTO tb_produtos (nome, descricao, preco, estoque, validade, categoria_id)
VALUES ("Complexo Vitamínico", "Suplemento multivitamínico - 60 cápsulas", 45.00, 80, "2026-05-15", 5);
 
INSERT INTO tb_produtos (nome, descricao, preco, estoque, validade, categoria_id)
VALUES ("Colágeno Hidrolisado", "Suplemento para pele e articulações - 30 sachês", 79.90, 35, "2025-10-25", 5);
 
INSERT INTO tb_produtos (nome, descricao, preco, estoque, validade, categoria_id)
VALUES ("Condicionador Reparador", "Para cabelos danificados - 300ml", 28.90, 90, "2026-03-18", 4);
 
-- Lista todos os Produtos
SELECT * FROM tb_produtos;
 
-- 6. Seleciona todos os produtos com valor maior que R$ 50,00
SELECT * FROM tb_produtos WHERE preco > 50.00;
 
-- 7. Seleciona todos os produtos com valor entre R$ 5,00 e R$ 60,00
SELECT * FROM tb_produtos WHERE preco BETWEEN 5.00 AND 60.00;
 
-- 8. Seleciona todos os produtos que possuam a letra 'C' no nome
SELECT * FROM tb_produtos WHERE nome LIKE '%C%';
 
-- 9. Seleciona todos os produtos junto com suas categorias usando INNER JOIN
SELECT 
    p.id,
    p.nome,
    p.descricao,
    p.preco,
    p.estoque,
    p.validade,
    c.nome AS categoria,
    c.descricao AS descricao_categoria,
    c.restricao_idade
FROM 
    tb_produtos p
INNER JOIN 
    tb_categorias c ON p.categoria_id = c.id;
 
-- 10. Seleciona apenas os produtos da categoria "Cosméticos"
SELECT 
    p.id,
    p.nome,
    p.descricao,
    p.preco,
    p.estoque,
    p.validade,
    c.nome AS categoria,
    c.descricao AS descricao_categoria
FROM 
    tb_produtos p
INNER JOIN 
    tb_categorias c ON p.categoria_id = c.id
WHERE 
    c.nome = "Cosméticos";
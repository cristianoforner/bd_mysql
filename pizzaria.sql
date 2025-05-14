-- Cria o Banco de dados
CREATE DATABASE db_pizzaria_legal;
 
-- Seleciona o Banco de dados para uso
USE db_pizzaria_legal;
 
-- Cria a tabela Categorias
CREATE TABLE tb_categorias (
    id BIGINT NOT NULL AUTO_INCREMENT,
    tipo VARCHAR(255) NOT NULL,
    descricao VARCHAR(255),
    PRIMARY KEY (id)
);
 
-- Insere dados na tabela Categorias
INSERT INTO tb_categorias (tipo, descricao) VALUES ("Salgada Tradicional", "Pizzas salgadas com ingredientes clássicos");
INSERT INTO tb_categorias (tipo, descricao) VALUES ("Salgada Especial", "Pizzas salgadas com combinações exclusivas");
INSERT INTO tb_categorias (tipo, descricao) VALUES ("Doce", "Pizzas com coberturas doces");
INSERT INTO tb_categorias (tipo, descricao) VALUES ("Vegetariana", "Pizzas sem carnes e produtos de origem animal");
INSERT INTO tb_categorias (tipo, descricao) VALUES ("Vegana", "Pizzas sem nenhum produto de origem animal");
 
-- Lista todas as Categorias
SELECT * FROM tb_categorias;
 
-- Cria a tabela Pizzas
CREATE TABLE tb_pizzas (
    id BIGINT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    ingredientes VARCHAR(500),
    tamanho VARCHAR(50) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    categoria_id BIGINT,
    PRIMARY KEY (id),
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias (id)
);
 
-- Insere dados na tabela Pizzas
INSERT INTO tb_pizzas (nome, ingredientes, tamanho, preco, categoria_id)
VALUES ("Mussarela", "Molho de tomate, mussarela, orégano e azeitonas", "Grande", 45.00, 1);
 
INSERT INTO tb_pizzas (nome, ingredientes, tamanho, preco, categoria_id)
VALUES ("Calabresa", "Molho de tomate, calabresa, cebola, mussarela e orégano", "Grande", 49.90, 1);
 
INSERT INTO tb_pizzas (nome, ingredientes, tamanho, preco, categoria_id)
VALUES ("Margherita", "Molho de tomate, mussarela de búfala, tomate, manjericão fresco", "Grande", 59.90, 1);
 
INSERT INTO tb_pizzas (nome, ingredientes, tamanho, preco, categoria_id)
VALUES ("Quatro Queijos Premium", "Molho de tomate, mussarela, provolone, gorgonzola, parmesão e orégano", "Grande", 65.90, 2);
 
INSERT INTO tb_pizzas (nome, ingredientes, tamanho, preco, categoria_id)
VALUES ("Mexicana", "Molho de tomate, mussarela, calabresa picada, pimentão, cebola, pimenta jalapeño", "Grande", 79.90, 2);
 
INSERT INTO tb_pizzas (nome, ingredientes, tamanho, preco, categoria_id)
VALUES ("Chocolate com Morango", "Chocolate ao leite, morangos frescos e chocolate branco ralado", "Grande", 55.00, 3);
 
INSERT INTO tb_pizzas (nome, ingredientes, tamanho, preco, categoria_id)
VALUES ("Vegetais Grelhados", "Molho de tomate, mussarela, abobrinha, berinjela, pimentão, cebola roxa grelhados e orégano", "Grande", 58.50, 4);
 
INSERT INTO tb_pizzas (nome, ingredientes, tamanho, preco, categoria_id)
VALUES ("Vegana Supreme", "Molho de tomate caseiro, queijo vegano, cogumelos, tomate seco, rúcula e azeitonas", "Grande", 89.90, 5);
 
-- Lista todas as Pizzas
SELECT * FROM tb_pizzas;
 
-- 6. Seleciona todas as pizzas com valor maior que R$ 45,00
SELECT * FROM tb_pizzas WHERE preco > 45.00;
 
-- 7. Seleciona todas as pizzas com valor entre R$ 50,00 e R$ 100,00
SELECT * FROM tb_pizzas WHERE preco BETWEEN 50.00 AND 100.00;
 
-- 8. Seleciona todas as pizzas que possuam a letra 'M' no nome
SELECT * FROM tb_pizzas WHERE nome LIKE '%M%';
 
-- 9. Seleciona todas as pizzas junto com suas categorias usando INNER JOIN
SELECT 
    p.id,
    p.nome,
    p.ingredientes,
    p.tamanho,
    p.preco,
    c.tipo AS categoria,
    c.descricao AS descricao_categoria
FROM 
    tb_pizzas p
INNER JOIN 
    tb_categorias c ON p.categoria_id = c.id;
 
-- 10. Seleciona apenas as pizzas doces
SELECT 
    p.id,
    p.nome,
    p.ingredientes,
    p.tamanho,
    p.preco,
    c.tipo AS categoria,
    c.descricao AS descricao_categoria
FROM 
    tb_pizzas p
INNER JOIN 
    tb_categorias c ON p.categoria_id = c.id
WHERE 
    c.tipo = "Doce";
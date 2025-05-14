-- Cria o Banco de dados
CREATE DATABASE db_curso_da_minha_vida;
 
-- Seleciona o Banco de dados para uso
USE db_curso_da_minha_vida;
 
-- Cria a tabela Categorias
CREATE TABLE tb_categorias (
    id BIGINT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    area_conhecimento VARCHAR(255) NOT NULL,
    nivel VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
);
 
-- Insere dados na tabela Categorias
INSERT INTO tb_categorias (nome, area_conhecimento, nivel) 
VALUES ("Desenvolvimento Web", "Tecnologia", "Iniciante");

INSERT INTO tb_categorias (nome, area_conhecimento, nivel) 
VALUES ("Programação Back-end", "Tecnologia", "Avançado");

INSERT INTO tb_categorias (nome, area_conhecimento, nivel) 
VALUES ("Ciência de Dados", "Tecnologia", "Intermediário");

INSERT INTO tb_categorias (nome, area_conhecimento, nivel) 
VALUES ("Design UX/UI", "Design", "Intermediário");

INSERT INTO tb_categorias (nome, area_conhecimento, nivel) 
VALUES ("Marketing Digital", "Marketing", "Iniciante");
 
-- Lista todas as Categorias
SELECT * FROM tb_categorias;
 
-- Cria a tabela Cursos
CREATE TABLE tb_cursos (
    id BIGINT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    descricao VARCHAR(500),
    carga_horaria INT NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    data_lancamento DATE,
    instrutor VARCHAR(255),
    categoria_id BIGINT,
    PRIMARY KEY (id),
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias (id)
);
 
-- Insere dados na tabela Cursos
INSERT INTO tb_cursos (nome, descricao, carga_horaria, preco, data_lancamento, instrutor, categoria_id)
VALUES ("JavaScript Completo", "Curso completo de JavaScript do zero ao avançado", 60, 499.90, "2023-05-15", "Carlos Eduardo", 1);
 
INSERT INTO tb_cursos (nome, descricao, carga_horaria, preco, data_lancamento, instrutor, categoria_id)
VALUES ("Java Expert", "Desenvolvimento de aplicações empresariais com Java", 120, 899.90, "2023-02-10", "Amanda Silveira", 2);
 
INSERT INTO tb_cursos (nome, descricao, carga_horaria, preco, data_lancamento, instrutor, categoria_id)
VALUES ("Python para Data Science", "Análise de dados e machine learning com Python", 80, 749.90, "2023-04-20", "Rafael Gomes", 3);
 
INSERT INTO tb_cursos (nome, descricao, carga_horaria, preco, data_lancamento, instrutor, categoria_id)
VALUES ("Design de Interfaces", "Criação de interfaces modernas e funcionais", 45, 649.90, "2023-03-05", "Juliana Costa", 4);
 
INSERT INTO tb_cursos (nome, descricao, carga_horaria, preco, data_lancamento, instrutor, categoria_id)
VALUES ("React.js Avançado", "Desenvolvimento de aplicações SPA com React", 70, 699.90, "2023-01-15", "André Martins", 1);
 
INSERT INTO tb_cursos (nome, descricao, carga_horaria, preco, data_lancamento, instrutor, categoria_id)
VALUES ("Marketing em Redes Sociais", "Estratégias eficientes para redes sociais", 30, 299.90, "2023-06-01", "Bruna Santos", 5);
 
INSERT INTO tb_cursos (nome, descricao, carga_horaria, preco, data_lancamento, instrutor, categoria_id)
VALUES ("Node.js e MongoDB", "Criação de APIs RESTful com Node.js e MongoDB", 65, 599.90, "2023-02-28", "João Vitor", 2);
 
INSERT INTO tb_cursos (nome, descricao, carga_horaria, preco, data_lancamento, instrutor, categoria_id)
VALUES ("Jornada DevOps", "Implementação de práticas DevOps em ambientes de produção", 100, 1299.90, "2023-07-10", "Mariana Silveira", 2);
 
-- Lista todos os Cursos
SELECT * FROM tb_cursos;
 
-- 6. Seleciona todos os cursos com valor maior que R$ 500,00
SELECT * FROM tb_cursos WHERE preco > 500.00;
 
-- 7. Seleciona todos os cursos com valor entre R$ 600,00 e R$ 1000,00
SELECT * FROM tb_cursos WHERE preco BETWEEN 600.00 AND 1000.00;
 
-- 8. Seleciona todos os cursos que possuam a letra 'J' no nome
SELECT * FROM tb_cursos WHERE nome LIKE '%J%';
 
-- 9. Seleciona todos os cursos junto com suas categorias usando INNER JOIN
SELECT 
    c.id,
    c.nome,
    c.descricao,
    c.carga_horaria,
    c.preco,
    c.data_lancamento,
    c.instrutor,
    cat.nome AS categoria,
    cat.area_conhecimento,
    cat.nivel
FROM 
    tb_cursos c
INNER JOIN 
    tb_categorias cat ON c.categoria_id = cat.id;
 
-- 10. Seleciona apenas os cursos da categoria "Programação Back-end"
SELECT 
    c.id,
    c.nome,
    c.descricao,
    c.carga_horaria,
    c.preco,
    c.data_lancamento,
    c.instrutor,
    cat.nome AS categoria,
    cat.area_conhecimento,
    cat.nivel
FROM 
    tb_cursos c
INNER JOIN 
    tb_categorias cat ON c.categoria_id = cat.id
WHERE 
    cat.nome = "Programação Back-end";
# CREATE DATABASE Bradesco;

CREATE TABLE clientes (
codcliente INT PRIMARY KEY,
nome varchar (50) NOT NULL)

CREATE TABLE vendedores (
codvendedor INT PRIMARY KEY,
nome varchar (50) NOT NULL)

CREATE TABLE vendas (
codvendas INT PRIMARY KEY,
datavenda DATE NOT NULL,
codcliente INT,
codvendedor INT)




ALTER TABLE vendas ADD CONSTRAINT fk_vendas_codvendedor FOREIGN KEY (codvendedor) REFERENCES vendedores (codvendedor)


1) INSERIR 10 LINHAS DE DADOS EM CADA TABELA CRIADA

-- Tabela Clientes --

INSERT INTO clientes VALUES
(1, 'Fernando'),
(2, 'Marcia'),
(3, 'Rafaela'),
(4, 'Juliana'),
(5, 'Paula'),
(6, 'Gustavo'),
(7, 'Rodolfo'),
(8, 'Petronio'),
(9, 'Selma'),
(10, 'Joao')

SELECT * FROM clientes


-- Tabela Vendedores -- 

INSERT INTO vendedores VALUES
(1, 'Vendedor 1'),
(2, 'Vendedor 2'),
(3, 'Vendedor 3'),
(4, 'Vendedor 4'),
(5, 'Vendedor 5'),
(6, 'Vendedor 6'),
(7, 'Vendedor 7'),
(8, 'Vendedor 8'),
(9, 'Vendedor 9'),
(10, 'Vendedor 10')

SELECT * FROM vendedores

-- Tabela Vendas -- 

SELECT * FROM vendas

INSERT INTO vendas VALUES
(1, '2023-04-27', 1, 4),
(2, '2023-04-27', 3, 5),
(3, '2023-04-27', 2, 7),
(4, '2023-04-27', 10, 1),
(5, '2023-04-27', 9, 3),
(6, '2023-04-27', 8, 2),
(7, '2023-04-27', 6, 10),
(8, '2023-04-27', 9, 8),
(9, '2023-04-27', 4, 6),
(10,'2023-04-27', 5, 9);

SELECT * FROM vendas

ALTER TABLE vendas CHANGE codvendas cod_vendas INT


-- EXERCICIOS ALTERANDO A TABELA --

1)Adicionar uma coluna na tabela vendas a gosto (sendo Varchar 255)

2)Modificar uma coluna na tabela vendas criada no exercício 1 por varchar 100 (tipagem do campo)

3)Modificar a coluna datavenda na tabela vendas por data_venda

4)Excluir a coluna criada no exercício 1 da tabela venda


-- Exercício 1)Adicionar uma coluna na tabela vendas a gosto (sendo Varchar 255) -- 

ALTER TABLE vendas ADD COLUMN metodo_pgto VARCHAR (255)

SELECT * FROM vendas

-- Exercício 2)Modificar uma coluna na tabela vendas criada no exercício 1 por varchar 100 (tipagem do campo) --

ALTER TABLE vendas modify metodo_pgto VARCHAR (100)

-- Exercício 3)Modificar a coluna datavenda na tabela vendas por data_venda --

ALTER TABLE vendas change datavenda data_venda date

-- Exercício 4)Excluir a coluna criada no exercício 1 da tabela venda --

ALTER TABLE vendas DROP metodo_pgto


-- EXERCICIOS UPDATE --

1) REALIZAR UM UPDATE NA TABELA VENDEDORES, COLOCANDO MAIS UM SOBRENOME EM CADA VENDEDOR (somente em 5 vendedores).

2) REALIZAR UM UPDATE NA TABELA CLIENTES, COLOCANDO MAIS UM SOBRENOME EM CADA CLIENTE (somente em 5 clientes).


-- Exercício 1) REALIZAR UM UPDATE NA TABELA VENDEDORES, COLOCANDO MAIS UM SOBRENOME EM CADA VENDEDOR (somente em 5 vendedores) --

UPDATE vendedores SET nome = 'Vendedor_Jacinto' WHERE codvendedor = 5;

SELECT * FROM vendedores;

-- Exercício 2) REALIZAR UM UPDATE NA TABELA CLIENTES, COLOCANDO MAIS UM SOBRENOME EM CADA CLIENTE (somente em 5 clientes) --

UPDATE clientes SET nome = 'Paula Cristina' WHERE codcliente = 5;


SELECT * FROM clientes;

-- EXERCICIOS DE MANIPULAÇÃO --

1)INNER JOIN VENDAS X CLIENTES

2)LEFT JOIN VENDAS X VENDEDORES

3)RIGHT JOIN VENDAS X VENDEDORES

4)INNER JOIN VENDAS X CLIENTES e LEFT JOIN VENDAS X VENDEDORES

5)LEFT JOIN VENDAS X CLIENTES e RIGHT JOIN VENDAS X VENDEDORES, GROUP BY POR DATAVENDA, ORDER BY DESC POR DATAVENDA E UM LIMIT DE 1

-- Exercício 1)INNER JOIN VENDAS X CLIENTES --

SELECT * FROM vendas a
INNER JOIN clientes b
ON a.codcliente = b.codcliente;

-- Exercício 2)LEFT JOIN VENDAS X VENDEDORES --

SELECT * FROM vendas a
LEFT JOIN vendedores b
ON a.codvendedor = b.codvendedor;

-- Exercício 3)RIGHT JOIN VENDAS X VENDEDORES --

SELECT * FROM vendas a
RIGHT JOIN vendedores b
ON a.codvendedor = b.codvendedor

-- Exercício 4)INNER JOIN VENDAS X CLIENTES e LEFT JOIN VENDAS X VENDEDORES --

SELECT * FROM vendas a
INNER JOIN clientes b
ON a.codcliente = b.codcliente
left JOIN vendedores c
ON a.codvendedor = c.codvendedor

-- Exercício 5)LEFT JOIN VENDAS X CLIENTES e RIGHT JOIN VENDAS X VENDEDORES, GROUP BY POR DATAVENDA, ORDER BY DESC POR DATAVENDA E UM LIMIT DE 1 --

SELECT a.data_venda, COUNT(data_venda) FROM vendas a
left JOIN clientes b
ON a.codcliente = b.codcliente
right JOIN vendedores c
ON a.codvendedor = c.codvendedor
GROUP BY data_venda
ORDER BY data_venda DESC
LIMIT 1
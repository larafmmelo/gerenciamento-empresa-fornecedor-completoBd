USE empresa;

-- RESOLUÇÃO DOS 20 EXERCÍCIOS DA PARTE 10
-- Parte 1
-- 1
SELECT COUNT(*) FROM Fornecedor;
-- 2
SELECT COUNT(*) FROM Produto;
-- 3
SELECT SUM(quantidade) FROM Estoque;
-- 4
SELECT AVG(preco) FROM Estoque;
-- 5
SELECT MAX(preco) FROM Estoque;
-- 6
SELECT MIN(preco) FROM Estoque;
-- 7
SELECT SUM(preco * quantidade) FROM Estoque;
-- 8
SELECT COUNT(*) FROM Estoque WHERE validade < '2027-01-01';

-- Parte 2 - DISTINCT
-- 9
SELECT DISTINCT cnpj_filial FROM Estoque;
-- 10
SELECT DISTINCT id_produto FROM Estoque;
-- 11
SELECT COUNT(DISTINCT cnpj_fornecedor) FROM Produto;
-- 12
SELECT COUNT(DISTINCT cnpj_filial) FROM Estoque WHERE id_produto = 1;

-- Parte 3 - Subqueries sem JOIN
-- 13
SELECT SUM(quantidade) FROM Estoque WHERE id_produto = (SELECT id FROM Produto WHERE nome = 'Suco de Laranja 1L');
-- 14
SELECT AVG(preco) FROM Estoque WHERE id_produto = (SELECT id FROM Produto WHERE nome = 'Fone de Ouvido Bluetooth');
-- 15
SELECT COUNT(DISTINCT cnpj_filial) FROM Estoque WHERE id_produto = (SELECT id FROM Produto WHERE nome = 'Refrigerante Cola 2L');
-- 16
SELECT nome FROM Produto WHERE id NOT IN (SELECT id_produto FROM Estoque);
-- 17
SELECT nome FROM Fornecedor WHERE cnpj NOT IN (SELECT cnpj_fornecedor FROM Produto);
-- 18
SELECT id_produto, cnpj_filial FROM Estoque WHERE quantidade = (SELECT MAX(quantidade) FROM Estoque);
-- 19
SELECT MIN(preco) FROM Estoque WHERE cnpj_filial = (SELECT cnpj FROM Filial WHERE nome = 'Filial Savassi');
-- 20
SELECT nome FROM Produto WHERE id IN (SELECT id FROM Identificacao WHERE observacao LIKE '%garantia%');
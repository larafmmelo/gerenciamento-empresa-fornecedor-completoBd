USE empresa;

-- Exemplos da aula
SELECT p.nome AS produto, COUNT(*) AS quantidade_filiais FROM Produto p JOIN Estoque e ON p.id = e.id_produto GROUP BY p.id, p.nome;
SELECT p.nome AS produto, AVG(e.preco) AS preco_medio FROM Produto p JOIN Estoque e ON p.id = e.id_produto GROUP BY p.id, p.nome HAVING AVG(e.preco) > 20.00;

-- RESOLUÇÃO DOS EXERCÍCIOS DA PARTE 12
-- 1. Empresa
SELECT p.nome, COUNT(e.cnpj_filial) FROM Produto p JOIN Estoque e ON p.id = e.id_produto GROUP BY p.id, p.nome;
SELECT p.nome, SUM(e.quantidade) FROM Produto p JOIN Estoque e ON p.id = e.id_produto GROUP BY p.id, p.nome HAVING SUM(e.quantidade) > 100;
SELECT p.nome, AVG(e.preco) AS media FROM Produto p JOIN Estoque e ON p.id = e.id_produto GROUP BY p.id, p.nome ORDER BY media DESC;
SELECT p.nome, MAX(e.preco) - MIN(e.preco) AS diff FROM Produto p JOIN Estoque e ON p.id = e.id_produto GROUP BY p.id, p.nome HAVING (MAX(e.preco) - MIN(e.preco)) > 20.00;
SELECT f.nome, SUM(e.quantidade) FROM Filial f JOIN Estoque e ON f.cnpj = e.cnpj_filial GROUP BY f.cnpj, f.nome HAVING SUM(e.quantidade) > 500;
SELECT p.nome, COUNT(e.cnpj_filial) FROM Produto p JOIN Estoque e ON p.id = e.id_produto GROUP BY p.id, p.nome HAVING COUNT(e.cnpj_filial) >= 3;
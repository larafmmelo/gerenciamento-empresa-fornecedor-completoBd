USE empresa;

-- Exemplos da Aula
SELECT f.nome AS fornecedor, p.nome AS produto FROM Fornecedor f JOIN Produto p ON f.cnpj = p.cnpj_fornecedor;
SELECT f.nome AS fornecedor, p.nome AS produto FROM Fornecedor f LEFT JOIN Produto p ON f.cnpj = p.cnpj_fornecedor;

-- Simulação de FULL OUTER JOIN com UNION
SELECT f.nome AS fornecedor, p.nome AS produto FROM Fornecedor f LEFT JOIN Produto p ON f.cnpj = p.cnpj_fornecedor
UNION
SELECT f.nome AS fornecedor, p.nome AS produto FROM Fornecedor f RIGHT JOIN Produto p ON f.cnpj = p.cnpj_fornecedor;

-- EXERCÍCIO 1 (Joins Básicos no Empresa)
SELECT f.nome, p.nome FROM Fornecedor f JOIN Produto p ON f.cnpj = p.cnpj_fornecedor;
SELECT f.nome, p.nome FROM Fornecedor f LEFT JOIN Produto p ON f.cnpj = p.cnpj_fornecedor;
SELECT p.nome, f.nome FROM Fornecedor f RIGHT JOIN Produto p ON f.cnpj = p.cnpj_fornecedor;
SELECT f.nome FROM Fornecedor f LEFT JOIN Produto p ON f.cnpj = p.cnpj_fornecedor WHERE p.id IS NULL;
SELECT f.nome, p.nome, i.descricao FROM Produto p JOIN Fornecedor f ON p.cnpj_fornecedor = f.cnpj JOIN Identificacao i ON p.id = i.id;
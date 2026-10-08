USE empresa;

-- Teste de segurança com Transação
START TRANSACTION;
DELETE FROM Fornecedor WHERE id = 1;
SELECT * FROM Fornecedor;
ROLLBACK;

-- RESOLUÇÃO DOS EXERCÍCIOS DE DELETE

-- Exercício 1 — Produto
DELETE FROM Produto WHERE id = 5;
DELETE FROM Produto WHERE id IN (6, 7);
DELETE FROM Produto WHERE nome LIKE '%cola%';

-- Exercício 2 — Padaria
DELETE FROM Pedido WHERE id = 6;
DELETE FROM Pedido WHERE id IN (1, 5);
DELETE FROM Pedido WHERE status = 'entregue';
DELETE FROM Pedido ORDER BY quantidade DESC LIMIT 1;

-- Exercício 3 — Agência
DELETE FROM Pacote WHERE id = 5;
DELETE FROM Pacote WHERE ativo = 0 AND vagas = 0;
DELETE FROM Pacote WHERE preco > 2000;

-- Exercício 4 — Banco
DELETE FROM Conta WHERE numero = 1004;
DELETE FROM Conta WHERE telefone IS NULL;

-- Exercício 5 — Desafio (Estoque)
DELETE FROM Estoque WHERE id_produto = 1 AND cnpj_filial = '20202020000120';
DELETE FROM Estoque WHERE quantidade = 0;
DELETE FROM Estoque WHERE id_produto IN (SELECT id FROM Produto WHERE cnpj_fornecedor = '11111111000101');
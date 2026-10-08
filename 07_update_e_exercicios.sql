USE empresa;

-- Exemplos de aula
UPDATE Fornecedor SET telefone = '3133331111' WHERE id = 1;
UPDATE Fornecedor SET endereco = CONCAT('[PJ] ', endereco) WHERE nome LIKE '%Ltda%' AND endereco IS NOT NULL;

-- EXERCÍCIO 1 — Produto
UPDATE Produto SET nome = 'Arroz Tipo 1 5kg' WHERE id = 1;
UPDATE Produto SET nome = CONCAT('[Eletrônico] ', nome) WHERE nome LIKE '%usb-c%';
UPDATE Produto SET cnpj_fornecedor = '11111111000101' WHERE id IN (6, 7);
UPDATE Produto SET nome = CASE 
    WHEN id = 2 THEN CONCAT(nome, ' [Produto 2]')
    WHEN id = 3 THEN CONCAT(nome, ' [Produto 3]')
    WHEN id = 4 THEN CONCAT(nome, ' [Produto 4]')
    ELSE nome END WHERE id IN (2, 3, 4);

-- EXERCÍCIO 2 — Padaria (Pedido)
UPDATE Pedido SET status = 'pronto' WHERE id = 3;
UPDATE Pedido SET observacao = 'cliente vai retirar às 18h' WHERE cliente = 'Ana Souza' AND status = 'pendente';
UPDATE Pedido SET status = CASE 
    WHEN status = 'preparando' THEN 'pronto'
    WHEN status = 'pronto' THEN 'entregue'
    ELSE status END;
UPDATE Pedido SET observacao = CONCAT(IFNULL(observacao, ''), ' - pedido grande') WHERE quantidade > 10;

-- EXERCÍCIO 3 — Agência (Pacote)
UPDATE Pacote SET ativo = 0 WHERE destino = 'Bonito - MS';
UPDATE Pacote SET preco = preco * 1.10 WHERE vagas > 10;
UPDATE Pacote SET preco = preco * 0.85 WHERE destino LIKE '%RS%' OR destino LIKE '%PR%';
UPDATE Pacote SET vagas = vagas - 1 ORDER BY preco ASC LIMIT 1;

-- EXERCÍCIO 4 — Banco (Conta)
UPDATE Conta SET saldo = saldo + 500 WHERE numero = 1004;
UPDATE Conta SET telefone = '0800-000-0000' WHERE telefone IS NULL;
UPDATE Conta SET saldo = saldo * 1.005 WHERE tipo = 'poupanca' AND saldo > 5000;
UPDATE Conta SET telefone = CASE WHEN tipo = 'corrente' AND saldo < 0 THEN 'CONTATO URGENTE' ELSE telefone END;

-- EXERCÍCIO 5 — Desafio (Estoque)
UPDATE Estoque SET preco = preco * 0.70 WHERE id_produto = 5 AND cnpj_filial = '20202020000120';
UPDATE Estoque SET quantidade = 0 WHERE validade < '2026-11-01';
UPDATE Estoque SET quantidade = quantidade + 10 WHERE id_produto = 1;
UPDATE Estoque SET preco = preco * 1.05 WHERE cnpj_filial = (SELECT cnpj FROM Filial WHERE nome = 'Filial Centro');
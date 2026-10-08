USE empresa;

DROP TABLE IF EXISTS Fornecedor;
CREATE TABLE Fornecedor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(256) NOT NULL UNIQUE,
    telefone VARCHAR(20) NOT NULL UNIQUE,
    endereco VARCHAR(255) NOT NULL
);

INSERT INTO Fornecedor (nome, telefone, endereco) VALUES 
('Logística Brasil Ltda', '(11) 98765-4321', 'Av. Paulista, 1000 - São Paulo, SP'),
('Distribuidora Norte-Sul', '(21) 2555-1234', 'Rua das Marrecas, 45 - Rio de Janeiro, RJ'),
('Tech Componentes Eletrônicos', '(31) 3444-9876', 'Av. Antônio Carlos, 6627 - Belo Horizonte, MG'),
('Embalagens Sustentáveis S.A.', '(41) 99111-2233', 'Rua das Flores, 123 - Curitiba, PR'),
('Atacadista Central', '(61) 3222-0000', 'SCS Quadra 4, Bloco A - Brasília, DF');

-- RESOLUÇÃO DOS EXERCÍCIOS 1 A 15
-- Ex 1
INSERT INTO Fornecedor (nome, telefone, endereco) VALUES ('Suprimentos Globais', '(11) 91111-2222', 'Av. das Nações, 500 - São Paulo, SP');
-- Na segunda execução dará erro por causa do UNIQUE no nome/telefone.
-- Ex 2
SELECT * FROM Fornecedor WHERE id BETWEEN 3 AND 5;
-- Ex 3
SELECT * FROM Fornecedor WHERE id IN (1, 2, 4);
-- Ex 4
SELECT * FROM Fornecedor ORDER BY 2 DESC;
-- Ex 5
SELECT nome, endereco FROM Fornecedor ORDER BY id DESC;
-- Ex 6
INSERT INTO Fornecedor (nome, telefone, endereco) VALUES ('Paraná Madeiras', '(41) 3322-1111', 'Rua Chile, 1500 - Curitiba, PR');
-- Ex 7
INSERT INTO Fornecedor (nome, telefone, endereco) VALUES 
('Alimentos Nordeste', '(81) 9988-7766', 'Av. Boa Viagem, 400 - Recife, PE'),
('Metais Sudeste', '(11) 2233-4455', 'Rua das Indústrias, 80 - Osasco, SP'),
('Vidros do Sul', '(51) 3211-0000', 'Av. Farrapos, 1010 - Porto Alegre, RS');
-- Ex 8
-- Para cadastrar sem telefone, a coluna precisaria permitir NULL.
-- Ex 9
SELECT nome, telefone FROM Fornecedor;
-- Ex 10
SELECT * FROM Fornecedor WHERE nome = 'Metais Sudeste';
-- Ex 11
SELECT * FROM Fornecedor WHERE endereco LIKE '%SP';
-- Ex 12
SELECT * FROM Fornecedor WHERE id = 3;
-- Ex 13
SELECT * FROM Fornecedor WHERE id >= 4;
-- Ex 14
SELECT nome, endereco FROM Fornecedor ORDER BY nome ASC;
-- Ex 15
SELECT * FROM Fornecedor WHERE id BETWEEN 2 AND 5 ORDER BY id DESC;
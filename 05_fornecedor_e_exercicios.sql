USE empresa;

-- Exemplos de Aula
DROP TABLE IF EXISTS Fornecedor;
CREATE TABLE Fornecedor (
    id INT,
    nome VARCHAR(256),
    telefone VARCHAR(20),
    endereco VARCHAR(256)
);

INSERT INTO Fornecedor (id, nome, telefone, endereco) VALUES 
(1, 'Logística Brasil Ltda', '(11) 98765-4321', 'Av. Paulista, 1000 - São Paulo, SP'),
(2, 'Distribuidora Norte-Sul', '(21) 2555-1234', 'Rua das Marrecas, 45 - Rio de Janeiro, RJ'),
(3, 'Tech Componentes Eletrônicos', '(31) 3444-9876', 'Av. Antônio Carlos, 6627 - Belo Horizonte, MG');

SELECT * FROM Fornecedor;
SELECT * FROM Fornecedor WHERE id = 1;
SELECT * FROM Fornecedor WHERE nome LIKE 'a%';

-- EXERCÍCIO 1: EMPRESA DE AVIAÇÃO
DROP TABLE IF EXISTS Voo;
CREATE TABLE Voo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    origem VARCHAR(100),
    destino VARCHAR(100),
    data_partida DATE,
    data_volta DATE,
    valor DECIMAL(10,2)
);

INSERT INTO Voo (origem, destino, data_partida, data_volta, valor) VALUES 
('Belo Horizonte, MG', 'Fortaleza, CE', '2027-01-10', '2027-01-20', 800.00),
('Cuiabá, MT', 'Curitiba, PR', '2027-03-15', NULL, 1300.00),
('Palmas, TO', 'Salvador, BA', '2028-02-10', '2028-02-20', 600.00);

-- Respostas do Exercício 1
SELECT * FROM Voo WHERE origem LIKE '%Belo Horizonte%';
SELECT * FROM Voo WHERE destino LIKE '%Fortaleza%';
SELECT * FROM Voo WHERE data_volta IS NOT NULL;
SELECT * FROM Voo WHERE valor < 950.00;
SELECT * FROM Voo WHERE valor > 1200.00;
SELECT * FROM Voo WHERE valor BETWEEN 500.00 AND 800.00;
SELECT * FROM Voo WHERE data_partida LIKE '2027%';
SELECT * FROM Voo WHERE data_volta LIKE '2028%';
SELECT * FROM Voo WHERE origem LIKE '%Cuiabá%' AND destino LIKE '%Curitiba%';
SELECT * FROM Voo WHERE origem LIKE '%Minas Gerais%' OR origem LIKE '%MG%';
SELECT * FROM Voo WHERE destino LIKE '%Rio Grande do Sul%' OR destino LIKE '%RS%';
SELECT * FROM Voo WHERE origem LIKE '%Tocantins%' OR origem LIKE '%Pará%';
SELECT * FROM Voo WHERE destino LIKE '%Salvador%' OR destino LIKE '%Aracajú%';
SELECT * FROM Voo WHERE data_volta IS NULL;
SELECT * FROM Voo WHERE origem LIKE '%es%';
SELECT * FROM Voo WHERE destino LIKE '%ta%';
SELECT * FROM Voo WHERE origem LIKE '%or%' OR destino LIKE '%or%';

-- EXERCÍCIO 2: EMPRESA DE HOTELARIA
DROP TABLE IF EXISTS Hotel;
CREATE TABLE Hotel (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cidade VARCHAR(100), estado VARCHAR(2), nome VARCHAR(100),
    categoria INT, acomodacao VARCHAR(50), diaria DECIMAL(10,2),
    checkin DATE, checkout DATE, cafe BOOLEAN, garagem BOOLEAN
);

INSERT INTO Hotel (cidade, estado, nome, categoria, acomodacao, diaria, checkin, checkout, cafe, garagem) VALUES
('Belo Horizonte', 'MG', 'Resort Elite Minas', 3, 'Quarto duplo', 280.00, '2027-05-10', '2028-01-10', 1, 1),
('São Luís', 'MA', 'Hotel Costa', 3, 'Suite', 350.00, '2027-06-01', '2027-06-10', 0, 1),
('Recife', 'PE', 'Hotel Standard Sol', 4, 'Quarto duplo', 200.00, '2027-07-01', '2027-07-05', 1, 0);

-- Respostas do Exercício 2
SELECT * FROM Hotel WHERE estado = 'MG';
SELECT * FROM Hotel WHERE diaria < 300.00;
SELECT * FROM Hotel WHERE cidade = 'São Luís';
SELECT * FROM Hotel WHERE categoria = 3;
SELECT * FROM Hotel WHERE nome LIKE '%resort%';
SELECT * FROM Hotel WHERE cidade IN ('Recife', 'Salvador');
SELECT * FROM Hotel WHERE acomodacao = 'Quarto duplo';
SELECT * FROM Hotel WHERE diaria > 100.00;
SELECT * FROM Hotel WHERE nome LIKE '%elite%' OR acomodacao LIKE '%elite%';
SELECT * FROM Hotel WHERE checkin LIKE '2027%';
SELECT * FROM Hotel WHERE cidade = 'Curitiba' AND acomodacao LIKE '%Suite%';
SELECT * FROM Hotel WHERE estado = 'RS';
SELECT * FROM Hotel WHERE estado IN ('SP', 'PR');
SELECT * FROM Hotel WHERE cafe = 0;
SELECT * FROM Hotel WHERE acomodacao LIKE '%standard%';
SELECT * FROM Hotel WHERE diaria BETWEEN 250.00 AND 450.00;
SELECT * FROM Hotel WHERE checkout LIKE '2028%';
SELECT * FROM Hotel WHERE garagem = 1;
SELECT * FROM Hotel WHERE garagem = 1 AND cafe = 0;
SELECT * FROM Hotel WHERE cafe = 1 AND garagem = 0;
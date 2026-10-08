USE empresa;

-- Limpeza de tabelas respeitando a ordem de FKs
DROP TABLE IF EXISTS Funcionario;
DROP TABLE IF EXISTS Promocao;
DROP TABLE IF EXISTS Estoque;
DROP TABLE IF EXISTS Identificacao;
DROP TABLE IF EXISTS Produto;
DROP TABLE IF EXISTS Filial;
DROP TABLE IF EXISTS Fornecedor;

-- Criação das Tabelas Principais
CREATE TABLE Fornecedor (
    cnpj VARCHAR(14) NOT NULL,
    nome VARCHAR(100) NOT NULL UNIQUE,
    telefone VARCHAR(15) NOT NULL UNIQUE,
    endereco VARCHAR(200) NOT NULL,
    PRIMARY KEY (cnpj)
);

CREATE TABLE Filial (
    cnpj VARCHAR(14) NOT NULL DEFAULT '10101010000110',
    nome VARCHAR(100) NOT NULL UNIQUE DEFAULT 'Filial Centro',
    telefone VARCHAR(15) NOT NULL UNIQUE DEFAULT '3140001010',
    endereco VARCHAR(200) NOT NULL DEFAULT 'Rua Tupis, 50 - Belo Horizonte/MG',
    PRIMARY KEY (cnpj)
);

CREATE TABLE Produto (
    id INT AUTO_INCREMENT,
    cnpj_fornecedor VARCHAR(14) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (cnpj_fornecedor) REFERENCES Fornecedor(cnpj)
);

CREATE TABLE Identificacao (
    id INT NOT NULL,
    descricao VARCHAR(200) NOT NULL,
    observacao VARCHAR(200) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES Produto(id)
);

CREATE TABLE Estoque (
    id_produto INT NOT NULL,
    cnpj_filial VARCHAR(14) NOT NULL,
    preco DECIMAL(10,2) NOT NULL DEFAULT 0 CHECK (preco >= 0),
    quantidade INT NOT NULL DEFAULT 0,
    validade DATE NOT NULL,
    PRIMARY KEY (id_produto, cnpj_filial),
    FOREIGN KEY (id_produto) REFERENCES Produto(id),
    FOREIGN KEY (cnpj_filial) REFERENCES Filial(cnpj),
    CONSTRAINT check_validade CHECK (validade > '1900-01-01')
);

-- Inserts do Projeto
INSERT INTO Fornecedor (cnpj, nome, telefone, endereco) VALUES
('11111111000101', 'Distribuidora Alfa Ltda', '3132221111', 'Rua das Flores, 100 - Belo Horizonte/MG'),
('22222222000102', 'Comercial Beta S.A.', '3132222222', 'Av. Brasil, 200 - Belo Horizonte/MG'),
('33333333000103', 'Gama Alimentos Ltda', '3132223333', 'Rua da Bahia, 300 - Belo Horizonte/MG'),
('44444444000104', 'Delta Bebidas Ltda', '3132224444', 'Av. Afonso Pena, 400 - Belo Horizonte/MG');

INSERT INTO Filial (cnpj, nome, telefone, endereco) VALUES
('20202020000120', 'Filial Savassi', '3140002020', 'Rua Pernambuco, 400 - Belo Horizonte/MG');

INSERT INTO Produto (id, cnpj_fornecedor, nome) VALUES
(1, '11111111000101', 'Arroz Tipo 1 5kg'),
(2, '11111111000101', 'Feijao Carioca 1kg'),
(3, '22222222000102', 'Refrigerante Cola 2L'),
(4, '33333333000103', 'Macarrao Espaguete');

INSERT INTO Identificacao (id, descricao, observacao) VALUES
(1, 'Arroz branco tipo 1, pacote de 5kg', 'Produto de giro rápido, alta demanda'),
(2, 'Feijao carioca tipo 1, pacote de 1kg', 'Sensível à umidade, armazenar em local seco'),
(3, 'Refrigerante sabor cola, garrafa de 2 litros', 'Manter refrigerado apos aberto'),
(4, 'Macarrao tipo espaguete, pacote 500g', 'Sem glúten disponível sob encomenda');

INSERT INTO Estoque (id_produto, cnpj_filial, preco, quantidade, validade) VALUES
(1, '10101010000110', 22.90, 50, '2027-01-15'),
(1, '20202020000120', 23.50, 30, '2027-01-15'),
(2, '10101010000110', 8.90, 100, '2026-11-01');

-- EXERCÍCIO DA PARTE 09: TABELA PROMOÇÃO E FUNCIONÁRIO
CREATE TABLE Promocao (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_produto INT NOT NULL,
    cnpj_filial VARCHAR(14) NOT NULL,
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL,
    preco_custo DECIMAL(10,2) NOT NULL,
    preco_promocional DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_produto, cnpj_filial) REFERENCES Estoque(id_produto, cnpj_filial),
    CONSTRAINT check_periodo CHECK (data_fim >= data_inicio),
    CONSTRAINT check_preco CHECK (preco_promocional >= preco_custo)
);

CREATE TABLE Funcionario (
    cpf VARCHAR(14) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    data_contratacao DATE NOT NULL,
    endereco VARCHAR(200) NOT NULL,
    telefone VARCHAR(15) NOT NULL,
    cargo VARCHAR(50) NOT NULL,
    salario DECIMAL(10,2) NOT NULL,
    cnpj_filial VARCHAR(14) NOT NULL,
    cpf_supervisor VARCHAR(14),
    FOREIGN KEY (cnpj_filial) REFERENCES Filial(cnpj),
    FOREIGN KEY (cpf_supervisor) REFERENCES Funcionario(cpf)
);
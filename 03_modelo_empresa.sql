-- PARTE 03: Modelo Conceitual do Projeto Empresa
/*
Entidades e Atributos:
1. Fornecedor: cnpj (PK), nome (NOT NULL, UNIQUE), telefone (NOT NULL, UNIQUE), endereco (NOT NULL)
2. Produto: id (PK), cnpj_fornecedor (FK), nome (NOT NULL)
3. Identificacao: id (PK e FK para Produto), descricao (NOT NULL), observacao (NOT NULL)
4. Filial: cnpj (PK), nome (NOT NULL, UNIQUE), telefone (NOT NULL, UNIQUE), endereco (NOT NULL)
5. Estoque: id_produto (PK/FK), cnpj_filial (PK/FK), preco (NOT NULL), quantidade (NOT NULL), validade (NOT NULL)
*/
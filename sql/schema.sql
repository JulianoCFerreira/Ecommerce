-- ==============================================
-- SCHEMA: Ecommerce
-- Banco de dados lógico para cenário de e-commerce
-- ==============================================

-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS Ecommerce
  DEFAULT CHARACTER SET utf8mb4
  DEFAULT COLLATE utf8mb4_general_ci;
USE Ecommerce;

-- ========================
-- TABELAS PRINCIPAIS
-- ========================

-- Cliente genérico
CREATE TABLE Cliente (
    id_cliente     INT AUTO_INCREMENT PRIMARY KEY,
    nome           VARCHAR(100)      NOT NULL,
    email          VARCHAR(100)      NOT NULL UNIQUE,
    telefone       VARCHAR(20),
    data_cadastro  DATETIME          DEFAULT CURRENT_TIMESTAMP
);

-- Cliente Pessoa Física (especialização 1:1 com Cliente)
CREATE TABLE ClientePF (
    id_cliente INT PRIMARY KEY,
    cpf        CHAR(11) NOT NULL UNIQUE,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
        ON DELETE CASCADE
);

-- Cliente Pessoa Jurídica (especialização 1:1 com Cliente)
CREATE TABLE ClientePJ (
    id_cliente   INT PRIMARY KEY,
    cnpj         CHAR(14) NOT NULL UNIQUE,
    razao_social VARCHAR(150) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
        ON DELETE CASCADE
);

-- Endereço (um cliente pode ter vários)
CREATE TABLE Endereco (
    id_endereco  INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente   INT NOT NULL,
    logradouro   VARCHAR(150) NOT NULL,
    numero       VARCHAR(20),
    cidade       VARCHAR(100) NOT NULL,
    estado       CHAR(2) NOT NULL,
    cep          CHAR(8) NOT NULL,
    tipo_endereco ENUM('Entrega','Cobranca','Ambos') DEFAULT 'Entrega',
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
        ON DELETE CASCADE
);

-- Fornecedor
CREATE TABLE Fornecedor (
    id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    nome          VARCHAR(150) NOT NULL,
    cnpj          CHAR(14) NOT NULL UNIQUE
);

-- Categoria de produtos
CREATE TABLE Categoria (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome         VARCHAR(100) NOT NULL UNIQUE
);

-- Produto
CREATE TABLE Produto (
    id_produto   INT AUTO_INCREMENT PRIMARY KEY,
    nome         VARCHAR(150) NOT NULL,
    descricao    TEXT,
    preco        DECIMAL(10,2) NOT NULL,
    estoque      INT DEFAULT 0,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES Categoria(id_categoria)
        ON DELETE SET NULL
);

-- Associação N:N Produto x Fornecedor
CREATE TABLE ProdutoFornecedor (
    id_fornecedor INT NOT NULL,
    id_produto    INT NOT NULL,
    PRIMARY KEY (id_fornecedor, id_produto),
    FOREIGN KEY (id_fornecedor) REFERE_

CREATE DATABASE Casocinco;

USE Casocinco;

CREATE TABLE Clientes (
    ClienteID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    CPF VARCHAR(11) NOT NULL UNIQUE,
    DataNascimento DATE,
    Endereco VARCHAR(255),
    StatusFidelidade VARCHAR(50)
);

CREATE TABLE Fornecedores (
    FornecedorID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Contato VARCHAR(100),
    Telefone VARCHAR(15),
    Email VARCHAR(100)
);

CREATE TABLE Produtos (
    ProdutoID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Categoria VARCHAR(50),
    Preco DECIMAL(10, 2),
    QuantidadeEstoque INT,
    FornecedorID INT,
    FOREIGN KEY (FornecedorID) REFERENCES Fornecedores(FornecedorID)
);

CREATE TABLE Vendas (
    VendaID INT AUTO_INCREMENT PRIMARY KEY,
    ClienteID INT,
    DataVenda DATE,
    ValorTotal DECIMAL(10, 2),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

CREATE TABLE Pagamentos (
    PagamentoID INT AUTO_INCREMENT PRIMARY KEY,
    VendaID INT,
    DataPagamento DATE,
    Valor DECIMAL(10, 2),
    Status VARCHAR(50),
    FOREIGN KEY (VendaID) REFERENCES Vendas(VendaID)
);

CREATE TABLE ProdutosVendas (
    ProdutoVendaID INT AUTO_INCREMENT PRIMARY KEY,
    VendaID INT,
    ProdutoID INT,
    Quantidade INT,
    FOREIGN KEY (VendaID) REFERENCES Vendas(VendaID),
    FOREIGN KEY (ProdutoID) REFERENCES Produtos(ProdutoID)
);

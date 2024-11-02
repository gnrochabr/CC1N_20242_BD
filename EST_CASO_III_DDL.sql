CREATE DATABASE Casotres;

USE Casotres;

CREATE TABLE Clientes (
    Codigo INT AUTO_INCREMENT PRIMARY KEY,
    CNPJ VARCHAR(14) NOT NULL UNIQUE,
    RazaoSocial VARCHAR(100) NOT NULL,
    RamoAtividade VARCHAR(100),
    DataCadastramento DATE,
    Telefones VARCHAR(255),
    Enderecos VARCHAR(255),
    PessoaContato VARCHAR(100)
);

CREATE TABLE Empregados (
    Matricula INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Telefones VARCHAR(255),
    Cargo VARCHAR(50),
    Salario DECIMAL(10, 2),
    DataAdmissao DATE,
    Qualificacoes VARCHAR(255),
    Endereco VARCHAR(255)
);

CREATE TABLE Empresas (
    CNPJ VARCHAR(14) PRIMARY KEY,
    RazaoSocial VARCHAR(100) NOT NULL,
    Telefones VARCHAR(255),
    PessoaContato VARCHAR(100),
    Endereco VARCHAR(255)
);

CREATE TABLE Fornecedores (
    CNPJ VARCHAR(14) PRIMARY KEY,
    RazaoSocial VARCHAR(100) NOT NULL,
    Endereco VARCHAR(255),
    Telefones VARCHAR(255),
    PessoaContato VARCHAR(100)
);

CREATE TABLE TipoEndereco (
    Codigo INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL
);

CREATE TABLE Enderecos (
    Numero INT,
    Logradouro VARCHAR(100),
    Complemento VARCHAR(100),
    CEP VARCHAR(8),
    Bairro VARCHAR(50),
    Cidade VARCHAR(50),
    Estado VARCHAR(50),
    TipoEnderecoID INT,
    FOREIGN KEY (TipoEnderecoID) REFERENCES TipoEndereco(Codigo)
);

CREATE TABLE Encomendas (
    Numero INT AUTO_INCREMENT PRIMARY KEY,
    DataInclusao DATE,
    ValorTotal DECIMAL(10, 2),
    ValorDesconto DECIMAL(10, 2),
    ValorLiquido DECIMAL(10, 2),
    IDFormaPagamento INT,
    QuantidadeParcelas INT,
    ClienteID INT,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(Codigo)
);

CREATE TABLE Produtos (
    Codigo INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Cor VARCHAR(50),
    Dimensoes VARCHAR(50),
    Peso DECIMAL(10, 2),
    Preco DECIMAL(10, 2),
    TempoFabricacao INT,
    DesenhoProduto VARCHAR(255),
    HorasMaoDeObra INT
);

CREATE TABLE TiposComponente (
    Codigo INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL
);

CREATE TABLE Componentes (
    Codigo INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    QuantidadeEstoque INT,
    PrecoUnitario DECIMAL(10, 2),
    Unidade VARCHAR(50),
    FornecedorID VARCHAR(14),
    FOREIGN KEY (FornecedorID) REFERENCES Fornecedores(CNPJ)
);

CREATE TABLE Maquinas (
    Codigo INT AUTO_INCREMENT PRIMARY KEY,
    TempoVida INT,
    DataCompra DATE,
    DataFimGarantia DATE
);

CREATE TABLE RecursosEspecificos (
    Codigo INT AUTO_INCREMENT PRIMARY KEY,
    QuantidadeNecessaria INT,
    Unidade VARCHAR(50),
    TempoUso INT,
    HorasMaoDeObra INT
);

CREATE TABLE RegistroManutencao (
    Codigo INT AUTO_INCREMENT PRIMARY KEY,
    Data DATE,
    Descricao VARCHAR(255),
    MaquinaID INT,
    FOREIGN KEY (MaquinaID) REFERENCES Maquinas(Codigo)
);

CREATE TABLE RegistroSuprimentos (
    Codigo INT AUTO_INCREMENT PRIMARY KEY,
    Quantidade INT,
    DataNecessidade DATE,
    ComponenteID INT,
    FOREIGN KEY (ComponenteID) REFERENCES Componentes(Codigo)
);

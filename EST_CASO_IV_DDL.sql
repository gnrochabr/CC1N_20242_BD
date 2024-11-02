CREATE DATABASE Casoquatro;

USE Casoquatro;

CREATE TABLE Alunos (
    AlunoID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    CPF VARCHAR(11) NOT NULL UNIQUE,
    DataNascimento DATE,
    Endereco VARCHAR(255),
    Modalidades VARCHAR(255)
);

CREATE TABLE Instrutores (
    InstrutorID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Modalidades VARCHAR(255),
    Alunos VARCHAR(255)
);

CREATE TABLE Modalidades (
    ModalidadeID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Descricao VARCHAR(255)
);

CREATE TABLE PlanosTreinamento (
    PlanoID INT AUTO_INCREMENT PRIMARY KEY,
    AlunoID INT,
    InstrutorID INT,
    Descricao VARCHAR(255),
    DataInicio DATE,
    DataFim DATE,
    FOREIGN KEY (AlunoID) REFERENCES Alunos(AlunoID),
    FOREIGN KEY (InstrutorID) REFERENCES Instrutores(InstrutorID)
);

CREATE TABLE Aulas (
    AulaID INT AUTO_INCREMENT PRIMARY KEY,
    ModalidadeID INT,
    InstrutorID INT,
    Horario TIME,
    Capacidade INT,
    FOREIGN KEY (ModalidadeID) REFERENCES Modalidades(ModalidadeID),
    FOREIGN KEY (InstrutorID) REFERENCES Instrutores(InstrutorID)
);

CREATE TABLE Pagamentos (
    PagamentoID INT AUTO_INCREMENT PRIMARY KEY,
    AlunoID INT,
    DataPagamento DATE,
    Valor DECIMAL(10, 2),
    Status VARCHAR(50),
    FOREIGN KEY (AlunoID) REFERENCES Alunos(AlunoID)
);

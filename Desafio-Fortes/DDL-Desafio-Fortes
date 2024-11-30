CREATE DATABASE Projeto_Fortificar;

USE Projeto_Fortificar;

CREATE TABLE Funcionarios (
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    endereco VARCHAR(200),
    telefone VARCHAR(15),
    idade INT,
    sexo ENUM('Masculino', 'Feminino', 'Outro'),
    cpf VARCHAR(14) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL
);

CREATE TABLE Usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    endereco VARCHAR(200),
    telefone VARCHAR(15),
    idade INT,
    sexo ENUM('Masculino', 'Feminino', 'Outro'),
    cpf VARCHAR(14) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL
);

CREATE TABLE RelatoriosVisitas (
    id_relatorio INT AUTO_INCREMENT PRIMARY KEY,
    id_funcionario INT NOT NULL,
    instituicao_visitada VARCHAR(150) NOT NULL,
    nome_projeto VARCHAR(150) NOT NULL,
    detalhes_projeto TEXT NOT NULL,
    data_visita DATE NOT NULL,
    FOREIGN KEY (id_funcionario) REFERENCES Funcionarios(id_funcionario)
);

CREATE TABLE PlataformasDivulgacao (
    id_divulgacao INT AUTO_INCREMENT PRIMARY KEY,
    id_funcionario INT NOT NULL,
    plataforma ENUM('YouTube', 'Instagram', 'Facebook') NOT NULL,
    link_postagem VARCHAR(255),
    data_postagem DATETIME NOT NULL,
    FOREIGN KEY (id_funcionario) REFERENCES Funcionarios(id_funcionario)
);

CREATE TABLE Projetos (
    id_projeto INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    nome_projeto VARCHAR(150) NOT NULL,
    descricao_projeto TEXT NOT NULL,
    aprovado ENUM('Pendente', 'Aprovado', 'Reprovado') DEFAULT 'Pendente',
    id_funcionario_aprovador INT,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_funcionario_aprovador) REFERENCES Funcionarios(id_funcionario)
);

CREATE TABLE HistoricoProjetos (
    id_historico INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_funcionario INT NOT NULL,
    id_projeto INT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_funcionario) REFERENCES Funcionarios(id_funcionario),
    FOREIGN KEY (id_projeto) REFERENCES Projetos(id_projeto)
);

CREATE DATABASE IF NOT EXISTS Entrga4;
USE Entrga4;

CREATE TABLE Estudante (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Morada VARCHAR(255),
    Email VARCHAR(100) NOT NULL,
    Telefone VARCHAR(20),
    Password VARCHAR(255) NOT NULL
);

CREATE TABLE Presenca (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Numero_aluno INT NOT NULL,
    Data DATE NOT NULL,
    Hora_entrada TIME NOT NULL,
    Hora_saida TIME
);

CREATE TABLE Inscricao (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Data DATE NOT NULL
);

CREATE TABLE Plano_Inscricao (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Semanal INT NOT NULL,
    Mensal DECIMAL(10,2) NOT NULL,
    Trimestral DATE NOT NULL,
    Anual DATE NOT NULL
);

CREATE TABLE Avaliacao_Fisica (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ID_Estudante INT NOT NULL,
    Matricula INT NOT NULL,
    Comentario TEXT NOT NULL,
    Data_feedback DATE NOT NULL,
    FOREIGN KEY (ID_Estudante) REFERENCES Estudante(ID)
);

CREATE TABLE Modalidade (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Descricao VARCHAR(255),
    Titulo TEXT NOT NULL,
    Imagem VARCHAR(255)
);

CREATE TABLE Plano_Treino (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Descricao TEXT NOT NULL
);

CREATE TABLE Nutricao (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Data DATE NOT NULL,
    Peso DECIMAL(5,2),
    ID_Estudante INT NOT NULL,
    ID_Nutricionista INT NOT NULL,
    FOREIGN KEY (ID_Estudante) REFERENCES Estudante(ID)
);

CREATE TABLE Evento (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Descricao TEXT NOT NULL,
    Data DATE NOT NULL,
    Titulo TEXT NOT NULL,
    Imagem_Evento VARCHAR(255) NOT NULL,
    Hora_inicio TIME NOT NULL,
    Hora_fim TIME NOT NULL,
    Local VARCHAR(255) NOT NULL,
    Responsavel VARCHAR(100) NOT NULL
);

CREATE TABLE Album (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Titulo TEXT NOT NULL,
    Data_Upload DATE NOT NULL
);

CREATE TABLE Foto (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Titulo TEXT,
    Imagem VARCHAR(255) NOT NULL
);

CREATE TABLE Workshop (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Data DATE NOT NULL,
    Nome_formador VARCHAR(100) NOT NULL,
    Titulo TEXT NOT NULL,
    Local VARCHAR(100) NOT NULL
);

CREATE TABLE Feedback (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ID_Estudante INT NOT NULL,
    Nota INT NOT NULL,
    Comentario TEXT NOT NULL,
    Data_feedback DATE NOT NULL,
    FOREIGN KEY (ID_Estudante) REFERENCES Estudante(ID)
);

CREATE TABLE Contacto (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Email VARCHAR(100) NOT NULL,
    Nome VARCHAR(100) NOT NULL,
    Localizacao VARCHAR(255),
    Telefone VARCHAR(20)
);

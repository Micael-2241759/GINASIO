-- Garantir que o schema está criado
CREATE DATABASE academia_db;
USE academia_db;

-- Tabelas principais
CREATE TABLE utilizador (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(100),
    telemovel VARCHAR(15)
);

CREATE TABLE nutricionista (
    id INT AUTO_INCREMENT PRIMARY KEY,
    peso DECIMAL(5,2),
    data DATE,
    id_utilizador INT,
    FOREIGN KEY (id_utilizador) REFERENCES utilizador(id)
);

CREATE TABLE aula (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data DATE,
    titulo VARCHAR(100)
);

CREATE TABLE participa_aula (
    id_utilizador INT,
    id_aula INT,
    PRIMARY KEY (id_utilizador, id_aula),
    FOREIGN KEY (id_utilizador) REFERENCES utilizador(id),
    FOREIGN KEY (id_aula) REFERENCES aula(id)
);

CREATE TABLE album (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data_aplicada DATE,
    titulo VARCHAR(100)
);

CREATE TABLE foto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_album INT,
    imagem TEXT,
    FOREIGN KEY (id_album) REFERENCES album(id)
);

CREATE TABLE workshop (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tema VARCHAR(100),
    descricao TEXT,
    data DATE,
    duracao TIME
);

CREATE TABLE evento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    descricao TEXT,
    data_inicio DATE
);

CREATE TABLE lista (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_evento INT,
    descricao TEXT,
    FOREIGN KEY (id_evento) REFERENCES evento(id)
);

CREATE TABLE modalidades (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_studio INT,
    descricao TEXT,
    imagem TEXT
);

CREATE TABLE plano_treino (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_utilizador INT,
    descricao TEXT,
    FOREIGN KEY (id_utilizador) REFERENCES utilizador(id)
);

CREATE TABLE plano_inicial (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_studio INT,
    descricao TEXT,
    preco DECIMAL(6,2)
);

CREATE TABLE exercicio (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    data DATE,
    preco DECIMAL(6,2),
    id_utilizador INT,
    FOREIGN KEY (id_utilizador) REFERENCES utilizador(id)
);

CREATE TABLE plano_exercicio (
    id_plano INT,
    id_exercicio INT,
    PRIMARY KEY (id_plano, id_exercicio),
    FOREIGN KEY (id_plano) REFERENCES plano_treino(id),
    FOREIGN KEY (id_exercicio) REFERENCES exercicio(id)
);

CREATE TABLE imagem_evento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_evento INT,
    imagem TEXT,
    FOREIGN KEY (id_evento) REFERENCES evento(id)
);

-- Vistas úteis
CREATE VIEW vw_utilizadores_com_planos AS
SELECT u.nome, pt.descricao AS plano_treino
FROM utilizador u
JOIN plano_treino pt ON u.id = pt.id_utilizador;

CREATE VIEW vw_eventos_com_imagens AS
SELECT e.id, e.descricao, e.data_inicio, ie.imagem
FROM evento e
LEFT JOIN imagem_evento ie ON e.id = ie.id_evento;

-- Dados de exemplo
INSERT INTO utilizador (nome, email, password, telemovel)
VALUES ('João Silva', 'joao@example.com', 'senha123', '912345678');

INSERT INTO nutricionista (peso, data, id_utilizador)
VALUES (75.5, '2025-05-01', 1);

INSERT INTO aula (data, titulo)
VALUES ('2025-05-03', 'Yoga Matinal');

INSERT INTO participa_aula (id_utilizador, id_aula)
VALUES (1, 1);

INSERT INTO album (data_aplicada, titulo)
VALUES ('2025-04-15', 'Progresso Abril');

INSERT INTO foto (id_album, imagem)
VALUES (1, 'foto1.jpg');

INSERT INTO evento (descricao, data_inicio)
VALUES ('Evento de Verão', '2025-07-01');

INSERT INTO imagem_evento (id_evento, imagem)
VALUES (1, 'verao.jpg');




CREATE DATABASE LuminosidadeDB;

USE LuminosidadeDB;

-- Tabela Empresa
CREATE TABLE Empresa (
    idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(15),
    cnpj VARCHAR(14) UNIQUE NOT NULL,
    cep VARCHAR(8),
    endereco VARCHAR(255)
);

-- Tabela Usuario
CREATE TABLE Usuario (
    idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    fkIdEmpresa INT,
    nome VARCHAR(50) NOT NULL,
    telefone VARCHAR(15),
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    FOREIGN KEY (fkIdEmpresa) REFERENCES Empresa(idEmpresa)
);

-- Tabela Estufa
CREATE TABLE Estufa (
    idEstufa INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    fkIdEmpresa INT NOT NULL,
    FOREIGN KEY (fkIdEmpresa) REFERENCES Empresa(idEmpresa)
);

-- Tabela Sensor
CREATE TABLE Sensor (
    idSensor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    fkIdEstufa INT NOT NULL,
    dataInstalacao DATETIME NOT NULL,
    FOREIGN KEY (fkIdEstufa) REFERENCES Estufa(idEstufa)
);

-- Tabela Registro
CREATE TABLE Registro (
    idRegistro INT PRIMARY KEY AUTO_INCREMENT,
    fkIdSensor INT NOT NULL,
    luminosidade INT NOT NULL,
    dataRegistro DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (fkIdSensor) REFERENCES Sensor(idSensor)
);

SELECT * FROM Empresa;

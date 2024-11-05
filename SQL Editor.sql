CREATE DATABASE banco_de_dados;
USE banco_de_dados;

CREATE TABLE banco (
    codigo_banco INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL
);

CREATE TABLE agencia (
    codigo_agencia INT PRIMARY KEY AUTO_INCREMENT,
    numero INT NOT NULL,
    codigo_banco INT,
    FOREIGN KEY (codigo_banco) REFERENCES banco(codigo_banco) ON DELETE CASCADE
);

CREATE TABLE conta (
    numero_conta INT PRIMARY KEY AUTO_INCREMENT,
    saldo DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    tipo_conta ENUM('Corrente', 'Poupança') NOT NULL,
    numero_agencia INT,
    cpf_cliente CHAR(11),
    FOREIGN KEY (numero_agencia) REFERENCES agencia(codigo_agencia),
    FOREIGN KEY (cpf_cliente) REFERENCES cliente(cpf) ON DELETE CASCADE
);

CREATE TABLE cliente (
    cpf CHAR(11) PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    sexo ENUM('M', 'F') NOT NULL,
    endereco VARCHAR(255) NOT NULL
);

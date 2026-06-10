-- ============================================================
-- NaraHoteis — Criação do Banco de Dados
-- Arquivo: criacao_banco.sql
-- ============================================================

CREATE DATABASE IF NOT EXISTS narahoteis_db
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE narahoteis_db;

-- ============================================================
-- TABELA: unidades
-- ============================================================
CREATE TABLE unidades (
    id_unidade        INT            NOT NULL AUTO_INCREMENT,
    nome_unidade      VARCHAR(100)   NOT NULL,
    cidade            VARCHAR(100)   NOT NULL,
    regiao            VARCHAR(50)    NOT NULL,
    categoria_hotel   VARCHAR(20)    NOT NULL,
    num_quartos_total INT            NOT NULL,
    PRIMARY KEY (id_unidade)
);

-- ============================================================
-- TABELA: tipos_quarto
-- ============================================================
CREATE TABLE tipos_quarto (
    id_tipo_quarto    INT            NOT NULL AUTO_INCREMENT,
    descricao         VARCHAR(50)    NOT NULL,
    capacidade_max    INT            NOT NULL,
    valor_diaria_base DECIMAL(10,2)  NOT NULL,
    PRIMARY KEY (id_tipo_quarto)
);

-- ============================================================
-- TABELA: clientes
-- ============================================================
CREATE TABLE clientes (
    id_cliente        INT            NOT NULL AUTO_INCREMENT,
    nome              VARCHAR(100)   NOT NULL,
    cidade_origem     VARCHAR(100),
    estado_origem     CHAR(2),
    faixa_etaria      VARCHAR(10),
    tipo_cliente      VARCHAR(20),
    PRIMARY KEY (id_cliente)
);

-- ============================================================
-- TABELA: canais_venda
-- ============================================================
CREATE TABLE canais_venda (
    id_canal          INT            NOT NULL AUTO_INCREMENT,
    nome_canal        VARCHAR(50)    NOT NULL,
    comissao_pct      DECIMAL(5,2)   NOT NULL,
    PRIMARY KEY (id_canal)
);

-- ============================================================
-- TABELA: funcionarios
-- (relacionada com unidades — cada funcionário pertence a uma unidade)
-- ============================================================
CREATE TABLE funcionarios (
    id_funcionario    INT            NOT NULL AUTO_INCREMENT,
    id_unidade        INT            NOT NULL,
    nome              VARCHAR(100)   NOT NULL,
    cargo             VARCHAR(50),
    departamento      VARCHAR(50),
    salario           DECIMAL(10,2),
    data_admissao     DATE,
    PRIMARY KEY (id_funcionario),
    FOREIGN KEY (id_unidade) REFERENCES unidades(id_unidade)
);

-- ============================================================
-- TABELA: reservas (fato principal)
-- ============================================================
CREATE TABLE reservas (
    id_reserva        INT            NOT NULL,
    id_unidade        INT            NOT NULL,
    id_tipo_quarto    INT            NOT NULL,
    id_cliente        INT            NOT NULL,
    id_canal          INT,
    data_checkin      DATE           NOT NULL,
    data_checkout     DATE           NOT NULL,
    qtd_diarias       INT            NOT NULL,
    num_hospedes      INT            NOT NULL,
    avaliacao_hospede DECIMAL(3,1),
    status_reserva    VARCHAR(20),
    forma_pagamento   VARCHAR(30),
    PRIMARY KEY (id_reserva),
    FOREIGN KEY (id_unidade)     REFERENCES unidades(id_unidade),
    FOREIGN KEY (id_tipo_quarto) REFERENCES tipos_quarto(id_tipo_quarto),
    FOREIGN KEY (id_cliente)     REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_canal)       REFERENCES canais_venda(id_canal)
);

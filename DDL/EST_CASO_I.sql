CREATE DATABASE CASOUM;
USE CASOUM;

CREATE TABLE IF NOT EXISTS FORNECEDORES(
    cod_forn INT PRIMARY KEY AUTO_INCREMENT,
    nome_forn VARCHAR (50) NOT NULL,
    end_forn TEXT NOT NULL,
    pais_forn VARCHAR (2) NOT NULL,
    tel_forn VARCHAR(15) NOT NULL,
    contato_forn VARCHAR (50) NOT NULL
);

CREATE TABLE IF NOT EXISTS PRODUTOS(
    cod_prod INT PRIMARY KEY AUTO_INCREMENT,
    nome_prod VARCHAR (50) NOT NULL,
    desc_prod VARCHAR (50) NOT NULL,
    esp_tec_prod VARCHAR (50) NOT NULL,
    uni_med_prod VARCHAR (10) NOT NULL,
    preco_u_prod NUMERIC(12,2) NOT NULL,
    quant_prod INT NOT NULL,
    estoque_min_prod INT NOT NULL,
    local_prod VARCHAR (50) NOT NULL
);

CREATE TABLE IF NOT EXISTS PEDIDOS(
    cod_ped INT PRIMARY KEY AUTO_INCREMENT,
    data_ped DATE NOT NULL,
    hora_ped TIME NOT NULL,
    prev_ped DATETIME NOT NULL,
    status_pedido ENUM ("AGUARDANDO PAGAMENTO", "ENVIADO", "SAINDO PARA ENTREGA", "ENTREGUE")
);

CREATE TABLE IF NOT EXISTS RECEBIMENTOS(
    cod_pedido_r INT NOT NULL, -- Nome corrigido
    data_receb DATE NOT NULL,
    hora_receb TIME NOT NULL,
    quant_prod_receb INT NOT NULL,
    condic_mat_receb VARCHAR (50) NOT NULL,
    CONSTRAINT fk_cod_pedido_r FOREIGN KEY (cod_pedido_r) REFERENCES PEDIDOS(cod_ped), -- Referência corrigida
    PRIMARY KEY (cod_pedido_r, data_receb, hora_receb) -- Ajuste na chave primária
);

CREATE TABLE IF NOT EXISTS FILIAIS (
    cod_filial INT PRIMARY KEY AUTO_INCREMENT,
    nome_filial VARCHAR (50) NOT NULL,
    end_filial VARCHAR (50) NOT NULL,
    capac_arm_filial INT NOT NULL
); 

-- Entidades associativas --

CREATE TABLE IF NOT EXISTS FORNEC_PROD(
    cod_fornec_fp INT NOT NULL,
    cod_prod_fp INT NOT NULL,
    CONSTRAINT fk_cod_fornec FOREIGN KEY (cod_fornec_fp) REFERENCES FORNECEDORES(cod_forn),
    CONSTRAINT fk_cod_prod FOREIGN KEY (cod_prod_fp) REFERENCES PRODUTOS(cod_prod),
    PRIMARY KEY (cod_fornec_fp, cod_prod_fp) 
);

CREATE TABLE IF NOT EXISTS PEDIDO_PROD(
    cod_prod_pp INT NOT NULL,
    cod_pedido_pp INT NOT NULL,
    CONSTRAINT fk_cod_pedido_pp FOREIGN KEY (cod_pedido_pp) REFERENCES PEDIDOS(cod_ped), -- Referência corrigida
    CONSTRAINT fk_cod_prod_pp FOREIGN KEY (cod_prod_pp) REFERENCES PRODUTOS(cod_prod),
    PRIMARY KEY (cod_pedido_pp, cod_prod_pp) 
);

CREATE TABLE IF NOT EXISTS PROD_FILIAL(
    cod_filial_pf INT NOT NULL,
    cod_prod_pf INT NOT NULL,
    CONSTRAINT fk_cod_filial_pf FOREIGN KEY (cod_filial_pf) REFERENCES FILIAIS(cod_filial), -- Referência corrigida
    CONSTRAINT fk_cod_prod_pf FOREIGN KEY (cod_prod_pf) REFERENCES PRODUTOS(cod_prod),
    PRIMARY KEY (cod_filial_pf, cod_prod_pf) 
);

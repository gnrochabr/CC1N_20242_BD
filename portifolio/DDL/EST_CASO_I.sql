###### ESTUDO DE CASO (I) - CADEIA DE SUPRIMENTOS - DDL
##
# CRIAR O BANCO DE DADOS (SCHEMA OU DATABASE):
CREATE SCHEMA IF NOT EXISTS EST_CASO_I;
# SELECIONAR O NOVO SCHEMA OU DATABASE PARA USO:
USE EST_CASO_I;
# DROP SCHEMA EST_CASO_I;
##
### CRIANDO AS TABELAS SEM CHAVES ESTRANGEIRAS
##
# CRIANDO A TABELA FORNECEDORES
CREATE TABLE IF NOT EXISTS FORNECEDORES(
	#NOME_DO_ATRIBUTO - TIPO - RESTRIÇÃO DE INTEGRIDADE(OPCIONAL)
	FORNEC_COD INT(4) PRIMARY KEY AUTO_INCREMENT,
	FORNEC_NOME VARCHAR(45) NOT NULL,
	FORNEC_RUA VARCHAR(45) NOT NULL,
	FORNEC_NUMRUA INT,
	FORNEC_BAIRRO VARCHAR(45) NOT NULL,
	FORNEC_CIDADE VARCHAR(45) NOT NULL,
	FORNEC_ESTADO VARCHAR(45) NOT NULL,
	FORNEC_PAIS VARCHAR(30) NOT NULL,
	FORNEC_CODPOSTAL VARCHAR(10) NOT NULL,
	FORNEC_TELEFONE VARCHAR(15) NOT NULL,
	FORNEC_CONTATO TEXT NOT NULL
);
##
# CRIANDO A TABELA FILIAIS
CREATE TABLE IF NOT EXISTS FILIAIS(
#NOME_DO_ATRIBUTO - TIPO - RESTRIÇÃO DE INTEGRIDADE(OPCIONAL)
	FILIAL_COD INT(2) PRIMARY KEY AUTO_INCREMENT,	
	FILIAL_NOME VARCHAR(45) NOT NULL,
	FILIAL_RUA VARCHAR(100) NOT NULL,
	FILIAL_NUMRUA INT,
	FILIAL_BAIRRO VARCHAR(50) NOT NULL,
	FILIAL_CIDADE VARCHAR(50) NOT NULL,
	FILIAL_ESTADO VARCHAR(50) NOT NULL,
	FILIAL_PAIS VARCHAR(50) NOT NULL,
	FILIAL_CODPOSTAL VARCHAR(10) NOT NULL,
	FILIAL_CAPACIDADE TEXT NOT NULL
);
##
# CRIANDO A TABELA PRODUTOS
CREATE TABLE IF NOT EXISTS PRODUTOS(
	#NOME_DO_ATRIBUTO - TIPO - RESTRIÇÃO DE INTEGRIDADE(OPCIONAL)
	PROD_COD INT(8) PRIMARY KEY AUTO_INCREMENT,
	PROD_NOME VARCHAR(50) NOT NULL,
	PROD_DESCRICAO TEXT NOT NULL,
	PROD_ESPECTEC TEXT NOT NULL,
	PROD_QUANT DECIMAL(10,3) NOT NULL,	
	PROD_PRECOUNIT DECIMAL(10,2) NOT NULL,
	PROD_UNIDMEDIDA VARCHAR(10) NOT NULL,
	PROD_ESTOQ_MIN DECIMAL(10,3) NOT NULL
);
##
### CRIAR AS TABELAS COM DEPENDÊNCIA DE CHAVE ESTRANGEIRA
##
# CRIANDO A TABELA PEDIDOS
CREATE TABLE IF NOT EXISTS PEDIDOS(
	#NOME_DO_ATRIBUTO - TIPO - RESTRIÇÃO DE INTEGRIDADE(OPCIONAL)
	PED_CODIGO INT(6) PRIMARY KEY AUTO_INCREMENT,
	PED_DATA DATE NOT NULL,
	PED_HORA TIME NOT NULL,
	PED_PREVISAO DATE NOT NULL,
	PED_STATUS ENUM('PENDENTE','CONCLUÍDO','EM ESPERA'),
	PED_FORNECEDOR INT NOT NULL, #NOSSA CHAVE ESTRANGEIRA DE FORNECEDOR
	#CRIANDO A REFERENCIA PARA A CHAVE ESTRANGEIRA
	#RESTRIÇÃO APELIDO CH.ESTRANGEIRA(CAMPO CRIADO) REFERENCIA TABELA(CH.PRIMÁRIA)
	CONSTRAINT FK_FORNECEDOR 
		FOREIGN KEY (PED_FORNECEDOR) #DAR NOME A RESTRIÇÃO(CONSTRAINT)
		REFERENCES FORNECEDORES(FORNEC_COD) #REFERENCIA A CHAVE PRIMÁRIA DE FORNECEDORES
);
##
# CRIANDO A TABELA RECEBIMENTOS (DEPENDÊNCIA DE PEDIDOS)
CREATE TABLE IF NOT EXISTS RECEBIMENTOS(
	#NOME_DO_ATRIBUTO - TIPO - RESTRIÇÃO DE INTEGRIDADE(OPCIONAL)
	RECEB_DATA DATE NOT NULL,
	RECEB_HORA TIME NOT NULL,
	RECEB_QUANT_PROD DECIMAL(10,3),
	RECEB_CONDICAO TEXT NOT NULL,
	RECEB_PEDIDOS INT PRIMARY KEY,
	CONSTRAINT FK_PEDIDOS
		FOREIGN KEY(RECEB_PEDIDOS)
        REFERENCES PEDIDOS(PED_CODIGO)
);
###
### CRIANDO AS TABELAS ASSOCIATIVAS (ENTIDADES ASSOCIATIVAS)
##
# CRIANDO A TABELA PEDIDOS_PRODUTOS
CREATE TABLE IF NOT EXISTS PEDIDOS_PRODUTOS(
PDPR_PEDIDOS INT,
PDPR_PRODUTOS INT,
PRIMARY KEY(PDPR_PEDIDOS,PDPR_PRODUTOS),
PDPR_QUANT DECIMAL(10,3) NOT NULL,
CONSTRAINT PDPR_FK_PEDIDOS FOREIGN KEY(PDPR_PEDIDOS) REFERENCES PEDIDOS(PED_CODIGO),
CONSTRAINT PDPR_FK_PRODUTOS FOREIGN KEY(PDPR_PRODUTOS) REFERENCES PRODUTOS(PROD_COD)
);
##
# CRIANDO A TABELA FILIAIS_PRODUTOS
CREATE TABLE IF NOT EXISTS FILIAIS_PRODUTOS(
	#NOME_DO_ATRIBUTO - TIPO - RESTRIÇÃO DE INTEGRIDADE(OPCIONAL)
    FLPR_FILIAL INT,
	FLPR_PRODUTOS INT,
	PRIMARY KEY(FLPR_FILIAL,FLPR_PRODUTOS),
	FLPR_QUANT DECIMAL(10,3) NOT NULL,
	CONSTRAINT FLPR_FK_FILIAIS 
		FOREIGN KEY(FLPR_FILIAL) 
        REFERENCES FILIAIS(FILIAL_COD),
	CONSTRAINT FLPR_FK_PRODUTOS 
		FOREIGN KEY(FLPR_PRODUTOS) 
        REFERENCES PRODUTOS(PROD_COD)
);
#
## CRIAR A TABELA FORNECEDORES_PRODUTOS
CREATE TABLE IF NOT EXISTS FORNECEDORES_PRODUTOS(
	#NOME_DO_ATRIBUTO - TIPO - RESTRIÇÃO DE INTEGRIDADE(OPCIONAL)
	FRPR_FORNECEDOR INT,
	FRPR_PRODUTOS INT,
	PRIMARY KEY(FRPR_FORNECEDOR,FRPR_PRODUTOS),
	CONSTRAINT FRPR_FK_FORNECEDORES FOREIGN KEY(FRPR_FORNECEDOR)
	REFERENCES FORNECEDORES(FORNEC_COD),
	CONSTRAINT FRPR_FK_PRODUTOS FOREIGN KEY(FRPR_PRODUTOS) 
	REFERENCES PRODUTOS(PROD_COD)
);
##
### ALTERANDO AS TABELAS DO BANCO
##
### ALTER COM ADD
##
# ALTERANDO A TABELA FORNECEDORES
ALTER TABLE FORNECEDORES 
	ADD FORNEC_EMAIL_COMER VARCHAR(55); # CAMPO ANULÁVEL
##
# ALTERANDO A TABELA FORNECEDORES
ALTER TABLE FILIAIS 
	ADD FILIAIS_TEL VARCHAR(15); # CAMPO NULÁVEL
##
# ALTERANDO A TABELA PRODUTOS
ALTER TABLE PRODUTOS 
	ADD  PRODUTOS_ FLOAT NOT NULL;
## 
# ALTERANDO A TABELA PEDIDOS
ALTER TABLE PEDIDOS
    ADD PEDIDOS_DESC TEXT;
##
# ALTERANDO A TABELA RECEBIMENTOS
ALTER TABLE RECEBIMENTOS
    ADD RECEBIMENTOS_STATUS BOOL NOT NULL;


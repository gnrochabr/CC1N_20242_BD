###### ESTUDO DE CASO (I) - CADEIA DE SUPRIMENTOS - DML
##
# USANDO O SCHEMA EST_CASO_I
USE EST_CASO_I;
##
# EXIBINDO A COLUNA FORNECEDORES
SHOW COLUMNS FROM FORNECEDORES;
##
# INSERINDO NA COLUNA FORNECEDORES
INSERT INTO FORNECEDORES(
    FORNEC_NOME,
    FORNEC_RUA,
    FORNEC_NUMRUA,
    FORNEC_BAIRRO,
    FORNEC_CIDADE,
    FORNEC_ESTADO,
    FORNEC_PAIS,
    FORNEC_CODPOSTAL,
    FORNEC_TELEFONE,
    FORNEC_CONTATO,
    FORNEC_EMAIL_COMER)
    VALUES (
	"Alice Figueiredo Assis",
    "Av. Vitória",
    1480,
    "Jucutuquara",
    "Vitória",
    "Espírito Santo",
    "Brasil",
    "29017-022",
    "(27)92836-5125",
    "(27)3344-5566",
    "alice.assis@contoso.com"
);
# INSERINDO NA COLUNA FORNECEDORES
INSERT INTO FORNECEDORES(
    FORNEC_NOME,
    FORNEC_RUA,
    FORNEC_NUMRUA,
    FORNEC_BAIRRO,
    FORNEC_CIDADE,
    FORNEC_ESTADO,
    FORNEC_PAIS,
    FORNEC_CODPOSTAL,
    FORNEC_TELEFONE,
    FORNEC_CONTATO,
    FORNEC_EMAIL_COMER)
    VALUES (
	"Maria do Carmo Amaral",
    "Av. Nossa Sra. dos Navegantes",
    1245,
    "Enseada do Suá",
    "Vitória",
    "Espírito Santo",
    "Brasil",
    "29050-335",
    "(27)96314-2147",
    "(27)3497-1247",
    "maria.amaral@contoso.com"
);
##
# EXIBINDO A COLUNA FILIAIS
SHOW COLUMNS FROM FILIAIS;
##
# INSERINDO NA COLUNA FORNECEDORES
INSERT INTO FILIAIS(
    FILIAL_NOME,
    FILIAL_RUA,
    FILIAL_NUMRUA,
    FILIAL_BAIRRO,
    FILIAL_CIDADE,
    FILIAL_ESTADO,
    FILIAL_PAIS,
    FILIAL_CODPOSTAL,
    FILIAL_CAPACIDADE,
    FILIAIS_TEL)
    VALUES (
	"Yara Brasil Fertilizantes",
    "Atalydes Moreira de Souza",
    109,
    "Civit I",
    "Serra",
    "Espírito Santo",
    "Brasil",
    "29168-055",
    "(27)9897-1234",
    "(27)3512-4785",
    "yara@contoso.com"
);



    
    
    
	

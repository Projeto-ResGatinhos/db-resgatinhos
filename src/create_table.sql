-- TABELAS ONG
CREATE TABLE TB_END_ONG (
  ID_END_ONG INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY,
  CEP CHAR(10) NOT NULL,
  RUA VARCHAR(100) NOT NULL,
  NUMERO VARCHAR(10),
  COMPLEMENTO VARCHAR(50),
  BAIRRO VARCHAR(50) NOT NULL,
  CIDADE VARCHAR(50) NOT NULL,
  UF CHAR(2) NOT NULL
);

CREATE TABLE TB_TEL_ONG (
  ID_TEL_ONG INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY,
  DDD CHAR(2) NOT NULL,
  NUMERO CHAR(9) NOT NULL
);

CREATE TABLE TB_ONG (
  ID_ONG INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY,
  ID_END_ONG INTEGER NOT NULL,
  ID_TEL_ONG INTEGER NOT NULL,
  NOME VARCHAR(100) NOT NULL,
  CNPJ CHAR(14) NOT NULL UNIQUE,
  FOREIGN KEY (ID_END_ONG) REFERENCES TB_END_ONG(ID_END_ONG),
  FOREIGN KEY (ID_TEL_ONG) REFERENCES TB_TEL_ONG(ID_TEL_ONG)
);

-- TABELAS COLABORADORES
CREATE TABLE TB_END_COLABORADOR (
  ID_END_COLABORADOR INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY,
  CEP CHAR(10) NOT NULL,
  RUA VARCHAR(100) NOT NULL,
  NUMERO VARCHAR(10),
  COMPLEMENTO VARCHAR(50),
  BAIRRO VARCHAR(50) NOT NULL,
  CIDADE VARCHAR(50) NOT NULL,
  UF CHAR(2) NOT NULL
);

CREATE TABLE TB_TEL_COLABORADOR (
  ID_TEL_COLABORADOR INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY,
  DDD CHAR(2) NOT NULL,
  NUMERO CHAR(9) NOT NULL
);

CREATE TABLE TB_COLABORADOR (
  ID_COLABORADOR INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY,
  ID_ONG INT NOT NULL,
  ID_END_COLABORADOR INTEGER NOT NULL,
  ID_TEL_COLABORADOR INTEGER NOT NULL,
  NOME VARCHAR(100) NOT NULL,
  CARGO VARCHAR(50) NOT NULL,
  DT_NASCIMENTO DATE NOT NULL,
  TIPO_DOCUMENTO VARCHAR(50) NOT NULL,
  DOCUMENTO CHAR(14) NOT NULL UNIQUE,
  FOREIGN KEY (ID_ONG) REFERENCES TB_ONG(ID_ONG),
  FOREIGN KEY (ID_END_COLABORADOR) REFERENCES TB_END_COLABORADOR(ID_END_COLABORADOR),
  FOREIGN KEY (ID_TEL_COLABORADOR) REFERENCES TB_TEL_COLABORADOR(ID_TEL_COLABORADOR)
);

-- TABELA CAIXA
CREATE TABLE TB_CAIXA (
  ID_CAIXA INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY,
  TIPO_OPERACAO VARCHAR(10) CHECK (TIPO_OPERACAO IN ('ENTRADA', 'SAIDA')) NOT NULL,
  DATA_OPERACAO DATE NOT NULL,
  VALOR DECIMAL(10, 2) NOT NULL,
  DESCRICAO VARCHAR(200)
);

-- TABELAS DOAÇÃO/CAMPANHA
CREATE TABLE TB_DOADOR (
  ID_DOADOR INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY,
  NOME VARCHAR(100) NOT NULL,
  LINK_REDE_SOCIAL VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE TB_CAMPANHA (
  ID_CAMPANHA INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY,
  DT_INICIO DATE NOT NULL,
  DT_FINAL DATE NOT NULL,
  OBJETIVO VARCHAR(200) NOT NULL
);

CREATE TABLE TB_DOACAO (
  ID_DOACAO INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY,
  ID_DOADOR INT NOT NULL,
  ID_CAMPANHA INT NOT NULL,
  ID_PRODUTO INT,
  VALOR DECIMAL(10, 2),
  FOREIGN KEY (ID_DOADOR) REFERENCES TB_DOADOR(ID_DOADOR),
  FOREIGN KEY (ID_CAMPANHA) REFERENCES TB_CAMPANHA(ID_CAMPANHA)
);

-- TABELAS PROTUDOS
CREATE TABLE TB_TIPO_PRODUTO (
  ID_TIPO_PRODUTO INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY,
  DESCRICAO VARCHAR(100) NOT NULL
);

CREATE TABLE TB_PRODUTO (
  ID_PRODUTO INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY,
  ID_DOACAO INT NOT NULL,
  ID_TIPO_PRODUTO INT NOT NULL,
  DATA_ENTRADA DATE DEFAULT CURRENT_DATE NOT NULL,
  VALIDADE DATE,
  QTD_ENTRADA INT NOT NULL,
  PESO DECIMAL(10, 2),
  FOREIGN KEY (ID_DOACAO) REFERENCES TB_DOACAO(ID_DOACAO),
  FOREIGN KEY (ID_TIPO_PRODUTO) REFERENCES TB_TIPO_PRODUTO(ID_TIPO_PRODUTO)
);

CREATE TABLE TB_ESTOQUE (
  ID_ESTOQUE INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY,
  ID_PRODUTO INT NOT NULL,
  QUANTIDADE INT NOT NULL,
  DATA_MODIFICACAO DATE DEFAULT CURRENT_DATE,
  FOREIGN KEY (ID_PRODUTO) REFERENCES TB_PRODUTO(ID_PRODUTO)
);

-- TABELA GATO
CREATE TABLE TB_GATO (
  ID_GATO INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY,
  ID_ONG INT NOT NULL,
  NOME_GATO VARCHAR(100) NOT NULL,
  ID_COLAB_RESPONSAVEL INT NOT NULL,
  CEP_RESGATE CHAR(10),
  DESCRICAO_SAUDE VARCHAR(200),
  RACA VARCHAR(50),
  COR VARCHAR(50),
  DT_NASC_APROXIMADA DATE,
  FOREIGN KEY (ID_ONG) REFERENCES TB_ONG(ID_ONG),
  FOREIGN KEY (ID_COLAB_RESPONSAVEL) REFERENCES TB_COLABORADOR(ID_COLABORADOR)
);

-- TABELAS ADOTANTE/ADOÇÃO
CREATE TABLE TB_END_ADOTANTE (
  ID_END_ADOTANTE INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY,
  CEP CHAR(10) NOT NULL,
  RUA VARCHAR(100) NOT NULL,
  NUMERO VARCHAR(10),
  COMPLEMENTO VARCHAR(50),
  BAIRRO VARCHAR(50) NOT NULL,
  CIDADE VARCHAR(50) NOT NULL,
  UF CHAR(2) NOT NULL
);

CREATE TABLE TB_TEL_ADOTANTE (
  ID_TEL_ADOTANTE INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY,
  DDD CHAR(2) NOT NULL,
  NUMERO CHAR(9) NOT NULL
);

CREATE TABLE TB_ADOTANTE (
  ID_ADOTANTE INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY,
  NOME VARCHAR(100) NOT NULL,
  DOCUMENTO CHAR(14) NOT NULL UNIQUE,
  TIPO_DE_DOCUMENTO VARCHAR(50) NOT NULL,
  COMPROVANTE_RESIDENCIA VARCHAR(200),
  ID_END_ADOTANTE INT NOT NULL,
  ID_TEL_ADOTANTE INT NOT NULL,
  INSTAGRAM VARCHAR(100),
  RESIDENCIASEGURA CHAR(3) CHECK (RESIDENCIASEGURA IN ('SIM', 'NÃO')),
  FOREIGN KEY (ID_END_ADOTANTE) REFERENCES TB_END_ADOTANTE(ID_END_ADOTANTE),
  FOREIGN KEY (ID_TEL_ADOTANTE) REFERENCES TB_TEL_ADOTANTE(ID_TEL_ADOTANTE)
);

CREATE TABLE TB_ADOCAO (
  ID_ADOCAO INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY,
  ID_ADOTANTE INT NOT NULL,
  ID_GATO INT NOT NULL,
  ID_ONG INT NOT NULL,
  DT_ADOCAO DATE NOT NULL,
  FOREIGN KEY (ID_ADOTANTE) REFERENCES TB_ADOTANTE(ID_ADOTANTE),
  FOREIGN KEY (ID_GATO) REFERENCES TB_GATO(ID_GATO),
  FOREIGN KEY (ID_ONG) REFERENCES TB_ONG(ID_ONG)
);
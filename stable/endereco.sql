/* Lógico_1: */

CREATE TABLE CVLattes (
    LattesID varchar(40) PRIMARY KEY,
    OrchidID varchar(40),
    telefone integer,
    homepage varchar(40),
    OutrasInfo varchar(40),
    fk_Departamento_codDepto integer,
    fk_Pessoa_codPessoa integer
);

CREATE TABLE Logradouro (
    codLogradouro integer PRIMARY KEY,
    CEP integer,
    Nome varchar(40),
    fk_TipoLogradouro_codTipoLogradouro integer,
    fk_Bairro_codBairro integer
);

CREATE TABLE Bairro (
    codBairro integer PRIMARY KEY,
    nomeBairro varchar(20),
    fk_Cidade_codCidade integer
);

CREATE TABLE Cidade (
    nomeCidade varchar(20),
    codCidade integer PRIMARY KEY,
    fk_Estado_codEstado integer
);

CREATE TABLE Estado (
    codEstado integer PRIMARY KEY,
    nomeEstado varchar(20),
    fk_Pais_codPais integer
);

CREATE TABLE Pais (
    codPais integer PRIMARY KEY,
    nomePais varchar(20)
);

CREATE TABLE Instituicao (
    codInstituicao integer PRIMARY KEY,
    nomeInstituicao varchar(100),
    abreviacao varchar(10),
    fk_Logradouro_codLogradouro integer
);

CREATE TABLE TipoLogradouro (
    codTipoLogradouro integer PRIMARY KEY,
    Nome varchar(20)
);

CREATE TABLE Departamento (
    codDepto integer PRIMARY KEY,
    Nome varchar(100),
    fk_Instituicao_codInstituicao integer
);

CREATE TABLE Pessoa (
    Nome varchar(40),
    codPessoa integer PRIMARY KEY
);

CREATE TABLE Lingua (
    codLingua integer PRIMARY KEY,
    Nome varchar(40)
);

CREATE TABLE NivelLingua (
    codNivelLingua integer PRIMARY KEY,
    Nome varchar(20)
);

CREATE TABLE Premio (
    codPremio integer PRIMARY KEY,
    Titulo varchar(100),
    Ano integer,
    fk_Instituicao_codInstituicao integer
);

CREATE TABLE NomeEmCitacao (
    codNome integer PRIMARY KEY,
    Nome varchar(40)
);

CREATE TABLE Compreende_CVLattes_Lingua_NivelLingua (
    fk_CVLattes_LattesID varchar(40),
    fk_Lingua_codLingua integer,
    fk_NivelLingua_codNivelLingua integer
);

CREATE TABLE Fala_CVLattes_Lingua_NivelLingua (
    fk_CVLattes_LattesID varchar(40),
    fk_Lingua_codLingua integer,
    fk_NivelLingua_codNivelLingua integer
);

CREATE TABLE Escreve_CVLattes_Lingua_NivelLingua (
    fk_CVLattes_LattesID varchar(40),
    fk_Lingua_codLingua integer,
    fk_NivelLingua_codNivelLingua integer
);

CREATE TABLE Le_CVLattes_Lingua_NivelLingua (
    fk_CVLattes_LattesID varchar(40),
    fk_Lingua_codLingua integer,
    fk_NivelLingua_codNivelLingua integer
);

CREATE TABLE CVContemplatdo (
    fk_Premio_codPremio integer,
    fk_CVLattes_LattesID varchar(40)
);

CREATE TABLE NomesEmCitacao (
    fk_NomeEmCitacao_codNome integer,
    fk_Pessoa_codPessoa integer
);
 
ALTER TABLE CVLattes ADD CONSTRAINT FK_CVLattes_2
    FOREIGN KEY (fk_Departamento_codDepto)
    REFERENCES Departamento (codDepto)
    ON DELETE CASCADE;
 
ALTER TABLE CVLattes ADD CONSTRAINT FK_CVLattes_3
    FOREIGN KEY (fk_Pessoa_codPessoa)
    REFERENCES Pessoa (codPessoa)
    ON DELETE CASCADE;
 
ALTER TABLE Logradouro ADD CONSTRAINT FK_Logradouro_2
    FOREIGN KEY (fk_TipoLogradouro_codTipoLogradouro)
    REFERENCES TipoLogradouro (codTipoLogradouro)
    ON DELETE CASCADE;
 
ALTER TABLE Logradouro ADD CONSTRAINT FK_Logradouro_3
    FOREIGN KEY (fk_Bairro_codBairro)
    REFERENCES Bairro (codBairro)
    ON DELETE CASCADE;
 
ALTER TABLE Bairro ADD CONSTRAINT FK_Bairro_2
    FOREIGN KEY (fk_Cidade_codCidade)
    REFERENCES Cidade (codCidade)
    ON DELETE CASCADE;
 
ALTER TABLE Cidade ADD CONSTRAINT FK_Cidade_2
    FOREIGN KEY (fk_Estado_codEstado)
    REFERENCES Estado (codEstado)
    ON DELETE CASCADE;
 
ALTER TABLE Estado ADD CONSTRAINT FK_Estado_2
    FOREIGN KEY (fk_Pais_codPais)
    REFERENCES Pais (codPais)
    ON DELETE CASCADE;
 
ALTER TABLE Instituicao ADD CONSTRAINT FK_Instituicao_2
    FOREIGN KEY (fk_Logradouro_codLogradouro)
    REFERENCES Logradouro (codLogradouro)
    ON DELETE CASCADE;
 
ALTER TABLE Departamento ADD CONSTRAINT FK_Departamento_2
    FOREIGN KEY (fk_Instituicao_codInstituicao)
    REFERENCES Instituicao (codInstituicao)
    ON DELETE CASCADE;
 
ALTER TABLE Premio ADD CONSTRAINT FK_Premio_2
    FOREIGN KEY (fk_Instituicao_codInstituicao)
    REFERENCES Instituicao (codInstituicao)
    ON DELETE CASCADE;
 
ALTER TABLE Compreende_CVLattes_Lingua_NivelLingua ADD CONSTRAINT FK_Compreende_CVLattes_Lingua_NivelLingua_1
    FOREIGN KEY (fk_CVLattes_LattesID)
    REFERENCES CVLattes (LattesID)
    ON DELETE NO ACTION;
 
ALTER TABLE Compreende_CVLattes_Lingua_NivelLingua ADD CONSTRAINT FK_Compreende_CVLattes_Lingua_NivelLingua_2
    FOREIGN KEY (fk_Lingua_codLingua)
    REFERENCES Lingua (codLingua)
    ON DELETE NO ACTION;
 
ALTER TABLE Compreende_CVLattes_Lingua_NivelLingua ADD CONSTRAINT FK_Compreende_CVLattes_Lingua_NivelLingua_3
    FOREIGN KEY (fk_NivelLingua_codNivelLingua)
    REFERENCES NivelLingua (codNivelLingua)
    ON DELETE RESTRICT;
 
ALTER TABLE Fala_CVLattes_Lingua_NivelLingua ADD CONSTRAINT FK_Fala_CVLattes_Lingua_NivelLingua_1
    FOREIGN KEY (fk_CVLattes_LattesID)
    REFERENCES CVLattes (LattesID)
    ON DELETE NO ACTION;
 
ALTER TABLE Fala_CVLattes_Lingua_NivelLingua ADD CONSTRAINT FK_Fala_CVLattes_Lingua_NivelLingua_2
    FOREIGN KEY (fk_Lingua_codLingua)
    REFERENCES Lingua (codLingua)
    ON DELETE NO ACTION;
 
ALTER TABLE Fala_CVLattes_Lingua_NivelLingua ADD CONSTRAINT FK_Fala_CVLattes_Lingua_NivelLingua_3
    FOREIGN KEY (fk_NivelLingua_codNivelLingua)
    REFERENCES NivelLingua (codNivelLingua)
    ON DELETE RESTRICT;
 
ALTER TABLE Escreve_CVLattes_Lingua_NivelLingua ADD CONSTRAINT FK_Escreve_CVLattes_Lingua_NivelLingua_1
    FOREIGN KEY (fk_CVLattes_LattesID)
    REFERENCES CVLattes (LattesID)
    ON DELETE NO ACTION;
 
ALTER TABLE Escreve_CVLattes_Lingua_NivelLingua ADD CONSTRAINT FK_Escreve_CVLattes_Lingua_NivelLingua_2
    FOREIGN KEY (fk_Lingua_codLingua)
    REFERENCES Lingua (codLingua)
    ON DELETE NO ACTION;
 
ALTER TABLE Escreve_CVLattes_Lingua_NivelLingua ADD CONSTRAINT FK_Escreve_CVLattes_Lingua_NivelLingua_3
    FOREIGN KEY (fk_NivelLingua_codNivelLingua)
    REFERENCES NivelLingua (codNivelLingua)
    ON DELETE RESTRICT;
 
ALTER TABLE Le_CVLattes_Lingua_NivelLingua ADD CONSTRAINT FK_Le_CVLattes_Lingua_NivelLingua_1
    FOREIGN KEY (fk_CVLattes_LattesID)
    REFERENCES CVLattes (LattesID)
    ON DELETE NO ACTION;
 
ALTER TABLE Le_CVLattes_Lingua_NivelLingua ADD CONSTRAINT FK_Le_CVLattes_Lingua_NivelLingua_2
    FOREIGN KEY (fk_Lingua_codLingua)
    REFERENCES Lingua (codLingua)
    ON DELETE NO ACTION;
 
ALTER TABLE Le_CVLattes_Lingua_NivelLingua ADD CONSTRAINT FK_Le_CVLattes_Lingua_NivelLingua_3
    FOREIGN KEY (fk_NivelLingua_codNivelLingua)
    REFERENCES NivelLingua (codNivelLingua)
    ON DELETE RESTRICT;
 
ALTER TABLE CVContemplatdo ADD CONSTRAINT FK_CVContemplatdo_1
    FOREIGN KEY (fk_Premio_codPremio)
    REFERENCES Premio (codPremio)
    ON DELETE SET NULL;
 
ALTER TABLE CVContemplatdo ADD CONSTRAINT FK_CVContemplatdo_2
    FOREIGN KEY (fk_CVLattes_LattesID)
    REFERENCES CVLattes (LattesID)
    ON DELETE SET NULL;
 
ALTER TABLE NomesEmCitacao ADD CONSTRAINT FK_NomesEmCitacao_1
    FOREIGN KEY (fk_NomeEmCitacao_codNome)
    REFERENCES NomeEmCitacao (codNome)
    ON DELETE RESTRICT;
 
ALTER TABLE NomesEmCitacao ADD CONSTRAINT FK_NomesEmCitacao_2
    FOREIGN KEY (fk_Pessoa_codPessoa)
    REFERENCES Pessoa (codPessoa)
    ON DELETE SET NULL;
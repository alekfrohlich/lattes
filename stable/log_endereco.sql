CREATE TABLE CVLattes (
    LattesID integer PRIMARY KEY,
    OrchidID integer,
    telefone integer,
    homepage varchar(40),
    fk_Departamento_codDepto integer,
    fk_Pessoa_codPessoa integer
);

CREATE TABLE Logradouro (
    codLogradouro integer PRIMARY KEY,
    CEP integer,
    fk_TipoLogradouro_codTipoLogradouro integer,
    fk_Bairro_codBairro integer
);

CREATE TABLE Bairro (
    codBairro integer PRIMARY KEY,
    nomeBairro varchar(20)
);

CREATE TABLE Cidade (
    nomeCidade varchar(20),
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
    nomeInstituicao varchar(20),
    abreviacao varchar(10)
);

CREATE TABLE TipoLogradouro (
    codTipoLogradouro integer PRIMARY KEY,
    Nome varchar(20)
);

CREATE TABLE Departamento (
    codDepto integer PRIMARY KEY,
    Nome varchar(20),
    fk_Campus_codCampus integer
);

CREATE TABLE Pessoa (
    Nome varchar(20),
    codPessoa integer PRIMARY KEY
);

CREATE TABLE Campus (
    codCampus integer PRIMARY KEY,
    nomeCampus varchar(20),
    fk_Instituicao_codInstituicao integer,
    fk_Logradouro_codLogradouro integer
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
 
ALTER TABLE Cidade ADD CONSTRAINT FK_Cidade_1
    FOREIGN KEY (fk_Estado_codEstado)
    REFERENCES Estado (codEstado)
    ON DELETE CASCADE;
 
ALTER TABLE Estado ADD CONSTRAINT FK_Estado_2
    FOREIGN KEY (fk_Pais_codPais)
    REFERENCES Pais (codPais)
    ON DELETE CASCADE;
 
ALTER TABLE Departamento ADD CONSTRAINT FK_Departamento_2
    FOREIGN KEY (fk_Campus_codCampus)
    REFERENCES Campus (codCampus)
    ON DELETE CASCADE;
 
ALTER TABLE Campus ADD CONSTRAINT FK_Campus_2
    FOREIGN KEY (fk_Instituicao_codInstituicao)
    REFERENCES Instituicao (codInstituicao)
    ON DELETE CASCADE;
 
ALTER TABLE Campus ADD CONSTRAINT FK_Campus_3
    FOREIGN KEY (fk_Logradouro_codLogradouro)
    REFERENCES Logradouro (codLogradouro)
    ON DELETE CASCADE;
/* Lógico_1: */

CREATE TABLE Banca (
    codBanca integer PRIMARY KEY,
    Titulo varchar(100),
    Ano integer,
    fk_TipoBanca_codBanca integer,
    fk_Pessoa_codPessoa integer,
    fk_Instituicao_codInstituicao integer,
    fk_Curso_codCurso integer
);

CREATE TABLE TipoBanca (
    codBanca integer PRIMARY KEY,
    Nome varchar(100)
);

CREATE TABLE Pessoa (
    codPessoa integer PRIMARY KEY
);

CREATE TABLE Orientacao (
    codOrientacao integer PRIMARY KEY,
    Titulo varchar(100),
    Ano integer,
    fk_Pessoa_codPessoa integer,
    fk_Pessoa_codPessoa_ integer,
    fk_Pessoa_codPessoa__ integer,
    fk_TipoOrientacao_codTipoOrientacao integer,
    fk_Instituicao_codInstituicao integer,
    fk_Instituicao_codInstituicao_ integer
);

CREATE TABLE TipoOrientacao (
    codTipoOrientacao integer PRIMARY KEY,
    Nome varchar(100)
);

CREATE TABLE Curso (
    codCurso integer PRIMARY KEY
);

CREATE TABLE Instituicao (
    codInstituicao integer PRIMARY KEY
);

CREATE TABLE MembroDaBanca (
    fk_Pessoa_codPessoa integer,
    fk_Banca_codBanca integer
);

CREATE TABLE CursoDaInstituicao (
    fk_Instituicao_codInstituicao integer,
    fk_Curso_codCurso integer
);
 
ALTER TABLE Banca ADD CONSTRAINT FK_Banca_2
    FOREIGN KEY (fk_TipoBanca_codBanca)
    REFERENCES TipoBanca (codBanca)
    ON DELETE CASCADE;
 
ALTER TABLE Banca ADD CONSTRAINT FK_Banca_3
    FOREIGN KEY (fk_Pessoa_codPessoa)
    REFERENCES Pessoa (codPessoa)
    ON DELETE SET NULL;
 
ALTER TABLE Banca ADD CONSTRAINT FK_Banca_4
    FOREIGN KEY (fk_Instituicao_codInstituicao)
    REFERENCES Instituicao (codInstituicao)
    ON DELETE CASCADE;
 
ALTER TABLE Banca ADD CONSTRAINT FK_Banca_5
    FOREIGN KEY (fk_Curso_codCurso)
    REFERENCES Curso (codCurso)
    ON DELETE CASCADE;
 
ALTER TABLE Orientacao ADD CONSTRAINT FK_Orientacao_2
    FOREIGN KEY (fk_Pessoa_codPessoa, fk_Pessoa_codPessoa_, fk_Pessoa_codPessoa__)
    REFERENCES Pessoa (codPessoa, codPessoa, codPessoa)
    ON DELETE CASCADE;
 
ALTER TABLE Orientacao ADD CONSTRAINT FK_Orientacao_3
    FOREIGN KEY (fk_TipoOrientacao_codTipoOrientacao)
    REFERENCES TipoOrientacao (codTipoOrientacao)
    ON DELETE CASCADE;
 
ALTER TABLE Orientacao ADD CONSTRAINT FK_Orientacao_4
    FOREIGN KEY (fk_Instituicao_codInstituicao, fk_Instituicao_codInstituicao_)
    REFERENCES Instituicao (codInstituicao, codInstituicao)
    ON DELETE CASCADE;
 
ALTER TABLE MembroDaBanca ADD CONSTRAINT FK_MembroDaBanca_1
    FOREIGN KEY (fk_Pessoa_codPessoa)
    REFERENCES Pessoa (codPessoa)
    ON DELETE RESTRICT;
 
ALTER TABLE MembroDaBanca ADD CONSTRAINT FK_MembroDaBanca_2
    FOREIGN KEY (fk_Banca_codBanca)
    REFERENCES Banca (codBanca)
    ON DELETE SET NULL;
 
ALTER TABLE CursoDaInstituicao ADD CONSTRAINT FK_CursoDaInstituicao_1
    FOREIGN KEY (fk_Instituicao_codInstituicao)
    REFERENCES Instituicao (codInstituicao)
    ON DELETE SET NULL;
 
ALTER TABLE CursoDaInstituicao ADD CONSTRAINT FK_CursoDaInstituicao_2
    FOREIGN KEY (fk_Curso_codCurso)
    REFERENCES Curso (codCurso)
    ON DELETE SET NULL;
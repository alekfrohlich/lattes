CREATE TABLE Conceito (
    codConceito integer PRIMARY KEY,
    nomeConceito varchar(20)
);

CREATE TABLE ProgramaDePesquisa (
    nomePrograma varchar(20),
    codProgramaDePesquisa integer PRIMARY KEY
);

CREATE TABLE Titulacao (
    nomeTit varchar(10),
    codTit varchar(40) PRIMARY KEY
);

CREATE TABLE FormacaoAcad (
    anoInicio integer,
    codFormacao integer PRIMARY KEY,
    anoFim integer,
    anoObtencao integer,
    fk_Conceito_codConceito integer,
    fk_ProgramaDePesquisa_codProgramaDePesquisa integer,
    fk_CVLattes_LattesID integer,
    fk_Titulacao_codTit varchar(40),
    fk_Pessoa_codPessoa integer,
    fk_InstituicaoFormacao_codI integer
);

CREATE TABLE FormacaoComplementar (
    cargaHoraria integer,
    anoFim integer,
    Titulo varchar(40),
    anoIn integer,
    codFormComp integer PRIMARY KEY,
    fk_CVLattes_LattesID integer,
    fk_InstituicaoFormacao_codI integer
);

CREATE TABLE InstituicaoFormacao (
    nomeI varchar(20),
    codI integer PRIMARY KEY
);

CREATE TABLE PeriodoSanduiche (
    codPeriodoSand integer PRIMARY KEY,
    fk_InstituicaoFormacao_codI integer,
    fk_FormacaoAcad_codFormacao integer,
    fk_Pessoa_codPessoa integer
);

CREATE TABLE Pessoa (
    codPessoa integer PRIMARY KEY,
    Nome varchar(20)
);

CREATE TABLE CVLattes (
    telefone integer,
    homepage varchar(40),
    OrchidID integer,
    LattesID integer PRIMARY KEY
);
 
ALTER TABLE FormacaoAcad ADD CONSTRAINT FK_FormacaoAcad_2
    FOREIGN KEY (fk_Conceito_codConceito)
    REFERENCES Conceito (codConceito)
    ON DELETE SET NULL;
 
ALTER TABLE FormacaoAcad ADD CONSTRAINT FK_FormacaoAcad_3
    FOREIGN KEY (fk_ProgramaDePesquisa_codProgramaDePesquisa)
    REFERENCES ProgramaDePesquisa (codProgramaDePesquisa)
    ON DELETE SET NULL;
 
ALTER TABLE FormacaoAcad ADD CONSTRAINT FK_FormacaoAcad_4
    FOREIGN KEY (fk_CVLattes_LattesID)
    REFERENCES CVLattes (LattesID)
    ON DELETE CASCADE;
 
ALTER TABLE FormacaoAcad ADD CONSTRAINT FK_FormacaoAcad_5
    FOREIGN KEY (fk_Titulacao_codTit)
    REFERENCES Titulacao (codTit)
    ON DELETE CASCADE;
 
ALTER TABLE FormacaoAcad ADD CONSTRAINT FK_FormacaoAcad_6
    FOREIGN KEY (fk_Pessoa_codPessoa)
    REFERENCES Pessoa (codPessoa)
    ON DELETE CASCADE;
 
ALTER TABLE FormacaoAcad ADD CONSTRAINT FK_FormacaoAcad_7
    FOREIGN KEY (fk_InstituicaoFormacao_codI)
    REFERENCES InstituicaoFormacao (codI)
    ON DELETE CASCADE;
 
ALTER TABLE FormacaoComplementar ADD CONSTRAINT FK_FormacaoComplementar_2
    FOREIGN KEY (fk_CVLattes_LattesID)
    REFERENCES CVLattes (LattesID)
    ON DELETE CASCADE;
 
ALTER TABLE FormacaoComplementar ADD CONSTRAINT FK_FormacaoComplementar_3
    FOREIGN KEY (fk_InstituicaoFormacao_codI)
    REFERENCES InstituicaoFormacao (codI)
    ON DELETE CASCADE;
 
ALTER TABLE PeriodoSanduiche ADD CONSTRAINT FK_PeriodoSanduiche_2
    FOREIGN KEY (fk_InstituicaoFormacao_codI)
    REFERENCES InstituicaoFormacao (codI)
    ON DELETE CASCADE;
 
ALTER TABLE PeriodoSanduiche ADD CONSTRAINT FK_PeriodoSanduiche_3
    FOREIGN KEY (fk_FormacaoAcad_codFormacao)
    REFERENCES FormacaoAcad (codFormacao)
    ON DELETE CASCADE;
 
ALTER TABLE PeriodoSanduiche ADD CONSTRAINT FK_PeriodoSanduiche_4
    FOREIGN KEY (fk_Pessoa_codPessoa)
    REFERENCES Pessoa (codPessoa)
    ON DELETE CASCADE;
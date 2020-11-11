CREATE TABLE Conceito (
    codConceito integer PRIMARY KEY,
    nomeConceito varchar(20)
);

CREATE TABLE CV (
    lattesID integer PRIMARY KEY
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
    fk_CV_lattesID integer,
    fk_Titulacao_codTit varchar(40),
    fk_PessoaOrientador_codPessoa integer,
    fk_InstituicaoFormacao_codI integer
);

CREATE TABLE FormacaoComplementar (
    cargaHoraria integer,
    anoFim integer,
    Titulo varchar(40),
    anoIn integer,
    codFormComp integer PRIMARY KEY,
    fk_CV_lattesID integer,
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
    fk_PessoaOrientador_codPessoa integer
);

CREATE TABLE PessoaOrientador (
    codPessoa integer PRIMARY KEY,
    Nome varchar(20)
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
    FOREIGN KEY (fk_CV_lattesID)
    REFERENCES CV (lattesID)
    ON DELETE CASCADE;
 
ALTER TABLE FormacaoAcad ADD CONSTRAINT FK_FormacaoAcad_5
    FOREIGN KEY (fk_Titulacao_codTit)
    REFERENCES Titulacao (codTit)
    ON DELETE CASCADE;
 
ALTER TABLE FormacaoAcad ADD CONSTRAINT FK_FormacaoAcad_6
    FOREIGN KEY (fk_PessoaOrientador_codPessoa)
    REFERENCES PessoaOrientador (codPessoa)
    ON DELETE CASCADE;
 
ALTER TABLE FormacaoAcad ADD CONSTRAINT FK_FormacaoAcad_7
    FOREIGN KEY (fk_InstituicaoFormacao_codI)
    REFERENCES InstituicaoFormacao (codI)
    ON DELETE CASCADE;
 
ALTER TABLE FormacaoComplementar ADD CONSTRAINT FK_FormacaoComplementar_2
    FOREIGN KEY (fk_CV_lattesID)
    REFERENCES CV (lattesID)
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
    FOREIGN KEY (fk_PessoaOrientador_codPessoa)
    REFERENCES PessoaOrientador (codPessoa)
    ON DELETE CASCADE;
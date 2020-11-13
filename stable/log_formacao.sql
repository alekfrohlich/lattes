/* Lógico_1: */

CREATE TABLE Conceito (
    codConceito integer PRIMARY KEY,
    nomeConceito varchar(20)
);

CREATE TABLE Titulacao (
    nomeTit varchar(10),
    codTit varchar(40) PRIMARY KEY
);

CREATE TABLE FormacaoAcademica_Pessoa_Instituicao (
    codFormacao integer,
    anoInicio integer,
    anoFim integer,
    TituloTrabalhoDeConclusao varchar(40),
    fk_Titulacao_codTit varchar(40),
    fk_CVLattes_LattesID integer,
    fk_Pessoa_codPessoa integer,
    fk_Conceito_codConceito integer,
    fk_Instituicao_codInstituicao integer,
    
    fk_Instituicao_codInstituicao_ integer,
    codPessoa integer,
    codInstituicao integer,
    fk_Curso_codCurso integer,
    PRIMARY KEY (codFormacao, codPessoa, codInstituicao)
);

CREATE TABLE FormacaoComplementar (
    cargaHoraria integer,
    anoFim integer,
    Titulo varchar(40),
    anoIn integer,
    codFormComp integer PRIMARY KEY,
    fk_CVLattes_LattesID integer,
    fk_FormacaoAcademica_Pessoa_Instituicao_codFormacao integer,
    fk_FormacaoAcademica_Pessoa_Instituicao_codPessoa integer,
    fk_FormacaoAcademica_Pessoa_Instituicao_codInstituicao integer
);

CREATE TABLE CVLattes (
    LattesID integer PRIMARY KEY
);

CREATE TABLE Curso (
    codCurso integer PRIMARY KEY,
    Nome varchar(40)
);

CREATE TABLE PalavraChave (
    codPalavraChave integer PRIMARY KEY,
    Nome varchar(20)
);

CREATE TABLE CursosDaInstituicao (
    fk_FormacaoAcademica_Pessoa_Instituicao_codFormacao integer,
    fk_FormacaoAcademica_Pessoa_Instituicao_codPessoa integer,
    fk_FormacaoAcademica_Pessoa_Instituicao_codInstituicao integer,
    fk_Curso_codCurso integer
);

CREATE TABLE PalavrasChaveDaFormacao (
    fk_PalavraChave_codPalavraChave integer,
    fk_FormacaoAcademica_Pessoa_Instituicao_codFormacao integer,
    fk_FormacaoAcademica_Pessoa_Instituicao_codPessoa integer,
    fk_FormacaoAcademica_Pessoa_Instituicao_codInstituicao integer
);
 
ALTER TABLE FormacaoAcademica_Pessoa_Instituicao ADD CONSTRAINT FK_FormacaoAcademica_Pessoa_Instituicao_2
    FOREIGN KEY (fk_Conceito_codConceito)
    REFERENCES Conceito (codConceito)
    ON DELETE SET NULL;
 
ALTER TABLE FormacaoAcademica_Pessoa_Instituicao ADD CONSTRAINT FK_FormacaoAcademica_Pessoa_Instituicao_3
    FOREIGN KEY (fk_Instituicao_codInstituicao, fk_Pessoa_codPessoa, fk_Instituicao_codInstituicao_)
    REFERENCES ??? (???);
 
ALTER TABLE FormacaoAcademica_Pessoa_Instituicao ADD CONSTRAINT FK_FormacaoAcademica_Pessoa_Instituicao_4
    FOREIGN KEY (fk_CVLattes_LattesID)
    REFERENCES CVLattes (LattesID)
    ON DELETE CASCADE;
 
ALTER TABLE FormacaoAcademica_Pessoa_Instituicao ADD CONSTRAINT FK_FormacaoAcademica_Pessoa_Instituicao_5
    FOREIGN KEY (fk_Titulacao_codTit)
    REFERENCES Titulacao (codTit)
    ON DELETE CASCADE;
 
ALTER TABLE FormacaoAcademica_Pessoa_Instituicao ADD CONSTRAINT FK_FormacaoAcademica_Pessoa_Instituicao_6
    FOREIGN KEY (fk_Curso_codCurso)
    REFERENCES Curso (codCurso)
    ON DELETE CASCADE;
 
ALTER TABLE FormacaoComplementar ADD CONSTRAINT FK_FormacaoComplementar_2
    FOREIGN KEY (fk_CVLattes_LattesID)
    REFERENCES CVLattes (LattesID)
    ON DELETE CASCADE;
 
ALTER TABLE FormacaoComplementar ADD CONSTRAINT FK_FormacaoComplementar_3
    FOREIGN KEY (fk_FormacaoAcademica_Pessoa_Instituicao_codFormacao, fk_FormacaoAcademica_Pessoa_Instituicao_codPessoa, fk_FormacaoAcademica_Pessoa_Instituicao_codInstituicao)
    REFERENCES FormacaoAcademica_Pessoa_Instituicao (codFormacao, codPessoa, codInstituicao)
    ON DELETE CASCADE;
 
ALTER TABLE CursosDaInstituicao ADD CONSTRAINT FK_CursosDaInstituicao_1
    FOREIGN KEY (fk_FormacaoAcademica_Pessoa_Instituicao_codFormacao, fk_FormacaoAcademica_Pessoa_Instituicao_codPessoa, fk_FormacaoAcademica_Pessoa_Instituicao_codInstituicao)
    REFERENCES FormacaoAcademica_Pessoa_Instituicao (codFormacao, codPessoa, codInstituicao)
    ON DELETE SET NULL;
 
ALTER TABLE CursosDaInstituicao ADD CONSTRAINT FK_CursosDaInstituicao_2
    FOREIGN KEY (fk_Curso_codCurso)
    REFERENCES Curso (codCurso)
    ON DELETE SET NULL;
 
ALTER TABLE PalavrasChaveDaFormacao ADD CONSTRAINT FK_PalavrasChaveDaFormacao_1
    FOREIGN KEY (fk_PalavraChave_codPalavraChave)
    REFERENCES PalavraChave (codPalavraChave)
    ON DELETE RESTRICT;
 
ALTER TABLE PalavrasChaveDaFormacao ADD CONSTRAINT FK_PalavrasChaveDaFormacao_2
    FOREIGN KEY (fk_FormacaoAcademica_Pessoa_Instituicao_codFormacao, fk_FormacaoAcademica_Pessoa_Instituicao_codPessoa, fk_FormacaoAcademica_Pessoa_Instituicao_codInstituicao)
    REFERENCES FormacaoAcademica_Pessoa_Instituicao (codFormacao, codPessoa, codInstituicao)
    ON DELETE SET NULL;
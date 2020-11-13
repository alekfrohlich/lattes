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
    anoInicio integer,
    codFormacao integer,
    anoFim integer,
    TituloTrabalhoDeConclusao varchar(40),
    fk_Conceito_codConceito integer,
    fk_Instituicao_codInstituicao integer,
    fk_CVLattes_LattesID integer,
    fk_Titulacao_codTit varchar(40),
    fk_Pessoa_codPessoa integer,
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

CREATE TABLE AtuacaoProfissional (
    codAtuacao integer PRIMARY KEY,
    anoInicio integer,
    anoFim integer,
    cargaHoraria integer,
    AtuacaoProfissional_TIPO INT,
    fk_CVLattes_LattesID integer,
    fk_FormacaoAcademica_Pessoa_Instituicao_codFormacao integer,
    fk_FormacaoAcademica_Pessoa_Instituicao_codPessoa integer,
    fk_FormacaoAcademica_Pessoa_Instituicao_codInstituicao integer,
    fk_Enquadramento_codEnquadramento integer,
    fk_Vinculo_codVinculo integer,
    fk_Cargo_codCargo integer,
    fk_Cargo_codCargo_ integer
);

CREATE TABLE Vinculo (
    codVinculo integer PRIMARY KEY,
    Nome varchar(40)
);

CREATE TABLE Enquadramento (
    codEnquadramento integer PRIMARY KEY,
    Nome varchar(40)
);

CREATE TABLE Regime (
    codRegime integer PRIMARY KEY,
    Nome varchar(40)
);

CREATE TABLE NivelDisciplina (
    codNivelDisciplina integer PRIMARY KEY,
    Nome varchar(100)
);

CREATE TABLE Disciplina (
    codDisciplina integer PRIMARY KEY,
    Nome varchar(100),
    fk_NivelDisciplina_codNivelDisciplina integer
);

CREATE TABLE ServicoRealizado (
    codServicoRealizado integer PRIMARY KEY,
    Titulo varchar(100)
);

CREATE TABLE LinhaDePesquisa (
    codLinha integer PRIMARY KEY,
    Nome varchar(100),
    fk_AtuacaoProfissional_codAtuacao integer
);

CREATE TABLE Cargo (
    Nome varchar(100),
    codCargo integer PRIMARY KEY
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

CREATE TABLE RegimeDaAtuacao (
    fk_AtuacaoProfissional_codAtuacao integer,
    fk_Regime_codRegime integer
);

CREATE TABLE DisciplinasMinistradas (
    fk_Disciplina_codDisciplina integer,
    fk_AtuacaoProfissional_codAtuacao integer
);

CREATE TABLE ServicosRealizados (
    fk_ServicoRealizado_codServicoRealizado integer,
    fk_AtuacaoProfissional_codAtuacao integer
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
 
ALTER TABLE AtuacaoProfissional ADD CONSTRAINT FK_AtuacaoProfissional_2
    FOREIGN KEY (fk_CVLattes_LattesID)
    REFERENCES CVLattes (LattesID)
    ON DELETE CASCADE;
 
ALTER TABLE AtuacaoProfissional ADD CONSTRAINT FK_AtuacaoProfissional_3
    FOREIGN KEY (fk_FormacaoAcademica_Pessoa_Instituicao_codFormacao, fk_FormacaoAcademica_Pessoa_Instituicao_codPessoa, fk_FormacaoAcademica_Pessoa_Instituicao_codInstituicao)
    REFERENCES FormacaoAcademica_Pessoa_Instituicao (codFormacao, codPessoa, codInstituicao)
    ON DELETE CASCADE;
 
ALTER TABLE AtuacaoProfissional ADD CONSTRAINT FK_AtuacaoProfissional_4
    FOREIGN KEY (fk_Enquadramento_codEnquadramento)
    REFERENCES Enquadramento (codEnquadramento)
    ON DELETE CASCADE;
 
ALTER TABLE AtuacaoProfissional ADD CONSTRAINT FK_AtuacaoProfissional_5
    FOREIGN KEY (fk_Vinculo_codVinculo)
    REFERENCES Vinculo (codVinculo)
    ON DELETE CASCADE;
 
ALTER TABLE AtuacaoProfissional ADD CONSTRAINT FK_AtuacaoProfissional_6
    FOREIGN KEY (fk_Cargo_codCargo, fk_Cargo_codCargo_)
    REFERENCES Cargo (codCargo, codCargo)
    ON DELETE CASCADE;
 
ALTER TABLE Disciplina ADD CONSTRAINT FK_Disciplina_2
    FOREIGN KEY (fk_NivelDisciplina_codNivelDisciplina)
    REFERENCES NivelDisciplina (codNivelDisciplina)
    ON DELETE CASCADE;
 
ALTER TABLE LinhaDePesquisa ADD CONSTRAINT FK_LinhaDePesquisa_2
    FOREIGN KEY (fk_AtuacaoProfissional_codAtuacao)
    REFERENCES AtuacaoProfissional (codAtuacao)
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
 
ALTER TABLE RegimeDaAtuacao ADD CONSTRAINT FK_RegimeDaAtuacao_1
    FOREIGN KEY (fk_AtuacaoProfissional_codAtuacao)
    REFERENCES AtuacaoProfissional (codAtuacao)
    ON DELETE SET NULL;
 
ALTER TABLE RegimeDaAtuacao ADD CONSTRAINT FK_RegimeDaAtuacao_2
    FOREIGN KEY (fk_Regime_codRegime)
    REFERENCES Regime (codRegime)
    ON DELETE SET NULL;
 
ALTER TABLE DisciplinasMinistradas ADD CONSTRAINT FK_DisciplinasMinistradas_1
    FOREIGN KEY (fk_Disciplina_codDisciplina)
    REFERENCES Disciplina (codDisciplina)
    ON DELETE RESTRICT;
 
ALTER TABLE DisciplinasMinistradas ADD CONSTRAINT FK_DisciplinasMinistradas_2
    FOREIGN KEY (fk_AtuacaoProfissional_codAtuacao)
    REFERENCES AtuacaoProfissional (codAtuacao)
    ON DELETE SET NULL;
 
ALTER TABLE ServicosRealizados ADD CONSTRAINT FK_ServicosRealizados_1
    FOREIGN KEY (fk_ServicoRealizado_codServicoRealizado)
    REFERENCES ServicoRealizado (codServicoRealizado)
    ON DELETE RESTRICT;
 
ALTER TABLE ServicosRealizados ADD CONSTRAINT FK_ServicosRealizados_2
    FOREIGN KEY (fk_AtuacaoProfissional_codAtuacao)
    REFERENCES AtuacaoProfissional (codAtuacao)
    ON DELETE SET NULL;
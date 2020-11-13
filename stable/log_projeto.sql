/* Lógico_1: */

CREATE TABLE Situacao (
    codSituacao integer PRIMARY KEY,
    nomeSituacao varchar(10)
);

CREATE TABLE Financiamento_Projeto (
    Valor real,
    anoInicio integer,
    qtdeDoutorado integer,
    Titulo varchar(20),
    inovacao boolean,
    numProducoes integer,
    qtdGraduacao integer,
    anoFim integer,
    qtdMestrado integer,
    descricao varchar(20),
    codProjeto integer PRIMARY KEY,
    numOrientacoes integer,
    fk_Situacao_codSituacao integer,
    fk_NaturezaProjeto_codNatureza integer,
    fk_Pessoa_codPessoa integer,
    fk_Instituicao_codInstituicao integer,
    fk_NaturezaFinanciamento_codNaturezaFinanciamento integer,
    fk_Moeda_codMoeda integer,
    fk_Edital_numEdital integer,
    Processo integer
);

CREATE TABLE NaturezaProjeto (
    nomeNatureza varchar(10),
    codNatureza integer PRIMARY KEY
);

CREATE TABLE Pessoa (
    codPessoa integer PRIMARY KEY,
    Nome varchar(20)
);

CREATE TABLE NaturezaFinanciamento (
    codNaturezaFinanciamento integer PRIMARY KEY,
    nomeNatureza varchar(20)
);

CREATE TABLE Moeda (
    codMoeda integer PRIMARY KEY,
    nomeMoeda varchar(20)
);

CREATE TABLE Edital (
    numEdital integer PRIMARY KEY,
    nomeEdital varchar(20)
);

CREATE TABLE Instituicao (
    abreviacao varchar(10),
    nomeInstituicao varchar(20),
    codInstituicao integer PRIMARY KEY
);

CREATE TABLE IntegranteProjeto (
    fk_Pessoa_codPessoa integer,
    fk_Financiamento_Projeto_codProjeto integer
);
 
ALTER TABLE Financiamento_Projeto ADD CONSTRAINT FK_Financiamento_Projeto_2
    FOREIGN KEY (fk_Situacao_codSituacao)
    REFERENCES Situacao (codSituacao);
 
ALTER TABLE Financiamento_Projeto ADD CONSTRAINT FK_Financiamento_Projeto_3
    FOREIGN KEY (fk_NaturezaProjeto_codNatureza)
    REFERENCES NaturezaProjeto (codNatureza)
    ON DELETE CASCADE;
 
ALTER TABLE Financiamento_Projeto ADD CONSTRAINT FK_Financiamento_Projeto_4
    FOREIGN KEY (fk_Pessoa_codPessoa)
    REFERENCES Pessoa (codPessoa)
    ON DELETE CASCADE;
 
ALTER TABLE Financiamento_Projeto ADD CONSTRAINT FK_Financiamento_Projeto_5
    FOREIGN KEY (fk_Instituicao_codInstituicao)
    REFERENCES Instituicao (codInstituicao)
    ON DELETE CASCADE;
 
ALTER TABLE Financiamento_Projeto ADD CONSTRAINT FK_Financiamento_Projeto_6
    FOREIGN KEY (fk_NaturezaFinanciamento_codNaturezaFinanciamento)
    REFERENCES NaturezaFinanciamento (codNaturezaFinanciamento)
    ON DELETE CASCADE;
 
ALTER TABLE Financiamento_Projeto ADD CONSTRAINT FK_Financiamento_Projeto_7
    FOREIGN KEY (fk_Moeda_codMoeda)
    REFERENCES Moeda (codMoeda)
    ON DELETE CASCADE;
 
ALTER TABLE Financiamento_Projeto ADD CONSTRAINT FK_Financiamento_Projeto_8
    FOREIGN KEY (fk_Edital_numEdital)
    REFERENCES Edital (numEdital)
    ON DELETE SET NULL;
 
ALTER TABLE IntegranteProjeto ADD CONSTRAINT FK_IntegranteProjeto_1
    FOREIGN KEY (fk_Pessoa_codPessoa)
    REFERENCES Pessoa (codPessoa)
    ON DELETE RESTRICT;
 
ALTER TABLE IntegranteProjeto ADD CONSTRAINT FK_IntegranteProjeto_2
    FOREIGN KEY (fk_Financiamento_Projeto_codProjeto)
    REFERENCES Financiamento_Projeto (codProjeto)
    ON DELETE SET NULL;
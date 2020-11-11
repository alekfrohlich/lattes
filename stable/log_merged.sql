/* Merge */

CREATE TABLE Atuacao (
);

CREATE TABLE LinhaDePesquisa (
);

CREATE TABLE Lingua (
);

CREATE TABLE NivelLingua (
);

CREATE TABLE Premio (
);

CREATE TABLE Periodico (
    codPer integer PRIMARY KEY,
    Nome varchar(40)
);

CREATE TABLE FerramentaDeBusca (
    codFerramenta integer PRIMARY KEY,
    Nome varchar(20)
);

CREATE TABLE ArtigoEmPeriodico (
    Ano integer,
    Titulo varchar(40),
    intervaloPags interval,
    codArtigoEmPer integer PRIMARY KEY,
    fk_Periodico_codPer integer,
    Volume integer
);

CREATE TABLE Livro (
    Volume integer,
    Titulo varchar(40),
    Ano integer,
    codLivro integer PRIMARY KEY,
    qtdPaginas integer,
    Edicao integer
);

CREATE TABLE Editora (
    Nome varchar(20),
    cidade varchar(20),
    codEditora integer PRIMARY KEY
);

CREATE TABLE PessoaAutor (
    nomePA varchar(20),
    codPA integer PRIMARY KEY
);

CREATE TABLE Pessoa (
    codPessoa integer PRIMARY KEY,
    Nome varchar(20)
);

CREATE TABLE CVLattes (
    telefone integer,
    LattesID integer PRIMARY KEY,
    homepage varchar(40),
    OrchidID integer,
    fk_Pessoa_codPessoa integer,
    fk_Departamento_codDepto integer
);

CREATE TABLE Departamento (
    codDepto integer PRIMARY KEY,
    Nome varchar(20),
    fk_Campus_codCampus integer
);

CREATE TABLE Instituicao (
    nomeInstituicao varchar(20),
    abreviacao varchar(10),
    codInstituicao integer PRIMARY KEY
);

CREATE TABLE TipoLogradouro (
    codTipoLogradouro integer PRIMARY KEY,
    Nome varchar(20)
);

CREATE TABLE Campus (
    nomeCampus varchar(20),
    codCampus integer PRIMARY KEY,
    fk_Instituicao_codInstituicao integer,
    fk_Logradouro_codLogradouro integer
);

CREATE TABLE Logradouro (
    codLogradouro integer PRIMARY KEY,
    CEP integer,
    fk_TipoLogradouro_codTipoLogradouro integer,
    fk_Bairro_codBairro integer
);

CREATE TABLE Bairro (
    nomeBairro varchar(20),
    codBairro integer PRIMARY KEY
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
    nomePais varchar(20),
    codPais integer PRIMARY KEY
);

CREATE TABLE PeriodoSanduiche (
    codPeriodoSand integer PRIMARY KEY,
    fk_PessoaOrientador_codPessoa integer,
    fk_InstituicaoFormacao_codI integer,
    fk_FormacaoAcad_codFormacao integer
);

CREATE TABLE PessoaOrientador (
    codPessoa integer PRIMARY KEY,
    Nome varchar(20)
);

CREATE TABLE InstituicaoFormacao (
    codI integer PRIMARY KEY,
    nomeI varchar(20)
);

CREATE TABLE FormacaoAcad (
    anoObtencao integer,
    anoInicio integer,
    codFormacao integer PRIMARY KEY,
    anoFim integer,
    fk_InstituicaoFormacao_codI integer,
    fk_PessoaOrientador_codPessoa integer,
    fk_CV_lattesID integer,
    fk_Titulacao_codTit varchar(40),
    fk_ProgramaDePesquisa_codProgramaDePesquisa integer,
    fk_Conceito_codConceito integer
);

CREATE TABLE FormacaoComplementar (
    anoFim integer,
    cargaHoraria integer,
    codFormComp integer PRIMARY KEY,
    anoIn integer,
    Titulo varchar(40),
    fk_InstituicaoFormacao_codI integer,
    fk_CV_lattesID integer
);

CREATE TABLE CV (
    lattesID integer PRIMARY KEY
);

CREATE TABLE Titulacao (
    nomeTit varchar(10),
    codTit varchar(40) PRIMARY KEY
);

CREATE TABLE ProgramaDePesquisa (
    nomePrograma varchar(20),
    codProgramaDePesquisa integer PRIMARY KEY
);

CREATE TABLE Conceito (
    codConceito integer PRIMARY KEY,
    nomeConceito varchar(20)
);

CREATE TABLE NaturezaFinanciamento (
    codNaturezaFinanciamento integer PRIMARY KEY,
    nomeNatureza varchar(20)
);

CREATE TABLE InstituicaoFinanciamento (
    codI integer PRIMARY KEY,
    Nome varchar(20)
);

CREATE TABLE Edital (
    numEdital integer PRIMARY KEY,
    nomeEdital varchar(20)
);

CREATE TABLE PessoaProjeto (
    Nome varchar(20),
    codP integer PRIMARY KEY
);

CREATE TABLE NaturezaProjeto (
    codNatureza integer PRIMARY KEY,
    nomeNatureza varchar(10)
);

CREATE TABLE Projeto_Financiamento (
    qtdeDoutorado integer,
    anoFim integer,
    qtdGraduacao integer,
    anoInicio integer,
    inovacao boolean,
    numOrientacoes integer,
    numProducoes integer,
    codProjeto integer PRIMARY KEY,
    descricao varchar(20),
    Titulo varchar(20),
    qtdMestrado integer,
    fk_PessoaProjeto_codP integer,
    fk_NaturezaProjeto_codNatureza integer,
    Valor real,
    fk_NaturezaFinanciamento_codNaturezaFinanciamento integer,
    fk_Edital_numEdital integer,
    Processo integer,
    fk_InstituicaoFinanciamento_codI integer,
    fk_Moeda_codMoeda integer,
    fk_Situacao_codSituacao integer
);

CREATE TABLE Moeda (
    nomeMoeda varchar(20),
    codMoeda integer PRIMARY KEY
);

CREATE TABLE Situacao (
    nomeSituacao varchar(10),
    codSituacao integer PRIMARY KEY
);

CREATE TABLE CitacoesPelaFerr (
    fk_FerramentaDeBusca_codFerramenta integer,
    fk_ArtigoEmPeriodico_codArtigoEmPer integer,
    Quantidade integer
);

CREATE TABLE AutorArtigo (
    fk_PessoaAutor_codPA integer,
    fk_ArtigoEmPeriodico_codArtigoEmPer integer
);

CREATE TABLE AutorLivro (
    fk_PessoaAutor_codPA integer,
    fk_Livro_codLivro integer
);

CREATE TABLE OrganizadorLivro (
    fk_PessoaAutor_codPA integer,
    fk_Livro_codLivro integer
);

CREATE TABLE IntegranteProjeto (
    fk_PessoaProjeto_codP integer,
    fk_Projeto_Financiamento_codProjeto integer
);
 
ALTER TABLE ArtigoEmPeriodico ADD CONSTRAINT FK_ArtigoEmPeriodico_2
    FOREIGN KEY (fk_Periodico_codPer)
    REFERENCES Periodico (codPer)
    ON DELETE CASCADE;
 
ALTER TABLE CVLattes ADD CONSTRAINT FK_CVLattes_2
    FOREIGN KEY (fk_Pessoa_codPessoa)
    REFERENCES Pessoa (codPessoa)
    ON DELETE CASCADE;
 
ALTER TABLE CVLattes ADD CONSTRAINT FK_CVLattes_3
    FOREIGN KEY (fk_Departamento_codDepto)
    REFERENCES Departamento (codDepto)
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
 
ALTER TABLE PeriodoSanduiche ADD CONSTRAINT FK_PeriodoSanduiche_2
    FOREIGN KEY (fk_PessoaOrientador_codPessoa)
    REFERENCES PessoaOrientador (codPessoa)
    ON DELETE CASCADE;
 
ALTER TABLE PeriodoSanduiche ADD CONSTRAINT FK_PeriodoSanduiche_3
    FOREIGN KEY (fk_InstituicaoFormacao_codI)
    REFERENCES InstituicaoFormacao (codI)
    ON DELETE CASCADE;
 
ALTER TABLE PeriodoSanduiche ADD CONSTRAINT FK_PeriodoSanduiche_4
    FOREIGN KEY (fk_FormacaoAcad_codFormacao)
    REFERENCES FormacaoAcad (codFormacao)
    ON DELETE CASCADE;
 
ALTER TABLE FormacaoAcad ADD CONSTRAINT FK_FormacaoAcad_2
    FOREIGN KEY (fk_InstituicaoFormacao_codI)
    REFERENCES InstituicaoFormacao (codI)
    ON DELETE CASCADE;
 
ALTER TABLE FormacaoAcad ADD CONSTRAINT FK_FormacaoAcad_3
    FOREIGN KEY (fk_PessoaOrientador_codPessoa)
    REFERENCES PessoaOrientador (codPessoa)
    ON DELETE CASCADE;
 
ALTER TABLE FormacaoAcad ADD CONSTRAINT FK_FormacaoAcad_4
    FOREIGN KEY (fk_CV_lattesID)
    REFERENCES CV (lattesID)
    ON DELETE CASCADE;
 
ALTER TABLE FormacaoAcad ADD CONSTRAINT FK_FormacaoAcad_5
    FOREIGN KEY (fk_Titulacao_codTit)
    REFERENCES Titulacao (codTit)
    ON DELETE CASCADE;
 
ALTER TABLE FormacaoAcad ADD CONSTRAINT FK_FormacaoAcad_6
    FOREIGN KEY (fk_ProgramaDePesquisa_codProgramaDePesquisa)
    REFERENCES ProgramaDePesquisa (codProgramaDePesquisa)
    ON DELETE SET NULL;
 
ALTER TABLE FormacaoAcad ADD CONSTRAINT FK_FormacaoAcad_7
    FOREIGN KEY (fk_Conceito_codConceito)
    REFERENCES Conceito (codConceito)
    ON DELETE SET NULL;
 
ALTER TABLE FormacaoComplementar ADD CONSTRAINT FK_FormacaoComplementar_2
    FOREIGN KEY (fk_InstituicaoFormacao_codI)
    REFERENCES InstituicaoFormacao (codI)
    ON DELETE CASCADE;
 
ALTER TABLE FormacaoComplementar ADD CONSTRAINT FK_FormacaoComplementar_3
    FOREIGN KEY (fk_CV_lattesID)
    REFERENCES CV (lattesID)
    ON DELETE CASCADE;
 
ALTER TABLE Projeto_Financiamento ADD CONSTRAINT FK_Projeto_Financiamento_2
    FOREIGN KEY (fk_PessoaProjeto_codP)
    REFERENCES PessoaProjeto (codP)
    ON DELETE CASCADE;
 
ALTER TABLE Projeto_Financiamento ADD CONSTRAINT FK_Projeto_Financiamento_3
    FOREIGN KEY (fk_NaturezaProjeto_codNatureza)
    REFERENCES NaturezaProjeto (codNatureza)
    ON DELETE CASCADE;
 
ALTER TABLE Projeto_Financiamento ADD CONSTRAINT FK_Projeto_Financiamento_4
    FOREIGN KEY (fk_NaturezaFinanciamento_codNaturezaFinanciamento)
    REFERENCES NaturezaFinanciamento (codNaturezaFinanciamento);
 
ALTER TABLE Projeto_Financiamento ADD CONSTRAINT FK_Projeto_Financiamento_5
    FOREIGN KEY (fk_Edital_numEdital)
    REFERENCES Edital (numEdital);
 
ALTER TABLE Projeto_Financiamento ADD CONSTRAINT FK_Projeto_Financiamento_6
    FOREIGN KEY (fk_InstituicaoFinanciamento_codI)
    REFERENCES InstituicaoFinanciamento (codI);
 
ALTER TABLE Projeto_Financiamento ADD CONSTRAINT FK_Projeto_Financiamento_7
    FOREIGN KEY (fk_Moeda_codMoeda)
    REFERENCES Moeda (codMoeda);
 
ALTER TABLE Projeto_Financiamento ADD CONSTRAINT FK_Projeto_Financiamento_8
    FOREIGN KEY (fk_Situacao_codSituacao)
    REFERENCES Situacao (codSituacao)
    ON DELETE CASCADE;
 
ALTER TABLE CitacoesPelaFerr ADD CONSTRAINT FK_CitacoesPelaFerr_1
    FOREIGN KEY (fk_FerramentaDeBusca_codFerramenta)
    REFERENCES FerramentaDeBusca (codFerramenta)
    ON DELETE SET NULL;
 
ALTER TABLE CitacoesPelaFerr ADD CONSTRAINT FK_CitacoesPelaFerr_2
    FOREIGN KEY (fk_ArtigoEmPeriodico_codArtigoEmPer)
    REFERENCES ArtigoEmPeriodico (codArtigoEmPer)
    ON DELETE SET NULL;
 
ALTER TABLE AutorArtigo ADD CONSTRAINT FK_AutorArtigo_1
    FOREIGN KEY (fk_PessoaAutor_codPA)
    REFERENCES PessoaAutor (codPA)
    ON DELETE RESTRICT;
 
ALTER TABLE AutorArtigo ADD CONSTRAINT FK_AutorArtigo_2
    FOREIGN KEY (fk_ArtigoEmPeriodico_codArtigoEmPer)
    REFERENCES ArtigoEmPeriodico (codArtigoEmPer)
    ON DELETE SET NULL;
 
ALTER TABLE AutorLivro ADD CONSTRAINT FK_AutorLivro_1
    FOREIGN KEY (fk_PessoaAutor_codPA)
    REFERENCES PessoaAutor (codPA)
    ON DELETE RESTRICT;
 
ALTER TABLE AutorLivro ADD CONSTRAINT FK_AutorLivro_2
    FOREIGN KEY (fk_Livro_codLivro)
    REFERENCES Livro (codLivro)
    ON DELETE SET NULL;
 
ALTER TABLE OrganizadorLivro ADD CONSTRAINT FK_OrganizadorLivro_1
    FOREIGN KEY (fk_PessoaAutor_codPA)
    REFERENCES PessoaAutor (codPA)
    ON DELETE RESTRICT;
 
ALTER TABLE OrganizadorLivro ADD CONSTRAINT FK_OrganizadorLivro_2
    FOREIGN KEY (fk_Livro_codLivro)
    REFERENCES Livro (codLivro)
    ON DELETE SET NULL;
 
ALTER TABLE IntegranteProjeto ADD CONSTRAINT FK_IntegranteProjeto_1
    FOREIGN KEY (fk_PessoaProjeto_codP)
    REFERENCES PessoaProjeto (codP)
    ON DELETE RESTRICT;
 
ALTER TABLE IntegranteProjeto ADD CONSTRAINT FK_IntegranteProjeto_2
    FOREIGN KEY (fk_Projeto_Financiamento_codProjeto)
    REFERENCES Projeto_Financiamento (codProjeto)
    ON DELETE SET NULL;
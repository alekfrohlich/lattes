-- BEGIN endereco.sql

CREATE TABLE CVLattes (
    LattesID bigint PRIMARY KEY,
    OrchidID varchar(40),
    telefone bigint,
    homepage varchar(100),
    OutrasInfo varchar(100),
    sala integer,
    descricao text,
    fk_Departamento_codDepto integer,
    fk_Bolsa_codBolsa integer
);

CREATE TABLE Logradouro (
    codLogradouro integer PRIMARY KEY,
    CEP integer,
    Nome varchar(100),
    Complemento varchar(100),
    fk_TipoLogradouro_codTipoLogradouro integer,
    fk_Bairro_codBairro integer
);

CREATE TABLE Bairro (
    codBairro integer PRIMARY KEY,
    nomeBairro varchar(40),
    fk_Cidade_codCidade integer
);

CREATE TABLE Cidade (
    nomeCidade varchar(40),
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
    codPessoa integer PRIMARY KEY,
    Nome varchar(40),
    LattesID bigint,
    FOREIGN KEY (LattesID) REFERENCES CVLattes(LattesID)
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
    numNome integer PRIMARY KEY,
    Nome varchar(40),
    fk_Pessoa_codPessoa integer
);

CREATE TABLE Bolsa (
    codBolsa integer PRIMARY KEY,
    nome varchar(100)
);

CREATE TABLE Compreende_CVLattes_Lingua_NivelLingua (
    fk_CVLattes_LattesID bigint,
    fk_Lingua_codLingua integer,
    fk_NivelLingua_codNivelLingua integer,
    PRIMARY KEY (fk_CVLattes_LattesID, fk_Lingua_codLingua, fk_NivelLingua_codNivelLingua)
);

CREATE TABLE Fala_CVLattes_Lingua_NivelLingua (
    fk_CVLattes_LattesID bigint,
    fk_Lingua_codLingua integer,
    fk_NivelLingua_codNivelLingua integer,
    PRIMARY KEY (fk_CVLattes_LattesID, fk_Lingua_codLingua, fk_NivelLingua_codNivelLingua)
);

CREATE TABLE Escreve_CVLattes_Lingua_NivelLingua (
    fk_CVLattes_LattesID bigint,
    fk_Lingua_codLingua integer,
    fk_NivelLingua_codNivelLingua integer,
    PRIMARY KEY (fk_CVLattes_LattesID, fk_Lingua_codLingua, fk_NivelLingua_codNivelLingua)
);

CREATE TABLE Le_CVLattes_Lingua_NivelLingua (
    fk_CVLattes_LattesID bigint,
    fk_Lingua_codLingua integer,
    fk_NivelLingua_codNivelLingua integer,
    PRIMARY KEY (fk_CVLattes_LattesID, fk_Lingua_codLingua, fk_NivelLingua_codNivelLingua)
);

CREATE TABLE CVContemplatdo (
    fk_Premio_codPremio integer,
    fk_CVLattes_LattesID bigint,
    PRIMARY KEY (fk_Premio_codPremio, fk_CVLattes_LattesID)
);


-- BEGIN formacao.sql


CREATE TABLE Conceito (
    codConceito integer PRIMARY KEY,
    nomeConceito varchar(20)
);

CREATE TABLE Titulacao (
    codTitulacao integer PRIMARY KEY,
    nomeTitulacao varchar(20)
);

CREATE TABLE FormacaoAcademica (
    codFormacao integer PRIMARY KEY,
    anoInicio integer,
    anoFim integer,
    TituloTrabalhoDeConclusao varchar(200),
    fk_Instituicao_codInstituicao integer,
    fk_CVLattes_LattesID bigint,
    fk_Titulacao_codTitulacao integer,
    fk_Pessoa_codPessoa integer,
    fk_Instituicao_codInstituicao_ integer,
    fk_Curso_codCurso integer
);

CREATE TABLE FormacaoComplementar (
    codFormComp integer PRIMARY KEY,
    Titulo varchar(40),
    cargaHoraria integer,
    anoFim integer,
    anoIn integer,
    fk_CVLattes_LattesID bigint,
    fk_Instituicao_codInstituicao integer
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
    outrasInfo varchar(100),
    fk_CVLattes_LattesID bigint,
    fk_Instituicao_codInstituicao integer,
    fk_Enquadramento_codEnquadramento integer,
    fk_Vinculo_codVinculo integer,
    fk_Regime_codRegime integer
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
    fk_NivelDisciplina_codNivelDisciplina integer,
    fk_Curso_codCurso integer
);

CREATE TABLE Ensino (
    codAtividade integer PRIMARY KEY,
    dataInicio date,
    dataFim date,
    descricao varchar(100),
    fk_AtuacaoProfissional_codAtuacao integer
);

CREATE TABLE ServicoTecnico (
    codAtividade integer PRIMARY KEY,
    dataInicio date,
    dataFim date,
    descricao varchar(100),
    fk_AtuacaoProfissional_codAtuacao integer
);

CREATE TABLE ServicoRealizado (
    codServicoRealizado integer PRIMARY KEY,
    Titulo varchar(100)
);

CREATE TABLE LinhaDePesquisa (
    codLinha integer PRIMARY KEY,
    Nome varchar(100)
);

CREATE TABLE P_D (
    codAtividade integer PRIMARY KEY,
    dataInicio date,
    dataFim date,
    descricao varchar(100),
    FK_AtuacaoProfissional_codAtuacao integer
);

CREATE TABLE Cargo (
    codCargo integer PRIMARY KEY,
    Nome varchar(100)
);

CREATE TABLE ConselhoComissaoConsultoria (
    codAtividade integer PRIMARY KEY,
    dataInicio date,
    dataFim date,
    descricao varchar(100),
    fk_Cargo_codCargo integer,
    fk_AtuacaoProfissional_codAtuacao integer
);

CREATE TABLE DirecaoAdm (
    codAtividade integer PRIMARY KEY,
    dataInicio date,
    dataFim date,
    descricao varchar(100),
    fk_Cargo_codCargo integer,
    fk_AtuacaoProfissional_codAtuacao integer
);

CREATE TABLE Especialidade (
    codEspecialidade integer PRIMARY KEY,
    Nome varchar(20),
    fk_SubArea_codSubArea integer
);

CREATE TABLE SubArea (
    codSubArea integer PRIMARY KEY,
    Nome varchar(40),
    fk_Area_codArea integer
);

CREATE TABLE Area (
    codArea integer PRIMARY KEY,
    Nome varchar(40),
    fk_GrandeArea_codGrandeArea integer
);

CREATE TABLE GrandeArea (
    codGrandeArea integer PRIMARY KEY,
    Nome varchar(40)
);

CREATE TABLE ConceitoDoCurso_Curso_Conceito_Instituicao (
    fk_Curso_codCurso integer,
    fk_Conceito_codConceito integer,
    fk_Instituicao_codInstituicao integer,
    PRIMARY KEY (fk_Curso_codCurso, fk_Conceito_codConceito, fk_Instituicao_codInstituicao)
);

CREATE TABLE PeriodoSanduiche_FormacaoAcademica_Pessoa_Instituicao (
    fk_FormacaoAcademica_codFormacao integer,
    fk_Pessoa_codPessoa integer,
    fk_Instituicao_codInstituicao integer,
    PRIMARY KEY (fk_FormacaoAcademica_codFormacao, fk_Pessoa_codPessoa, fk_Instituicao_codInstituicao)
);

CREATE TABLE CursosDaInstituicao (
    fk_Instituicao_codInstituicao integer,
    fk_Curso_codCurso integer,
    PRIMARY KEY (fk_Instituicao_codInstituicao, fk_Curso_codCurso)
);

CREATE TABLE PalavrasChaveDaFormacao (
    fk_PalavraChave_codPalavraChave integer,
    fk_FormacaoAcademica_codFormacao integer,
    PRIMARY KEY (fk_PalavraChave_codPalavraChave, fk_FormacaoAcademica_codFormacao)
);

CREATE TABLE DisciplinasMinistradas (
    fk_Disciplina_codDisciplina integer,
    fk_Ensino_codAtividade integer,
    PRIMARY KEY (fk_Disciplina_codDisciplina, fk_Ensino_codAtividade)
);

CREATE TABLE ServicosRealizados (
    fk_ServicoRealizado_codServicoRealizado integer,
    fk_ServicoTecnico_codAtividade integer,
    PRIMARY KEY (fk_ServicoRealizado_codServicoRealizado, fk_ServicoTecnico_codAtividade)
);

CREATE TABLE LinhasDePesquisa (
    fk_LinhaDePesquisa_codLinha integer,
    fk_P_D_codAtividade integer,
    PRIMARY KEY (fk_LinhaDePesquisa_codLinha, fk_P_D_codAtividade)
);

CREATE TABLE EspecialidadeDaFormacao (
    fk_FormacaoAcademica_codFormacao integer,
    fk_Especialidade_codEspecialidade integer,
    PRIMARY KEY (fk_FormacaoAcademica_codFormacao, fk_Especialidade_codEspecialidade)
);

CREATE TABLE SubAreaDaFormacao (
    fk_FormacaoAcademica_codFormacao integer,
    fk_SubArea_codSubArea integer,
    PRIMARY KEY (fk_FormacaoAcademica_codFormacao, fk_SubArea_codSubArea)
);

CREATE TABLE AreaDaFormacao (
    fk_FormacaoAcademica_codFormacao integer,
    fk_Area_codArea integer,
    PRIMARY KEY (fk_FormacaoAcademica_codFormacao, fk_Area_codArea)
);

CREATE TABLE GrandeAreaDaFormacao (
    fk_FormacaoAcademica_codFormacao integer,
    fk_GrandeArea_codGrandeArea integer,
    PRIMARY KEY (fk_FormacaoAcademica_codFormacao, fk_GrandeArea_codGrandeArea)
);


-- BEGIN orientacao.sql


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

CREATE TABLE Orientacao (
    codOrientacao integer PRIMARY KEY,
    Titulo varchar(100),
    Ano integer,
    orientador boolean,
    fk_Pessoa_codPessoa integer,
    fk_TipoOrientacao_codTipoOrientacao integer,
    fk_Instituicao_codInstituicao integer,
    fk_Instituicao_codInstituicao_ integer,
    fk_CVLattes_LattesID bigint,
    fk_Curso_codCurso integer
);

CREATE TABLE TipoOrientacao (
    codTipoOrientacao integer PRIMARY KEY,
    Nome varchar(100)
);

CREATE TABLE MembroDaBanca (
    fk_Pessoa_codPessoa integer,
    fk_Banca_codBanca integer,
    PRIMARY KEY (fk_Pessoa_codPessoa, fk_Banca_codBanca)
);


-- BEGIN producao.sql


CREATE TABLE Editora (
    codEditora integer PRIMARY KEY,
    Nome varchar(40),
    fk_Cidade_codCidade integer
);

CREATE TABLE Livro (
    codLivro integer PRIMARY KEY,
    Ano integer,
    Volume integer,
    Edicao integer,
    qtdPaginas integer,
    Titulo varchar(40),
    fk_Editora_codEditora integer
);

CREATE TABLE ArtigoEmPeriodico (
    codArtigoEmPeriodico integer PRIMARY KEY,
    Ano integer,
    intervaloPags interval,
    Titulo varchar(40),
    fk_Periodico_codPeriodico integer,
    Volume integer
);

CREATE TABLE FerramentaDeBusca (
    codFerramenta integer PRIMARY KEY,
    Nome varchar(20)
);

CREATE TABLE Periodico (
    codPeriodico integer PRIMARY KEY,
    Nome varchar(40),
    fk_Qualis_codQualis integer
);

CREATE TABLE PublicacaoEmCongresso (
    codArtigoEmCongresso integer PRIMARY KEY,
    Titulo varchar(40),
    intPags interval,
    fk_TipoProducao_codTipoProducao integer,
    fk_Evento_codEvento integer,
    NomeAnais varchar(100)
);

CREATE TABLE TipoProducao (
    codTipoProducao integer PRIMARY KEY,
    Nome varchar(20)
);

CREATE TABLE Evento (
    codEvento integer PRIMARY KEY,
    nomeEvento varchar(40),
    ano integer,
    fk_TipoEvento_codTipoEvento integer,
    fk_Cidade_codCidade integer
);

CREATE TABLE TipoEvento (
    codTipoEvento integer PRIMARY KEY,
    Nome varchar(20)
);

CREATE TABLE CapituloDeLivro (
    codCap integer PRIMARY KEY,
    Titulo varchar(40),
    intervaloPags interval,
    fk_Livro_codLivro integer
);

CREATE TABLE ApresentacaoDeTrabalho (
    codApresentacao integer PRIMARY KEY,
    Titulo varchar(100),
    ano integer,
    fk_TipoProducao_codTipoProducao integer
);

CREATE TABLE OutraProducaoBibliografica (
    codOutraProd integer PRIMARY KEY,
    titulo varchar(40),
    ano integer,
    localNaInstituicao varchar(40),
    fk_TipoProducao_codTipoProducao integer,
    fk_Cidade_codCidade integer
);

CREATE TABLE ProducaoTecnica (
    codProdTecnica integer PRIMARY KEY,
    Titulo varchar(100),
    ano integer,
    fk_TipoProducao_codTipoProducao integer
);

CREATE TABLE Qualis (
    codQualis integer PRIMARY KEY,
    Nome varchar(20)
);

CREATE TABLE ProgramaDePC (
    codProgramaPC integer PRIMARY KEY,
    NomePrograma varchar(100),
    Ano integer
);

CREATE TABLE Assessoria (
    codAssessoria integer PRIMARY KEY,
    Titulo varchar(100),
    Ano integer,
    fk_Instituicao_codInstituicao integer
);

CREATE TABLE OrganizadorLivro (
    fk_Pessoa_codPessoa integer,
    fk_Livro_codLivro integer,
    PRIMARY KEY (fk_Pessoa_codPessoa, fk_Livro_codLivro)
);

CREATE TABLE AutorLivro (
    fk_Pessoa_codPessoa integer,
    fk_Livro_codLivro integer,
    PRIMARY KEY (fk_Pessoa_codPessoa, fk_Livro_codLivro)
);

CREATE TABLE AutorArtigoEmPeriodico (
    fk_Pessoa_codPessoa integer,
    fk_ArtigoEmPeriodico_codArtigoEmPeriodico integer,
    PRIMARY KEY (fk_Pessoa_codPessoa, fk_ArtigoEmPeriodico_codArtigoEmPeriodico)
);

CREATE TABLE CitacoesPelaFerramenta (
    fk_FerramentaDeBusca_codFerramenta integer,
    fk_ArtigoEmPeriodico_codArtigoEmPeriodico integer,
    Quantidade integer,
    PRIMARY KEY (fk_FerramentaDeBusca_codFerramenta, fk_ArtigoEmPeriodico_codArtigoEmPeriodico)
);

CREATE TABLE ParticipacaoDoCVEmEvento (
    fk_CVLattes_LattesID bigint,
    fk_Evento_codEvento integer,
    PRIMARY KEY (fk_CVLattes_LattesID, fk_Evento_codEvento)
);

CREATE TABLE OrganizacaoDeEventoPeloCV (
    fk_CVLattes_LattesID bigint,
    fk_Evento_codEvento integer,
    PRIMARY KEY (fk_CVLattes_LattesID, fk_Evento_codEvento)
);

CREATE TABLE AutorCapitulo (
    fk_Pessoa_codPessoa integer,
    fk_CapituloDeLivro_codCap integer,
    PRIMARY KEY (fk_Pessoa_codPessoa, fk_CapituloDeLivro_codCap)
);

CREATE TABLE AutorPublicacaoEmCongresso (
    fk_Pessoa_codPessoa integer,
    fk_PublicacaoEmCongresso_codArtigoEmCongresso integer,
    PRIMARY KEY (fk_Pessoa_codPessoa, fk_PublicacaoEmCongresso_codArtigoEmCongresso)
);

CREATE TABLE AutorApresentacao (
    fk_Pessoa_codPessoa integer,
    fk_ApresentacaoDeTrabalho_codApresentacao integer,
    PRIMARY KEY (fk_Pessoa_codPessoa, fk_ApresentacaoDeTrabalho_codApresentacao)
);

CREATE TABLE AutorOutraProd (
    fk_Pessoa_codPessoa integer,
    fk_OutraProducaoBibliografica_codOutraProd integer,
    PRIMARY KEY (fk_Pessoa_codPessoa, fk_OutraProducaoBibliografica_codOutraProd)
);

CREATE TABLE Participante (
    fk_Pessoa_codPessoa integer,
    fk_ProducaoTecnica_codProdTecnica integer,
    PRIMARY KEY (fk_Pessoa_codPessoa, fk_ProducaoTecnica_codProdTecnica)
);

CREATE TABLE AutorProgramaPC (
    fk_Pessoa_codPessoa integer,
    fk_ProgramaDePC_codProgramaPC integer,
    PRIMARY KEY (fk_Pessoa_codPessoa, fk_ProgramaDePC_codProgramaPC)
);

CREATE TABLE Consultor (
    fk_Pessoa_codPessoa integer,
    fk_Assessoria_codAssessoria integer,
    PRIMARY KEY (fk_Pessoa_codPessoa, fk_Assessoria_codAssessoria)
);

CREATE TABLE RevisorDePeriodico (
    fk_CVLattes_LattesID bigint,
    fk_Periodico_codPeriodico integer,
    anoFim integer,
    anoInicio integer,
    PRIMARY KEY (fk_CVLattes_LattesID, fk_Periodico_codPeriodico)
);

CREATE TABLE RevisorDeProjetos (
    fk_CVLattes_LattesID bigint,
    fk_Instituicao_codInstituicao integer,
    anoInicio integer,
    anoFim integer,
    PRIMARY KEY (fk_CVLattes_LattesID, fk_Instituicao_codInstituicao)
);


-- BEGIN projeto.sql


CREATE TABLE Situacao (
    codSituacao integer PRIMARY KEY,
    nomeSituacao varchar(10)
);

CREATE TABLE Financiamento_Projeto (
    codProjeto integer PRIMARY KEY,
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
    numOrientacoes integer,
    fk_Situacao_codSituacao integer,
    fk_NaturezaProjeto_codNatureza integer,
    fk_Pessoa_codPessoa integer,
    fk_NaturezaFinanciamento_codNaturezaFinanciamento integer,
    fk_Moeda_codMoeda integer,
    fk_Edital_numEdital integer,
    Processo integer
);

CREATE TABLE NaturezaProjeto (
    codNatureza integer PRIMARY KEY,
    nomeNatureza varchar(10)
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

CREATE TABLE IntegranteProjeto (
    fk_Pessoa_codPessoa integer,
    fk_Financiamento_Projeto_codProjeto integer,
    PRIMARY KEY(fk_Pessoa_codPessoa, fk_Financiamento_Projeto_codProjeto)
);

CREATE TABLE Financiador (
    fk_Instituicao_codInstituicao integer,
    fk_Financiamento_Projeto_codProjeto integer,
    PRIMARY KEY(fk_Instituicao_codInstituicao, fk_Financiamento_Projeto_codProjeto)
);


-- BEGIN ALTER TABLES


-- BEGIN ALTER endereco.sql


ALTER TABLE CVLattes ADD CONSTRAINT FK_CVLattes_2
    FOREIGN KEY (fk_Departamento_codDepto)
    REFERENCES Departamento (codDepto)
    ON DELETE RESTRICT;

ALTER TABLE CVLattes ADD CONSTRAINT FK_CVLattes_4
    FOREIGN KEY (fk_Bolsa_codBolsa)
    REFERENCES Bolsa (codBolsa)
    ON DELETE RESTRICT;

ALTER TABLE Logradouro ADD CONSTRAINT FK_Logradouro_2
    FOREIGN KEY (fk_TipoLogradouro_codTipoLogradouro)
    REFERENCES TipoLogradouro (codTipoLogradouro)
    ON DELETE RESTRICT;

ALTER TABLE Logradouro ADD CONSTRAINT FK_Logradouro_3
    FOREIGN KEY (fk_Bairro_codBairro)
    REFERENCES Bairro (codBairro)
    ON DELETE RESTRICT;

ALTER TABLE Bairro ADD CONSTRAINT FK_Bairro_2
    FOREIGN KEY (fk_Cidade_codCidade)
    REFERENCES Cidade (codCidade)
    ON DELETE RESTRICT;

ALTER TABLE Cidade ADD CONSTRAINT FK_Cidade_2
    FOREIGN KEY (fk_Estado_codEstado)
    REFERENCES Estado (codEstado)
    ON DELETE RESTRICT;

ALTER TABLE Estado ADD CONSTRAINT FK_Estado_2
    FOREIGN KEY (fk_Pais_codPais)
    REFERENCES Pais (codPais)
    ON DELETE RESTRICT;

ALTER TABLE Instituicao ADD CONSTRAINT FK_Instituicao_2
    FOREIGN KEY (fk_Logradouro_codLogradouro)
    REFERENCES Logradouro (codLogradouro)
    ON DELETE RESTRICT;

ALTER TABLE Departamento ADD CONSTRAINT FK_Departamento_2
    FOREIGN KEY (fk_Instituicao_codInstituicao)
    REFERENCES Instituicao (codInstituicao)
    ON DELETE RESTRICT;

ALTER TABLE Premio ADD CONSTRAINT FK_Premio_2
    FOREIGN KEY (fk_Instituicao_codInstituicao)
    REFERENCES Instituicao (codInstituicao)
    ON DELETE RESTRICT;

ALTER TABLE NomeEmCitacao ADD CONSTRAINT FK_NomeEmCitacao_2
    FOREIGN KEY (fk_Pessoa_codPessoa)
    REFERENCES Pessoa (codPessoa)
    ON DELETE RESTRICT;

ALTER TABLE Compreende_CVLattes_Lingua_NivelLingua ADD CONSTRAINT FK_Compreende_CVLattes_Lingua_NivelLingua_1
    FOREIGN KEY (fk_CVLattes_LattesID)
    REFERENCES CVLattes (LattesID)
    ON DELETE RESTRICT;

ALTER TABLE Compreende_CVLattes_Lingua_NivelLingua ADD CONSTRAINT FK_Compreende_CVLattes_Lingua_NivelLingua_2
    FOREIGN KEY (fk_Lingua_codLingua)
    REFERENCES Lingua (codLingua)
    ON DELETE RESTRICT;

ALTER TABLE Compreende_CVLattes_Lingua_NivelLingua ADD CONSTRAINT FK_Compreende_CVLattes_Lingua_NivelLingua_3
    FOREIGN KEY (fk_NivelLingua_codNivelLingua)
    REFERENCES NivelLingua (codNivelLingua)
    ON DELETE RESTRICT;

ALTER TABLE Fala_CVLattes_Lingua_NivelLingua ADD CONSTRAINT FK_Fala_CVLattes_Lingua_NivelLingua_1
    FOREIGN KEY (fk_CVLattes_LattesID)
    REFERENCES CVLattes (LattesID)
    ON DELETE RESTRICT;

ALTER TABLE Fala_CVLattes_Lingua_NivelLingua ADD CONSTRAINT FK_Fala_CVLattes_Lingua_NivelLingua_2
    FOREIGN KEY (fk_Lingua_codLingua)
    REFERENCES Lingua (codLingua)
    ON DELETE RESTRICT;

ALTER TABLE Fala_CVLattes_Lingua_NivelLingua ADD CONSTRAINT FK_Fala_CVLattes_Lingua_NivelLingua_3
    FOREIGN KEY (fk_NivelLingua_codNivelLingua)
    REFERENCES NivelLingua (codNivelLingua)
    ON DELETE RESTRICT;

ALTER TABLE Escreve_CVLattes_Lingua_NivelLingua ADD CONSTRAINT FK_Escreve_CVLattes_Lingua_NivelLingua_1
    FOREIGN KEY (fk_CVLattes_LattesID)
    REFERENCES CVLattes (LattesID)
    ON DELETE RESTRICT;

ALTER TABLE Escreve_CVLattes_Lingua_NivelLingua ADD CONSTRAINT FK_Escreve_CVLattes_Lingua_NivelLingua_2
    FOREIGN KEY (fk_Lingua_codLingua)
    REFERENCES Lingua (codLingua)
    ON DELETE RESTRICT;

ALTER TABLE Escreve_CVLattes_Lingua_NivelLingua ADD CONSTRAINT FK_Escreve_CVLattes_Lingua_NivelLingua_3
    FOREIGN KEY (fk_NivelLingua_codNivelLingua)
    REFERENCES NivelLingua (codNivelLingua)
    ON DELETE RESTRICT;

ALTER TABLE Le_CVLattes_Lingua_NivelLingua ADD CONSTRAINT FK_Le_CVLattes_Lingua_NivelLingua_1
    FOREIGN KEY (fk_CVLattes_LattesID)
    REFERENCES CVLattes (LattesID)
    ON DELETE RESTRICT;

ALTER TABLE Le_CVLattes_Lingua_NivelLingua ADD CONSTRAINT FK_Le_CVLattes_Lingua_NivelLingua_2
    FOREIGN KEY (fk_Lingua_codLingua)
    REFERENCES Lingua (codLingua)
    ON DELETE RESTRICT;

ALTER TABLE Le_CVLattes_Lingua_NivelLingua ADD CONSTRAINT FK_Le_CVLattes_Lingua_NivelLingua_3
    FOREIGN KEY (fk_NivelLingua_codNivelLingua)
    REFERENCES NivelLingua (codNivelLingua)
    ON DELETE RESTRICT;

ALTER TABLE CVContemplatdo ADD CONSTRAINT FK_CVContemplatdo_1
    FOREIGN KEY (fk_Premio_codPremio)
    REFERENCES Premio (codPremio)
    ON DELETE RESTRICT;

ALTER TABLE CVContemplatdo ADD CONSTRAINT FK_CVContemplatdo_2
    FOREIGN KEY (fk_CVLattes_LattesID)
    REFERENCES CVLattes (LattesID)
    ON DELETE RESTRICT;


-- BEGIN ALTER formacao.sql

-- Duplicated REF list; manually solved
ALTER TABLE FormacaoAcademica ADD CONSTRAINT FK_FormacaoAcademica_2_1
    FOREIGN KEY (fk_Instituicao_codInstituicao)
        REFERENCES Instituicao (codInstituicao)
    ON DELETE RESTRICT;

ALTER TABLE FormacaoAcademica ADD CONSTRAINT FK_FormacaoAcademica_2_2
    FOREIGN KEY (fk_Instituicao_codInstituicao_)
        REFERENCES Instituicao (codInstituicao)
    ON DELETE RESTRICT;

ALTER TABLE FormacaoAcademica ADD CONSTRAINT FK_FormacaoAcademica_3
    FOREIGN KEY (fk_CVLattes_LattesID)
    REFERENCES CVLattes (LattesID)
    ON DELETE RESTRICT;

ALTER TABLE FormacaoAcademica ADD CONSTRAINT FK_FormacaoAcademica_4
    FOREIGN KEY (fk_Titulacao_codTitulacao)
    REFERENCES Titulacao (codTitulacao)
    ON DELETE RESTRICT;

ALTER TABLE FormacaoAcademica ADD CONSTRAINT FK_FormacaoAcademica_5
    FOREIGN KEY (fk_Pessoa_codPessoa)
    REFERENCES Pessoa (codPessoa)
    ON DELETE RESTRICT;

ALTER TABLE FormacaoAcademica ADD CONSTRAINT FK_FormacaoAcademica_6
    FOREIGN KEY (fk_Curso_codCurso)
    REFERENCES Curso (codCurso)
    ON DELETE RESTRICT;

ALTER TABLE FormacaoComplementar ADD CONSTRAINT FK_FormacaoComplementar_2
    FOREIGN KEY (fk_CVLattes_LattesID)
    REFERENCES CVLattes (LattesID)
    ON DELETE RESTRICT;

ALTER TABLE FormacaoComplementar ADD CONSTRAINT FK_FormacaoComplementar_3
    FOREIGN KEY (fk_Instituicao_codInstituicao)
    REFERENCES Instituicao (codInstituicao)
    ON DELETE RESTRICT;

ALTER TABLE AtuacaoProfissional ADD CONSTRAINT FK_AtuacaoProfissional_2
    FOREIGN KEY (fk_CVLattes_LattesID)
    REFERENCES CVLattes (LattesID)
    ON DELETE RESTRICT;

ALTER TABLE AtuacaoProfissional ADD CONSTRAINT FK_AtuacaoProfissional_3
    FOREIGN KEY (fk_Instituicao_codInstituicao)
    REFERENCES Instituicao (codInstituicao)
    ON DELETE RESTRICT;

ALTER TABLE AtuacaoProfissional ADD CONSTRAINT FK_AtuacaoProfissional_4
    FOREIGN KEY (fk_Enquadramento_codEnquadramento)
    REFERENCES Enquadramento (codEnquadramento)
    ON DELETE RESTRICT;

ALTER TABLE AtuacaoProfissional ADD CONSTRAINT FK_AtuacaoProfissional_5
    FOREIGN KEY (fk_Vinculo_codVinculo)
    REFERENCES Vinculo (codVinculo)
    ON DELETE RESTRICT;

ALTER TABLE AtuacaoProfissional ADD CONSTRAINT FK_AtuacaoProfissional_6
    FOREIGN KEY (fk_Regime_codRegime)
    REFERENCES Regime (codRegime)
    ON DELETE RESTRICT;

ALTER TABLE Disciplina ADD CONSTRAINT FK_Disciplina_2
    FOREIGN KEY (fk_NivelDisciplina_codNivelDisciplina)
    REFERENCES NivelDisciplina (codNivelDisciplina)
    ON DELETE RESTRICT;

ALTER TABLE Disciplina ADD CONSTRAINT FK_Disciplina_3
    FOREIGN KEY (fk_Curso_codCurso)
    REFERENCES Curso (codCurso)
    ON DELETE RESTRICT;

ALTER TABLE Ensino ADD CONSTRAINT FK_Ensino_2
    FOREIGN KEY (fk_AtuacaoProfissional_codAtuacao)
    REFERENCES AtuacaoProfissional (codAtuacao)
    ON DELETE RESTRICT;

ALTER TABLE ServicoTecnico ADD CONSTRAINT FK_ServicoTecnico_2
    FOREIGN KEY (fk_AtuacaoProfissional_codAtuacao)
    REFERENCES AtuacaoProfissional (codAtuacao)
    ON DELETE RESTRICT;

ALTER TABLE P_D ADD CONSTRAINT FK_P_D_2
    FOREIGN KEY (FK_AtuacaoProfissional_codAtuacao)
    REFERENCES AtuacaoProfissional (codAtuacao)
    ON DELETE RESTRICT;

ALTER TABLE ConselhoComissaoConsultoria ADD CONSTRAINT FK_ConselhoComissaoConsultoria_2
    FOREIGN KEY (fk_Cargo_codCargo)
    REFERENCES Cargo (codCargo)
    ON DELETE RESTRICT;

ALTER TABLE ConselhoComissaoConsultoria ADD CONSTRAINT FK_ConselhoComissaoConsultoria_3
    FOREIGN KEY (fk_AtuacaoProfissional_codAtuacao)
    REFERENCES AtuacaoProfissional (codAtuacao)
    ON DELETE RESTRICT;

ALTER TABLE DirecaoAdm ADD CONSTRAINT FK_DirecaoAdm_2
    FOREIGN KEY (fk_Cargo_codCargo)
    REFERENCES Cargo (codCargo)
    ON DELETE RESTRICT;

ALTER TABLE DirecaoAdm ADD CONSTRAINT FK_DirecaoAdm_3
    FOREIGN KEY (fk_AtuacaoProfissional_codAtuacao)
    REFERENCES AtuacaoProfissional (codAtuacao)
    ON DELETE RESTRICT;

ALTER TABLE Especialidade ADD CONSTRAINT FK_Especialidade_2
    FOREIGN KEY (fk_SubArea_codSubArea)
    REFERENCES SubArea (codSubArea)
    ON DELETE RESTRICT;

ALTER TABLE SubArea ADD CONSTRAINT FK_SubArea_2
    FOREIGN KEY (fk_Area_codArea)
    REFERENCES Area (codArea)
    ON DELETE RESTRICT;

ALTER TABLE Area ADD CONSTRAINT FK_Area_2
    FOREIGN KEY (fk_GrandeArea_codGrandeArea)
    REFERENCES GrandeArea (codGrandeArea)
    ON DELETE RESTRICT;

ALTER TABLE ConceitoDoCurso_Curso_Conceito_Instituicao ADD CONSTRAINT FK_ConceitoDoCurso_Curso_Conceito_Instituicao_1
    FOREIGN KEY (fk_Curso_codCurso)
    REFERENCES Curso (codCurso)
    ON DELETE RESTRICT;

ALTER TABLE ConceitoDoCurso_Curso_Conceito_Instituicao ADD CONSTRAINT FK_ConceitoDoCurso_Curso_Conceito_Instituicao_2
    FOREIGN KEY (fk_Conceito_codConceito)
    REFERENCES Conceito (codConceito)
    ON DELETE RESTRICT;

ALTER TABLE ConceitoDoCurso_Curso_Conceito_Instituicao ADD CONSTRAINT FK_ConceitoDoCurso_Curso_Conceito_Instituicao_3
    FOREIGN KEY (fk_Instituicao_codInstituicao)
    REFERENCES Instituicao (codInstituicao)
    ON DELETE RESTRICT;

ALTER TABLE PeriodoSanduiche_FormacaoAcademica_Pessoa_Instituicao ADD CONSTRAINT FK_PeriodoSanduiche_FormacaoAcademica_Pessoa_Instituicao_1
    FOREIGN KEY (fk_FormacaoAcademica_codFormacao)
    REFERENCES FormacaoAcademica (codFormacao)
    ON DELETE RESTRICT;

ALTER TABLE PeriodoSanduiche_FormacaoAcademica_Pessoa_Instituicao ADD CONSTRAINT FK_PeriodoSanduiche_FormacaoAcademica_Pessoa_Instituicao_2
    FOREIGN KEY (fk_Pessoa_codPessoa)
    REFERENCES Pessoa (codPessoa)
    ON DELETE RESTRICT;

ALTER TABLE PeriodoSanduiche_FormacaoAcademica_Pessoa_Instituicao ADD CONSTRAINT FK_PeriodoSanduiche_FormacaoAcademica_Pessoa_Instituicao_3
    FOREIGN KEY (fk_Instituicao_codInstituicao)
    REFERENCES Instituicao (codInstituicao)
    ON DELETE RESTRICT;

ALTER TABLE CursosDaInstituicao ADD CONSTRAINT FK_CursosDaInstituicao_1
    FOREIGN KEY (fk_Instituicao_codInstituicao)
    REFERENCES Instituicao (codInstituicao)
    ON DELETE RESTRICT;

ALTER TABLE CursosDaInstituicao ADD CONSTRAINT FK_CursosDaInstituicao_2
    FOREIGN KEY (fk_Curso_codCurso)
    REFERENCES Curso (codCurso)
    ON DELETE RESTRICT;

ALTER TABLE PalavrasChaveDaFormacao ADD CONSTRAINT FK_PalavrasChaveDaFormacao_1
    FOREIGN KEY (fk_PalavraChave_codPalavraChave)
    REFERENCES PalavraChave (codPalavraChave)
    ON DELETE RESTRICT;

ALTER TABLE PalavrasChaveDaFormacao ADD CONSTRAINT FK_PalavrasChaveDaFormacao_2
    FOREIGN KEY (fk_FormacaoAcademica_codFormacao)
    REFERENCES FormacaoAcademica (codFormacao)
    ON DELETE RESTRICT;

ALTER TABLE DisciplinasMinistradas ADD CONSTRAINT FK_DisciplinasMinistradas_1
    FOREIGN KEY (fk_Disciplina_codDisciplina)
    REFERENCES Disciplina (codDisciplina)
    ON DELETE RESTRICT;

ALTER TABLE DisciplinasMinistradas ADD CONSTRAINT FK_DisciplinasMinistradas_2
    FOREIGN KEY (fk_Ensino_codAtividade)
    REFERENCES Ensino (codAtividade)
    ON DELETE RESTRICT;

ALTER TABLE ServicosRealizados ADD CONSTRAINT FK_ServicosRealizados_1
    FOREIGN KEY (fk_ServicoRealizado_codServicoRealizado)
    REFERENCES ServicoRealizado (codServicoRealizado)
    ON DELETE RESTRICT;

ALTER TABLE ServicosRealizados ADD CONSTRAINT FK_ServicosRealizados_2
    FOREIGN KEY (fk_ServicoTecnico_codAtividade)
    REFERENCES ServicoTecnico (codAtividade)
    ON DELETE RESTRICT;

ALTER TABLE LinhasDePesquisa ADD CONSTRAINT FK_LinhasDePesquisa_1
    FOREIGN KEY (fk_LinhaDePesquisa_codLinha)
    REFERENCES LinhaDePesquisa (codLinha)
    ON DELETE RESTRICT;

ALTER TABLE LinhasDePesquisa ADD CONSTRAINT FK_LinhasDePesquisa_2
    FOREIGN KEY (fk_P_D_codAtividade)
    REFERENCES P_D (codAtividade)
    ON DELETE RESTRICT;

ALTER TABLE EspecialidadeDaFormacao ADD CONSTRAINT FK_EspecialidadeDaFormacao_1
    FOREIGN KEY (fk_FormacaoAcademica_codFormacao)
    REFERENCES FormacaoAcademica (codFormacao)
    ON DELETE RESTRICT;

ALTER TABLE EspecialidadeDaFormacao ADD CONSTRAINT FK_EspecialidadeDaFormacao_2
    FOREIGN KEY (fk_Especialidade_codEspecialidade)
    REFERENCES Especialidade (codEspecialidade)
    ON DELETE RESTRICT;

ALTER TABLE SubAreaDaFormacao ADD CONSTRAINT FK_SubAreaDaFormacao_1
    FOREIGN KEY (fk_FormacaoAcademica_codFormacao)
    REFERENCES FormacaoAcademica (codFormacao)
    ON DELETE RESTRICT;

ALTER TABLE SubAreaDaFormacao ADD CONSTRAINT FK_SubAreaDaFormacao_2
    FOREIGN KEY (fk_SubArea_codSubArea)
    REFERENCES SubArea (codSubArea)
    ON DELETE RESTRICT;

ALTER TABLE AreaDaFormacao ADD CONSTRAINT FK_AreaDaFormacao_1
    FOREIGN KEY (fk_FormacaoAcademica_codFormacao)
    REFERENCES FormacaoAcademica (codFormacao)
    ON DELETE RESTRICT;

ALTER TABLE AreaDaFormacao ADD CONSTRAINT FK_AreaDaFormacao_2
    FOREIGN KEY (fk_Area_codArea)
    REFERENCES Area (codArea)
    ON DELETE RESTRICT;

ALTER TABLE GrandeAreaDaFormacao ADD CONSTRAINT FK_GrandeAreaDaFormacao_1
    FOREIGN KEY (fk_GrandeArea_codGrandeArea)
    REFERENCES GrandeArea (codGrandeArea)
    ON DELETE RESTRICT;

ALTER TABLE GrandeAreaDaFormacao ADD CONSTRAINT FK_GrandeAreaDaFormacao_2
    FOREIGN KEY (fk_FormacaoAcademica_codFormacao)
    REFERENCES FormacaoAcademica (codFormacao)
    ON DELETE RESTRICT;


-- BEGIN ALTER orientacao.sql


ALTER TABLE Banca ADD CONSTRAINT FK_Banca_2
    FOREIGN KEY (fk_TipoBanca_codBanca)
    REFERENCES TipoBanca (codBanca)
    ON DELETE RESTRICT;

ALTER TABLE Banca ADD CONSTRAINT FK_Banca_3
    FOREIGN KEY (fk_Pessoa_codPessoa)
    REFERENCES Pessoa (codPessoa)
    ON DELETE RESTRICT;

ALTER TABLE Banca ADD CONSTRAINT FK_Banca_4
    FOREIGN KEY (fk_Instituicao_codInstituicao)
    REFERENCES Instituicao (codInstituicao)
    ON DELETE RESTRICT;

ALTER TABLE Banca ADD CONSTRAINT FK_Banca_5
    FOREIGN KEY (fk_Curso_codCurso)
    REFERENCES Curso (codCurso)
    ON DELETE RESTRICT;

ALTER TABLE Orientacao ADD CONSTRAINT FK_Orientacao_2
    FOREIGN KEY (fk_Pessoa_codPessoa)
    REFERENCES Pessoa (codPessoa)
    ON DELETE RESTRICT;

ALTER TABLE Orientacao ADD CONSTRAINT FK_Orientacao_3
    FOREIGN KEY (fk_TipoOrientacao_codTipoOrientacao)
    REFERENCES TipoOrientacao (codTipoOrientacao)
    ON DELETE RESTRICT;

-- Duplicated REF list; manually solved
ALTER TABLE Orientacao ADD CONSTRAINT FK_Orientacao_4_1
    FOREIGN KEY (fk_Instituicao_codInstituicao)
        REFERENCES Instituicao (codInstituicao)
    ON DELETE RESTRICT;

ALTER TABLE Orientacao ADD CONSTRAINT FK_Orientacao_4_2
    FOREIGN KEY (fk_Instituicao_codInstituicao_)
        REFERENCES Instituicao (codInstituicao)
    ON DELETE RESTRICT;

ALTER TABLE Orientacao ADD CONSTRAINT FK_Orientacao_5
    FOREIGN KEY (fk_CVLattes_LattesID)
    REFERENCES CVLattes (LattesID)
    ON DELETE RESTRICT;

ALTER TABLE Orientacao ADD CONSTRAINT FK_Orientacao_6
    FOREIGN KEY (fk_Curso_codCurso)
    REFERENCES Curso (codCurso)
    ON DELETE RESTRICT;

ALTER TABLE MembroDaBanca ADD CONSTRAINT FK_MembroDaBanca_1
    FOREIGN KEY (fk_Pessoa_codPessoa)
    REFERENCES Pessoa (codPessoa)
    ON DELETE RESTRICT;

ALTER TABLE MembroDaBanca ADD CONSTRAINT FK_MembroDaBanca_2
    FOREIGN KEY (fk_Banca_codBanca)
    REFERENCES Banca (codBanca)
    ON DELETE RESTRICT;


-- BEGIN ALTER producao.sql


ALTER TABLE Editora ADD CONSTRAINT FK_Editora_2
    FOREIGN KEY (fk_Cidade_codCidade)
    REFERENCES Cidade (codCidade)
    ON DELETE RESTRICT;

ALTER TABLE Livro ADD CONSTRAINT FK_Livro_2
    FOREIGN KEY (fk_Editora_codEditora)
    REFERENCES Editora (codEditora)
    ON DELETE RESTRICT;

ALTER TABLE ArtigoEmPeriodico ADD CONSTRAINT FK_ArtigoEmPeriodico_2
    FOREIGN KEY (fk_Periodico_codPeriodico)
    REFERENCES Periodico (codPeriodico)
    ON DELETE RESTRICT;

ALTER TABLE Periodico ADD CONSTRAINT FK_Periodico_2
    FOREIGN KEY (fk_Qualis_codQualis)
    REFERENCES Qualis (codQualis)
    ON DELETE RESTRICT;

ALTER TABLE PublicacaoEmCongresso ADD CONSTRAINT FK_PublicacaoEmCongresso_2
    FOREIGN KEY (fk_TipoProducao_codTipoProducao)
    REFERENCES TipoProducao (codTipoProducao)
    ON DELETE RESTRICT;

ALTER TABLE PublicacaoEmCongresso ADD CONSTRAINT FK_PublicacaoEmCongresso_3
    FOREIGN KEY (fk_Evento_codEvento)
    REFERENCES Evento (codEvento)
    ON DELETE RESTRICT;

ALTER TABLE Evento ADD CONSTRAINT FK_Evento_2
    FOREIGN KEY (fk_TipoEvento_codTipoEvento)
    REFERENCES TipoEvento (codTipoEvento)
    ON DELETE RESTRICT;

ALTER TABLE Evento ADD CONSTRAINT FK_Evento_3
    FOREIGN KEY (fk_Cidade_codCidade)
    REFERENCES Cidade (codCidade)
    ON DELETE RESTRICT;

ALTER TABLE CapituloDeLivro ADD CONSTRAINT FK_CapituloDeLivro_2
    FOREIGN KEY (fk_Livro_codLivro)
    REFERENCES Livro (codLivro)
    ON DELETE RESTRICT;

ALTER TABLE ApresentacaoDeTrabalho ADD CONSTRAINT FK_ApresentacaoDeTrabalho_2
    FOREIGN KEY (fk_TipoProducao_codTipoProducao)
    REFERENCES TipoProducao (codTipoProducao)
    ON DELETE RESTRICT;

ALTER TABLE OutraProducaoBibliografica ADD CONSTRAINT FK_OutraProducaoBibliografica_2
    FOREIGN KEY (fk_TipoProducao_codTipoProducao)
    REFERENCES TipoProducao (codTipoProducao)
    ON DELETE RESTRICT;

ALTER TABLE OutraProducaoBibliografica ADD CONSTRAINT FK_OutraProducaoBibliografica_3
    FOREIGN KEY (fk_Cidade_codCidade)
    REFERENCES Cidade (codCidade)
    ON DELETE RESTRICT;

ALTER TABLE ProducaoTecnica ADD CONSTRAINT FK_ProducaoTecnica_2
    FOREIGN KEY (fk_TipoProducao_codTipoProducao)
    REFERENCES TipoProducao (codTipoProducao)
    ON DELETE RESTRICT;

ALTER TABLE Assessoria ADD CONSTRAINT FK_Assessoria_2
    FOREIGN KEY (fk_Instituicao_codInstituicao)
    REFERENCES Instituicao (codInstituicao)
    ON DELETE RESTRICT;

ALTER TABLE OrganizadorLivro ADD CONSTRAINT FK_OrganizadorLivro_1
    FOREIGN KEY (fk_Pessoa_codPessoa)
    REFERENCES Pessoa (codPessoa)
    ON DELETE RESTRICT;

ALTER TABLE OrganizadorLivro ADD CONSTRAINT FK_OrganizadorLivro_2
    FOREIGN KEY (fk_Livro_codLivro)
    REFERENCES Livro (codLivro)
    ON DELETE RESTRICT;

ALTER TABLE AutorLivro ADD CONSTRAINT FK_AutorLivro_1
    FOREIGN KEY (fk_Pessoa_codPessoa)
    REFERENCES Pessoa (codPessoa)
    ON DELETE RESTRICT;

ALTER TABLE AutorLivro ADD CONSTRAINT FK_AutorLivro_2
    FOREIGN KEY (fk_Livro_codLivro)
    REFERENCES Livro (codLivro)
    ON DELETE RESTRICT;

ALTER TABLE AutorArtigoEmPeriodico ADD CONSTRAINT FK_AutorArtigoEmPeriodico_1
    FOREIGN KEY (fk_Pessoa_codPessoa)
    REFERENCES Pessoa (codPessoa)
    ON DELETE RESTRICT;

ALTER TABLE AutorArtigoEmPeriodico ADD CONSTRAINT FK_AutorArtigoEmPeriodico_2
    FOREIGN KEY (fk_ArtigoEmPeriodico_codArtigoEmPeriodico)
    REFERENCES ArtigoEmPeriodico (codArtigoEmPeriodico)
    ON DELETE RESTRICT;

ALTER TABLE CitacoesPelaFerramenta ADD CONSTRAINT FK_CitacoesPelaFerramenta_1
    FOREIGN KEY (fk_FerramentaDeBusca_codFerramenta)
    REFERENCES FerramentaDeBusca (codFerramenta)
    ON DELETE RESTRICT;

ALTER TABLE CitacoesPelaFerramenta ADD CONSTRAINT FK_CitacoesPelaFerramenta_2
    FOREIGN KEY (fk_ArtigoEmPeriodico_codArtigoEmPeriodico)
    REFERENCES ArtigoEmPeriodico (codArtigoEmPeriodico)
    ON DELETE RESTRICT;

ALTER TABLE ParticipacaoDoCVEmEvento ADD CONSTRAINT FK_ParticipacaoDoCVEmEvento_1
    FOREIGN KEY (fk_Evento_codEvento)
    REFERENCES Evento (codEvento)
    ON DELETE RESTRICT;

ALTER TABLE ParticipacaoDoCVEmEvento ADD CONSTRAINT FK_ParticipacaoDoCVEmEvento_2
    FOREIGN KEY (fk_CVLattes_LattesID)
    REFERENCES CVLattes (LattesID)
    ON DELETE RESTRICT;

ALTER TABLE OrganizacaoDeEventoPeloCV ADD CONSTRAINT FK_OrganizacaoDeEventoPeloCV_1
    FOREIGN KEY (fk_CVLattes_LattesID)
    REFERENCES CVLattes (LattesID)
    ON DELETE RESTRICT;

ALTER TABLE OrganizacaoDeEventoPeloCV ADD CONSTRAINT FK_OrganizacaoDeEventoPeloCV_2
    FOREIGN KEY (fk_Evento_codEvento)
    REFERENCES Evento (codEvento)
    ON DELETE RESTRICT;

ALTER TABLE AutorCapitulo ADD CONSTRAINT FK_AutorCapitulo_1
    FOREIGN KEY (fk_CapituloDeLivro_codCap)
    REFERENCES CapituloDeLivro (codCap)
    ON DELETE RESTRICT;

ALTER TABLE AutorCapitulo ADD CONSTRAINT FK_AutorCapitulo_2
    FOREIGN KEY (fk_Pessoa_codPessoa)
    REFERENCES Pessoa (codPessoa)
    ON DELETE RESTRICT;

ALTER TABLE AutorPublicacaoEmCongresso ADD CONSTRAINT FK_AutorPublicacaoEmCongresso_1
    FOREIGN KEY (fk_PublicacaoEmCongresso_codArtigoEmCongresso)
    REFERENCES PublicacaoEmCongresso (codArtigoEmCongresso)
    ON DELETE RESTRICT;

ALTER TABLE AutorPublicacaoEmCongresso ADD CONSTRAINT FK_AutorPublicacaoEmCongresso_2
    FOREIGN KEY (fk_Pessoa_codPessoa)
    REFERENCES Pessoa (codPessoa)
    ON DELETE RESTRICT;

ALTER TABLE AutorApresentacao ADD CONSTRAINT FK_AutorApresentacao_1
    FOREIGN KEY (fk_Pessoa_codPessoa)
    REFERENCES Pessoa (codPessoa)
    ON DELETE RESTRICT;

ALTER TABLE AutorApresentacao ADD CONSTRAINT FK_AutorApresentacao_2
    FOREIGN KEY (fk_ApresentacaoDeTrabalho_codApresentacao)
    REFERENCES ApresentacaoDeTrabalho (codApresentacao)
    ON DELETE RESTRICT;

ALTER TABLE AutorOutraProd ADD CONSTRAINT FK_AutorOutraProd_1
    FOREIGN KEY (fk_Pessoa_codPessoa)
    REFERENCES Pessoa (codPessoa)
    ON DELETE RESTRICT;

ALTER TABLE AutorOutraProd ADD CONSTRAINT FK_AutorOutraProd_2
    FOREIGN KEY (fk_OutraProducaoBibliografica_codOutraProd)
    REFERENCES OutraProducaoBibliografica (codOutraProd)
    ON DELETE RESTRICT;

ALTER TABLE Participante ADD CONSTRAINT FK_Participante_1
    FOREIGN KEY (fk_Pessoa_codPessoa)
    REFERENCES Pessoa (codPessoa)
    ON DELETE RESTRICT;

ALTER TABLE Participante ADD CONSTRAINT FK_Participante_2
    FOREIGN KEY (fk_ProducaoTecnica_codProdTecnica)
    REFERENCES ProducaoTecnica (codProdTecnica)
    ON DELETE RESTRICT;

ALTER TABLE AutorProgramaPC ADD CONSTRAINT FK_AutorProgramaPC_1
    FOREIGN KEY (fk_Pessoa_codPessoa)
    REFERENCES Pessoa (codPessoa)
    ON DELETE RESTRICT;

ALTER TABLE AutorProgramaPC ADD CONSTRAINT FK_AutorProgramaPC_2
    FOREIGN KEY (fk_ProgramaDePC_codProgramaPC)
    REFERENCES ProgramaDePC (codProgramaPC)
    ON DELETE RESTRICT;

ALTER TABLE Consultor ADD CONSTRAINT FK_Consultor_1
    FOREIGN KEY (fk_Pessoa_codPessoa)
    REFERENCES Pessoa (codPessoa)
    ON DELETE RESTRICT;

ALTER TABLE Consultor ADD CONSTRAINT FK_Consultor_2
    FOREIGN KEY (fk_Assessoria_codAssessoria)
    REFERENCES Assessoria (codAssessoria)
    ON DELETE RESTRICT;

ALTER TABLE RevisorDePeriodico ADD CONSTRAINT FK_RevisorDePeriodico_1
    FOREIGN KEY (fk_CVLattes_LattesID)
    REFERENCES CVLattes (LattesID)
    ON DELETE RESTRICT;

ALTER TABLE RevisorDePeriodico ADD CONSTRAINT FK_RevisorDePeriodico_2
    FOREIGN KEY (fk_Periodico_codPeriodico)
    REFERENCES Periodico (codPeriodico)
    ON DELETE RESTRICT;

ALTER TABLE RevisorDeProjetos ADD CONSTRAINT FK_RevisorDeProjetos_1
    FOREIGN KEY (fk_CVLattes_LattesID)
    REFERENCES CVLattes (LattesID)
    ON DELETE RESTRICT;

ALTER TABLE RevisorDeProjetos ADD CONSTRAINT FK_RevisorDeProjetos_2
    FOREIGN KEY (fk_Instituicao_codInstituicao)
    REFERENCES Instituicao (codInstituicao)
    ON DELETE RESTRICT;


-- BEGIN ALTER projeto.sql


ALTER TABLE Financiamento_Projeto ADD CONSTRAINT FK_Financiamento_Projeto_2
    FOREIGN KEY (fk_Situacao_codSituacao)
    REFERENCES Situacao (codSituacao);

ALTER TABLE Financiamento_Projeto ADD CONSTRAINT FK_Financiamento_Projeto_3
    FOREIGN KEY (fk_NaturezaProjeto_codNatureza)
    REFERENCES NaturezaProjeto (codNatureza)
    ON DELETE RESTRICT;

ALTER TABLE Financiamento_Projeto ADD CONSTRAINT FK_Financiamento_Projeto_4
    FOREIGN KEY (fk_Pessoa_codPessoa)
    REFERENCES Pessoa (codPessoa)
    ON DELETE RESTRICT;

ALTER TABLE Financiamento_Projeto ADD CONSTRAINT FK_Financiamento_Projeto_5
    FOREIGN KEY (fk_NaturezaFinanciamento_codNaturezaFinanciamento)
    REFERENCES NaturezaFinanciamento (codNaturezaFinanciamento)
    ON DELETE RESTRICT;

ALTER TABLE Financiamento_Projeto ADD CONSTRAINT FK_Financiamento_Projeto_6
    FOREIGN KEY (fk_Moeda_codMoeda)
    REFERENCES Moeda (codMoeda)
    ON DELETE RESTRICT;

ALTER TABLE Financiamento_Projeto ADD CONSTRAINT FK_Financiamento_Projeto_7
    FOREIGN KEY (fk_Edital_numEdital)
    REFERENCES Edital (numEdital)
    ON DELETE RESTRICT;

ALTER TABLE IntegranteProjeto ADD CONSTRAINT FK_IntegranteProjeto_1
    FOREIGN KEY (fk_Pessoa_codPessoa)
    REFERENCES Pessoa (codPessoa)
    ON DELETE RESTRICT;

ALTER TABLE IntegranteProjeto ADD CONSTRAINT FK_IntegranteProjeto_2
    FOREIGN KEY (fk_Financiamento_Projeto_codProjeto)
    REFERENCES Financiamento_Projeto (codProjeto)
    ON DELETE RESTRICT;

ALTER TABLE Financiador ADD CONSTRAINT FK_Financiador_1
    FOREIGN KEY (fk_Instituicao_codInstituicao)
    REFERENCES Instituicao (codInstituicao)
    ON DELETE RESTRICT;

ALTER TABLE Financiador ADD CONSTRAINT FK_Financiador_2
    FOREIGN KEY (fk_Financiamento_Projeto_codProjeto)
    REFERENCES Financiamento_Projeto (codProjeto)
    ON DELETE RESTRICT;

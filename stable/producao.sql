/* Lógico_1: */

CREATE TABLE Editora (
    Nome varchar(20),
    codEditora integer PRIMARY KEY,
    fk_Cidade_codCidade integer
);

CREATE TABLE Livro (
    Ano integer,
    Volume integer,
    Edicao integer,
    qtdPaginas integer,
    Titulo varchar(40),
    codLivro integer PRIMARY KEY,
    fk_Editora_codEditora integer
);

CREATE TABLE Pessoa (
    Nome varchar(20),
    codPessoa integer PRIMARY KEY
);

CREATE TABLE ArtigoEmPeriodico (
    Ano integer,
    intervaloPags interval,
    codArtigoEmPeriodico integer PRIMARY KEY,
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
    fk_TipoProducao_codTipoProducaoCientifica integer,
    fk_Evento_codEvento integer,
    NomeAnais varchar(100)
);

CREATE TABLE TipoProducao (
    codTipoProducaoCientifica integer PRIMARY KEY,
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

CREATE TABLE CVLattes (
    LattesID integer PRIMARY KEY
);

CREATE TABLE CapituloDeLivro (
    codCap integer PRIMARY KEY,
    Titulo varchar(40),
    intervaloPags interval,
    fk_Livro_codLivro integer
);

CREATE TABLE Cidade (
    codCidade integer PRIMARY KEY
);

CREATE TABLE ApresentacaoDeTrabalho (
    codApresentacao integer PRIMARY KEY,
    Titulo varchar(100),
    ano integer,
    fk_TipoProducao_codTipoProducaoCientifica integer
);

CREATE TABLE OutraProducaoBibliografica (
    codOutraProd integer PRIMARY KEY,
    titulo varchar(40),
    ano integer,
    localNaInstituicao varchar(40),
    fk_TipoProducao_codTipoProducaoCientifica integer,
    fk_Cidade_codCidade integer
);

CREATE TABLE ProducaoTecnica (
    codProdTecnica integer PRIMARY KEY,
    Titulo varchar(100),
    ano integer,
    fk_TipoProducao_codTipoProducaoCientifica integer
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

CREATE TABLE Instituicao (
    codInstituicao integer PRIMARY KEY
);

CREATE TABLE OrganizadorLivro (
    fk_Pessoa_codPessoa integer,
    fk_Livro_codLivro integer
);

CREATE TABLE AutorLivro (
    fk_Pessoa_codPessoa integer,
    fk_Livro_codLivro integer
);

CREATE TABLE AutorArtigoEmPeriodico (
    fk_Pessoa_codPessoa integer,
    fk_ArtigoEmPeriodico_codArtigoEmPeriodico integer
);

CREATE TABLE CitacoesPelaFerramenta (
    fk_FerramentaDeBusca_codFerramenta integer,
    fk_ArtigoEmPeriodico_codArtigoEmPeriodico integer,
    Quantidade integer
);

CREATE TABLE ParticipacaoDoCVEmEvento (
    fk_Evento_codEvento integer,
    fk_CVLattes_LattesID integer
);

CREATE TABLE OrganizacaoDeEventoPeloCV (
    fk_CVLattes_LattesID integer,
    fk_Evento_codEvento integer
);

CREATE TABLE AutorCapitulo (
    fk_CapituloDeLivro_codCap integer,
    fk_Pessoa_codPessoa integer
);

CREATE TABLE AutorPublicacaoEmCongresso (
    fk_PublicacaoEmCongresso_codArtigoEmCongresso integer,
    fk_Pessoa_codPessoa integer
);

CREATE TABLE AutorApresentacao (
    fk_Pessoa_codPessoa integer,
    fk_ApresentacaoDeTrabalho_codApresentacao integer
);

CREATE TABLE AutorOutraProd (
    fk_Pessoa_codPessoa integer,
    fk_OutraProducaoBibliografica_codOutraProd integer
);

CREATE TABLE Participante (
    fk_Pessoa_codPessoa integer,
    fk_ProducaoTecnica_codProdTecnica integer
);

CREATE TABLE AutorProgramaPC (
    fk_Pessoa_codPessoa integer,
    fk_ProgramaDePC_codProgramaPC integer
);

CREATE TABLE Consultor (
    fk_Pessoa_codPessoa integer,
    fk_Assessoria_codAssessoria integer
);

CREATE TABLE RevisorDePeriodico (
    fk_CVLattes_LattesID integer,
    fk_Periodico_codPeriodico integer,
    anoFim integer,
    anoInicio integer
);

CREATE TABLE RevisorDeProjetos (
    fk_CVLattes_LattesID integer,
    fk_Instituicao_codInstituicao integer,
    anoInicio integer,
    anoFim integer
);
 
ALTER TABLE Editora ADD CONSTRAINT FK_Editora_2
    FOREIGN KEY (fk_Cidade_codCidade)
    REFERENCES Cidade (codCidade)
    ON DELETE CASCADE;
 
ALTER TABLE Livro ADD CONSTRAINT FK_Livro_2
    FOREIGN KEY (fk_Editora_codEditora)
    REFERENCES Editora (codEditora)
    ON DELETE CASCADE;
 
ALTER TABLE ArtigoEmPeriodico ADD CONSTRAINT FK_ArtigoEmPeriodico_2
    FOREIGN KEY (fk_Periodico_codPeriodico)
    REFERENCES Periodico (codPeriodico)
    ON DELETE CASCADE;
 
ALTER TABLE Periodico ADD CONSTRAINT FK_Periodico_2
    FOREIGN KEY (fk_Qualis_codQualis)
    REFERENCES Qualis (codQualis)
    ON DELETE SET NULL;
 
ALTER TABLE PublicacaoEmCongresso ADD CONSTRAINT FK_PublicacaoEmCongresso_2
    FOREIGN KEY (fk_TipoProducao_codTipoProducaoCientifica)
    REFERENCES TipoProducao (codTipoProducaoCientifica)
    ON DELETE CASCADE;
 
ALTER TABLE PublicacaoEmCongresso ADD CONSTRAINT FK_PublicacaoEmCongresso_3
    FOREIGN KEY (fk_Evento_codEvento)
    REFERENCES Evento (codEvento)
    ON DELETE CASCADE;
 
ALTER TABLE Evento ADD CONSTRAINT FK_Evento_2
    FOREIGN KEY (fk_TipoEvento_codTipoEvento)
    REFERENCES TipoEvento (codTipoEvento)
    ON DELETE CASCADE;
 
ALTER TABLE Evento ADD CONSTRAINT FK_Evento_3
    FOREIGN KEY (fk_Cidade_codCidade)
    REFERENCES Cidade (codCidade)
    ON DELETE CASCADE;
 
ALTER TABLE CapituloDeLivro ADD CONSTRAINT FK_CapituloDeLivro_2
    FOREIGN KEY (fk_Livro_codLivro)
    REFERENCES Livro (codLivro)
    ON DELETE CASCADE;
 
ALTER TABLE ApresentacaoDeTrabalho ADD CONSTRAINT FK_ApresentacaoDeTrabalho_2
    FOREIGN KEY (fk_TipoProducao_codTipoProducaoCientifica)
    REFERENCES TipoProducao (codTipoProducaoCientifica)
    ON DELETE CASCADE;
 
ALTER TABLE OutraProducaoBibliografica ADD CONSTRAINT FK_OutraProducaoBibliografica_2
    FOREIGN KEY (fk_TipoProducao_codTipoProducaoCientifica)
    REFERENCES TipoProducao (codTipoProducaoCientifica)
    ON DELETE CASCADE;
 
ALTER TABLE OutraProducaoBibliografica ADD CONSTRAINT FK_OutraProducaoBibliografica_3
    FOREIGN KEY (fk_Cidade_codCidade)
    REFERENCES Cidade (codCidade)
    ON DELETE CASCADE;
 
ALTER TABLE ProducaoTecnica ADD CONSTRAINT FK_ProducaoTecnica_2
    FOREIGN KEY (fk_TipoProducao_codTipoProducaoCientifica)
    REFERENCES TipoProducao (codTipoProducaoCientifica)
    ON DELETE CASCADE;
 
ALTER TABLE Assessoria ADD CONSTRAINT FK_Assessoria_2
    FOREIGN KEY (fk_Instituicao_codInstituicao)
    REFERENCES Instituicao (codInstituicao)
    ON DELETE CASCADE;
 
ALTER TABLE OrganizadorLivro ADD CONSTRAINT FK_OrganizadorLivro_1
    FOREIGN KEY (fk_Pessoa_codPessoa)
    REFERENCES Pessoa (codPessoa)
    ON DELETE RESTRICT;
 
ALTER TABLE OrganizadorLivro ADD CONSTRAINT FK_OrganizadorLivro_2
    FOREIGN KEY (fk_Livro_codLivro)
    REFERENCES Livro (codLivro)
    ON DELETE SET NULL;
 
ALTER TABLE AutorLivro ADD CONSTRAINT FK_AutorLivro_1
    FOREIGN KEY (fk_Pessoa_codPessoa)
    REFERENCES Pessoa (codPessoa)
    ON DELETE SET NULL;
 
ALTER TABLE AutorLivro ADD CONSTRAINT FK_AutorLivro_2
    FOREIGN KEY (fk_Livro_codLivro)
    REFERENCES Livro (codLivro)
    ON DELETE SET NULL;
 
ALTER TABLE AutorArtigoEmPeriodico ADD CONSTRAINT FK_AutorArtigoEmPeriodico_1
    FOREIGN KEY (fk_Pessoa_codPessoa)
    REFERENCES Pessoa (codPessoa)
    ON DELETE RESTRICT;
 
ALTER TABLE AutorArtigoEmPeriodico ADD CONSTRAINT FK_AutorArtigoEmPeriodico_2
    FOREIGN KEY (fk_ArtigoEmPeriodico_codArtigoEmPeriodico)
    REFERENCES ArtigoEmPeriodico (codArtigoEmPeriodico)
    ON DELETE SET NULL;
 
ALTER TABLE CitacoesPelaFerramenta ADD CONSTRAINT FK_CitacoesPelaFerramenta_1
    FOREIGN KEY (fk_FerramentaDeBusca_codFerramenta)
    REFERENCES FerramentaDeBusca (codFerramenta)
    ON DELETE SET NULL;
 
ALTER TABLE CitacoesPelaFerramenta ADD CONSTRAINT FK_CitacoesPelaFerramenta_2
    FOREIGN KEY (fk_ArtigoEmPeriodico_codArtigoEmPeriodico)
    REFERENCES ArtigoEmPeriodico (codArtigoEmPeriodico)
    ON DELETE SET NULL;
 
ALTER TABLE ParticipacaoDoCVEmEvento ADD CONSTRAINT FK_ParticipacaoDoCVEmEvento_1
    FOREIGN KEY (fk_Evento_codEvento)
    REFERENCES Evento (codEvento)
    ON DELETE SET NULL;
 
ALTER TABLE ParticipacaoDoCVEmEvento ADD CONSTRAINT FK_ParticipacaoDoCVEmEvento_2
    FOREIGN KEY (fk_CVLattes_LattesID)
    REFERENCES CVLattes (LattesID)
    ON DELETE SET NULL;
 
ALTER TABLE OrganizacaoDeEventoPeloCV ADD CONSTRAINT FK_OrganizacaoDeEventoPeloCV_1
    FOREIGN KEY (fk_CVLattes_LattesID)
    REFERENCES CVLattes (LattesID)
    ON DELETE SET NULL;
 
ALTER TABLE OrganizacaoDeEventoPeloCV ADD CONSTRAINT FK_OrganizacaoDeEventoPeloCV_2
    FOREIGN KEY (fk_Evento_codEvento)
    REFERENCES Evento (codEvento)
    ON DELETE SET NULL;
 
ALTER TABLE AutorCapitulo ADD CONSTRAINT FK_AutorCapitulo_1
    FOREIGN KEY (fk_CapituloDeLivro_codCap)
    REFERENCES CapituloDeLivro (codCap)
    ON DELETE SET NULL;
 
ALTER TABLE AutorCapitulo ADD CONSTRAINT FK_AutorCapitulo_2
    FOREIGN KEY (fk_Pessoa_codPessoa)
    REFERENCES Pessoa (codPessoa)
    ON DELETE SET NULL;
 
ALTER TABLE AutorPublicacaoEmCongresso ADD CONSTRAINT FK_AutorPublicacaoEmCongresso_1
    FOREIGN KEY (fk_PublicacaoEmCongresso_codArtigoEmCongresso)
    REFERENCES PublicacaoEmCongresso (codArtigoEmCongresso)
    ON DELETE SET NULL;
 
ALTER TABLE AutorPublicacaoEmCongresso ADD CONSTRAINT FK_AutorPublicacaoEmCongresso_2
    FOREIGN KEY (fk_Pessoa_codPessoa)
    REFERENCES Pessoa (codPessoa)
    ON DELETE SET NULL;
 
ALTER TABLE AutorApresentacao ADD CONSTRAINT FK_AutorApresentacao_1
    FOREIGN KEY (fk_Pessoa_codPessoa)
    REFERENCES Pessoa (codPessoa)
    ON DELETE RESTRICT;
 
ALTER TABLE AutorApresentacao ADD CONSTRAINT FK_AutorApresentacao_2
    FOREIGN KEY (fk_ApresentacaoDeTrabalho_codApresentacao)
    REFERENCES ApresentacaoDeTrabalho (codApresentacao)
    ON DELETE SET NULL;
 
ALTER TABLE AutorOutraProd ADD CONSTRAINT FK_AutorOutraProd_1
    FOREIGN KEY (fk_Pessoa_codPessoa)
    REFERENCES Pessoa (codPessoa)
    ON DELETE RESTRICT;
 
ALTER TABLE AutorOutraProd ADD CONSTRAINT FK_AutorOutraProd_2
    FOREIGN KEY (fk_OutraProducaoBibliografica_codOutraProd)
    REFERENCES OutraProducaoBibliografica (codOutraProd)
    ON DELETE SET NULL;
 
ALTER TABLE Participante ADD CONSTRAINT FK_Participante_1
    FOREIGN KEY (fk_Pessoa_codPessoa)
    REFERENCES Pessoa (codPessoa)
    ON DELETE RESTRICT;
 
ALTER TABLE Participante ADD CONSTRAINT FK_Participante_2
    FOREIGN KEY (fk_ProducaoTecnica_codProdTecnica)
    REFERENCES ProducaoTecnica (codProdTecnica)
    ON DELETE SET NULL;
 
ALTER TABLE AutorProgramaPC ADD CONSTRAINT FK_AutorProgramaPC_1
    FOREIGN KEY (fk_Pessoa_codPessoa)
    REFERENCES Pessoa (codPessoa)
    ON DELETE RESTRICT;
 
ALTER TABLE AutorProgramaPC ADD CONSTRAINT FK_AutorProgramaPC_2
    FOREIGN KEY (fk_ProgramaDePC_codProgramaPC)
    REFERENCES ProgramaDePC (codProgramaPC)
    ON DELETE SET NULL;
 
ALTER TABLE Consultor ADD CONSTRAINT FK_Consultor_1
    FOREIGN KEY (fk_Pessoa_codPessoa)
    REFERENCES Pessoa (codPessoa)
    ON DELETE RESTRICT;
 
ALTER TABLE Consultor ADD CONSTRAINT FK_Consultor_2
    FOREIGN KEY (fk_Assessoria_codAssessoria)
    REFERENCES Assessoria (codAssessoria)
    ON DELETE SET NULL;
 
ALTER TABLE RevisorDePeriodico ADD CONSTRAINT FK_RevisorDePeriodico_1
    FOREIGN KEY (fk_CVLattes_LattesID)
    REFERENCES CVLattes (LattesID)
    ON DELETE SET NULL;
 
ALTER TABLE RevisorDePeriodico ADD CONSTRAINT FK_RevisorDePeriodico_2
    FOREIGN KEY (fk_Periodico_codPeriodico)
    REFERENCES Periodico (codPeriodico)
    ON DELETE SET NULL;
 
ALTER TABLE RevisorDeProjetos ADD CONSTRAINT FK_RevisorDeProjetos_1
    FOREIGN KEY (fk_CVLattes_LattesID)
    REFERENCES CVLattes (LattesID)
    ON DELETE SET NULL;
 
ALTER TABLE RevisorDeProjetos ADD CONSTRAINT FK_RevisorDeProjetos_2
    FOREIGN KEY (fk_Instituicao_codInstituicao)
    REFERENCES Instituicao (codInstituicao)
    ON DELETE SET NULL;
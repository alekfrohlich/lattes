/* Lógico_1: */

CREATE TABLE Editora (
    Nome varchar(20),
    cidade varchar(20),
    codEditora integer PRIMARY KEY
);

CREATE TABLE Livro (
    Ano integer,
    Volume integer,
    Edicao integer,
    qtdPaginas integer,
    Titulo varchar(40),
    codLivro integer PRIMARY KEY
);

CREATE TABLE Pessoa (
    Nome varchar(20),
    codPessoa integer PRIMARY KEY
);

CREATE TABLE ArtigoEmPeriodico (
    Ano integer,
    intervaloPags interval,
    codArtigoEmPer integer PRIMARY KEY,
    Titulo varchar(40),
    fk_Periodico_codPer integer,
    Volume integer
);

CREATE TABLE FerramentaDeBusca (
    codFerramenta integer PRIMARY KEY,
    Nome varchar(20)
);

CREATE TABLE Periodico (
    codPer integer PRIMARY KEY,
    Nome varchar(40)
);

CREATE TABLE Revista (
    codRevista integer PRIMARY KEY,
    nomeRevista varchar(40),
    paisRevista varchar(40)
);

CREATE TABLE Qualis (
);

CREATE TABLE ArtigoEmCongresso (
    codArtigoEmCongresso integer PRIMARY KEY,
    Titulo varchar(40),
    intPags interval
);

CREATE TABLE TipoPublicacaoEmCongresso (
    fk_ArtigoEmCongresso_codArtigoEmCongresso integer
);

CREATE TABLE Evento (
    codEvento integer PRIMARY KEY,
    nomeEvento varchar(40),
    local varchar(200)
);

CREATE TABLE OrganizadorLivro (
    fk_Pessoa_codPessoa integer,
    fk_Livro_codLivro integer
);

CREATE TABLE AutorLivro (
    fk_Pessoa_codPessoa integer,
    fk_Livro_codLivro integer
);

CREATE TABLE AutorArtigo (
    fk_Pessoa_codPessoa integer,
    fk_ArtigoEmPeriodico_codArtigoEmPer integer
);

CREATE TABLE CitacoesPelaFerr (
    fk_FerramentaDeBusca_codFerramenta integer,
    fk_ArtigoEmPeriodico_codArtigoEmPer integer,
    Quantidade integer
);

CREATE TABLE EventoDoCongresso (
    fk_ArtigoEmCongresso_codArtigoEmCongresso integer,
    fk_Evento_codEvento integer,
    NomeAnais varchar(40)
);
 
ALTER TABLE ArtigoEmPeriodico ADD CONSTRAINT FK_ArtigoEmPeriodico_2
    FOREIGN KEY (fk_Periodico_codPer)
    REFERENCES Periodico (codPer)
    ON DELETE CASCADE;
 
ALTER TABLE TipoPublicacaoEmCongresso ADD CONSTRAINT FK_TipoPublicacaoEmCongresso_1
    FOREIGN KEY (fk_ArtigoEmCongresso_codArtigoEmCongresso)
    REFERENCES ArtigoEmCongresso (codArtigoEmCongresso)
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
    ON DELETE RESTRICT;
 
ALTER TABLE AutorLivro ADD CONSTRAINT FK_AutorLivro_2
    FOREIGN KEY (fk_Livro_codLivro)
    REFERENCES Livro (codLivro)
    ON DELETE SET NULL;
 
ALTER TABLE AutorArtigo ADD CONSTRAINT FK_AutorArtigo_1
    FOREIGN KEY (fk_Pessoa_codPessoa)
    REFERENCES Pessoa (codPessoa)
    ON DELETE RESTRICT;
 
ALTER TABLE AutorArtigo ADD CONSTRAINT FK_AutorArtigo_2
    FOREIGN KEY (fk_ArtigoEmPeriodico_codArtigoEmPer)
    REFERENCES ArtigoEmPeriodico (codArtigoEmPer)
    ON DELETE SET NULL;
 
ALTER TABLE CitacoesPelaFerr ADD CONSTRAINT FK_CitacoesPelaFerr_1
    FOREIGN KEY (fk_FerramentaDeBusca_codFerramenta)
    REFERENCES FerramentaDeBusca (codFerramenta)
    ON DELETE SET NULL;
 
ALTER TABLE CitacoesPelaFerr ADD CONSTRAINT FK_CitacoesPelaFerr_2
    FOREIGN KEY (fk_ArtigoEmPeriodico_codArtigoEmPer)
    REFERENCES ArtigoEmPeriodico (codArtigoEmPer)
    ON DELETE SET NULL;
 
ALTER TABLE EventoDoCongresso ADD CONSTRAINT FK_EventoDoCongresso_1
    FOREIGN KEY (fk_ArtigoEmCongresso_codArtigoEmCongresso)
    REFERENCES ArtigoEmCongresso (codArtigoEmCongresso)
    ON DELETE SET NULL;
 
ALTER TABLE EventoDoCongresso ADD CONSTRAINT FK_EventoDoCongresso_2
    FOREIGN KEY (fk_Evento_codEvento)
    REFERENCES Evento (codEvento)
    ON DELETE SET NULL;
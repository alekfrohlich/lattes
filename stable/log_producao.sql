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

CREATE TABLE PessoaAutor (
    nomePA varchar(20),
    codPA integer PRIMARY KEY
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

CREATE TABLE OrganizadorLivro (
    fk_PessoaAutor_codPA integer,
    fk_Livro_codLivro integer
);

CREATE TABLE AutorLivro (
    fk_PessoaAutor_codPA integer,
    fk_Livro_codLivro integer
);

CREATE TABLE AutorArtigo (
    fk_PessoaAutor_codPA integer,
    fk_ArtigoEmPeriodico_codArtigoEmPer integer
);

CREATE TABLE CitacoesPelaFerr (
    fk_FerramentaDeBusca_codFerramenta integer,
    fk_ArtigoEmPeriodico_codArtigoEmPer integer,
    Quantidade integer
);
 
ALTER TABLE ArtigoEmPeriodico ADD CONSTRAINT FK_ArtigoEmPeriodico_2
    FOREIGN KEY (fk_Periodico_codPer)
    REFERENCES Periodico (codPer)
    ON DELETE CASCADE;
 
ALTER TABLE OrganizadorLivro ADD CONSTRAINT FK_OrganizadorLivro_1
    FOREIGN KEY (fk_PessoaAutor_codPA)
    REFERENCES PessoaAutor (codPA)
    ON DELETE RESTRICT;
 
ALTER TABLE OrganizadorLivro ADD CONSTRAINT FK_OrganizadorLivro_2
    FOREIGN KEY (fk_Livro_codLivro)
    REFERENCES Livro (codLivro)
    ON DELETE SET NULL;
 
ALTER TABLE AutorLivro ADD CONSTRAINT FK_AutorLivro_1
    FOREIGN KEY (fk_PessoaAutor_codPA)
    REFERENCES PessoaAutor (codPA)
    ON DELETE RESTRICT;
 
ALTER TABLE AutorLivro ADD CONSTRAINT FK_AutorLivro_2
    FOREIGN KEY (fk_Livro_codLivro)
    REFERENCES Livro (codLivro)
    ON DELETE SET NULL;
 
ALTER TABLE AutorArtigo ADD CONSTRAINT FK_AutorArtigo_1
    FOREIGN KEY (fk_PessoaAutor_codPA)
    REFERENCES PessoaAutor (codPA)
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
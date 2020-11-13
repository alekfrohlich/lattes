/* Lógico_1: */

CREATE TABLE AtuacaoProfissional (
    codAtuacao integer PRIMARY KEY,
    anoInicio integer,
    cargaHoraria integer,
    anoFim integer,
    AtuacaoProfissional_TIPO INT,
    
    fk_Vinculo_codVinculo integer,
    fk_Cargo_codCargo integer,
    fk_Cargo_codCargo_ integer
);

CREATE TABLE Vinculo (
    codVinculo integer PRIMARY KEY,
    Nome varchar(100)
);

CREATE TABLE Regime (
    codRegime integer PRIMARY KEY,
    Nome varchar(100)
);

CREATE TABLE Cargo (
    codCargo integer PRIMARY KEY,
    Nome varchar(100)
);

CREATE TABLE LinhaDePesquisa (
    codLinha integer PRIMARY KEY,
    Nome varchar(100),
    fk_AtuacaoProfissional_codAtuacao integer
);

CREATE TABLE Disciplina (
    codDisciplina integer PRIMARY KEY,
    Nome varchar(100),
    fk_NivelDisciplina_codNivelDisciplina integer
);

CREATE TABLE NivelDisciplina (
    codNivelDisciplina integer PRIMARY KEY,
    Nome varchar(100)
);

CREATE TABLE ServicoRealizado (
    codServicoRealizado integer PRIMARY KEY,
    Titulo varchar(100)
);

CREATE TABLE RegimeDaAtuacao (
    fk_Regime_codRegime integer,
    fk_AtuacaoProfissional_codAtuacao integer
);

CREATE TABLE DisciplinasMinistradas (
    fk_Disciplina_codDisciplina integer,
    fk_AtuacaoProfissional_codAtuacao integer
);

CREATE TABLE ServicosRealizados (
    fk_ServicoRealizado_codServicoRealizado integer,
    fk_AtuacaoProfissional_codAtuacao integer
);
 
ALTER TABLE AtuacaoProfissional ADD CONSTRAINT FK_AtuacaoProfissional_2
    FOREIGN KEY (fk_Vinculo_codVinculo)
    REFERENCES Vinculo (codVinculo)
    ON DELETE CASCADE;
 
ALTER TABLE AtuacaoProfissional ADD CONSTRAINT FK_AtuacaoProfissional_3
    FOREIGN KEY (fk_Cargo_codCargo, fk_Cargo_codCargo_)
    REFERENCES Cargo (codCargo, codCargo)
    ON DELETE CASCADE;
 
ALTER TABLE LinhaDePesquisa ADD CONSTRAINT FK_LinhaDePesquisa_2
    FOREIGN KEY (fk_AtuacaoProfissional_codAtuacao)
    REFERENCES AtuacaoProfissional (codAtuacao)
    ON DELETE CASCADE;
 
ALTER TABLE Disciplina ADD CONSTRAINT FK_Disciplina_2
    FOREIGN KEY (fk_NivelDisciplina_codNivelDisciplina)
    REFERENCES NivelDisciplina (codNivelDisciplina)
    ON DELETE CASCADE;
 
ALTER TABLE RegimeDaAtuacao ADD CONSTRAINT FK_RegimeDaAtuacao_1
    FOREIGN KEY (fk_Regime_codRegime)
    REFERENCES Regime (codRegime)
    ON DELETE SET NULL;
 
ALTER TABLE RegimeDaAtuacao ADD CONSTRAINT FK_RegimeDaAtuacao_2
    FOREIGN KEY (fk_AtuacaoProfissional_codAtuacao)
    REFERENCES AtuacaoProfissional (codAtuacao)
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
/* Lógico_1: */

CREATE TABLE Pessoa (
    CPF integer PRIMARY KEY,
    Nome varchar(20),
    fk_Cidade_codCidade integer
);

CREATE TABLE Objeto (
    codObjeto integer PRIMARY KEY,
    Nome varchar(20),
    Descricao varchar(400)
);

CREATE TABLE Cidade (
    codCidade integer PRIMARY KEY,
    Nome varchar(20),
    fk_Estado_codEstado integer
);

CREATE TABLE Estado (
    codEstado integer PRIMARY KEY,
    Nome varchar(2)
);

CREATE TABLE Dono (
    fk_Pessoa_CPF integer,
    fk_Objeto_codObjeto integer
);
 
ALTER TABLE Pessoa ADD CONSTRAINT FK_Pessoa_2
    FOREIGN KEY (fk_Cidade_codCidade)
    REFERENCES Cidade (codCidade)
    ON DELETE CASCADE;
 
ALTER TABLE Cidade ADD CONSTRAINT FK_Cidade_2
    FOREIGN KEY (fk_Estado_codEstado)
    REFERENCES Estado (codEstado)
    ON DELETE CASCADE;
 
ALTER TABLE Dono ADD CONSTRAINT FK_Dono_1
    FOREIGN KEY (fk_Pessoa_CPF)
    REFERENCES Pessoa (CPF)
    ON DELETE SET NULL;
 
ALTER TABLE Dono ADD CONSTRAINT FK_Dono_2
    FOREIGN KEY (fk_Objeto_codObjeto)
    REFERENCES Objeto (codObjeto)
    ON DELETE SET NULL;
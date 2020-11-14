-- Test Endereco

INSERT INTO Pessoa (codPessoa, Nome) VALUES (1, 'Vania Bogorny');
INSERT INTO NomeEmCitacao (codNome, Nome) VALUES (1, 'BOGORNY, V.'), (2, 'Bogorny, Vania');
INSERT INTO NomesEmCitacao VALUES (1, 1), (2, 1);

INSERT INTO Instituicao VALUES (1, 'Universidade Federal de Santa Catarina', 'UFSC', 1);
INSERT INTO Departamento VALUES (1, 'Departamento de Informática e Estatística (UFSC-CTC-INE)', 1);

INSERT INTO Pais (codPais, nomePais) VALUES (1, 'Brasil');
INSERT INTO Estado (codEstado, nomeEstado, fk_Pais_codPais) VALUES (1, 'SC', 1);
INSERT INTO Cidade (codCidade, nomeCidade, fk_Estado_codEstado) VALUES (1, 'Florianopolis', 1);
INSERT INTO Bairro (codBairro, nomeBairro, fk_Cidade_codCidade) VALUES (1, 'Trindade', 1);
INSERT INTO TipoLogradouro (1, 'Rua');
INSERT INTO Logradouro (codLogradouro, CEP, Nome, fk_TipoLogradouro_codTipoLogradouro, fk_Bairro_codBairro);
    VALUES (1, 88040900, 'Rua da UFSC', 1, 1);

INSERT INTO CVLattes (LattesID, OrchidID, telefone, homepage, OutrasInfo, fk_Departamento_codDepto, fk_Pessoa_codPessoa)
    VALUES ('9045199822095908', '0000-0002-0159-4643', 37214728, 'www.inf.ufsc.br/~vania', 'H-Index (...)', 1, 1);

-- ToDo: Premio

INSERT INTO Lingua VALUES (1, 'Inglês'), (2, 'Alemão'), (3, 'Espanhol');
INSERT INTO NivelLingua VALUES (1, 'Bem'), (2, 'Razoavelmente'), (3, 'Pouco');
INSERT INTO Compreende_CVLattes_Lingua_NivelLingua (fk_CVLattes_LattesID, fk_Lingua_codLingua, fk_NivelLingua_codNivelLingua)
    VALUES (1, 1, 1), (1, 2, 1), (1, 3, 2);
INSERT INTO Fala_CVLattes_Lingua_NivelLingua VALUES (1, 1, 1), (1, 2, 1), (1, 3, 3);
INSERT INTO Escreve_CVLattes_Lingua_NivelLingua VALUES (1, 1, 1);
INSERT INTO Le_CVLattes_Lingua_NivelLingua VALUES (1, 1, 1), (1, 3, 2);
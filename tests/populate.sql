-- Identficacao e endereco

INSERT INTO Pais (codPais, nomePais)
    VALUES (1, 'Brasil'),
           (2, 'U.S.'),
           (3, 'Canada');
INSERT INTO Estado (codEstado, nomeEstado, fk_Pais_codPais)
    VALUES (1, 'SC', 1),
           (2, 'RS', 1),
           (3, 'Massachusetts', 2),
           (4, 'Ontario', 3);
INSERT INTO Cidade (codCidade, nomeCidade, fk_Estado_codEstado)
    VALUES (1, 'Florianopolis', 1),
           (2, 'Cambridge', 3),
           (3, 'Ottawa', 4);
INSERT INTO Bairro (codBairro, nomeBairro, fk_Cidade_codCidade)
    VALUES (1, 'Trindade', 1),
           (2, 'Massachusetts University', 2),
           (3, 'Carleton University', 3);
INSERT INTO TipoLogradouro VALUES (1, 'Universidade');
INSERT INTO Logradouro (codLogradouro, CEP, Nome, fk_TipoLogradouro_codTipoLogradouro, fk_Bairro_codBairro)
    VALUES (1, 88040900, 'Rua da UFSC', 1, 1),
           (2, null, 'Massachusetts Avenue', 1, 2),
           (3, null, 'Colonel By Drive', 1, 3);

INSERT INTO Instituicao
    VALUES (1, 'Universidade Federal de Santa Catarina', 'UFSC', 1),
           (2, 'Massachusetts Institute of Technology', 'MIT', 2),
           (3, 'Carleton University', 'Carleton', 3);
INSERT INTO Departamento
    VALUES (1, 'Departamento de Informatica e Estatística', 1),
           (2, 'Department of Linguistics and Philosophy', 2),
           (3, 'Department of Mathematics', 2),
           (4, 'School of Mathematics and Statistics', 3);

INSERT INTO Bolsa VALUES (1, 'Bolsista de Produtividade em Pesquisa do CNPq - Nivel 2');
INSERT INTO CVLattes
    (LattesID, OrchidID, telefone, homepage, sala, OutrasInfo, fk_Departamento_codDepto, fk_Bolsa_codBolsa, descricao)
    VALUES (9045199822095908, '0000-0002-0159-4643', 37214728, 'www.inf.ufsc.br/~vania', 404, 'H-Index (...)', 1, 1, '...'),
           (2, null, 1, null, null, null, 1, null, null),
           (3, null, 2, null, null, null, 1, null, null),
           (4, null, 6172537819, 'linguistics.mit.edu/user/chomsky/', 840, null, 2, null, null),
           (5, null, 6172537930, 'http://www-math.mit.edu/~rstan/', 380, null, 3, null, null),
           (6, null, 3, 'https://people.math.carleton.ca/~daniel/', 4372, null, 4, null, null);

INSERT INTO Pessoa (codPessoa, Nome, LattesID)
    VALUES (1, 'Vania Bogorny', 9045199822095908),
           (2, 'Alek Frohlich', 2),
           (3, 'Gabriel Belle', 3),
           (4, 'Noam Chomsky', 4),
           (5, 'Richard P. Stanley', 5),
           (6, 'Daniel Panario', 6);
INSERT INTO NomeEmCitacao (fk_Pessoa_codPessoa, numNome, Nome)
    VALUES (1, 1, 'BOGORNY, V.'),
           (1, 2, 'Bogorny, Vania');

-- TODO: queries sobre lingua
INSERT INTO Lingua
    VALUES (1, 'Ingles'),
           (2, 'Alemao'),
           (3, 'Espanhol');
INSERT INTO NivelLingua
    VALUES (1, 'Bem'),
           (2, 'Razoavelmente'),
           (3, 'Pouco');
INSERT INTO Compreende_CVLattes_Lingua_NivelLingua (fk_CVLattes_LattesID, fk_Lingua_codLingua, fk_NivelLingua_codNivelLingua)
    VALUES (9045199822095908, 1, 1),
           (9045199822095908, 2, 1),
           (9045199822095908, 3, 2);
INSERT INTO Fala_CVLattes_Lingua_NivelLingua
    VALUES (9045199822095908, 1, 1),
           (9045199822095908, 2, 1),
           (9045199822095908, 3, 3);
INSERT INTO Escreve_CVLattes_Lingua_NivelLingua
    VALUES (9045199822095908, 1, 1);
INSERT INTO Le_CVLattes_Lingua_NivelLingua
    VALUES (9045199822095908, 1, 1),
           (9045199822095908, 3, 2);

-- Formacao

-- Orientacao

-- Producao

-- Projeto
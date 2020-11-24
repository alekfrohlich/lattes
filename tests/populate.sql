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
           (3, 'Ottawa', 4),
           (4, 'Passo Fundo', 2),
           (5, 'Porto Alegre', 2);
INSERT INTO Bairro (codBairro, nomeBairro, fk_Cidade_codCidade)
    VALUES (1, 'Trindade', 1),
           (2, 'Massachusetts University', 2),
           (3, 'Carleton University', 3),
           (4, 'São José', 4),
           (5, 'Farroupilha', 5);

INSERT INTO TipoLogradouro VALUES (1, 'Universidade'), (2, 'Rodovia'), (3, 'Avenida');
INSERT INTO Logradouro (codLogradouro, CEP, Nome, fk_TipoLogradouro_codTipoLogradouro, fk_Bairro_codBairro)
    VALUES (1, 88040900, 'Rua da UFSC', 1, 1),
           (2, NULL, 'Massachusetts Avenue', 1, 2),
           (3, NULL, 'Colonel By Drive', 1, 3),
           (4, 99052900, 'BR-285', 2, 4),
           (5, 90040060, 'Paulo Gama', 3, 5);

INSERT INTO Instituicao
    VALUES (1, 'Universidade Federal de Santa Catarina', 'UFSC', 1),
           (2, 'Massachusetts Institute of Technology', 'MIT', 2),
           (3, 'Carleton University', 'Carleton', 3),
           (4, 'Universidade de Passo Fundo', 'UPF', 4),
           (5, 'Universidade Federal do Rio Grande do Sul', 'UFRGS', 5);

INSERT INTO Departamento
    VALUES (1, 'Departamento de Informatica e Estatística', 1),
           (2, 'Department of Linguistics and Philosophy', 2),
           (3, 'Department of Mathematics', 2),
           (4, 'School of Mathematics and Statistics', 3);

INSERT INTO Bolsa VALUES (1, 'Bolsista de Produtividade em Pesquisa do CNPq - Nivel 2');
INSERT INTO CVLattes
    (LattesID, OrchidID, telefone, homepage, sala, OutrasInfo, fk_Departamento_codDepto, fk_Bolsa_codBolsa, descricao)
    VALUES (9045199822095908, '0000-0002-0159-4643', 37214728, 'www.inf.ufsc.br/~vania', 404, 'H-Index (...)', 1, 1, '...'),
           (5655194264112797, NULL, 4837217543, 'http://inf.ufsc.br/~alvares', NULL, NULL, 1, NULL, NULL),
           (2, NULL, 1, NULL, NULL, NULL, 1, NULL, NULL),
           (3, NULL, 2, NULL, NULL, NULL, 1, NULL, NULL),
           (4, NULL, 6172537819, 'linguistics.mit.edu/user/chomsky/', 840, null, 2, null, null),
           (5, NULL, 6172537930, 'http://www-math.mit.edu/~rstan/', 380, null, 3, null, null),
           (6, NULL, 3, 'https://people.math.carleton.ca/~daniel/', 4372, null, 4, null, null);

INSERT INTO Pessoa (codPessoa, Nome, LattesID)
    VALUES (1, 'Vania Bogorny', 9045199822095908),
           (2, 'Alek Frohlich', 2),
           (3, 'Gabriel Belle', 3),
           (4, 'Noam Chomsky', 4),
           (5, 'Richard P. Stanley', 5),
           (6, 'Daniel Panario', 6),
           (7, 'Shashi Shekhar', NULL),
           (8, 'Jane Colossi Grazziotin', NULL),
           (9, 'Cirano Iochpe', NULL),
           (10, 'Luis Otavio Campos Alvares', 5655194264112797),
           (11, 'Garry L. Mullen', NULL);

INSERT INTO NomeEmCitacao (fk_Pessoa_codPessoa, numNome, Nome)
    VALUES (1, 1, 'BOGORNY, V.'),
           (1, 2, 'Bogorny, Vania');

-- TODO: queries sobre lingua
INSERT INTO Lingua
    VALUES (1, 'Ingles'),
           (2, 'Alemao'),
           (3, 'Espanhol'),
           (4, 'Francês');
INSERT INTO NivelLingua
    VALUES (1, 'Bem'),
           (2, 'Razoavelmente'),
           (3, 'Pouco');
INSERT INTO Compreende_CVLattes_Lingua_NivelLingua (fk_CVLattes_LattesID, fk_Lingua_codLingua, fk_NivelLingua_codNivelLingua)
    VALUES (9045199822095908, 1, 1), (9045199822095908, 2, 1), (9045199822095908, 3, 2),
           (5655194264112797, 1, 1), (5655194264112797, 3, 2), (5655194264112797, 4, 1);
INSERT INTO Fala_CVLattes_Lingua_NivelLingua
    VALUES (9045199822095908, 1, 1), (9045199822095908, 2, 1), (9045199822095908, 3, 3),
           (5655194264112797, 1, 1), (5655194264112797, 3, 3), (5655194264112797, 4, 1);
INSERT INTO Escreve_CVLattes_Lingua_NivelLingua
    VALUES (9045199822095908, 1, 1),
           (5655194264112797, 1, 1), (5655194264112797, 3, 3), (5655194264112797, 4, 1);
INSERT INTO Le_CVLattes_Lingua_NivelLingua
    VALUES (9045199822095908, 1, 1), (9045199822095908, 3, 2),
           (5655194264112797, 1, 1), (5655194264112797, 3, 2), (5655194264112797, 4, 1);

-- Formacao

INSERT INTO Titulacao
VALUES (1, 'Graduação'),
       (2, 'Mestrado'),
       (3, 'Doutorado');

INSERT INTO Curso
VALUES (1, 'Computação'),
       (2, 'Economia'),
       (3, 'Matematica'),
       (4, 'Fisica');

INSERT INTO FormacaoAcademica
VALUES (1, 1991, 1995, 'Projeto conceitual, lógico e físico de um sistema de controle de fretes.', 4,  9045199822095908, 1, 8, NULL, 1),
       (2, 1999, 2001, 'Incorporando Suporte a Restrições Espaciais de Caráter Topológico ao Modelo Abstrato do Consórcio OpenGIS', 5,  9045199822095908, 2, 9, NULL, 1),
       (3, 2002, 2006, 'Enhancing Spatial Association Rule Mining in Geographic Databases', 5, 9045199822095908, 3, 10, NULL, 1);

INSERT INTO Conceito
VALUES (1, 'Capes 7');

INSERT INTO ConceitoDoCurso_Curso_Conceito_Instituicao
VALUES (1, 1, 1),
       (2, 1, 1);

INSERT INTO CursosDaInstituicao
VALUES (1, 1), (1, 2), (2, 3), (2, 4);

-- Orientacao

INSERT INTO TipoOrientacao
VALUES (1, 'Trabalho de conclusão de curso de graduação');

INSERT INTO Orientacao
VALUES (1, 'O melhor  TCC da computacao', 2021, TRUE, 2, 1, 1, NULL, 9045199822095908, 1),
       (2, 'O melhor TCC de economia big data', 2021, TRUE, 3, 1, 1, NULL, 9045199822095908, 2);

-- Producao

-- INSERT INTO Qualis
-- INSERT INTO Periodico

-- INSERT INTO ArtigoEmPeriodico
-- INSERT INTO AutorArtigoEmPeriodico

INSERT INTO Editora
    VALUES (1, 'Cambridge University Press', null),
           (2, 'Pearson Education Inc.', null),
           (3, 'MIT Press', null),
           (4, 'CRC Press', null);
INSERT INTO Livro
    VALUES (1, 2014, 11, 1, 258, 'Aspects of the Theory of Syntax', 3),
           (2, 1997, 1, 2, 725, 'Enumerative Combinatorics', 1),
           (3, 2013, 1, 1, 1071, 'Handbook of Finite Fields', 4);
INSERT INTO AutorLivro
    VALUES (4, 1),
           (5, 2),
           (6, 3), (11, 3);

-- Projeto
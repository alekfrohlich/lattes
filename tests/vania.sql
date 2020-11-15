-- Test Endereco

INSERT INTO Pessoa (codPessoa, Nome) VALUES (1, 'Vania Bogorny');
INSERT INTO NomeEmCitacao (codNome, Nome) VALUES (1, 'BOGORNY, V.'), (2, 'Bogorny, Vania');
INSERT INTO NomesEmCitacao VALUES (1, 1), (2, 1);

INSERT INTO Pais (codPais, nomePais) VALUES (1, 'Brasil');
INSERT INTO Estado (codEstado, nomeEstado, fk_Pais_codPais) VALUES (1, 'SC', 1);
INSERT INTO Cidade (codCidade, nomeCidade, fk_Estado_codEstado) VALUES (1, 'Florianopolis', 1);
INSERT INTO Bairro (codBairro, nomeBairro, fk_Cidade_codCidade) VALUES (1, 'Trindade', 1);
INSERT INTO TipoLogradouro VALUES (1, 'Rua');
INSERT INTO Logradouro (codLogradouro, CEP, Nome, fk_TipoLogradouro_codTipoLogradouro, fk_Bairro_codBairro)
    VALUES (1, 88040900, 'Rua da UFSC', 1, 1);

INSERT INTO Instituicao VALUES (1, 'Universidade Federal de Santa Catarina', 'UFSC', 1);
INSERT INTO Departamento VALUES (1, 'Departamento de Informática e Estatística (UFSC-CTC-INE)', 1);

INSERT INTO Bolsa VALUES (1, 'Bolsista de Produtividade em Pesquisa do CNPq - Nível 2');
INSERT INTO CVLattes (LattesID, OrchidID, telefone, homepage, sala, OutrasInfo, fk_Departamento_codDepto, fk_Pessoa_codPessoa, fk_Bolsa_codBolsa, descricao)
    VALUES ('9045199822095908', '0000-0002-0159-4643', 37214728, 'www.inf.ufsc.br/~vania', 404, 'H-Index (...)', 1, 1, 1,

'É professora Associada do Departamento de Informática e Estatística da Universidade Federal de Santa
Catarina desde Julho de 2009, sendo atualmente coordenadora do Programa de Pós-Graduação em Computação
da UFSC --- Possui Doutorado (2006) e Mestrado(2001) em Ciência da Computação pela Universidade Federal do
Rio Grande do Sul. Em 2007 recebeu da Sociedade Brasileira de Computação o prêmio de melhor tese de
Doutorado em Computação daquele ano. ----É bolsista de produtividade em Pesquisa do CNPq desde 2008.
Realizou três estágios de Pós-Doutorado (em 2014 no INRIA Sophia Antipolis, França; em 2008 no II/UFRGS, e
em 2007 na Universidade de Hasselt, Bélgica). Foi pesquisador visitante financiado pela União Européia no
CNR/Itália (2013, 2017 e 2019 ), Universidade Ca´Foscari de Veneza/Itália (2013), na Universidade de
Piraeus/Grécia (2015) e na Dalhousie University/Canadá (2019-financiamento CAPES/PRINT). --- Em 2012 editou
um livro sobre seu tema de pesquisa (Trajetórias de Objetos Móveis) e em 2010 ministrou tutorial no tema de
sua pesquisa no segundo maior congresso internacional na área de mineração de dados (IEEE ICDM). --- Foi
membro titular do colegiado delegado do PPGCC da UFSC e membro da comissão de seleção por mais de 8
anos.--- Atua como consultor ad-hoc para órgãos de fomento nacionais (CNPQ, CAPES, Fundação de Amparo à
Pesquisa do Espírito Santo, FAPEMIG, FAPESP) e internacionais como Czech Science Foundation, CONICYT do
Chile e Ministério de Ciência e Tecnologia de Israel. --- Tem projetos de cooperação internacional como MODAP,
SEEK [FP7] e MASTER [H2020], financiados pela União Européia (sendo coordenadora pela UFSC) ,
estabelecendo parcerias de pesquisa com o CNR de Pisa/Itália, Universidade CaFoscari de Veneza/Itália,
Universidade de Piraeus/Grécia, Universidade de Versailes/França, Universidade de Dalhousie/Canadá e
Universidade de Harokopio/Grécia, promovendo intercâmbio de pesquisa para professores e alunos de Mestrado
e Doutorado da UFSC.--- Sua produção científica tem a co-autoria de mais de 40 co-autores estrangeiros e mais
de 50% dos mestres e 100% dos doutores formados publicaram artigos em períodicos do IR e escreveram suas
dissertações/teses em língua inglesa. Revisa artigos para 23 periódicos internacionais, tem mais de 20 artigos
publicados em periódicos do IR e mais de 40 artigos completos publicados em eventos, tendo sua produção
científica mais de 3000 citações no Google Scholar e um h-index de 22. Atualmente coordena 5 projetos de
pesquisa com financiamento superior a R$ 1.200.000,00. (Texto informado pelo autor)');

-- ToDo: Premio

INSERT INTO Lingua VALUES (1, 'Ingles'), (2, 'Alemao'), (3, 'Espanhol');
INSERT INTO NivelLingua VALUES (1, 'Bem'), (2, 'Razoavelmente'), (3, 'Pouco');
INSERT INTO Compreende_CVLattes_Lingua_NivelLingua (fk_CVLattes_LattesID, fk_Lingua_codLingua, fk_NivelLingua_codNivelLingua)
    VALUES ('9045199822095908', 1, 1), ('9045199822095908', 2, 1), ('9045199822095908', 3, 2);
INSERT INTO Fala_CVLattes_Lingua_NivelLingua VALUES ('9045199822095908', 1, 1), ('9045199822095908', 2, 1), ('9045199822095908', 3, 3);
INSERT INTO Escreve_CVLattes_Lingua_NivelLingua VALUES ('9045199822095908', 1, 1);
INSERT INTO Le_CVLattes_Lingua_NivelLingua VALUES ('9045199822095908', 1, 1), ('9045199822095908', 3, 2);
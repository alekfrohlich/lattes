-- Pessoas e suas informacoes, instituicoes e enderecos.
SELECT p.nome, cv.homepage, cv.sala, d.nome AS depto, i.nomeInstituicao AS instituicao,
    c.nomeCidade AS cidade, e.nomeEstado AS estado, pais.nomePais AS pais
    FROM Pessoa p, CVLattes cv, Departamento d, Instituicao i, Logradouro l, Bairro b, Cidade c, Estado e, Pais pais
    WHERE p.lattesid = cv.lattesid
      AND d.codDepto = cv.fk_Departamento_codDepto
      AND d.fk_Instituicao_codInstituicao = i.codInstituicao
      AND i.fk_Logradouro_codLogradouro = l.codLogradouro
      AND l.fk_Bairro_codBairro = b.codBairro
      AND b.fk_Cidade_codCidade = c.codCidade
      AND c.fk_Estado_codEstado = e.codEstado
      AND e.fk_Pais_codPais = pais.codPais;

-- Compreende/Fala/Le/Escreve
SELECT p.nome, l.nome AS lingua, n.nome AS compreende
  FROM Pessoa p, CVLattes cv, Lingua l, NivelLingua n,
    Compreende_CVLattes_Lingua_NivelLingua comp
  WHERE p.lattesid = cv.lattesid
    AND cv.lattesid = comp.fk_CVLattes_LattesID
    AND l.codLingua = comp.fk_Lingua_codLingua
    AND n.codNivelLingua = comp.fk_NivelLingua_codNivelLingua;

-- Livros e suas informacoes, editora e autores.
SELECT l.Titulo, l.Ano, l.Volume, l.Edicao, l.qtdPaginas, p.nome AS Autor
  FROM Livro l, AutorLivro al, Pessoa p
  WHERE l.codLivro = al.fk_Livro_codLivro
    AND p.codPessoa = al.fk_Pessoa_codPessoa
    ORDER BY l.Titulo;
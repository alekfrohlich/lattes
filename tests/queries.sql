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
SELECT p.nome, l.nome AS lingua, n.nome AS compreende, n2.nome AS fala, n3.nome AS le, n4.nome as escreve
  FROM Pessoa p, CVLattes cv, Lingua l, NivelLingua n, NivelLingua n2, NivelLingua n3, NivelLingua n4,
    Compreende_CVLattes_Lingua_NivelLingua comp,
    Fala_CVLattes_Lingua_NivelLingua fal,
    Le_CVLattes_Lingua_NivelLingua lee,
    Escreve_CVLattes_Lingua_NivelLingua esc
  WHERE p.lattesid = cv.lattesid
    AND cv.lattesid = comp.fk_CVLattes_LattesID
    AND cv.lattesid = fal.fk_CVLattes_LattesID
    AND cv.lattesid = lee.fk_CVLattes_LattesID
    AND cv.lattesid = esc.fk_CVLattes_LattesID
    AND l.codLingua = comp.fk_Lingua_codLingua
    AND l.codLingua = fal.fk_Lingua_codLingua
    AND l.codLingua = lee.fk_Lingua_codLingua
    AND l.codLingua = esc.fk_Lingua_codLingua
    AND n.codNivelLingua = comp.fk_NivelLingua_codNivelLingua
    AND n2.codNivelLingua = fal.fk_NivelLingua_codNivelLingua
    AND n3.codNivelLingua = lee.fk_NivelLingua_codNivelLingua
    AND n4.codNivelLingua = esc.fk_NivelLingua_codNivelLingua
    ORDER BY l.nome;

-- Livros e suas informacoes, editora e autores.
SELECT l.Titulo, l.Ano, l.Volume, l.Edicao, l.qtdPaginas, p.nome AS Autor
  FROM Livro l, AutorLivro al, Pessoa p
  WHERE l.codLivro = al.fk_Livro_codLivro
    AND p.codPessoa = al.fk_Pessoa_codPessoa
    ORDER BY l.Titulo;

-- Conceito dos Cursos
SELECT DISTINCT p.nome, i.nomeInstituicao AS instituicao, c.Nome AS Curso, Conceito.nomeConceito AS conceito,
form.anoFim AS ano_formatura, tit.nomeTitulacao AS titulacao
	FROM pessoa p, CVLattes cv, Instituicao i, Curso c, Conceito, ConceitoDoCurso_Curso_Conceito_Instituicao cci,
FormacaoAcademica form, Titulacao tit
  WHERE p.lattesid = cv.lattesid
  AND cv.lattesid = form.fk_CVLattes_LattesID
  AND i.codInstituicao = form.fk_Instituicao_codInstituicao
  AND c.codCurso = form.fk_Curso_codCurso
  AND c.codCurso = cci.fk_Curso_codCurso
  AND Conceito.codConceito = cci.fk_Conceito_codConceito
  AND i.codInstituicao = cci.fk_Instituicao_codInstituicao
  AND tit.codTItulacao = form.fk_Titulacao_codTitulacao

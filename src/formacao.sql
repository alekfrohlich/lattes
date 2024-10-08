/* Lógico_1: */

CREATE TABLE Conceito (
    codConceito integer PRIMARY KEY,
    nomeConceito varchar(20)
);

CREATE TABLE Titulacao (
    nomeTitulacao varchar(20),
    codTitulacao integer PRIMARY KEY
);

CREATE TABLE FormacaoAcademica (
    anoInicio integer,
    codFormacao integer PRIMARY KEY,
    anoFim integer,
    TituloTrabalhoDeConclusao varchar(40),
    fk_Instituicao_codInstituicao integer,
    fk_CVLattes_LattesID integer,
    fk_Titulacao_codTitulacao integer,
    fk_Pessoa_codPessoa integer,
    fk_Instituicao_codInstituicao_ integer,
    fk_Curso_codCurso integer
);

CREATE TABLE FormacaoComplementar (
    cargaHoraria integer,
    anoFim integer,
    Titulo varchar(40),
    anoIn integer,
    codFormComp integer PRIMARY KEY,
    fk_CVLattes_LattesID integer,
    fk_Instituicao_codInstituicao integer
);

CREATE TABLE Instituicao (
    codInstituicao integer PRIMARY KEY
);

CREATE TABLE Pessoa (
    codPessoa integer PRIMARY KEY
);

CREATE TABLE CVLattes (
    LattesID integer PRIMARY KEY
);

CREATE TABLE Curso (
    codCurso integer PRIMARY KEY,
    Nome varchar(40)
);

CREATE TABLE PalavraChave (
    codPalavraChave integer PRIMARY KEY,
    Nome varchar(20)
);

CREATE TABLE AtuacaoProfissional (
    codAtuacao integer PRIMARY KEY,
    anoInicio integer,
    anoFim integer,
    cargaHoraria integer,
    outrasInfo varchar(100),
    fk_CVLattes_LattesID integer,
    fk_Instituicao_codInstituicao integer,
    fk_Enquadramento_codEnquadramento integer,
    fk_Vinculo_codVinculo integer,
    fk_Regime_codRegime integer
);

CREATE TABLE Vinculo (
    codVinculo integer PRIMARY KEY,
    Nome varchar(40)
);

CREATE TABLE Enquadramento (
    codEnquadramento integer PRIMARY KEY,
    Nome varchar(40)
);

CREATE TABLE Regime (
    codRegime integer PRIMARY KEY,
    Nome varchar(40)
);

CREATE TABLE NivelDisciplina (
    codNivelDisciplina integer PRIMARY KEY,
    Nome varchar(100)
);

CREATE TABLE Disciplina (
    codDisciplina integer PRIMARY KEY,
    Nome varchar(100),
    fk_NivelDisciplina_codNivelDisciplina integer,
    fk_Curso_codCurso integer
);

CREATE TABLE ServicoRealizado (
    codServicoRealizado integer PRIMARY KEY,
    Titulo varchar(100)
);

CREATE TABLE Ensino (
    codAtividade integer PRIMARY KEY,
    dataInicio date,
    dataFim date,
    descricao varchar(100),
    fk_AtuacaoProfissional_codAtuacao integer
);

CREATE TABLE ServicoTecnico (
    codAtividade integer PRIMARY KEY,
    dataInicio date,
    dataFim date,
    descricao varchar(100),
    fk_AtuacaoProfissional_codAtuacao integer
);

CREATE TABLE LinhaDePesquisa (
    codLinha integer PRIMARY KEY,
    Nome varchar(100)
);

CREATE TABLE P_D (
    codAtividade integer PRIMARY KEY,
    dataInicio date,
    dataFim date,
    descricao varchar(100),
    FK_AtuacaoProfissional_codAtuacao integer
);

CREATE TABLE ConselhoComissaoConsultoria (
    codAtividade integer PRIMARY KEY,
    dataInicio date,
    dataFim date,
    descricao varchar(100),
    fk_Cargo_codCargo integer,
    fk_AtuacaoProfissional_codAtuacao integer
);

CREATE TABLE Cargo (
    Nome varchar(100),
    codCargo integer PRIMARY KEY
);

CREATE TABLE DirecaoAdm (
    codAtividade integer PRIMARY KEY,
    dataInicio date,
    dataFim date,
    descricao varchar(100),
    fk_Cargo_codCargo integer,
    fk_AtuacaoProfissional_codAtuacao integer
);

CREATE TABLE Especialidade (
    codEspecialidade integer PRIMARY KEY,
    Nome varchar(20),
    fk_SubArea_codSubArea integer
);

CREATE TABLE SubArea (
    codSubArea integer PRIMARY KEY,
    Nome varchar(40),
    fk_Area_codArea integer
);

CREATE TABLE Area (
    codArea integer PRIMARY KEY,
    Nome varchar(40),
    fk_GrandeArea_codGrandeArea integer
);

CREATE TABLE GrandeArea (
    codGrandeArea integer PRIMARY KEY,
    Nome varchar(40)
);

CREATE TABLE ConceitoDoCurso_Curso_Conceito_Instituicao (
    fk_Curso_codCurso integer,
    fk_Conceito_codConceito integer,
    fk_Instituicao_codInstituicao integer
);

CREATE TABLE PeriodoSanduiche_FormacaoAcademica_Pessoa_Instituicao (
    fk_FormacaoAcademica_codFormacao integer,
    fk_Pessoa_codPessoa integer,
    fk_Instituicao_codInstituicao integer
);

CREATE TABLE CursosDaInstituicao (
    fk_Instituicao_codInstituicao integer,
    fk_Curso_codCurso integer
);

CREATE TABLE PalavrasChaveDaFormacao (
    fk_PalavraChave_codPalavraChave integer,
    fk_FormacaoAcademica_codFormacao integer
);

CREATE TABLE DisciplinasMinistradas (
    fk_Disciplina_codDisciplina integer,
    fk_Ensino_codAtividade integer
);

CREATE TABLE ServicosRealizados (
    fk_ServicoRealizado_codServicoRealizado integer,
    fk_ServicoTecnico_codAtividade integer
);

CREATE TABLE LinhasDePesquisa (
    fk_LinhaDePesquisa_codLinha integer,
    fk_P_D_codAtividade integer
);

CREATE TABLE EspecialidadeDaFormacao (
    fk_FormacaoAcademica_codFormacao integer,
    fk_Especialidade_codEspecialidade integer
);

CREATE TABLE SubAreaDaFormacao (
    fk_FormacaoAcademica_codFormacao integer,
    fk_SubArea_codSubArea integer
);

CREATE TABLE AreaDaFormacao (
    fk_FormacaoAcademica_codFormacao integer,
    fk_Area_codArea integer
);

CREATE TABLE GrandeAreaDaFormacao (
    fk_GrandeArea_codGrandeArea integer,
    fk_FormacaoAcademica_codFormacao integer
);

ALTER TABLE FormacaoAcademica ADD CONSTRAINT FK_FormacaoAcademica_2
    FOREIGN KEY (fk_Instituicao_codInstituicao, fk_Instituicao_codInstituicao_)
    REFERENCES Instituicao (codInstituicao, codInstituicao)
    ON DELETE SET NULL;

ALTER TABLE FormacaoAcademica ADD CONSTRAINT FK_FormacaoAcademica_3
    FOREIGN KEY (fk_CVLattes_LattesID)
    REFERENCES CVLattes (LattesID)
    ON DELETE CASCADE;

ALTER TABLE FormacaoAcademica ADD CONSTRAINT FK_FormacaoAcademica_4
    FOREIGN KEY (fk_Titulacao_codTitulacao)
    REFERENCES Titulacao (codTitulacao)
    ON DELETE CASCADE;

ALTER TABLE FormacaoAcademica ADD CONSTRAINT FK_FormacaoAcademica_5
    FOREIGN KEY (fk_Pessoa_codPessoa)
    REFERENCES Pessoa (codPessoa)
    ON DELETE CASCADE;

ALTER TABLE FormacaoAcademica ADD CONSTRAINT FK_FormacaoAcademica_6
    FOREIGN KEY (fk_Curso_codCurso)
    REFERENCES Curso (codCurso)
    ON DELETE CASCADE;

ALTER TABLE FormacaoComplementar ADD CONSTRAINT FK_FormacaoComplementar_2
    FOREIGN KEY (fk_CVLattes_LattesID)
    REFERENCES CVLattes (LattesID)
    ON DELETE CASCADE;

ALTER TABLE FormacaoComplementar ADD CONSTRAINT FK_FormacaoComplementar_3
    FOREIGN KEY (fk_Instituicao_codInstituicao)
    REFERENCES Instituicao (codInstituicao)
    ON DELETE CASCADE;

ALTER TABLE AtuacaoProfissional ADD CONSTRAINT FK_AtuacaoProfissional_2
    FOREIGN KEY (fk_CVLattes_LattesID)
    REFERENCES CVLattes (LattesID)
    ON DELETE CASCADE;

ALTER TABLE AtuacaoProfissional ADD CONSTRAINT FK_AtuacaoProfissional_3
    FOREIGN KEY (fk_Instituicao_codInstituicao)
    REFERENCES Instituicao (codInstituicao)
    ON DELETE CASCADE;

ALTER TABLE AtuacaoProfissional ADD CONSTRAINT FK_AtuacaoProfissional_4
    FOREIGN KEY (fk_Enquadramento_codEnquadramento)
    REFERENCES Enquadramento (codEnquadramento)
    ON DELETE CASCADE;

ALTER TABLE AtuacaoProfissional ADD CONSTRAINT FK_AtuacaoProfissional_5
    FOREIGN KEY (fk_Vinculo_codVinculo)
    REFERENCES Vinculo (codVinculo)
    ON DELETE CASCADE;

ALTER TABLE AtuacaoProfissional ADD CONSTRAINT FK_AtuacaoProfissional_6
    FOREIGN KEY (fk_Regime_codRegime)
    REFERENCES Regime (codRegime)
    ON DELETE CASCADE;

ALTER TABLE Disciplina ADD CONSTRAINT FK_Disciplina_2
    FOREIGN KEY (fk_NivelDisciplina_codNivelDisciplina)
    REFERENCES NivelDisciplina (codNivelDisciplina)
    ON DELETE CASCADE;

ALTER TABLE Disciplina ADD CONSTRAINT FK_Disciplina_3
    FOREIGN KEY (fk_Curso_codCurso)
    REFERENCES Curso (codCurso)
    ON DELETE CASCADE;

ALTER TABLE Ensino ADD CONSTRAINT FK_Ensino_2
    FOREIGN KEY (fk_AtuacaoProfissional_codAtuacao)
    REFERENCES AtuacaoProfissional (codAtuacao)
    ON DELETE CASCADE;

ALTER TABLE ServicoTecnico ADD CONSTRAINT FK_ServicoTecnico_2
    FOREIGN KEY (fk_AtuacaoProfissional_codAtuacao)
    REFERENCES AtuacaoProfissional (codAtuacao)
    ON DELETE CASCADE;

ALTER TABLE P_D ADD CONSTRAINT FK_P_D_2
    FOREIGN KEY (FK_AtuacaoProfissional_codAtuacao)
    REFERENCES AtuacaoProfissional (codAtuacao)
    ON DELETE CASCADE;

ALTER TABLE ConselhoComissaoConsultoria ADD CONSTRAINT FK_ConselhoComissaoConsultoria_2
    FOREIGN KEY (fk_Cargo_codCargo)
    REFERENCES Cargo (codCargo)
    ON DELETE CASCADE;

ALTER TABLE ConselhoComissaoConsultoria ADD CONSTRAINT FK_ConselhoComissaoConsultoria_3
    FOREIGN KEY (fk_AtuacaoProfissional_codAtuacao)
    REFERENCES AtuacaoProfissional (codAtuacao)
    ON DELETE CASCADE;

ALTER TABLE DirecaoAdm ADD CONSTRAINT FK_DirecaoAdm_2
    FOREIGN KEY (fk_Cargo_codCargo)
    REFERENCES Cargo (codCargo)
    ON DELETE CASCADE;

ALTER TABLE DirecaoAdm ADD CONSTRAINT FK_DirecaoAdm_3
    FOREIGN KEY (fk_AtuacaoProfissional_codAtuacao)
    REFERENCES AtuacaoProfissional (codAtuacao)
    ON DELETE CASCADE;

ALTER TABLE Especialidade ADD CONSTRAINT FK_Especialidade_2
    FOREIGN KEY (fk_SubArea_codSubArea)
    REFERENCES SubArea (codSubArea)
    ON DELETE CASCADE;

ALTER TABLE SubArea ADD CONSTRAINT FK_SubArea_2
    FOREIGN KEY (fk_Area_codArea)
    REFERENCES Area (codArea)
    ON DELETE CASCADE;

ALTER TABLE Area ADD CONSTRAINT FK_Area_2
    FOREIGN KEY (fk_GrandeArea_codGrandeArea)
    REFERENCES GrandeArea (codGrandeArea)
    ON DELETE CASCADE;

ALTER TABLE ConceitoDoCurso_Curso_Conceito_Instituicao ADD CONSTRAINT FK_ConceitoDoCurso_Curso_Conceito_Instituicao_1
    FOREIGN KEY (fk_Curso_codCurso)
    REFERENCES Curso (codCurso)
    ON DELETE NO ACTION;

ALTER TABLE ConceitoDoCurso_Curso_Conceito_Instituicao ADD CONSTRAINT FK_ConceitoDoCurso_Curso_Conceito_Instituicao_2
    FOREIGN KEY (fk_Conceito_codConceito)
    REFERENCES Conceito (codConceito)
    ON DELETE SET NULL;

ALTER TABLE ConceitoDoCurso_Curso_Conceito_Instituicao ADD CONSTRAINT FK_ConceitoDoCurso_Curso_Conceito_Instituicao_3
    FOREIGN KEY (fk_Instituicao_codInstituicao)
    REFERENCES Instituicao (codInstituicao)
    ON DELETE NO ACTION;

ALTER TABLE PeriodoSanduiche_FormacaoAcademica_Pessoa_Instituicao ADD CONSTRAINT FK_PeriodoSanduiche_FormacaoAcademica_Pessoa_Instituicao_1
    FOREIGN KEY (fk_FormacaoAcademica_codFormacao)
    REFERENCES FormacaoAcademica (codFormacao)
    ON DELETE NO ACTION;

ALTER TABLE PeriodoSanduiche_FormacaoAcademica_Pessoa_Instituicao ADD CONSTRAINT FK_PeriodoSanduiche_FormacaoAcademica_Pessoa_Instituicao_2
    FOREIGN KEY (fk_Pessoa_codPessoa)
    REFERENCES Pessoa (codPessoa)
    ON DELETE RESTRICT;

ALTER TABLE PeriodoSanduiche_FormacaoAcademica_Pessoa_Instituicao ADD CONSTRAINT FK_PeriodoSanduiche_FormacaoAcademica_Pessoa_Instituicao_3
    FOREIGN KEY (fk_Instituicao_codInstituicao)
    REFERENCES Instituicao (codInstituicao)
    ON DELETE RESTRICT;

ALTER TABLE CursosDaInstituicao ADD CONSTRAINT FK_CursosDaInstituicao_1
    FOREIGN KEY (fk_Instituicao_codInstituicao)
    REFERENCES Instituicao (codInstituicao)
    ON DELETE SET NULL;

ALTER TABLE CursosDaInstituicao ADD CONSTRAINT FK_CursosDaInstituicao_2
    FOREIGN KEY (fk_Curso_codCurso)
    REFERENCES Curso (codCurso)
    ON DELETE SET NULL;

ALTER TABLE PalavrasChaveDaFormacao ADD CONSTRAINT FK_PalavrasChaveDaFormacao_1
    FOREIGN KEY (fk_PalavraChave_codPalavraChave)
    REFERENCES PalavraChave (codPalavraChave)
    ON DELETE RESTRICT;

ALTER TABLE PalavrasChaveDaFormacao ADD CONSTRAINT FK_PalavrasChaveDaFormacao_2
    FOREIGN KEY (fk_FormacaoAcademica_codFormacao)
    REFERENCES FormacaoAcademica (codFormacao)
    ON DELETE SET NULL;

ALTER TABLE DisciplinasMinistradas ADD CONSTRAINT FK_DisciplinasMinistradas_1
    FOREIGN KEY (fk_Disciplina_codDisciplina)
    REFERENCES Disciplina (codDisciplina)
    ON DELETE RESTRICT;

ALTER TABLE DisciplinasMinistradas ADD CONSTRAINT FK_DisciplinasMinistradas_2
    FOREIGN KEY (fk_Ensino_codAtividade)
    REFERENCES Ensino (codAtividade)
    ON DELETE SET NULL;

ALTER TABLE ServicosRealizados ADD CONSTRAINT FK_ServicosRealizados_1
    FOREIGN KEY (fk_ServicoRealizado_codServicoRealizado)
    REFERENCES ServicoRealizado (codServicoRealizado)
    ON DELETE RESTRICT;

ALTER TABLE ServicosRealizados ADD CONSTRAINT FK_ServicosRealizados_2
    FOREIGN KEY (fk_ServicoTecnico_codAtividade)
    REFERENCES ServicoTecnico (codAtividade)
    ON DELETE SET NULL;

ALTER TABLE LinhasDePesquisa ADD CONSTRAINT FK_LinhasDePesquisa_1
    FOREIGN KEY (fk_LinhaDePesquisa_codLinha)
    REFERENCES LinhaDePesquisa (codLinha)
    ON DELETE SET NULL;

ALTER TABLE LinhasDePesquisa ADD CONSTRAINT FK_LinhasDePesquisa_2
    FOREIGN KEY (fk_P_D_codAtividade)
    REFERENCES P_D (codAtividade)
    ON DELETE SET NULL;

ALTER TABLE EspecialidadeDaFormacao ADD CONSTRAINT FK_EspecialidadeDaFormacao_1
    FOREIGN KEY (fk_FormacaoAcademica_codFormacao)
    REFERENCES FormacaoAcademica (codFormacao)
    ON DELETE SET NULL;

ALTER TABLE EspecialidadeDaFormacao ADD CONSTRAINT FK_EspecialidadeDaFormacao_2
    FOREIGN KEY (fk_Especialidade_codEspecialidade)
    REFERENCES Especialidade (codEspecialidade)
    ON DELETE SET NULL;

ALTER TABLE SubAreaDaFormacao ADD CONSTRAINT FK_SubAreaDaFormacao_1
    FOREIGN KEY (fk_FormacaoAcademica_codFormacao)
    REFERENCES FormacaoAcademica (codFormacao)
    ON DELETE SET NULL;

ALTER TABLE SubAreaDaFormacao ADD CONSTRAINT FK_SubAreaDaFormacao_2
    FOREIGN KEY (fk_SubArea_codSubArea)
    REFERENCES SubArea (codSubArea)
    ON DELETE SET NULL;

ALTER TABLE AreaDaFormacao ADD CONSTRAINT FK_AreaDaFormacao_1
    FOREIGN KEY (fk_FormacaoAcademica_codFormacao)
    REFERENCES FormacaoAcademica (codFormacao)
    ON DELETE SET NULL;

ALTER TABLE AreaDaFormacao ADD CONSTRAINT FK_AreaDaFormacao_2
    FOREIGN KEY (fk_Area_codArea)
    REFERENCES Area (codArea)
    ON DELETE SET NULL;

ALTER TABLE GrandeAreaDaFormacao ADD CONSTRAINT FK_GrandeAreaDaFormacao_1
    FOREIGN KEY (fk_GrandeArea_codGrandeArea)
    REFERENCES GrandeArea (codGrandeArea)
    ON DELETE SET NULL;

ALTER TABLE GrandeAreaDaFormacao ADD CONSTRAINT FK_GrandeAreaDaFormacao_2
    FOREIGN KEY (fk_FormacaoAcademica_codFormacao)
    REFERENCES FormacaoAcademica (codFormacao)
    ON DELETE SET NULL;
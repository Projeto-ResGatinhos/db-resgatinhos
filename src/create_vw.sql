-- VIEW DA ONG
CREATE VIEW VW_ONG AS
  SELECT
    TB_ONG.ID_ONG,
    TB_ONG.NOME            AS NOME_ONG,
    TB_ONG.CNPJ,
    TB_END_ONG.CEP,
    TB_END_ONG.RUA,
    TB_END_ONG.NUMERO,
    TB_END_ONG.COMPLEMENTO,
    TB_END_ONG.BAIRRO,
    TB_END_ONG.CIDADE,
    TB_END_ONG.UF,
    TB_TEL_ONG.DDD,
    TB_TEL_ONG.NUMERO      AS TELEFONE
  FROM
    TB_ONG
    JOIN TB_END_ONG
    ON TB_ONG.ID_END_ONG = TB_END_ONG.ID_END_ONG
    JOIN TB_TEL_ONG
    ON TB_ONG.ID_TEL_ONG = TB_TEL_ONG.ID_TEL_ONG;

-- VIEW DE COLABORADOR
CREATE VIEW VW_COLABORADOR AS
  SELECT
    TB_COLABORADOR.ID_COLABORADOR,
    TB_COLABORADOR.NOME,
    TB_COLABORADOR.CARGO,
    TB_COLABORADOR.DT_NASCIMENTO,
    TB_COLABORADOR.TIPO_DOCUMENTO,
    TB_COLABORADOR.DOCUMENTO,
    TB_END_COLABORADOR.CEP,
    TB_END_COLABORADOR.RUA,
    TB_END_COLABORADOR.NUMERO,
    TB_END_COLABORADOR.COMPLEMENTO,
    TB_END_COLABORADOR.BAIRRO,
    TB_END_COLABORADOR.CIDADE,
    TB_END_COLABORADOR.UF,
    TB_TEL_COLABORADOR.DDD,
    TB_TEL_COLABORADOR.NUMERO      AS TELEFONE
  FROM
    TB_COLABORADOR
    JOIN TB_END_COLABORADOR
    ON TB_COLABORADOR.ID_END_COLABORADOR = TB_END_COLABORADOR.ID_END_COLABORADOR
    JOIN TB_TEL_COLABORADOR
    ON TB_COLABORADOR.ID_TEL_COLABORADOR = TB_TEL_COLABORADOR.ID_TEL_COLABORADOR;
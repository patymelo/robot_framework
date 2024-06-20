
SELECT
cod_conta,
regexp_replace(LPAD(doc_comitente, 11),'([0-9]{3})([0-9]{3})([0-9]{3})','\1.\2.\3-') as doc_comitente,
CASE tipo_pessoa WHEN 15 THEN 'PF'
ELSE 'PJ' END tipo_pessoa,
nome_comitente,
email_comitente,
CASE cod_situacao_comitente WHEN 1 THEN 'ATIVO'
	WHEN 2 THEN 'INATIVO'
	WHEN 3 THEN 'PENDENTE ATUALIZACAO'
	ELSE 'BLOQUEADO'
	END cod_situacao_investidor,
regexp_replace(LPAD(doc_participante, 14),'([0-9]{2})([0-9]{3})([0-9]{3})([0-9]{4})','\1.\2.\3/\4-') as doc_participante,
DATA_INCLUSAO_REGISTRO , NUM_STATUS_RETORNO ,DATA_PROCESSAMENTO
FROM CETIP.TCTPEVENTO_CAD_COMITENTE  e,
JSON_TABLE (e.TXT_PARAMETRO,'$' COLUMNS (
	doc_comitente INTEGER PATH '$.investidorConta.numDocumentoInvestidor',
	cod_conta VARCHAR2(10) PATH '$.investidorConta.numIdentificacaoConta',
	tipo_pessoa INTEGER PATH '$.investidorConta.tipoPessoa',
	cod_situacao_comitente INTEGER PATH '$.investidorConta.codSituacaoInvestidor',
	doc_participante INTEGER PATH '$.investidorConta.numDocumentoParticipante',
	email_comitente VARCHAR2(150) PATH '$.investidorConta.nomeEmailInvestidor',
	nome_comitente VARCHAR2(150) PATH '$.investidorConta.nomeInvestidor'
	) 
)jsonComitente
WHERE COD_CONTA ='73410.00-5' AND doc_comitente='65017932461'
AND cod_situacao_comitente = 1
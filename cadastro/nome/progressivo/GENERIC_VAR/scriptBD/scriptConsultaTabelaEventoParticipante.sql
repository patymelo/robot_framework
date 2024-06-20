
SELECT
	*
FROM
	(
	SELECT
		NUM_ID_EVENTO_CADASTRO_B3I,
		DAT_INCLUSAO,
		NUM_ID_SERVICO,
		EXTRACTVALUE(xmltype(DES_PATRAMETROS), '/br.com.cetip.aplicacao.servicosinfra.apinegocio.ParametrosServico/parametros/br.com.cetip.aplicacao.servicosinfra.apinegocio.Parametro[1]/valor') RazaoSocial,
		EXTRACTVALUE(xmltype(DES_PATRAMETROS), '/br.com.cetip.aplicacao.servicosinfra.apinegocio.ParametrosServico/parametros/br.com.cetip.aplicacao.servicosinfra.apinegocio.Parametro[2]/valor') CNPJ,
		EXTRACTVALUE(xmltype(DES_PATRAMETROS), '/br.com.cetip.aplicacao.servicosinfra.apinegocio.ParametrosServico/parametros/br.com.cetip.aplicacao.servicosinfra.apinegocio.Parametro[3]/valor') Conta,
		EXTRACTVALUE(xmltype(DES_PATRAMETROS), '/br.com.cetip.aplicacao.servicosinfra.apinegocio.ParametrosServico/parametros/br.com.cetip.aplicacao.servicosinfra.apinegocio.Parametro[4]/valor') SituacaoConta,
		NUM_STATUS_ESPERADO,
		NUM_STATUS_RETORNO,
		DAT_PROCESSAMENTO
	FROM
		CETIP.TCTPEVENTO_CADASTRO_B3I) evento_participante
WHERE
	1 = 1
	AND NUM_ID_SERVICO = 276
	AND CONTA IN ('05778.00-7','05780.20-8','05772.10-6')
	AND CNPJ = '19608437000130'
	AND TO_CHAR(DAT_INCLUSAO, 'dd/mm/yyyy') = TO_CHAR(sysdate, 'dd/mm/yyyy')
	
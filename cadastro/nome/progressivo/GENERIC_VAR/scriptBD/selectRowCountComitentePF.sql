SELECT
	c.NUM_ID_ENTIDADE
FROM
	cetip.comitente c,
	cetip.RELACAO rel,
	cetip.ENTIDADE ent,
	cetip.ENTIDADE entC,
	cetip.PESSOA_FISICA pf
WHERE
	rel.num_id_tipo_relacao = 56
	AND c.NUM_ID_TIPO_INVEST_ESTRANGEIRO = 1
	AND c.num_id_entidade = rel.num_id_entidade_para
	AND pf.num_id_entidade(+) = rel.num_id_entidade
	AND ent.num_id_entidade = rel.num_id_entidade
	AND c.IND_COMITENTE_SIMPLIFICADO = 'N'
	AND entC.NUM_ID_ENTIDADE = c.NUM_ID_ENTIDADE
	AND pf.COD_CPF = '290.816.435-33'
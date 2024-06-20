select
DES_ERRO,
NUM_LINHA_ERRO,
TXT_LINHA_ORIGINAL,
NUM_ID_TRANSF_ARQ,
IND_ERRO
from CETIP.ERRO_TRANSF_ARQUIVO eta
WHERE 1=1
AND eta.num_id_transf_arq IN (
    SELECT ta.num_id_transf_arq
    FROM cetip.transferencia_arquivo ta
   WHERE 1 = 1
     AND ta.num_solicitacao = 2094332 -- ID SOLICITAÇÃO
)
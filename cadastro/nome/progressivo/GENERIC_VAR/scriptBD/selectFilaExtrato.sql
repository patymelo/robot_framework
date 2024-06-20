-- FILA EXTRATO
    SELECT * FROM CETIP.EXTR_FILA_ATUALIZACAO efa 
    WHERE 1=1
    --AND efa.nom_url LIKE '%azr-app-pos-b3i%'
    AND efa.nom_url LIKE '%investidor-conta%'
    AND TO_CHAR(DAT_SOLICITACAO,'dd/mm/yyyy') = TO_CHAR(sysdate,'dd/mm/yyyy')
    ORDER BY efa.DAT_SOLICITACAO DESC;
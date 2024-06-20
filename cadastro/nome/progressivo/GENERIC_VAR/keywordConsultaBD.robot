
*** Settings ***
Resource            KeywordsBD.robot

*** Variable ***
${CONSULTA_FILA_EXTRATO_COMITENTE}   SELECT * FROM CETIP.EXTR_FILA_ATUALIZACAO efa WHERE 1=1 AND efa.nom_url LIKE '%investidor-conta%' AND TO_CHAR(DAT_SOLICITACAO,'dd/mm/yyyy') = TO_CHAR(sysdate,'dd/mm/yyyy') ORDER BY efa.DAT_SOLICITACAO DESC
@{header}   COD_CONTA  DOC_COMITENTE  TIPO_PESSOA  NOME_COMITENTE  EMAIL_COMITENTE  COD_SITUACAO_COMITENTE  CNPJ_PARTICIPANTE  DATA_INCLUSAO_REGISTRO
*** Keywords ***
Executado a consulta ao banco ${AMBIENTE} ${COUNT_RESULT} buscando os eventos mandados ao B3i exportar csv ${nameCsv}
    Connect To DB ${AMBIENTE}
    row count is equal to x    SELECT * FROM CETIP.TCTPEVENTO_CAD_COMITENTE e, JSON_TABLE (e.TXT_PARAMETRO,'$' COLUMNS ( doc_comitente INTEGER PATH '$.investidorConta.numDocumentoInvestidor', cod_conta VARCHAR2(10) PATH '$.investidorConta.numIdentificacaoConta', tipo_pessoa INTEGER PATH '$.investidorConta.tipoPessoa', cod_situacao_comitente INTEGER PATH '$.investidorConta.codSituacaoInvestidor', doc_participante INTEGER PATH '$.investidorConta.numDocumentoParticipante', email_comitente VARCHAR2(150) PATH '$.investidorConta.nomeEmailInvestidor', nome_comitente VARCHAR2(150) PATH '$.investidorConta.nomeInvestidor' ) )jsonComitente WHERE COD_CONTA ='${CONTA_COMITENTE}' AND doc_comitente='${DOC_COMITENTE}'  ${COUNT_RESULT}
    @{queryResults}   Query    SELECT cod_conta, regexp_replace(LPAD(doc_comitente, 11),'([0-9]{3})([0-9]{3})([0-9]{3})','\\1.\\2.\\3-') as doc_comitente, CASE tipo_pessoa WHEN 15 THEN 'PF' ELSE 'PJ' END tipo_pessoa, nome_comitente, email_comitente, CASE cod_situacao_comitente WHEN 1THEN 'ATIVO' WHEN 2 THEN 'INATIVO' WHEN 3 THEN 'PENDENTE ATUALIZACAO' ELSE 'BLOQUEADO' END cod_situacao_investidor, regexp_replace(LPAD(doc_participante, 14),'([0-9]{2})([0-9]{3})([0-9]{3})([0-9]{4})','\\1.\\2.\\3/\\4-') as doc_participante,DATA_INCLUSAO_REGISTRO FROM CETIP.TCTPEVENTO_CAD_COMITENTE e, JSON_TABLE (e.TXT_PARAMETRO,'$' COLUMNS ( doc_comitente INTEGER PATH '$.investidorConta.numDocumentoInvestidor', cod_conta VARCHAR2(10) PATH '$.investidorConta.numIdentificacaoConta', tipo_pessoa INTEGER PATH '$.investidorConta.tipoPessoa', cod_situacao_comitente INTEGER PATH '$.investidorConta.codSituacaoInvestidor', doc_participante INTEGER PATH '$.investidorConta.numDocumentoParticipante', email_comitente VARCHAR2(150) PATH '$.investidorConta.nomeEmailInvestidor', nome_comitente VARCHAR2(150) PATH '$.investidorConta.nomeInvestidor' ) )jsonComitente WHERE COD_CONTA ='${CONTA_COMITENTE}' AND doc_comitente='${DOC_COMITENTE}' ORDER BY DATA_INCLUSAO_REGISTRO
    Log Many    @{queryResults}
    ${file_exists}=  Run Keyword and Return Status    File Should Exist  ${path_csv}\\${nameCsv}.csv
    IF  ${file_exists}
        Log   File Exists
        Adicionar resultado ${queryResults} na planilha ${nameCsv}
    ELSE
        Salvar resultado ${queryResults} na planilha ${nameCsv}
    END
    Disconnect From DB
Executado a consulta ao banco ${AMBIENTE} verificando que nao retornou nenhum resultado na fila do extrato
#    Connect To DB ${AMBIENTE}
#    row count is equal to x    ${CONSULTA_FILA_EXTRATO_COMITENTE}   0
#    @{queryResults}   Query    ${CONSULTA_FILA_EXTRATO_COMITENTE}
#    Log Many    @{queryResults}
#    Disconnect From DB
    executo a consulta no ambiente ${AMBIENTE} validando que nao retornou nenhum resultado para a query ${CONSULTA_FILA_EXTRATO_COMITENTE}
Salvar resultado ${result} na planilha ${name}
    [Documentation]  Takes header (list of column headers) and data (List containing nested list of row values)
    ${arqcsv}=  Set Variable   ${path_csv}\\${name}.csv
    Create File  ${arqcsv}
    ${header_string}  Convert List To Comma Seperated String   ${header}

    # Create the header
    Append To File  ${arqcsv}  ${header_string}

    # Append all the values row by row
    ${NumRowns} =      Get Length    ${result}
    FOR  ${indexRown}  IN RANGE  0  ${NumRowns}
        ${NumColumns}=  Get Length  ${result[${indexRown}]}
        @{random_row_list}  Create List
        FOR  ${indexColumn}  IN RANGE  0  ${NumColumns}
            ${value}   Convert To String  ${result[${indexRown}][${indexColumn}]}
            Append To List  ${random_row_list}  ${value}
        END
        ${row_values}  Convert List To Comma Seperated String   ${random_row_list}
        Append To File  ${arqcsv}  \n${row_values}
    END
Adicionar resultado ${result} na planilha ${name}
    ${arqcsv}=  Set Variable   ${path_csv}\\${name}.csv

    # Append all the values row by row
    ${NumRowns} =      Get Length    ${result}
    FOR  ${indexRown}  IN RANGE  0  ${NumRowns}
        ${NumColumns}=  Get Length  ${result[${indexRown}]}
        @{random_row_list}  Create List
        FOR  ${indexColumn}  IN RANGE  0  ${NumColumns}
            ${value}   Convert To String  ${result[${indexRown}][${indexColumn}]}
            Append To List  ${random_row_list}  ${value}
        END
        ${row_values}  Convert List To Comma Seperated String   ${random_row_list}
        Append To File  ${arqcsv}  \n${row_values}
    END
Convert List To Comma Seperated String
    [Documentation]  Converts list values to string so they can be appended to csv file
    [Arguments]  ${values}
    ${converted_values}  Evaluate  "; ".join(${values})
    [Return]  ${converted_values}
que eu valide que esses miolos de conta ${miolo_contas} seja igual a lista ${miolos_habilitado_comparacao}
    ordenar e comparar duas listas      ${miolo_contas}     ${miolos_habilitado_comparacao}
que eu execute a query consultando a fila de eventos de participante e exporte o resultado para csv
#    Set Global Variable         ${CNPJ_PARTICIPANTE}        09.513.847/0001-44
    ${cnpj_buscar}=             Get CNPJ without points ${CNPJ_PARTICIPANTE}
    ${query}=                   Set Variable        SELECT NUM_ID_EVENTO_CADASTRO_B3I, DAT_INCLUSAO, NUM_ID_SERVICO, DBMS_LOB.SUBSTR(DES_PATRAMETROS, 4000, 1), NUM_STATUS_ESPERADO, NUM_STATUS_RETORNO, DAT_PROCESSAMENTO FROM CETIP.TCTPEVENTO_CADASTRO_B3I WHERE 1=1 AND NUM_ID_SERVICO = 276 AND DES_PATRAMETROS LIKE '%${cnpj_buscar}%' AND TO_CHAR(DAT_INCLUSAO,'dd/mm/yyyy') = TO_CHAR(sysdate,'dd/mm/yyyy')
    ${results}=                 executo a consulta ${query} para tratar o resultado
    Should Not Be Empty         ${results}    msg=A consulta retornou o resultado vazio.
    Log Many    @{results}
    Converter resultado XML ${results} em planilha csv com nome ${NAME_CSV} utilizando o header ${header_resultado}
que eu execute a query consultando as contas na fila de eventos de participante e exporte o resultado para csv
    ${cnpj_buscar}=             Get CNPJ without points ${CNPJ_PARTICIPANTE}
    ${query}=                   Set Variable        SELECT * FROM (SELECT NUM_ID_EVENTO_CADASTRO_B3I, DAT_INCLUSAO, NUM_ID_SERVICO, EXTRACTVALUE(xmltype(DES_PATRAMETROS),'/br.com.cetip.aplicacao.servicosinfra.apinegocio.ParametrosServico/parametros/br.com.cetip.aplicacao.servicosinfra.apinegocio.Parametro[1]/valor') RazaoSocial, EXTRACTVALUE(xmltype(DES_PATRAMETROS),'/br.com.cetip.aplicacao.servicosinfra.apinegocio.ParametrosServico/parametros/br.com.cetip.aplicacao.servicosinfra.apinegocio.Parametro[2]/valor') CNPJ, EXTRACTVALUE(xmltype(DES_PATRAMETROS),'/br.com.cetip.aplicacao.servicosinfra.apinegocio.ParametrosServico/parametros/br.com.cetip.aplicacao.servicosinfra.apinegocio.Parametro[3]/valor') Conta, EXTRACTVALUE(xmltype(DES_PATRAMETROS),'/br.com.cetip.aplicacao.servicosinfra.apinegocio.ParametrosServico/parametros/br.com.cetip.aplicacao.servicosinfra.apinegocio.Parametro[4]/valor') SituacaoConta, NUM_STATUS_ESPERADO, NUM_STATUS_RETORNO, DAT_PROCESSAMENTO FROM CETIP.TCTPEVENTO_CADASTRO_B3I) evento_participante WHERE 1 = 1 AND NUM_ID_SERVICO = 276 AND CONTA IN (${list_contas}) AND CNPJ = '${cnpj_buscar}' AND TO_CHAR(DAT_INCLUSAO,'dd/mm/yyyy') = TO_CHAR(sysdate,'dd/mm/yyyy') ORDER BY DAT_INCLUSAO
    ${results}=                 executo a consulta ${query} para tratar o resultado
    Should Not Be Empty         ${results}    msg=A consulta retornou o resultado vazio.
    Log Many    @{results}
    Converter resultado XML ${results} em planilha csv com nome ${NAME_CSV} utilizando o header ${header_resultado}
que eu execute a query consultando a fila de eventos após encerramento de participante e exporte o resultado para csv
    #    Set Global Variable         ${CNPJ_PARTICIPANTE}        09.513.847/0001-44
    ${condicao_encerramento}=   Set Variable        AND DES_PATRAMETROS LIKE '%<valor>4</valor>%'
    ${cnpj_buscar}=             Get CNPJ without points ${CNPJ_PARTICIPANTE}
    ${query}=                   Set Variable        SELECT NUM_ID_EVENTO_CADASTRO_B3I, DAT_INCLUSAO, NUM_ID_SERVICO, DBMS_LOB.SUBSTR(DES_PATRAMETROS, 4000, 1), NUM_STATUS_ESPERADO, NUM_STATUS_RETORNO, DAT_PROCESSAMENTO FROM CETIP.TCTPEVENTO_CADASTRO_B3I WHERE 1=1 AND NUM_ID_SERVICO = 276 AND DES_PATRAMETROS LIKE '%${cnpj_buscar}%' ${condicao_encerramento} AND TO_CHAR(DAT_INCLUSAO,'dd/mm/yyyy') = TO_CHAR(sysdate,'dd/mm/yyyy')
    ${results}=                 executo a consulta ${query} para tratar o resultado
    Should Not Be Empty         ${results}    msg=A consulta retornou o resultado vazio.
    row count is equal to x     ${query}    3
    Log Many    @{results}
    Converter resultado XML ${results} em planilha csv com nome ${NAME_CSV} utilizando o header ${header_resultado}

eu busco os tipos de miolo de conta que estão habilitados na tabela parametro config
    ${query}=                   Set Variable        SELECT pc.VAL_PARAMETRO_CONFIG FROM CETIP.PARAMETRO_CONFIG pc WHERE 1=1 AND pc.NUM_ID_PARAMETRO_CONFIG = 183 AND PC.COD_PARAMETRO_CONFIG = 'B3ICP'
    ${result}=                  executo a consulta ${query} para tratar o resultado
    Should Not Be Empty         ${result}    msg=A consulta retornou o resultado vazio.
    Log Many    @{result}
    ${value}        Convert To String   ${result[${0}][${0}]}
    @{miolos}=      Split String        ${value}    ;
    @{miolos_ajustado}  Create List
    FOR     ${miolo}        IN      @{miolos}
        Append To List  ${miolos_ajustado}  .${miolo}-
    END
    Set Global Variable         ${miolo_contas_habilitado}  ${miolos_ajustado}
que eu execute a query consultando validando se ja existe cadastro para o participante ${tipo_participante}
    Connect To DB ${var_amb}
    ${CNPJ}=    Set Variable  ${EMPTY}
    ${count}=                   Row Count            SELECT * FROM CETIP.V_SAP_DADOS_PARTICIPANTES v WHERE v.RAZAO_SOCIAL_PARTICIPANTE LIKE '%ROBOTWEB${tipo_participante}%' AND NOME_SITUACAO_PARTICIPANTE ='ATIVO' AND TO_CHAR(DATA_ULTIMA_ALTERACAO,'dd/MM/yyyy')=TO_CHAR(sysdate,'dd/mm/yyyy')
    Log    ${count}
    IF   "${count}" >= "1"
        ${query}=                   Set Variable     SELECT DISTINCT CNPJ FROM CETIP.V_SAP_DADOS_PARTICIPANTES v WHERE v.RAZAO_SOCIAL_PARTICIPANTE LIKE '%ROBOTWEB${tipo_participante}%' AND NOME_SITUACAO_PARTICIPANTE ='ATIVO' AND TO_CHAR(DATA_ULTIMA_ALTERACAO,'dd/MM/yyyy')=TO_CHAR(sysdate,'dd/mm/yyyy')
        ${result}=                  executo a consulta ${query} para tratar o resultado
        Should Not Be Empty         ${result}    msg=A consulta retornou o resultado vazio.
        Log Many    @{result}
        ${CNPJ}        Convert To String   ${result[${0}]}
        ${CNPJ}        Replace String      ${CNPJ}    (    ${EMPTY}
        ${CNPJ}        Replace String      ${CNPJ}    )    ${EMPTY}
        ${CNPJ}        Replace String      ${CNPJ}    ,    ${EMPTY}
        ${CNPJ}        Replace String      ${CNPJ}    '    ${EMPTY}
    END
    Disconnect From DB
    [Return]  ${CNPJ}
o usuário verifica que não houve inclusão de registro na fila TCTPEVENTO_CADASTRO_B3I entre ${hora_inicio} e ${hora_fim} para a conta ${cod_conta_fila}
    ${results}=                 Consulta fila TCTPEVENTO_CADASTRO_B3I bucando o valor ${cod_conta_fila} no parametro e data inclusao entre ${hora_inicio} e ${hora_fim}
    ${results_vazio}=           Run Keyword And Return Status       Should Be Empty     ${results}
    Should Be True          ${results_vazio}
o usuario verifica se o ultimo registro incluido na fila TCTPEVENTO_CADASTRO_B3I entre ${hora_inicio} e ${hora_fim} para a conta ${cod_conta_fila} foi com situação ${situacao_conta_fila}
    ${results}=                 Consulta fila TCTPEVENTO_CADASTRO_B3I bucando o valor ${cod_conta_fila} no parametro e data inclusao entre ${hora_inicio} e ${hora_fim}
    ${results_vazio}=           Run Keyword And Return Status       Should Be Empty     ${results}
    Should Not Be True          ${results_vazio}

    ${root}=                    Parse XML                           ${results[0][3]}
    ${childrens}=               Get Elements                        ${root}                 parametros/br.com.cetip.aplicacao.servicosinfra.apinegocio.Parametro
    ${elements}=                XML.Get Element Count               ${root}                 parametros/br.com.cetip.aplicacao.servicosinfra.apinegocio.Parametro
    FOR  ${element}  IN RANGE  0  ${elements}
        ${element_string}=        Element To String       ${childrens[${element}]}
        Log     ${element_string}
        ${contains}=    Run Keyword And Return Status    Should Contain    ${element_string}    <contexto>SITUACAO_CONTA</contexto>
        IF    ${contains}
            IF     "${situacao_conta_fila}"=="ATIVA"
                Should Contain    ${element_string}    <valor>1</valor>
            ELSE IF     "${situacao_conta_fila}"=="ATIVA SOMENTE PARA RESGATE"
                Should Contain    ${element_string}    <valor>2</valor>
            ELSE IF     "${situacao_conta_fila}"=="BLOQUEADA"
                Should Contain    ${element_string}    <valor>3</valor>
            ELSE IF     "${situacao_conta_fila}"=="ENCERRADA"
                Should Contain    ${element_string}    <valor>4</valor>
            ELSE IF     "${situacao_conta_fila}"=="EM PROCESSO DE ABERTURA"
                Should Contain    ${element_string}    <valor>11</valor>
            ELSE IF     "${situacao_conta_fila}"=="EM PROCESSO DE REABERTURA"
                Should Contain    ${element_string}    <valor>12</valor>
            ELSE IF     "${situacao_conta_fila}"=="EM PROCESSO DE ENCERRAMENTO"
                Should Contain    ${element_string}    <valor>3</valor>
            ELSE
                Fail     Situação desconhecida
            END
            Exit For Loop
        END
    END
que eu execute a consulta pegando a conta principal do participante 
    ${SQL}=       Set Variable    SELECT COD_CONTA_PRINCIPAL FROM cetip.V_SAP_DADOS_PARTICS_SIMPLES WHERE NOME_SITUACAO_PARTICIPANTE ='ATIVO' AND CNPJ_PARTICIPANTE ='${CNPJ_PARTICIPANTE}'
    ${CONTA}=     Set Variable    ${EMPTY}
    ${count}=     executo a consulta ${SQL} e faco o count
    Log    ${count}
    IF   "${count}" >= "1"
        ${result}=   executo a consulta ${SQL} para tratar o resultado
        Should Not Be Empty      ${result}    msg=A consulta retornou o resultado vazio.
        Log Many    @{result}
        ${CONTA}     Convert To String   ${result[${0}]}
        ${CONTA}     Replace String      ${CONTA}    (    ${EMPTY}
        ${CONTA}     Replace String      ${CONTA}    )    ${EMPTY}
        ${CONTA}     Replace String      ${CONTA}    '    ${EMPTY}
        ${CONTA}     Replace String      ${CONTA}    ,    ${EMPTY}
    END
    Disconnect From DB
    [Return]  ${CONTA}
que eu execute a consulta validando se ja existe conta ${tipo_conta} para o participante
    IF    "${tipo_conta}"=="00"
           ${tipo_conta}=  Set Variable   1
    ELSE IF    "${tipo_conta}"=="10"
        ${tipo_conta}=  Set Variable   5
    ELSE IF    "${tipo_conta}"=="20"
        ${tipo_conta}=  Set Variable   10
    ELSE IF    "${tipo_conta}"=="40"
        ${tipo_conta}=  Set Variable   20
    ELSE IF    "${tipo_conta}"=="69"
        ${tipo_conta}=  Set Variable   113
    ELSE IF    "${tipo_conta}"=="70"
        ${tipo_conta}=  Set Variable   31    
    END

    ${SQL}=       Set Variable    SELECT vcp.COD_CONTA_PARTICIPANTE FROM CETIP.V_PARTICIPANTES vp INNER JOIN CETIP.CONTA_PARTICIPANTE vcp ON vcp.NUM_ID_ENTIDADE=vp.NUM_ID_ENTIDADE WHERE 1=1 AND vp.NUM_ID_SITUACAO_PARTICIPANTE = 1 AND vcp.NUM_ID_SITUACAO_CONTA = 1 AND COD_NACIONAL_PJ ='${CNPJ_PARTICIPANTE}' AND vcp.NUM_ID_TIPO_CONTA = ${tipo_conta} ORDER BY vcp.COD_CONTA_PARTICIPANTE DESC
    ${CONTA}=     Set Variable    ${EMPTY}
    ${count}=     executo a consulta ${SQL} e faco o count
    Log    ${count}
    IF   "${count}" >= "1"
        ${result}=   executo a consulta ${SQL} para tratar o resultado
        Should Not Be Empty      ${result}    msg=A consulta retornou o resultado vazio.
        Log Many    @{result}
        ${CONTA}     Convert To String   ${result[${0}]}
        ${CONTA}     Replace String      ${CONTA}    (    ${EMPTY}
        ${CONTA}     Replace String      ${CONTA}    )    ${EMPTY}
        ${CONTA}     Replace String      ${CONTA}    '    ${EMPTY}
        ${CONTA}     Replace String      ${CONTA}    ,    ${EMPTY}
    END
    Disconnect From DB
    [Return]  ${CONTA}

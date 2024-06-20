*** Settings ***
Documentation       Suite description

*** Keywords ***
Connect To DB ${ambiente}
     ${ENV_AMB}=      Convert To Upper Case  ${ambiente}
     IF   "${ENV_AMB}" == "DEV"
        ${DB_SERVICE_NAME}=     Set Variable        CETIP.world
        ${DB_USERNAME}=         Set Variable        cetip_aplic
        ${DB_PASSWORD}=         Set Variable        0Oracle#2022
        ${DB_HOST}=             Set Variable        orabal00102d.internalenv.oci
        ${DB_PORT}=             Set Variable        1521
     ELSE IF   "${ENV_AMB}" == "DES"
        ${DB_SERVICE_NAME}=     Set Variable        CETIP.world
        ${DB_USERNAME}=         Set Variable        cetip_aplic
        ${DB_PASSWORD}=         Set Variable        0Oracle#2022
        ${DB_HOST}=             Set Variable        orabal00102d.internalenv.oci
        ${DB_PORT}=             Set Variable        1521
     ELSE IF   "${ENV_AMB}" == "QAA"
        ${DB_SERVICE_NAME}=     Set Variable        CETIP.world
        ${DB_USERNAME}=         Set Variable        cetip_aplic
        ${DB_PASSWORD}=         Set Variable        cetip
        ${DB_HOST}=             Set Variable        orabal00102q.internalenv.oci
        ${DB_PORT}=             Set Variable        1521
     ELSE IF   "${ENV_AMB}" == "CERT"
        ${DB_SERVICE_NAME}=     Set Variable        CETIP
        ${DB_USERNAME}=         Set Variable        cetip_aplic
        ${DB_PASSWORD}=         Set Variable        cetip
        ${DB_HOST}=             Set Variable        leblon
        ${DB_PORT}=             Set Variable        1521
    END
    Iniciar Client Oracle  ${path_oracle_client}
    ${DB_CONNECT_STRING_VALUE}=   Set Variable   '${DB_USERNAME}/${DB_PASSWORD}@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=${DB_HOST})(PORT=${DB_PORT}))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=${DB_SERVICE_NAME})))'
    connect to database using custom params    oracledb     ${DB_CONNECT_STRING_VALUE}
Disconnect From DB
    Disconnect from database
executo a consulta no ambiente ${ambiente} validando que nao retornou nenhum resultado para a query ${query}
    que eu execute a consulta ${query} no ambiente ${ambiente} verificando que retornou 0 registros no resultado
que eu execute a consulta ${query} no ambiente ${ambiente} verificando que retornou ${qtd_registros} registros no resultado
    Connect To DB ${ambiente}
    row count is equal to x    ${query}   ${qtd_registros}
    @{queryResults}   Query    ${query}
    Log Many    @{queryResults}
    Disconnect From DB

executo a consulta ${query} para tratar o resultado
    Connect To DB ${var_amb}
    @{queryResults}     Query       ${query}
    [Return]    ${queryResults}
    Disconnect From DB
executo a consulta ${query} e faco o count
    Connect To DB ${var_amb}
    ${count}    Row Count       ${query}
    [Return]    ${count}
    Disconnect From DB   
Verificar valores na coluna ${index} do CSV ${file_path} permitindo ao menos um valor da lista ${miolo_contas_habilitado}
    #${index}=           Set Variable        4
    ${file_content}=    Get File            ${file_path}.csv
    @{lines}=           Split To Lines      ${file_content}         1
    FOR    ${line}    IN    @{lines}
        @{items}=       Split String        ${line}                 ;
        ${item}=        Get From List       ${items}                ${index}
        Run Keyword     Verifique se o item ${item} contém ao menos um valor da lista ${miolo_contas_habilitado}
    END
Consultar quantidade de linhas no arquivo
    [Arguments]     ${path_diretorio}       ${nome_arquivo}
    ${file_content}=    Get File            ${path_diretorio}\\${nome_arquivo}
    @{lines}=           Split To Lines      ${file_content}         1
    ${number_of_lines}=  Get Length    ${lines}
    [Return]    ${number_of_lines}
o usuário valida que existem ${qtd_registros} linha(s) no arquivo ${nome_arquivo} exportado para o diretorio ${path_diretorio}
    ${qtd_linhas}=      Consultar quantidade de linhas no arquivo       ${path_diretorio}       ${nome_arquivo}.csv
    Should Be True      ${qtd_linhas} == ${qtd_registros}    msg=O arquivo deve conter ${qtd_registros} linhas
Converter resultado XML ${result} em planilha csv com nome ${name} utilizando o header ${header_resultado}
    [Documentation]  Takes header (list of column headers) and data (List containing nested list of row values)
    Log     ${PATH_CSV}
    Log     ${name}
    Log     ${header_resultado}

    ${arqcsv}=  Set Variable   ${PATH_CSV}\\${name}.csv
    Create File  ${arqcsv}
    ${header_string}  Convert List To Comma Seperated String   ${header_resultado}

    # Create the header
    Append To File  ${arqcsv}  ${header_string}

    # Append all the values row by row
    ${NumRowns} =      Get Length    ${result}
    FOR  ${indexRown}  IN RANGE  0  ${NumRowns}
        ${NumColumns}=  Get Length  ${result[${indexRown}]}
        @{random_row_list}  Create List
        ${data_atual}=        Get Current Date      UTC     - 3 hours
        Append To List  ${random_row_list}  ${data_atual}
        FOR  ${indexColumn}  IN RANGE  0  ${NumColumns}
            ${value}   Convert To String  ${result[${indexRown}][${indexColumn}]}
            # Remover quebras de linha e espaços em branco adicionais
            ${unformatted_xml}=    Replace String    ${value}    \n    ${EMPTY}
            ${unformatted_xml}=    Replace String    ${unformatted_xml}    \t    ${EMPTY}
            ${unformatted_xml}=    Replace String    ${unformatted_xml}    ${SPACE}    ${EMPTY}
            ${unformatted_xml}=    Strip String    ${unformatted_xml}
            Append To List  ${random_row_list}  ${unformatted_xml}
        END
        ${row_values}  Convert List To Comma Seperated String   ${random_row_list}
        Append To File  ${arqcsv}  \n${row_values}
    END
Converter e adicionar resultado XML ${result} na planilha ${name}
    ${arqcsv}=  Set Variable   ${PATH_CSV}\\${name}.csv

    # Append all the values row by row
    ${NumRowns} =      Get Length    ${result}
    FOR  ${indexRown}  IN RANGE  0  ${NumRowns}
        ${NumColumns}=  Get Length  ${result[${indexRown}]}
        @{random_row_list}  Create List
        ${data_atual}=        Get Current Date      UTC     - 3 hours
        Append To List  ${random_row_list}  ${data_atual}
        FOR  ${indexColumn}  IN RANGE  0  ${NumColumns}
            ${value}   Convert To String  ${result[${indexRown}][${indexColumn}]}
             # Remover quebras de linha e espaços em branco adicionais
            ${unformatted_xml}=    Replace String    ${value}    \n    ${EMPTY}
            ${unformatted_xml}=    Replace String    ${unformatted_xml}    \t    ${EMPTY}
            ${unformatted_xml}=    Replace String    ${unformatted_xml}    ${SPACE}    ${EMPTY}
            ${unformatted_xml}=    Strip String    ${unformatted_xml}
            Append To List  ${random_row_list}  ${unformatted_xml}
        END
        ${row_values}  Convert List To Comma Seperated String   ${random_row_list}
        Append To File  ${arqcsv}  \n${row_values}
    END
Consulta fila TCTPEVENTO_CADASTRO_B3I bucando o valor ${param} no parametro e data inclusao entre ${hora_inicio} e ${hora_fim}
    [Documentation]  Busca no banco de dados todos os registros que atenda a data especificada e que possua no CLOB o valor informado no filtro
    ${count}=       Get Length   ${param}

    IF   "${count}" == "18"
        ${filtro}=      Get CNPJ without points ${param}
    ELSE
        ${filtro}=      Set Variable     ${param}
    END

    ${query}=       Set Variable            SELECT NUM_ID_EVENTO_CADASTRO_B3I, DAT_INCLUSAO, NUM_ID_SERVICO, DBMS_LOB.SUBSTR(DES_PATRAMETROS, 4000, 1), NUM_STATUS_ESPERADO, NUM_STATUS_RETORNO, DAT_PROCESSAMENTO FROM CETIP.TCTPEVENTO_CADASTRO_B3I WHERE 1=1 AND NUM_ID_SERVICO = 276 AND DES_PATRAMETROS LIKE '%${filtro}%' AND DAT_INCLUSAO BETWEEN TO_DATE('${hora_inicio}', 'YYYY-MM-DD HH24:MI:SS') AND TO_DATE('${hora_fim}', 'YYYY-MM-DD HH24:MI:SS') ORDER BY NUM_ID_EVENTO_CADASTRO_B3I DESC
    ${results}=     executo a consulta ${query} para tratar o resultado
    [Return]        ${results}
Consulta fila EXTR_FILA_ATUALIZACAO bucando o valor ${param} no parametro e data inclusao entre ${hora_inicio} e ${hora_fim}
    [Documentation]  Busca no banco de dados todos os registros que atenda a data especificada e que possua no CLOB o valor informado no filtro
    ${filtro}=      Replace String          ${param}        /       \\/
    ${query}=       Set Variable            SELECT NUM_ID_EXTR_FILA_ATUALIZACAO, NOM_URL, NOM_METODO, DAT_CONF_ENVIO, DAT_SOLICITACAO, NUM_ID_ENTIDADE_ATUALIZ, NUM_STATUS_RETORNO, NUM_GRUPO_PROCESSAMENTO, IND_PROCESSA_REGISTRO, DBMS_LOB.SUBSTR(DES_PARAMETROS, 4000, 1) FROM CETIP.EXTR_FILA_ATUALIZACAO WHERE 1=1 AND DES_PARAMETROS LIKE '%${filtro}%' AND DAT_SOLICITACAO BETWEEN TO_DATE('${hora_inicio}', 'YYYY-MM-DD HH24:MI:SS') AND TO_DATE('${hora_fim}', 'YYYY-MM-DD HH24:MI:SS') ORDER BY DAT_SOLICITACAO DESC, NUM_ID_EXTR_FILA_ATUALIZACAO DESC
    ${results}=     executo a consulta ${query} para tratar o resultado
    [Return]        ${results}
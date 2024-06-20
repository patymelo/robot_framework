*** Keywords ***
O usuario acessa o menu de consulta representante comitente
    Capture Page Screenshot     img/${TAG_NUMBER}_1LoginNome.png
    O Usuário possui autorização no NoMe para acessar Identificação de Comitentes
    Capture Page Screenshot     img/${TAG_NUMBER}_1Login.png
    E o Usuário acessa o menu Identificação de Comitentes > Consulta > Representante de Comitente
    Capture Page Screenshot     img/${TAG_NUMBER}_2ConsultaComitente.png
O usuario faz a busca do comitente ${TIPO_PESSOA} ${DOC_COMITENTE}
    O Usuario seleciona na combo Tipo Pessoa valor igual a ${TIPO_PESSOA}
    O Usuario informa no campo CPF/ CNPJ valor igual a ${DOC_COMITENTE}
    Capture Page Screenshot     img/${TAG_NUMBER}_3FiltroConsultaComitente.png
    O Usuario clica no botao Pesquisar
    Capture Page Screenshot     img/${TAG_NUMBER}_4ResutadoConsultaComitente.png
Busca na tabela valor da coluna ${column_find_text}
    ${TableXpath}=       Set Variable   xpath://table[@id='workspaceTable']/tbody/tr[2]
    ${ColumnsHeader}=    SeleniumLibrary.Get Element Count  ${TableXpath}/th

    FOR  ${rowIndexHeader}  IN RANGE    1   ${ColumnsHeader+1}
        ${curText}     Get text     ${TableXpath}/th[${rowIndexHeader}]
        IF  "${curText}" == "${column_find_text}"
            ${idColumn}=    Set Variable  ${rowIndexHeader}
            ${idColumn}=    Convert To Integer  ${idColumn}
            Set Global Variable  ${idColumn}
            Exit FOR Loop
        END
    END

    ${ValuesColumn}=   Get Text   ${TableXpath}//following::td[${idColumn}]
    [Return]   ${ValuesColumn}
Pega valores das colunas da tela de consulta representante comitente
    Pega valores das colunas da tela para dados basicos do representante
    Pega valores das colunas da tela para endereço do representante
    Pega valores das colunas da tela para telefone do representante
    Pega valores das colunas da tela para email do representante
#   ###################Pega Dados da TELA########################################################
#   ######################     **** representativeInvestor
Pega valores das colunas da tela para dados basicos do representante
    ${TIPO_DOC_REPRESENT_TELA}=    Busca na tabela valor da coluna Tipo de Documento
    ${TIPO_DOC_REPRESENT_TELA}=    Convert To String   ${TIPO_DOC_REPRESENT_TELA}
    Set Global Variable  ${TIPO_DOC_REPRESENT_TELA}
    ${DOC_REPRESENT_TELA}=             Busca na tabela valor da coluna Documento
    ${DOC_REPRESENT_TELA}=             Convert To String   ${DOC_REPRESENT_TELA}
    ${DOC_REPRESENT_TELA}=             Replace String      ${DOC_REPRESENT_TELA}    .   ${EMPTY}
    ${DOC_REPRESENT_TELA}=             Replace String      ${DOC_REPRESENT_TELA}    /   ${EMPTY}
    ${DOC_REPRESENT_TELA}=             Replace String      ${DOC_REPRESENT_TELA}    -   ${EMPTY}
    Set Global Variable  ${DOC_REPRESENT_TELA}
    ${NOME_REPRESENT_TELA}=            Busca na tabela valor da coluna Nome
    ${NOME_REPRESENT_TELA}=            Convert To String   ${NOME_REPRESENT_TELA}
    Set Global Variable  ${NOME_REPRESENT_TELA}
    ${PEP_REPRESENT_TELA}=             Busca na tabela valor da coluna Pessoa Exposta Politicamente?
    ${PEP_REPRESENT_TELA}=             Convert To String   ${PEP_REPRESENT_TELA}
    Set Global Variable  ${PEP_REPRESENT_TELA}
Pega valores das colunas da tela para endereço do representante
#   ######################     **** addressRepresentativeLegalInvestor
    ${TIPO_ENDERECO_REPRESENT_TELA}=   Busca na tabela valor da coluna Tipo de Endereço
    Set Global Variable  ${TIPO_ENDERECO_REPRESENT_TELA}
    ${LOGRADOURO_REPRESENT_TELA}=      Busca na tabela valor da coluna Logradouro
    Set Global Variable  ${LOGRADOURO_REPRESENT_TELA}
    ${NUM_LOGRADOURO_REPRESENT_TELA}=  Busca na tabela valor da coluna Número Logradouro
    Set Global Variable  ${NUM_LOGRADOURO_REPRESENT_TELA}
    ${COMPLEMENTO_REPRESENT_TELA}=     Busca na tabela valor da coluna Complemento
    Set Global Variable  ${COMPLEMENTO_REPRESENT_TELA}
    ${BAIRRO_REPRESENT_TELA}=          Busca na tabela valor da coluna Bairro
    Set Global Variable  ${BAIRRO_REPRESENT_TELA}
    ${CEP_REPRESENT_TELA}=             Busca na tabela valor da coluna CEP
    Set Global Variable  ${CEP_REPRESENT_TELA}
    ${MUNICIPIO_REPRESENT_TELA}=       Busca na tabela valor da coluna Tipo Município
    Set Global Variable  ${MUNICIPIO_REPRESENT_TELA}
    ${UF_REPRESENT_TELA}=              Busca na tabela valor da coluna UF
    Set Global Variable  ${UF_REPRESENT_TELA}
Pega valores das colunas da tela para telefone do representante
#   ######################     **** addressPhoneRepresentativeLegalInvestor
    ${DDD_REPRESENT_TELA}=             Busca na tabela valor da coluna DDD
    Set Global Variable  ${DDD_REPRESENT_TELA}
    ${TELEFONE_REPRESENT_TELA}=        Busca na tabela valor da coluna Telefone
    Set Global Variable  ${TELEFONE_REPRESENT_TELA}
    ${RAMAL_REPRESENT_TELA}=           Busca na tabela valor da coluna Ramal
    Set Global Variable  ${RAMAL_REPRESENT_TELA}
    ${TIPO_TELEFONE_REPRESENT_TELA}=   Busca na tabela valor da coluna Tipo Telefone
    Set Global Variable  ${TIPO_TELEFONE_REPRESENT_TELA}
Pega valores das colunas da tela para email do representante
    #   ######################     **** emailRepresentativeLegalInvestor
    ${TIPO_EMAIL_REPRESENT_TELA}=      Busca na tabela valor da coluna Tipo E-mail
    Set Global Variable  ${TIPO_EMAIL_REPRESENT_TELA}
    ${EMAIL_REPRESENT_TELA}=           Busca na tabela valor da coluna E-mail
    Set Global Variable  ${EMAIL_REPRESENT_TELA}
*** Variables ***
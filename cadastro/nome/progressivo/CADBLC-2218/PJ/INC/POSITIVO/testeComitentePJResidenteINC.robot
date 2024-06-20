*** Settings ***
Documentation       Teste API Comitente /legal-investors
Suite Setup         Log    Suite Setup!
Suite Teardown      Log    Suite Teardown!
Library             DateTime
Resource            ${CURDIR}\\..\\..\\..\\..\\GENERIC_VAR\\Keywords.robot
Resource            ${CURDIR}\\..\\..\\..\\..\\GENERIC_VAR\\KeywordsAPI.robot
Resource            ${CURDIR}\\..\\..\\..\\..\\GENERIC_VAR\\Login.robot
Resource            ${CURDIR}\\..\\..\\..\\..\\GENERIC_VAR\\keywordConsultaComitente.robot

*** Test Cases ***
TST0001: PJ RESIDENTE (API) - Inclusão ITAUBM Dados Minimos - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar sucesso no cadastro com dados minimos necessários preenchidos
    [Tags]    POSITIVO API
    ${TAG_NUMBER}=       Set Variable   TST0001
    ${CNPJ_COMITENTE_ITAUBM_MIN}=   Generate CNPJ with size   14
    ${PARTICIPANTE}=     Set Variable   ITAUBM
    ${DONO}=             Set Variable   SIM
    ${TOGGLE}=           Set Variable   S
    ${CNPJ_COMITENTE}=   Set Variable   ${CNPJ_COMITENTE_ITAUBM_MIN}
    ${VideoAlias}=       Set Variable   CadastroApiPJResidente
    ${VideoName}=        Set Variable   video/${VideoAlias}
    Set Global Variable  ${TOGGLE}
    Set Global Variable  ${CNPJ_COMITENTE}
    Set Global Variable  ${CNPJ_COMITENTE_ITAUBM_MIN}
    Set Global Variable  ${DONO}
    Set Global Variable  ${PARTICIPANTE}
    Set Global Variable  ${TAG_NUMBER}
    Set Global Variable  ${VideoName}
    Set Global Variable  ${VideoAlias}

    Setar variaveis comitente PJ residente API
    #Iniciar Gravacao
    Dado Que eu chame a api de inclusão de comitente PJ residente passando a apiKey ITAUAPIINT
    ${body}=        Que eu crie um novo body a partir de um ${JSON_INC_MIN}
    Set Global Variable  ${body}
    ${body_alterado}=    Setar dados no body da API PJ residente
    ${resposta}=         Que eu faça uma chamada POST enviando o ${body_alterado}
    Set Global Variable  ${resposta}
    Então a chamada deve ter status 200

TST0002: PJ RESIDENTE (API) - Inclusão ITAUBM Dados Maximos e depara no NoMe - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar sucesso no cadastro com dados máximos preenchidos
    [Tags]    POSITIVO_API_1
    ${TAG_NUMBER}=       Set Variable   TST0002
    ${CNPJ_COMITENTE_ITAUBM_MAX}=   Generate CNPJ with size   14
    ${PARTICIPANTE}=     Set Variable   ITAUBM
    ${DONO}=             Set Variable   SIM
    ${TOGGLE}=           Set Variable   S
    ${CNPJ_COMITENTE}=   Set Variable   ${CNPJ_COMITENTE_ITAUBM_MAX}
    Set Global Variable  ${TOGGLE}
    Set Global Variable  ${CNPJ_COMITENTE}
    Set Global Variable  ${CNPJ_COMITENTE_ITAUBM_MAX}
    Set Global Variable  ${DONO}
    Set Global Variable  ${PARTICIPANTE}
    Set Global Variable  ${TAG_NUMBER}

    Setar variaveis comitente PJ residente API
    Dado Que eu chame a api de inclusão de comitente PJ residente passando a apiKey ITAUAPIINT
    ${body}=        Que eu crie um novo body a partir de um ${JSON_INC_MAX}
    Set Global Variable  ${body}
    ${body}=    Setar dados no body da API PJ residente
    Set Global Variable  ${body}
    ${resposta}=         Que eu faça uma chamada POST enviando o ${body}
    Set Global Variable  ${resposta}
    Então a chamada deve ter status 200

TST0003: PJ RESIDENTE (API) - Inclusão RIOBM Dados minimos - NÃO DONO
    [Documentation]   Teste de API Comitente PJ como não Dono do cadastro: Validar sucesso no cadastro com dados minimos necessários preenchidos
    [Tags]    POSITIVO API
    ${TAG_NUMBER}=       Set Variable   TST0003
    ${PARTICIPANTE}=     Set Variable   RIOBM
    ${DONO}=             Set Variable   NAO
    ${TOGGLE}=           Set Variable   S
    ${CNPJ_COMITENTE}=   Set Variable   ${CNPJ_COMITENTE_ITAUBM_MIN}
    Set Global Variable  ${TOGGLE}
    Set Global Variable  ${CNPJ_COMITENTE}
    Set Global Variable  ${DONO}
    Set Global Variable  ${PARTICIPANTE}
    Set Global Variable  ${TAG_NUMBER}

    Setar variaveis comitente PJ residente API
    Dado Que eu chame a api de inclusão de comitente PJ residente passando a apiKey RIOAPIINT
    ${body}=        Que eu crie um novo body a partir de um ${JSON_INC_MIN}
    Set Global Variable  ${body}
    ${body_alterado}=    Setar dados no body da API PJ residente
    ${resposta}=         Que eu faça uma chamada POST enviando o ${body_alterado}
    Set Global Variable  ${resposta}
    Então a chamada deve ter status 200
TST0004: PJ RESIDENTE (API) - Inclusão ITAUBM Dados minimos - DONO
    [Documentation]   Teste de API Comitente PJ como não Dono do cadastro: Validar sucesso no cadastro com dados máximos preenchidos
    [Tags]    POSITIVO API
    ${TAG_NUMBER}=       Set Variable   TST0004
    ${PARTICIPANTE}=     Set Variable   RIOBM
    ${DONO}=             Set Variable   NAO
    ${TOGGLE}=           Set Variable   S
    ${CNPJ_COMITENTE}=   Set Variable   ${CNPJ_COMITENTE_ITAUBM_MAX}
    Set Global Variable  ${TOGGLE}
    Set Global Variable  ${CNPJ_COMITENTE}
    Set Global Variable  ${DONO}
    Set Global Variable  ${PARTICIPANTE}
    Set Global Variable  ${TAG_NUMBER}

    Setar variaveis comitente PJ residente API
    Dado Que eu chame a api de inclusão de comitente PJ residente passando a apiKey RIOAPIINT
    ${body}=        Que eu crie um novo body a partir de um ${JSON_INC_MAX}
    Set Global Variable  ${body}
    ${body_alterado}=    Setar dados no body da API PJ residente
    ${resposta}=         Que eu faça uma chamada POST enviando o ${body_alterado}
    Set Global Variable  ${resposta}
    Então a chamada deve ter status 200
    #Parar Gravacao

*** Variable ***
${TIPO_ENDERECO}=     MATRIZ
${TIPO_PESSOA}=       Pessoa Jurídica
${TIPO_EMAIL}=        PARTICULAR
${BAIRRO}=            CENTRO
${PAIS}=              BRASIL
${JSON_INC_MIN}=      ${CURDIR}\\..\\..\\JSON\\JSON_COMITENTE_PJ_MINIMO.json
${JSON_INC_MAX}=      ${CURDIR}\\..\\..\\JSON\\JSON_COMITENTE_PJ_MAXIMO.json
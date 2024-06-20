*** Settings ***
Documentation       Teste API Comitente /legal-investors
Suite Setup         Log    Suite Setup!
Suite Teardown      Log    Suite Teardown!
Resource            ${CURDIR}\\..\\..\\..\\..\\GENERIC_VAR\\Keywords.robot
Resource            ${CURDIR}\\..\\..\\..\\..\\GENERIC_VAR\\KeywordsAPI.robot
Resource            ${CURDIR}\\..\\..\\..\\..\\GENERIC_VAR\\Login.robot
Resource            ${CURDIR}\\..\\..\\..\\..\\GENERIC_VAR\\keywordConsultaComitente.robot
Resource            ${CURDIR}\\..\\..\\..\\..\\GENERIC_VAR\\keywordConsultaRepresentanteComitente.robot


*** Test Cases ***
TST0001: PJ RESIDENTE (API) - Inclusão ITAUBM Dados Maximos - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar sucesso no cadastro com dados máximos preenchidos
    [Tags]    DEPARA API
    ${TAG_NUMBER}=       Set Variable   TST0001
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
    #Então a chamada deve ter status 200

TST0002: PJ RESIDENTE (API) - Depara Dados do Comitente - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar sucesso no cadastro com dados máximos preenchidos
    [Tags]    DEPARA API
    ${TAG_NUMBER}=       Set Variable   TST0002
    Set Global Variable  ${TAG_NUMBER}
    Pega valores das colunas da api para dados basicos do comitente
    Pega valores das colunas da api para dados faturamento do comitente
    Pega valores das colunas da api para fatca do comitente
    Pega valores das colunas da api para dados investidor do comitente
    Pega valores das colunas da api para endereço do comitente
    Pega valores das colunas da api para email do comitente

    O usuario loga no NoMe como CETIP
    O usuario acessa o menu de consulta comitente
    keywordConsultaComitente.O usuario faz a busca do comitente ${TIPO_PESSOA} ${CNPJ_COMITENTE}
    Pega valores das colunas da tela de consulta comitente
    close browser

    Entao faz o depara dos campos entre tela e api para dados basicos do comitente
    Entao faz o depara dos campos entre tela e api para dados faturamento do comitente
    Entao faz o depara dos campos entre tela e api para fatca do comitente
    Entao faz o depara dos campos entre tela e api para dados investidor do comitente
    Entao faz o depara dos campos entre tela e api para endereço do comitente
    Entao faz o depara dos campos entre tela e api para email do comitente
TST0003: PJ RESIDENTE (API) - Depara Dados do Representante Comitente - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar sucesso no cadastro com dados máximos preenchidos
    [Tags]    DEPARA API
    ${TAG_NUMBER}=       Set Variable   TST0003
    Set Global Variable  ${TAG_NUMBER}
    Pega valores das colunas da api para dados basicos do representante
    Pega valores das colunas da api para endereço do representante
    Pega valores das colunas da api para email do representante
    Pega valores das colunas da api para telefone do representante

    O usuario loga no NoMe como CETIP
    O usuario acessa o menu de consulta representante comitente
    keywordConsultaRepresentanteComitente.O usuario faz a busca do comitente ${TIPO_PESSOA} ${CNPJ_COMITENTE}
    Pega valores das colunas da tela de consulta representante comitente
    close browser

    Entao faz o depara dos campos entre tela e api para dados basicos do representante
    Entao faz o depara dos campos entre tela e api para endereço do representante
    Entao faz o depara dos campos entre tela e api para email do representante
    Entao faz o depara dos campos entre tela e api para telefone do representante
*** Keywords ***
Limpa string API ${value}
    LOG  ${value}
    ${value}=    Convert To String   ${value}
    ${value}=    Replace String      ${value}    [   ${EMPTY}
    ${value}=    Replace String      ${value}    ]   ${EMPTY}
    ${value}=    Replace String      ${value}    '   ${EMPTY}
    [Return]  ${value}
Pega valores das colunas da api para dados basicos do comitente
#   ###################Pega Dados da API#########################################################
#   ######################     **** data ***
    ${DATA_ATU_COMITENTE_API}=          Que eu busque do ${body} o valor do campo updateDate
    ${DATA_ATU_COMITENTE_API}=          Limpa string API ${DATA_ATU_COMITENTE_API}
    Set Global Variable  ${DATA_ATU_COMITENTE_API}
#   ######################     **** investor
    ${TITULAR_CONTA_COMITENTE_API}=     Que eu busque do ${body} o valor do campo customerAccountHolderCode no objeto investor
    ${TITULAR_CONTA_COMITENTE_API}=     Limpa string API ${TITULAR_CONTA_COMITENTE_API}
    Set Global Variable  ${TITULAR_CONTA_COMITENTE_API}
    ${NATUREZA_FISC_API}=               Que eu busque do ${body} o valor do campo taxNatureCode no objeto investor
    ${NATUREZA_FISC_API}=               Limpa string API ${NATUREZA_FISC_API}
    Set Global Variable  ${NATUREZA_FISC_API}
    ${CNPJ_COMITENTE_API}=              Que eu busque do ${body} o valor do campo documentNumber no objeto investor
    ${CNPJ_COMITENTE_API}=              Limpa string API ${CNPJ_COMITENTE_API}
    Set Global Variable  ${CNPJ_COMITENTE_API}
    ${NOME_COMITENTE_API}=              Que eu busque do ${body} o valor do campo investorName no objeto investor
    ${NOME_COMITENTE_API}=               Limpa string API ${NOME_COMITENTE_API}
    Set Global Variable  ${NOME_COMITENTE_API}
    ${PAIS_RESIDENCIA_API}=             Que eu busque do ${body} o valor do campo residenceCountryCode no objeto investor
    ${PAIS_RESIDENCIA_API}=             Limpa string API ${PAIS_RESIDENCIA_API}
    Set Global Variable  ${PAIS_RESIDENCIA_API}
    ${CODIGO_LEI_API}=                  Que eu busque do ${body} o valor do campo leiCode no objeto investor
    ${CODIGO_LEI_API}=                  Limpa string API ${CODIGO_LEI_API}
    Set Global Variable  ${CODIGO_LEI_API}
Pega valores das colunas da api para dados faturamento do comitente
#   ######################     **** equitySituation
    ${FATURAMENTO_12_API}=              Que eu busque do ${body} o valor do campo annualIncomeValue no objeto investor.equitySituation
    ${FATURAMENTO_12_API}=              Limpa string API ${FATURAMENTO_12_API}
    Set Global Variable  ${FATURAMENTO_12_API}
    ${DATA_FAT_COMITENTE_API}=          Que eu busque do ${body} o valor do campo annualIncomeDate no objeto investor.equitySituation
    ${DATA_FAT_COMITENTE_API}=          Limpa string API ${DATA_FAT_COMITENTE_API}
    Set Global Variable  ${DATA_FAT_COMITENTE_API}
    ${VALOR_LIQUIDO_API}=               Que eu busque do ${body} o valor do campo equityValue no objeto investor.equitySituation
    ${VALOR_LIQUIDO_API}=               Limpa string API ${VALOR_LIQUIDO_API}
    Set Global Variable  ${VALOR_LIQUIDO_API}
    ${DATA_VALOR_VL_LIQUIDO_API}=       Que eu busque do ${body} o valor do campo equityDate no objeto investor.equitySituation
    ${DATA_VALOR_VL_LIQUIDO_API}=       Limpa string API ${DATA_VALOR_VL_LIQUIDO_API}
    Set Global Variable  ${DATA_VALOR_VL_LIQUIDO_API}
    ${CAPACIDADE_FINC_API}=             Que eu busque do ${body} o valor do campo lastYearBillingValue no objeto investor.equitySituation
    ${CAPACIDADE_FINC_API}=             Limpa string API ${CAPACIDADE_FINC_API}
    Set Global Variable  ${CAPACIDADE_FINC_API}
    ${DATA_CAPACIDADE_FINC_API}=        Que eu busque do ${body} o valor do campo billingDate no objeto investor.equitySituation
    ${DATA_CAPACIDADE_FINC_API}=        Limpa string API ${DATA_CAPACIDADE_FINC_API}
    Set Global Variable  ${DATA_CAPACIDADE_FINC_API}
Pega valores das colunas da api para fatca do comitente
#   ######################     **** fatca
    ${PAIS_ENVOLVIDO_API}=              Set Variable   DINAMARCA
    ${PAIS_ENVOLVIDO_API}=              Limpa string API ${PAIS_ENVOLVIDO_API}
    Set Global Variable  ${PAIS_ENVOLVIDO_API}
    ${PAIS_ORIGEM_INVEST_API}=          Set Variable   PALESTINA
    ${PAIS_ORIGEM_INVEST_API}=          Limpa string API ${PAIS_ORIGEM_INVEST_API}
    Set Global Variable  ${PAIS_ORIGEM_INVEST_API}
    ${GIIN_API}=                        Que eu busque do ${body} o valor do campo giinNumber no objeto investor.fatca
    ${GIIN_API}=                        Limpa string API ${GIIN_API}
    Set Global Variable  ${GIIN_API}
Pega valores das colunas da api para dados investidor do comitente
#   ######################     **** legalInvestor
    ${AUTORIZA_TRANS_TERCEIRP_API}=    Que eu busque do ${body} o valor do campo authorizeOrderTransmissionByThird no objeto legalInvestor
    ${AUTORIZA_TRANS_TERCEIRP_API}=    Limpa string API ${AUTORIZA_TRANS_TERCEIRP_API}
    Set Global Variable  ${AUTORIZA_TRANS_TERCEIRP_API}
    ${DATA_FUNDACAO_API}=              Que eu busque do ${body} o valor do campo companyStartDate no objeto legalInvestor
    ${DATA_FUNDACAO_API}=              Limpa string API ${DATA_FUNDACAO_API}
    Set Global Variable  ${DATA_FUNDACAO_API}
    ${EMPR_SEM_FIM_LUCRATIVO_API}=     Que eu busque do ${body} o valor do campo nonProfitCompanyIndicator no objeto legalInvestor
    ${EMPR_SEM_FIM_LUCRATIVO_API}=     Limpa string API ${EMPR_SEM_FIM_LUCRATIVO_API}
    Set Global Variable  ${EMPR_SEM_FIM_LUCRATIVO_API}
    ${GESTOR_CARTEIRA_API}=            Que eu busque do ${body} o valor do campo administrativePortfolioManagerIndicator no objeto legalInvestor
    ${GESTOR_CARTEIRA_API}=            Limpa string API ${GESTOR_CARTEIRA_API}
    Set Global Variable  ${GESTOR_CARTEIRA_API}
    ${GESTOR_FUNDO_API}=               Que eu busque do ${body} o valor do campo investmentFundAdministratorIndicator no objeto legalInvestor
    ${GESTOR_FUNDO_API}=               Limpa string API ${GESTOR_FUNDO_API}
    Set Global Variable  ${GESTOR_FUNDO_API}
    ${GRUPO_ECONOMICO_API}=            Que eu busque do ${body} o valor do campo economicGroupName no objeto legalInvestor
    ${GRUPO_ECONOMICO_API}=            Limpa string API ${GRUPO_ECONOMICO_API}
    Set Global Variable  ${GRUPO_ECONOMICO_API}
    ${CLASSIFICACAO_RISCO_API}=        Que eu busque do ${body} o valor do campo riskClassificationCode no objeto legalInvestor
    ${CLASSIFICACAO_RISCO_API}=        Limpa string API ${CLASSIFICACAO_RISCO_API}
    Set Global Variable  ${CLASSIFICACAO_RISCO_API}
    ${DESC_CLASSIFICACAO_RISCO_API}=   Que eu busque do ${body} o valor do campo riskClassificationName no objeto legalInvestor
    ${DESC_CLASSIFICACAO_RISCO_API}=   Limpa string API ${DESC_CLASSIFICACAO_RISCO_API}
    Set Global Variable  ${DESC_CLASSIFICACAO_RISCO_API}
    ${ATIVIDADE_DESENVOLVIDA_API}=     Que eu busque do ${body} o valor do campo economicActivityCode no objeto legalInvestor
    ${ATIVIDADE_DESENVOLVIDA_API}=     Limpa string API ${ATIVIDADE_DESENVOLVIDA_API}
    Set Global Variable  ${ATIVIDADE_DESENVOLVIDA_API}
Pega valores das colunas da api para endereço do comitente
#   ######################     **** addressLegalInvestor
    ${TIPO_ENDERECO_END_API}=           Que eu busque do ${body} o valor do campo addressTypeCode no objeto legalInvestor.addressLegalInvestor
    ${TIPO_ENDERECO_END_API}=           Limpa string API ${TIPO_ENDERECO_END_API}
    Set Global Variable  ${TIPO_ENDERECO_END_API}
    ${LOGRADOURO_END_API}=              Que eu busque do ${body} o valor do campo addressTypeName no objeto legalInvestor.addressLegalInvestor
    ${LOGRADOURO_END_API}=              Limpa string API ${LOGRADOURO_END_API}
    Set Global Variable  ${LOGRADOURO_END_API}
    ${NUM_LOGRADOURO_END_API}=          Que eu busque do ${body} o valor do campo addressNumber no objeto legalInvestor.addressLegalInvestor
    ${NUM_LOGRADOURO_END_API}=          Limpa string API ${NUM_LOGRADOURO_END_API}
    Set Global Variable  ${NUM_LOGRADOURO_END_API}
    ${COMPLEMENTO_END_API}=             Que eu busque do ${body} o valor do campo addressComplementName no objeto legalInvestor.addressLegalInvestor
    ${COMPLEMENTO_END_API}=             Limpa string API ${COMPLEMENTO_END_API}
    Set Global Variable  ${COMPLEMENTO_END_API}
    ${BAIRRO_END_API}=                  Que eu busque do ${body} o valor do campo neighborhoodName no objeto legalInvestor.addressLegalInvestor
    ${BAIRRO_END_API}=                   Limpa string API ${BAIRRO_END_API}
    Set Global Variable  ${BAIRRO_END_API}
    ${CEP_END_API}=                     Que eu busque do ${body} o valor do campo zipCode no objeto legalInvestor.addressLegalInvestor
    ${CEP_END_API}=                     Limpa string API ${CEP_END_API}
    Set Global Variable  ${CEP_END_API}
    ${MUNICIPIO_END_API}=               Set Variable   SAO PAULO
    ${MUNICIPIO_END_API}=               Limpa string API ${MUNICIPIO_END_API}
    Set Global Variable  ${MUNICIPIO_END_API}
    ${UF_END_API}=                      Set Variable   SP
    ${UF_END_API}=                      Limpa string API ${UF_END_API}
    Set Global Variable  ${UF_END_API}
Pega valores das colunas da api para email do comitente
#   ######################     **** emailRepresentativeLegalInvestor
    ${TIPO_EMAIL_API}=                 Que eu busque do ${body} o valor do campo emailTypeCode no objeto legalInvestor.addressLegalInvestor.emailLegalInvestor
    ${TIPO_EMAIL_API}=                 Limpa string API ${TIPO_EMAIL_API}
    Set Global Variable  ${TIPO_EMAIL_API}
    ${EMAIL_API}=                      Que eu busque do ${body} o valor do campo emailName no objeto legalInvestor.addressLegalInvestor.emailName
    ${EMAIL_API}=                      Limpa string API ${EMAIL_API}
    Set Global Variable  ${EMAIL_API}
Pega valores das colunas da api para telefone do comitente
#   ######################     **** addressPhoneRepresentativeLegalInvestor
    ${DDD_API}=                         Que eu busque do ${body} o valor do campo phoneAreaCodeNumber no objeto legalInvestor.addressLegalInvestor.addressPhoneLegalInvestor
    ${DDD_API}=                         Limpa string API ${DDD_API}
    Set Global Variable  ${DDD_API}
    ${TELEFONE_API}=                    Que eu busque do ${body} o valor do campo phoneNumber no objeto legalInvestor.addressLegalInvestor.addressPhoneLegalInvestor
    ${TELEFONE_API}=                    Limpa string API ${TELEFONE_API}
    Set Global Variable  ${TELEFONE_API}
    ${RAMAL_API}=                       Que eu busque do ${body} o valor do campo phoneExtension no objeto legalInvestor.addressLegalInvestor.addressPhoneLegalInvestor
    ${RAMAL_API}=                       Limpa string API ${RAMAL_API}
    Set Global Variable  ${RAMAL_API}
    ${TIPO_TELEFONE_API}=               Que eu busque do ${body} o valor do campo phoneTypeCode no objeto legalInvestor.addressLegalInvestor.addressPhoneLegalInvestor
    ${TIPO_TELEFONE_API}=               Limpa string API ${TIPO_TELEFONE_API}
    Set Global Variable  ${TIPO_TELEFONE_API}

#   ###################Pega Dados da API########################################################
Pega valores das colunas da api para dados basicos do representante
#   ######################     **** representativeInvestor
    ${TIPO_DOC_REPRESENT_API}=         Que eu busque do ${body} o valor do campo documentTypeCode no objeto representativeInvestor
    ${TIPO_DOC_REPRESENT_API}=         Limpa string API ${TIPO_DOC_REPRESENT_API}
    Set Global Variable  ${TIPO_DOC_REPRESENT_API}
    ${DOC_REPRESENT_API}=              Que eu busque do ${body} o valor do campo documentNumber no objeto representativeInvestor
    ${DOC_REPRESENT_API}=              Limpa string API ${DOC_REPRESENT_API}
    Set Global Variable  ${DOC_REPRESENT_API}
    ${NOME_REPRESENT_API}=             Que eu busque do ${body} o valor do campo representativeName no objeto representativeInvestor
    ${NOME_REPRESENT_API}=             Limpa string API ${NOME_REPRESENT_API}
    Set Global Variable  ${NOME_REPRESENT_API}
    ${PEP_REPRESENT_API}=              Que eu busque do ${body} o valor do campo politicallyExposedPersonCode no objeto representativeInvestor
    ${PEP_REPRESENT_API}=              Limpa string API ${PEP_REPRESENT_API}
    IF  "${PEP_REPRESENT_API}" == "FALSO"
        ${PEP_REPRESENT_API}=  Set Variable  Não
    ELSE IF  "${PEP_REPRESENT_API}" == "VERDADEIRO"
        ${PEP_REPRESENT_API}=  Set Variable  Sim
    END
    Set Global Variable  ${PEP_REPRESENT_API}
Pega valores das colunas da api para endereço do representante
#   ######################     **** addressRepresentativeLegalInvestor
    ${TIPO_ENDERECO_REPRESENT_API}=    Que eu busque do ${body} o valor do campo addressTypeCode no objeto representativeInvestor.addressRepresentativeLegalInvestor
    ${TIPO_ENDERECO_REPRESENT_API}=    Limpa string API ${TIPO_ENDERECO_REPRESENT_API}
    Set Global Variable  ${TIPO_ENDERECO_REPRESENT_API}
    ${LOGRADOURO_REPRESENT_API}=       Que eu busque do ${body} o valor do campo addressTypeName no objeto representativeInvestor.addressRepresentativeLegalInvestor
    ${LOGRADOURO_REPRESENT_API}=       Limpa string API ${LOGRADOURO_REPRESENT_API}
    Set Global Variable  ${LOGRADOURO_REPRESENT_API}
    ${NUM_LOGRADOURO_REPRESENT_API}=   Que eu busque do ${body} o valor do campo addressNumber no objeto representativeInvestor.addressRepresentativeLegalInvestor
    ${NUM_LOGRADOURO_REPRESENT_API}=   Limpa string API ${NUM_LOGRADOURO_REPRESENT_API}
    Set Global Variable  ${NUM_LOGRADOURO_REPRESENT_API}
    ${COMPLEMENTO_REPRESENT_API}=      Que eu busque do ${body} o valor do campo addressComplementName no objeto representativeInvestor.addressRepresentativeLegalInvestor
    ${COMPLEMENTO_REPRESENT_API}=      Limpa string API ${COMPLEMENTO_REPRESENT_API}
    Set Global Variable  ${COMPLEMENTO_REPRESENT_API}
    ${BAIRRO_REPRESENT_API}=           Que eu busque do ${body} o valor do campo neighborhoodName no objeto representativeInvestor.addressRepresentativeLegalInvestor
    ${BAIRRO_REPRESENT_API}=           Limpa string API ${BAIRRO_REPRESENT_API}
    Set Global Variable  ${BAIRRO_REPRESENT_API}
    ${CEP_REPRESENT_API}=              Que eu busque do ${body} o valor do campo zipCode no objeto representativeInvestor.addressRepresentativeLegalInvestor
    ${CEP_REPRESENT_API}=              Limpa string API ${CEP_REPRESENT_API}
    Set Global Variable  ${CEP_REPRESENT_API}
    ${MUNICIPIO_REPRESENT_API}=        Set Variable   INDAIATUBA
    ${MUNICIPIO_REPRESENT_API}=        Limpa string API ${MUNICIPIO_REPRESENT_API}
    Set Global Variable  ${MUNICIPIO_REPRESENT_API}
    ${UF_REPRESENT_API}=               Set Variable   SP
    ${UF_REPRESENT_API}=               Limpa string API ${UF_REPRESENT_API}
    Set Global Variable  ${UF_REPRESENT_API}
Pega valores das colunas da api para telefone do representante
#   ######################     **** addressPhoneRepresentativeLegalInvestor
    ${DDD_REPRESENT_API}=              Que eu busque do ${body} o valor do campo phoneAreaCodeNumber no objeto representativeInvestor.addressRepresentativeLegalInvestor.addressPhoneRepresentativeLegalInvestor
    ${DDD_REPRESENT_API}=              Limpa string API ${DDD_REPRESENT_API}
    Set Global Variable  ${DDD_REPRESENT_API}
    ${TELEFONE_REPRESENT_API}=         Que eu busque do ${body} o valor do campo phoneNumber no objeto representativeInvestor.addressRepresentativeLegalInvestor.addressPhoneRepresentativeLegalInvestor
    ${TELEFONE_REPRESENT_API}=         Limpa string API ${TELEFONE_REPRESENT_API}
    Set Global Variable  ${TELEFONE_REPRESENT_API}
    ${RAMAL_REPRESENT_API}=            Que eu busque do ${body} o valor do campo phoneExtension no objeto representativeInvestor.addressRepresentativeLegalInvestor.addressPhoneRepresentativeLegalInvestor
    ${RAMAL_REPRESENT_API}=            Limpa string API ${RAMAL_REPRESENT_API}
    Set Global Variable  ${RAMAL_REPRESENT_API}
    ${TIPO_TELEFONE_REPRESENT_API}=    Que eu busque do ${body} o valor do campo phoneTypeCode no objeto representativeInvestor.addressRepresentativeLegalInvestor.addressPhoneRepresentativeLegalInvestor
    ${TIPO_TELEFONE_REPRESENT_API}=    Limpa string API ${TIPO_TELEFONE_REPRESENT_API}
    Set Global Variable  ${TIPO_TELEFONE_REPRESENT_API}
Pega valores das colunas da api para email do representante
    #   ######################     **** emailRepresentativeLegalInvestor
    ${TIPO_EMAIL_REPRESENT_API}=       Que eu busque do ${body} o valor do campo emailTypeCode no objeto representativeInvestor.addressRepresentativeLegalInvestor.emailRepresentativeLegalInvestor
    ${TIPO_EMAIL_REPRESENT_API}=       Limpa string API ${TIPO_EMAIL_REPRESENT_API}
    Set Global Variable  ${TIPO_EMAIL_REPRESENT_API}
    ${EMAIL_REPRESENT_API}=            Que eu busque do ${body} o valor do campo emailName no objeto representativeInvestor.addressRepresentativeLegalInvestor.emailRepresentativeLegalInvestor
    ${EMAIL_REPRESENT_API}=            Limpa string API ${EMAIL_REPRESENT_API}
    Set Global Variable  ${EMAIL_REPRESENT_API}

Entao faz o depara dos campos entre tela e api para dados basicos do comitente
    Should Be True     "${DATA_ATU_COMITENTE_API}" == "${DATA_ATU_COMITENTE_TELA}"
    LOG   ${DATA_ATU_COMITENTE_API}
    LOG   ${DATA_ATU_COMITENTE_TELA}
    Should Be True     "${TITULAR_CONTA_COMITENTE_API}" == "${TITULAR_CONTA_COMITENTE_TELA}"
    LOG   ${TITULAR_CONTA_COMITENTE_API}
    LOG   ${TITULAR_CONTA_COMITENTE_TELA}
    Should Be True     "${CNPJ_COMITENTE_API}" == "${DOC_COMITENTE_TELA}"
    LOG   ${CNPJ_COMITENTE_API}
    LOG   ${DOC_COMITENTE_TELA}
    Should Be True     "${NOME_COMITENTE_API}" == "${NOME_COMITENTE_TELA}"
    LOG   ${NOME_COMITENTE_API}
    LOG   ${NOME_COMITENTE_TELA}
    Should Be True     "${CODIGO_LEI_API}" == "${CODIGO_LEI_TELA}"
    LOG   ${CODIGO_LEI_API}
    LOG   ${CODIGO_LEI_TELA}
Entao faz o depara dos campos entre tela e api para dados faturamento do comitente
    Should Be True     "${FATURAMENTO_12_API}" == "${FATURAMENTO_12_TELA}"
    LOG   ${FATURAMENTO_12_API}
    LOG   ${FATURAMENTO_12_TELA}
    Should Be True     "${DATA_FAT_COMITENTE_API}" == "${DATA_FAT_COMITENTE_TELA}"
    LOG   ${DATA_FAT_COMITENTE_API}
    LOG   ${DATA_FAT_COMITENTE_TELA}
    Should Be True     "${VALOR_LIQUIDO_API}" == "${VALOR_LIQUIDO_TELA}"
    LOG   ${VALOR_LIQUIDO_API}
    LOG   ${VALOR_LIQUIDO_TELA}
    Should Be True     "${DATA_VALOR_VL_LIQUIDO_API}" == "${DATA_VALOR_VL_LIQUIDO_TELA}"
    LOG   ${DATA_VALOR_VL_LIQUIDO_API}
    LOG   ${DATA_VALOR_VL_LIQUIDO_TELA}
    Should Be True     "${CAPACIDADE_FINC_API}" == "${CAPACIDADE_FINC_TELA}"
    LOG   ${CAPACIDADE_FINC_API}
    LOG   ${CAPACIDADE_FINC_TELA}
    Should Be True     "${DATA_CAPACIDADE_FINC_API}" == "${DATA_CAPACIDADE_FINC_TELA}"
    LOG   ${DATA_CAPACIDADE_FINC_API}
    LOG   ${DATA_CAPACIDADE_FINC_TELA}
Entao faz o depara dos campos entre tela e api para fatca do comitente
    Should Be True     "${PAIS_ENVOLVIDO_API}" == "${PAIS_ENVOLVIDO_TELA}"
    LOG   ${PAIS_ENVOLVIDO_API}
    LOG   ${PAIS_ENVOLVIDO_TELA}
    #Should Be True     "${PAIS_ORIGEM_INVEST_API}" == "${PAIS_ORIGEM_INVEST_TELA}"
    Should Be True     "${GIIN_API}" == "${GIIN_TELA}"
    LOG   ${GIIN_API}
    LOG   ${GIIN_TELA}
Entao faz o depara dos campos entre tela e api para dados investidor do comitente
    #Should Be True     "${AUTORIZA_TRANS_TERCEIRP_API}" == "${AUTORIZA_TRANS_TERCEIRP_TELA}"
    Should Be True     "${DATA_FUNDACAO_API}" == "${DATA_FUNDACAO_TELA}"
    LOG   ${DATA_FUNDACAO_API}
    LOG   ${DATA_FUNDACAO_TELA}
    IF  "${EMPR_SEM_FIM_LUCRATIVO_API}" == "False"
        ${EMPR_SEM_FIM_LUCRATIVO_API}=  Set Variable  Não
    ELSE
        ${EMPR_SEM_FIM_LUCRATIVO_API}=  Set Variable  Sim
    END
    Should Be True     "${EMPR_SEM_FIM_LUCRATIVO_API}" == "${EMPR_SEM_FIM_LUCRATIVO_TELA}"
    LOG   ${EMPR_SEM_FIM_LUCRATIVO_API}
    LOG   ${EMPR_SEM_FIM_LUCRATIVO_TELA}
    IF  "${GESTOR_CARTEIRA_API}" == "False"
        ${GESTOR_CARTEIRA_API}=  Set Variable  Não
    ELSE
        ${GESTOR_CARTEIRA_API}=  Set Variable  Sim
    END
    Should Be True     "${GESTOR_CARTEIRA_API}" == "${GESTOR_CARTEIRA_TELA}"
    LOG   ${GESTOR_CARTEIRA_API}
    LOG   ${GESTOR_CARTEIRA_TELA}
    IF  "${GESTOR_FUNDO_API}" == "False"
        ${GESTOR_FUNDO_API}=  Set Variable  Não
    ELSE
        ${GESTOR_FUNDO_API}=  Set Variable  Sim
    END
    Should Be True     "${GESTOR_FUNDO_API}" == "${GESTOR_FUNDO_TELA}"
    LOG   ${GESTOR_FUNDO_API}
    LOG   ${GESTOR_FUNDO_TELA}
    Should Be True     "${GRUPO_ECONOMICO_API}".lower() == "${GRUPO_ECONOMICO_TELA}".lower()
    LOG   ${GRUPO_ECONOMICO_API}
    LOG   ${GRUPO_ECONOMICO_TELA}
    IF  "${CLASSIFICACAO_RISCO_API}" == "M"
        ${CLASSIFICACAO_RISCO_API}=  Set Variable  Médio
    ELSE IF   "${CLASSIFICACAO_RISCO_API}" == "B"
        ${CLASSIFICACAO_RISCO_API}=  Set Variable  Baixo
    ELSE IF   "${CLASSIFICACAO_RISCO_API}" == "A"
        ${CLASSIFICACAO_RISCO_API}=  Set Variable  Alto
    ELSE IF   "${CLASSIFICACAO_RISCO_API}" == "O"
        ${CLASSIFICACAO_RISCO_API}=  Set Variable  Outros
    END
    Should Be True     "${CLASSIFICACAO_RISCO_API}" == "${CLASSIFICACAO_RISCO_TELA}"
    LOG   ${CLASSIFICACAO_RISCO_API}
    LOG   ${CLASSIFICACAO_RISCO_TELA}
    Should Be True     "${DESC_CLASSIFICACAO_RISCO_API}" == "${DESC_CLASSIFICACAO_RISCO_TELA}"
    LOG   ${DESC_CLASSIFICACAO_RISCO_API}
    LOG   ${DESC_CLASSIFICACAO_RISCO_TELA}
    #Should Be True     "${ATIVIDADE_DESENVOLVIDA_API}" == "${ATIVIDADE_DESENVOLVIDA_TELA}"
Entao faz o depara dos campos entre tela e api para endereço do comitente
    Should Be True     "${TIPO_ENDERECO_END_API}" == "${TIPO_ENDERECO_END_TELA}"
    LOG   ${TIPO_ENDERECO_END_API}
    LOG   ${TIPO_ENDERECO_END_TELA}
    Should Be True     "${LOGRADOURO_END_API.strip()}".lower() == "${LOGRADOURO_END_TELA}".lower()
    LOG   ${LOGRADOURO_END_API}
    LOG   ${LOGRADOURO_END_TELA}
    Should Be True     "${NUM_LOGRADOURO_END_API.strip()}" == "${NUM_LOGRADOURO_END_TELA}"
    LOG   ${NUM_LOGRADOURO_END_API}
    LOG   ${NUM_LOGRADOURO_END_TELA}
    Should Be True     "${COMPLEMENTO_END_API.strip()}".lower() == "${COMPLEMENTO_END_TELA}".lower()
    LOG   ${COMPLEMENTO_END_API}
    LOG   ${COMPLEMENTO_END_TELA}
    Should Be True     "${BAIRRO_END_API.strip()}".lower() == "${BAIRRO_END_TELA}".lower()
    LOG   ${BAIRRO_END_API}
    LOG   ${BAIRRO_END_TELA}
    Should Be True     "${CEP_END_API.strip()}" == "${CEP_END_TELA}"
    LOG   ${CEP_END_API}
    LOG   ${CEP_END_TELA}
    Should Be True     "${MUNICIPIO_END_API}".lower() == "${MUNICIPIO_END_TELA}".lower()
    LOG   ${MUNICIPIO_END_API}
    LOG   ${MUNICIPIO_END_TELA}
    Should Be True     "${UF_END_API}" == "${UF_END_TELA}"
    lOG   ${UF_END_API}
    LOG   ${UF_END_TELA}
Entao faz o depara dos campos entre tela e api para email do comitente
     Should Be True     "${TIPO_EMAIL_API}" == "${TIPO_EMAIL_TELA}"
     LOG   ${TIPO_EMAIL_API}
     LOG   ${TIPO_EMAIL_TELA}
     Should Be True     "${EMAIL_API}".lower() == "${EMAIL_TELA}".lower()
     LOG   ${EMAIL_API}
     LOG   ${EMAIL_TELA}
#Entao faz o depara dos campos entre tela e api para telefone do representante
    #Should Be True     "${DDD_API.strip()}" == "${DDD_TELA}"
    #Should Be True     "${TELEFONE_API.strip()}" == "${TELEFONE_TELA}"
    #Should Be True     "${RAMAL_API.strip()}" == "${RAMAL_TELA}"
    #Should Be True     "${TIPO_TELEFONE_API.strip()}" == "${TIPO_TELEFONE_TELA}"
Entao faz o depara dos campos entre tela e api para dados basicos do representante
    Should Be True     "${TIPO_DOC_REPRESENT_API.strip()}" == "${TIPO_DOC_REPRESENT_TELA}"
    LOG   ${TIPO_DOC_REPRESENT_API}
    LOG   ${TIPO_DOC_REPRESENT_TELA}
    Should Be True     "${DOC_REPRESENT_API.strip()}" == "${DOC_REPRESENT_TELA}"
    LOG   ${DOC_REPRESENT_API}
    LOG   ${DOC_REPRESENT_TELA}
    Should Be True     "${NOME_REPRESENT_API.strip()}" == "${NOME_REPRESENT_TELA}"
    LOG   ${NOME_REPRESENT_API}
    LOG   ${NOME_REPRESENT_TELA}
    Should Be True     "${PEP_REPRESENT_API.strip()}" == "${PEP_REPRESENT_TELA}"
    LOG   ${PEP_REPRESENT_API}
    LOG   ${PEP_REPRESENT_TELA}
Entao faz o depara dos campos entre tela e api para endereço do representante
    Should Be True     "${TIPO_ENDERECO_REPRESENT_API}" == "${TIPO_ENDERECO_REPRESENT_TELA}"
    LOG   ${TIPO_ENDERECO_REPRESENT_API}
    LOG   ${TIPO_ENDERECO_REPRESENT_TELA}
    Should Be True     "${LOGRADOURO_REPRESENT_API.strip()}".lower() == "${LOGRADOURO_REPRESENT_TELA}".lower()
    LOG   ${LOGRADOURO_REPRESENT_API}
    LOG   ${LOGRADOURO_REPRESENT_TELA}
    Should Be True     "${NUM_LOGRADOURO_REPRESENT_API.strip()}" == "${NUM_LOGRADOURO_REPRESENT_TELA}"
    LOG   ${NUM_LOGRADOURO_REPRESENT_API}
    LOG   ${NUM_LOGRADOURO_REPRESENT_TELA}
    Should Be True     "${COMPLEMENTO_REPRESENT_API.strip()}".lower() == "${COMPLEMENTO_REPRESENT_TELA}".lower()
    LOG   ${COMPLEMENTO_REPRESENT_API}
    LOG   ${COMPLEMENTO_REPRESENT_TELA}
    Should Be True     "${BAIRRO_REPRESENT_API.strip()}".lower() == "${BAIRRO_REPRESENT_TELA}".lower()
    LOG   ${BAIRRO_REPRESENT_API}
    LOG   ${BAIRRO_REPRESENT_TELA}
    Should Be True     "${CEP_REPRESENT_API.strip()}" == "${CEP_REPRESENT_TELA}"
    LOG   ${CEP_REPRESENT_API}
    LOG   ${CEP_REPRESENT_TELA}
    Should Be True     "${MUNICIPIO_REPRESENT_API}".lower() == "${MUNICIPIO_REPRESENT_TELA}".lower()
    LOG   ${MUNICIPIO_REPRESENT_API}
    LOG   ${MUNICIPIO_REPRESENT_TELA}
    Should Be True     "${UF_REPRESENT_API}" == "${UF_REPRESENT_TELA}"
    LOG   ${UF_REPRESENT_API}
    LOG   ${UF_REPRESENT_TELA}
Entao faz o depara dos campos entre tela e api para telefone do representante
    Should Be True     "${DDD_REPRESENT_API.strip()}" == "${DDD_REPRESENT_TELA}"
    LOG   ${DDD_REPRESENT_API}
    LOG   ${DDD_REPRESENT_TELA}
    Should Be True     "${TELEFONE_REPRESENT_API.strip()}" == "${TELEFONE_REPRESENT_TELA}"
    LOG   ${TELEFONE_REPRESENT_API}
    LOG   ${TELEFONE_REPRESENT_TELA}
    Should Be True     "${RAMAL_REPRESENT_API.strip()}" == "${RAMAL_REPRESENT_TELA}"
    LOG   ${RAMAL_REPRESENT_API}
    LOG   ${RAMAL_REPRESENT_TELA}
    Should Be True     "${TIPO_TELEFONE_REPRESENT_API.strip()}" == "${TIPO_TELEFONE_REPRESENT_TELA}"
    LOG   ${TIPO_TELEFONE_REPRESENT_API}
    LOG   ${TIPO_TELEFONE_REPRESENT_TELA}
Entao faz o depara dos campos entre tela e api para email do representante
    Should Be True     "${TIPO_EMAIL_REPRESENT_API}" == "${TIPO_EMAIL_REPRESENT_TELA}"
    LOG   ${TIPO_EMAIL_REPRESENT_API}
    LOG   ${TIPO_EMAIL_REPRESENT_TELA}
    Should Be True     "${EMAIL_REPRESENT_API}".lower() == "${EMAIL_REPRESENT_TELA}".lower()
    LOG   ${EMAIL_REPRESENT_API}
    LOG   ${EMAIL_REPRESENT_TELA}

*** Variable ***
${TIPO_ENDERECO}=     MATRIZ
${TIPO_PESSOA}=       Pessoa Jurídica
${TIPO_EMAIL}=        PARTICULAR
${BAIRRO}=            CENTRO
${PAIS}=              BRASIL
${JSON_INC_MIN}=      ${CURDIR}\\..\\..\\JSON\\JSON_COMITENTE_PJ_MINIMO.json
${JSON_INC_MAX}=      ${CURDIR}\\..\\..\\JSON\\JSON_COMITENTE_PJ_MAXIMO.json
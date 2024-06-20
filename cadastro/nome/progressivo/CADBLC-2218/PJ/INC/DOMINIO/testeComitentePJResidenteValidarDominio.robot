*** Settings ***
Documentation       Teste API Comitente /legal-investors
Suite Setup         Log    Suite Setup!
Suite Teardown      Log    Suite Teardown!
Resource            ${CURDIR}\\..\\..\\..\\..\\GENERIC_VAR\\Keywords.robot
Resource            ${CURDIR}\\..\\..\\..\\..\\GENERIC_VAR\\KeywordsAPI.robot
Resource            ${CURDIR}\\..\\..\\..\\..\\GENERIC_VAR\\Login.robot
Resource            ${CURDIR}\\..\\..\\..\\..\\GENERIC_VAR\\keywordConsultaComitente.robot

*** Test Cases ***
TST0001: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (confirmationDataIndicator) diferente de true e false - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Instituição Financeira confirma as informações cadastrais do cliente?" não pode ser diferente de true or false
    [Tags]    NEGATIVO DOMINIO INVALIDO API
    ${TAG_NUMBER}=       Set Variable   TST0001
    ${CNPJ_COMITENTE}=   Generate CNPJ with size   18
    ${PARTICIPANTE}=     Set Variable   ITAUBM
    ${DONO}=             Set Variable   SIM
    ${TOGGLE}=           Set Variable   S
    Set Global Variable  ${TOGGLE}
    Set Global Variable  ${CNPJ_COMITENTE}
    Set Global Variable  ${DONO}
    Set Global Variable  ${PARTICIPANTE}
    Set Global Variable  ${TAG_NUMBER}

    Setar variaveis comitente PJ residente API
    Dado Que eu chame a api de inclusão de comitente PJ residente passando a apiKey ITAUAPIINT
    ${body}=   Que eu crie um novo body a partir de um ${JSON_INC_MIN}
    Set Global Variable  ${body}
    ${body}=   Setar dados no body da API PJ residente
    ${body}=   Que eu altere o ${body} alterando o valor do campo confirmationDataIndicator para VERDADEIRO
    ${resposta}=        Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "Erro [DOMINIO_INVALIDO : Domínio inválido] no campo \\u0027confirmationDataIndicator\\u0027"
    Então a chamada deve ter status 422
TST0002: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (taxNatureCode) Dominio invalido - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Natureza Fiscal" Dominio invalido: Valores Aceitos: "Isento" e "Tributável"
    [Tags]    NEGATIVO DOMINIO INVALIDO API
    ${TAG_NUMBER}=       Set Variable   TST0002
    ${CNPJ_COMITENTE}=   Generate CNPJ with size   14
    ${PARTICIPANTE}=     Set Variable   ITAUBM
    ${DONO}=             Set Variable   SIM
    ${TOGGLE}=           Set Variable   S
    Set Global Variable  ${TOGGLE}
    Set Global Variable  ${CNPJ_COMITENTE}
    Set Global Variable  ${DONO}
    Set Global Variable  ${PARTICIPANTE}
    Set Global Variable  ${TAG_NUMBER}

    Setar variaveis comitente PJ residente API
    Dado Que eu chame a api de inclusão de comitente PJ residente passando a apiKey ITAUAPIINT
    ${body}=   Que eu crie um novo body a partir de um ${JSON_INC_MIN}
    Set Global Variable  ${body}
    ${body}=        Setar dados no body da API PJ residente
    ${body}=        Que eu altere o ${body} alterando o valor do campo taxNatureCode no objeto investor para Insencao
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    #Que a ${resposta} tenha no erro o valor "Erro [DOMINIO_INVALIDO : Insencao inválido] no campo \\u0027taxNatureCode\\u0027"
    Então a chamada deve ter status 422
TST0003: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (documentNumber) Não aceitar Padrao diferente de CNPJ e CPF- DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "CPF/CNPJ do Comitente" Não aceitar Padrao diferente de CNPJ e CPF
    [Tags]    NEGATIVO DOMINIO INVALIDO API
    ${TAG_NUMBER}=       Set Variable   TST0003
    ${CNPJ_COMITENTE}=   Generate CNPJ with size   14
    ${PARTICIPANTE}=     Set Variable   ITAUBM
    ${DONO}=             Set Variable   SIM
    ${TOGGLE}=           Set Variable   S
    Set Global Variable  ${TOGGLE}
    Set Global Variable  ${CNPJ_COMITENTE}
    Set Global Variable  ${DONO}
    Set Global Variable  ${PARTICIPANTE}
    Set Global Variable  ${TAG_NUMBER}

    Setar variaveis comitente PJ residente API
    Dado Que eu chame a api de inclusão de comitente PJ residente passando a apiKey ITAUAPIINT
    ${body}=   Que eu crie um novo body a partir de um ${JSON_INC_MIN}
    Set Global Variable  ${body}
    ${body}=        Setar dados no body da API PJ residente
    ${body}=        Que eu altere o ${body} alterando o valor do campo documentNumber no objeto investor para 112233445566778
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "Erro [NAO_EH_CPF_NEM_CNPJ : Código inválido 112233445566778.] no campo \\u0027documentNumber\\u0027"
    Então a chamada deve ter status 422
TST0004: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (taxNatureCode) Dominio Invalido - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Natureza Fiscal" Dominio Invalido
    [Tags]    NEGATIVO DOMINIO INVALIDO API
    ${TAG_NUMBER}=       Set Variable   TST0004
    ${CNPJ_COMITENTE}=   Generate CNPJ with size   18
    ${PARTICIPANTE}=     Set Variable   ITAUBM
    ${DONO}=             Set Variable   SIM
    ${TOGGLE}=           Set Variable   S
    Set Global Variable  ${TOGGLE}
    Set Global Variable  ${CNPJ_COMITENTE}
    Set Global Variable  ${DONO}
    Set Global Variable  ${PARTICIPANTE}
    Set Global Variable  ${TAG_NUMBER}

    Setar variaveis comitente PJ residente API
    Dado Que eu chame a api de inclusão de comitente PJ residente passando a apiKey ITAUAPIINT
    ${body}=        Que eu crie um novo body a partir de um ${JSON_INC_MIN}
    Set Global Variable  ${body}
    ${body}=        Setar dados no body da API PJ residente
    ${body}=        Que eu altere o ${body} alterando o valor do campo taxNatureCode no objeto investor para Outros
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    #Que a ${resposta} tenha no erro o valor "Erro [DOMINIO_INVALIDO : Outros inválido] no campo \\u0027taxNatureCode\\u0027"
    Então a chamada deve ter status 422
TST0005: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (currencyCode) Dominio invalido - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Moeda" Dominio invalido
    [Tags]    NEGATIVO DOMINIO INVALIDO API
    ${TAG_NUMBER}=       Set Variable   TST0005
    ${PARTICIPANTE}=     Set Variable   ITAUBM
    ${DONO}=             Set Variable   SIM
    ${TOGGLE}=           Set Variable   S
    ${CNPJ_COMITENTE}=   Generate CNPJ with size   18
    Set Global Variable  ${TOGGLE}
    Set Global Variable  ${CNPJ_COMITENTE}
    Set Global Variable  ${DONO}
    Set Global Variable  ${PARTICIPANTE}
    Set Global Variable  ${TAG_NUMBER}

    Setar variaveis comitente PJ residente API
    Dado Que eu chame a api de inclusão de comitente PJ residente passando a apiKey ITAUAPIINT
    ${body}=   Que eu crie um novo body a partir de um ${JSON_INC_MAX}
    Set Global Variable  ${body}
    ${body}=        Setar dados no body da API PJ residente
    ${body}=        Que eu altere o ${body} alterando o valor do campo currencyCode no objeto investor.equitySituation para 10
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "Erro [DOMINIO_INVALIDO : Domínio inválido] no campo \\u0027currencyCode\\u0027"
    Então a chamada deve ter status 422
TST0006: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (annualIncomeValue) Dominio invalido - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Valor da Renda Anual" Dominio invalido
    [Tags]    NEGATIVO DOMINIO INVALIDO API
    ${TAG_NUMBER}=       Set Variable   TST0006
    ${PARTICIPANTE}=     Set Variable   ITAUBM
    ${DONO}=             Set Variable   SIM
    ${TOGGLE}=           Set Variable   S
    ${CNPJ_COMITENTE}=   Generate CNPJ with size   18
    Set Global Variable  ${TOGGLE}
    Set Global Variable  ${CNPJ_COMITENTE}
    Set Global Variable  ${DONO}
    Set Global Variable  ${PARTICIPANTE}
    Set Global Variable  ${TAG_NUMBER}

    Setar variaveis comitente PJ residente API
    Dado Que eu chame a api de inclusão de comitente PJ residente passando a apiKey ITAUAPIINT
    ${body}=   Que eu crie um novo body a partir de um ${JSON_INC_MAX}
    Set Global Variable  ${body}
    ${body}=        Setar dados no body da API PJ residente
    ${body}=        Que eu altere o ${body} alterando o valor do campo annualIncomeValue no objeto investor.equitySituation para 1122334455661.123
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    #Que a ${resposta} tenha no erro o valor "Erro [VALIDACAO_REGEX : O valor \\u00271122334455661.123\\u0027 não é válido.] no campo \\u0027annualIncomeValue\\u0027""
    Então a chamada deve ter status 422
TST0007: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (equityValue) Dominio invalido - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Valor da Situação Patrimonial" Dominio invalido
    [Tags]    NEGATIVO DOMINIO INVALIDO API
    ${TAG_NUMBER}=       Set Variable   TST0007
    ${PARTICIPANTE}=     Set Variable   ITAUBM
    ${DONO}=             Set Variable   SIM
    ${TOGGLE}=           Set Variable   S
    ${CNPJ_COMITENTE}=   Generate CNPJ with size   18
    Set Global Variable  ${TOGGLE}
    Set Global Variable  ${CNPJ_COMITENTE}
    Set Global Variable  ${DONO}
    Set Global Variable  ${PARTICIPANTE}
    Set Global Variable  ${TAG_NUMBER}

    Setar variaveis comitente PJ residente API
    Dado Que eu chame a api de inclusão de comitente PJ residente passando a apiKey ITAUAPIINT
    ${body}=   Que eu crie um novo body a partir de um ${JSON_INC_MAX}
    Set Global Variable  ${body}
    ${body}=        Setar dados no body da API PJ residente
    ${body}=        Que eu altere o ${body} alterando o valor do campo equityValue no objeto investor.equitySituation para 1122334455661.123
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    #Que a ${resposta} tenha no erro o valor "Erro [VALIDACAO_REGEX : O valor \\u00271122334455661.123\\u0027 não é válido.] no campo \\u0027equityValue\\u0027""
    Então a chamada deve ter status 422
TST0008: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (lastYearBillingValue) Dominio invalido - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Capacidade Financeira" Dominio invalido
    [Tags]    NEGATIVO DOMINIO INVALIDO API
    ${TAG_NUMBER}=       Set Variable   TST0008
    ${PARTICIPANTE}=     Set Variable   ITAUBM
    ${DONO}=             Set Variable   SIM
    ${TOGGLE}=           Set Variable   S
    ${CNPJ_COMITENTE}=   Generate CNPJ with size   18
    Set Global Variable  ${TOGGLE}
    Set Global Variable  ${CNPJ_COMITENTE}
    Set Global Variable  ${DONO}
    Set Global Variable  ${PARTICIPANTE}
    Set Global Variable  ${TAG_NUMBER}

    Setar variaveis comitente PJ residente API
    Dado Que eu chame a api de inclusão de comitente PJ residente passando a apiKey ITAUAPIINT
    ${body}=   Que eu crie um novo body a partir de um ${JSON_INC_MAX}
    Set Global Variable  ${body}
    ${body}=        Setar dados no body da API PJ residente
    ${body}=        Que eu altere o ${body} alterando o valor do campo lastYearBillingValue no objeto investor.equitySituation para 1122334455661.123
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    #Que a ${resposta} tenha no erro o valor "Erro [VALIDACAO_REGEX : O valor \\u00271122334455661.123\\u0027 não é válido.] no campo \\u0027lastYearBillingValue\\u0027""
    Então a chamada deve ter status 422
TST0009: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (relatedCountryCode) Dominio invalido - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "País envolvido/relacionado" Dominio invalido
    [Tags]    NEGATIVO DOMINIO INVALIDO API
    ${TAG_NUMBER}=       Set Variable   TST0009
    ${PARTICIPANTE}=     Set Variable   ITAUBM
    ${DONO}=             Set Variable   SIM
    ${TOGGLE}=           Set Variable   S
    ${CNPJ_COMITENTE}=   Generate CNPJ with size   18
    Set Global Variable  ${TOGGLE}
    Set Global Variable  ${CNPJ_COMITENTE}
    Set Global Variable  ${DONO}
    Set Global Variable  ${PARTICIPANTE}
    Set Global Variable  ${TAG_NUMBER}

    Setar variaveis comitente PJ residente API
    Dado Que eu chame a api de inclusão de comitente PJ residente passando a apiKey ITAUAPIINT
    ${body}=   Que eu crie um novo body a partir de um ${JSON_INC_MAX}
    Set Global Variable  ${body}
    ${body}=        Setar dados no body da API PJ residente
    ${body}=        Que eu altere o ${body} alterando o valor do campo relatedCountryCode no objeto investor.fatca para 266
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "Erro [DOMINIO_INVALIDO : Domínio inválido] no campo \\u0027relatedCountryCode\\u0027"
    Então a chamada deve ter status 422
TST0010: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (relatedCountryCode) Dominio invalido - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "País de Origem do Investidor" Dominio invalido
    [Tags]    NEGATIVO DOMINIO INVALIDO API
    ${TAG_NUMBER}=       Set Variable   TST0010
    ${PARTICIPANTE}=     Set Variable   ITAUBM
    ${DONO}=             Set Variable   SIM
    ${TOGGLE}=           Set Variable   S
    ${CNPJ_COMITENTE}=   Generate CNPJ with size   18
    Set Global Variable  ${TOGGLE}
    Set Global Variable  ${CNPJ_COMITENTE}
    Set Global Variable  ${DONO}
    Set Global Variable  ${PARTICIPANTE}
    Set Global Variable  ${TAG_NUMBER}

    Setar variaveis comitente PJ residente API
    Dado Que eu chame a api de inclusão de comitente PJ residente passando a apiKey ITAUAPIINT
    ${body}=   Que eu crie um novo body a partir de um ${JSON_INC_MAX}
    Set Global Variable  ${body}
    ${body}=        Setar dados no body da API PJ residente
    ${body}=        Que eu altere o ${body} alterando o valor do campo originCountryCode no objeto investor.fatca para 266
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "Erro [DOMINIO_INVALIDO : Domínio inválido] no campo \\u0027originCountryCode\\u0027"
    Então a chamada deve ter status 422
TST0011: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (authorizeOrderTransmissionByThird) Dominio invalido - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Autoriza Transmissão de Ordem por Terceiros?" Dominio invalido. Aceita somente (A,P,N)
    [Tags]    NEGATIVO DOMINIO INVALIDO API
    ${TAG_NUMBER}=       Set Variable   TST0011
    ${PARTICIPANTE}=     Set Variable   ITAUBM
    ${DONO}=             Set Variable   SIM
    ${TOGGLE}=           Set Variable   S
    ${CNPJ_COMITENTE}=   Generate CNPJ with size   18
    Set Global Variable  ${TOGGLE}
    Set Global Variable  ${CNPJ_COMITENTE}
    Set Global Variable  ${DONO}
    Set Global Variable  ${PARTICIPANTE}
    Set Global Variable  ${TAG_NUMBER}

    Setar variaveis comitente PJ residente API
    Dado Que eu chame a api de inclusão de comitente PJ residente passando a apiKey ITAUAPIINT
    ${body}=   Que eu crie um novo body a partir de um ${JSON_INC_MAX}
    Set Global Variable  ${body}
    ${body}=        Setar dados no body da API PJ residente
    ${body}=        Que eu altere o ${body} alterando o valor do campo authorizeOrderTransmissionByThird no objeto legalInvestor para B
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    #Que a ${resposta} tenha no erro o valor "Erro [DOMINIO_INVALIDO : B inválido] no campo \\u0027authorizeOrderTransmissionByThird\\u0027"
    Então a chamada deve ter status 422
TST0012: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (nonProfitCompanyIndicator) Dado invalido - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Empresa sem fins lucrativos?" Dado invalido. Aceita (true,false)
    [Tags]    NEGATIVO DOMINIO INVALIDO API
    ${TAG_NUMBER}=       Set Variable   TST0012
    ${PARTICIPANTE}=     Set Variable   ITAUBM
    ${DONO}=             Set Variable   SIM
    ${TOGGLE}=           Set Variable   S
    ${CNPJ_COMITENTE}=   Generate CNPJ with size   18
    Set Global Variable  ${TOGGLE}
    Set Global Variable  ${CNPJ_COMITENTE}
    Set Global Variable  ${DONO}
    Set Global Variable  ${PARTICIPANTE}
    Set Global Variable  ${TAG_NUMBER}

    Setar variaveis comitente PJ residente API
    Dado Que eu chame a api de inclusão de comitente PJ residente passando a apiKey ITAUAPIINT
    ${body}=   Que eu crie um novo body a partir de um ${JSON_INC_MAX}
    Set Global Variable  ${body}
    ${body}=        Setar dados no body da API PJ residente
    ${body}=        Que eu altere o ${body} alterando o valor do campo nonProfitCompanyIndicator no objeto legalInvestor para verdadeiro
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "Erro [DOMINIO_INVALIDO : Domínio inválido] no campo \\u0027nonProfitCompanyIndicator\\u0027"
    Então a chamada deve ter status 422
TST0013: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (administrativePortfolioManagerIndicator) Dado invalido - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Gestor de Carteiras Administradas" Dado invalido. Aceita (true,false)
    [Tags]    NEGATIVO DOMINIO INVALIDO API
    ${TAG_NUMBER}=       Set Variable   TST0013
    ${PARTICIPANTE}=     Set Variable   ITAUBM
    ${DONO}=             Set Variable   SIM
    ${TOGGLE}=           Set Variable   S
    ${CNPJ_COMITENTE}=   Generate CNPJ with size   18
    Set Global Variable  ${TOGGLE}
    Set Global Variable  ${CNPJ_COMITENTE}
    Set Global Variable  ${DONO}
    Set Global Variable  ${PARTICIPANTE}
    Set Global Variable  ${TAG_NUMBER}

    Setar variaveis comitente PJ residente API
    Dado Que eu chame a api de inclusão de comitente PJ residente passando a apiKey ITAUAPIINT
    ${body}=   Que eu crie um novo body a partir de um ${JSON_INC_MAX}
    Set Global Variable  ${body}
    ${body}=        Setar dados no body da API PJ residente
    ${body}=        Que eu altere o ${body} alterando o valor do campo administrativePortfolioManagerIndicator no objeto legalInvestor para verdadeiro
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "Erro [DOMINIO_INVALIDO : Domínio inválido] no campo \\u0027administrativePortfolioManagerIndicator\\u0027"
    Então a chamada deve ter status 422
TST0014: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (investmentFundAdministratorIndicator) Dado invalido - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Gestor de Fundos de Investimento" Dado invalido. Aceita (true,false)
    [Tags]    NEGATIVO DOMINIO INVALIDO API
    ${TAG_NUMBER}=       Set Variable   TST0014
    ${PARTICIPANTE}=     Set Variable   ITAUBM
    ${DONO}=             Set Variable   SIM
    ${TOGGLE}=           Set Variable   S
    ${CNPJ_COMITENTE}=   Generate CNPJ with size   18
    Set Global Variable  ${TOGGLE}
    Set Global Variable  ${CNPJ_COMITENTE}
    Set Global Variable  ${DONO}
    Set Global Variable  ${PARTICIPANTE}
    Set Global Variable  ${TAG_NUMBER}

    Setar variaveis comitente PJ residente API
    Dado Que eu chame a api de inclusão de comitente PJ residente passando a apiKey ITAUAPIINT
    ${body}=   Que eu crie um novo body a partir de um ${JSON_INC_MAX}
    Set Global Variable  ${body}
    ${body}=        Setar dados no body da API PJ residente
    ${body}=        Que eu altere o ${body} alterando o valor do campo investmentFundAdministratorIndicator no objeto legalInvestor para verdadeiro
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "Erro [DOMINIO_INVALIDO : Domínio inválido] no campo \\u0027investmentFundAdministratorIndicator\\u0027"
    Então a chamada deve ter status 422
TST0015: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (riskClassificationCode) Dado invalido - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Classificação de Risco do Comitente" Dado invalido. Aceita (A,B,M,O)
    [Tags]    NEGATIVO DOMINIO INVALIDO API
    ${TAG_NUMBER}=       Set Variable   TST0015
    ${PARTICIPANTE}=     Set Variable   ITAUBM
    ${DONO}=             Set Variable   SIM
    ${TOGGLE}=           Set Variable   S
    ${CNPJ_COMITENTE}=   Generate CNPJ with size   18
    Set Global Variable  ${TOGGLE}
    Set Global Variable  ${CNPJ_COMITENTE}
    Set Global Variable  ${DONO}
    Set Global Variable  ${PARTICIPANTE}
    Set Global Variable  ${TAG_NUMBER}

    Setar variaveis comitente PJ residente API
    Dado Que eu chame a api de inclusão de comitente PJ residente passando a apiKey ITAUAPIINT
    ${body}=   Que eu crie um novo body a partir de um ${JSON_INC_MAX}
    Set Global Variable  ${body}
    ${body}=        Setar dados no body da API PJ residente
    ${body}=        Que eu altere o ${body} alterando o valor do campo riskClassificationCode no objeto legalInvestor para C
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    #Que a ${resposta} tenha no erro o valor "Erro [DOMINIO_INVALIDO : C inválido] no campo \\u0027riskClassificationCode\\u0027"
    Então a chamada deve ter status 422
TST0016: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (addressTypeCode) Dado Invalido - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Tipo de Endereço" Dado invalido. Valores aceitos: "MATRIZ", "FILIAL", "SEM TIPO DE ENDERECO"
    [Tags]    NEGATIVO DOMINIO INVALIDO API
    ${TAG_NUMBER}=       Set Variable   TST0016
    ${PARTICIPANTE}=     Set Variable   ITAUBM
    ${DONO}=             Set Variable   SIM
    ${TOGGLE}=           Set Variable   S
    ${CNPJ_COMITENTE}=   Generate CNPJ with size   18
    Set Global Variable  ${TOGGLE}
    Set Global Variable  ${CNPJ_COMITENTE}
    Set Global Variable  ${DONO}
    Set Global Variable  ${PARTICIPANTE}
    Set Global Variable  ${TAG_NUMBER}

    Setar variaveis comitente PJ residente API
    Dado Que eu chame a api de inclusão de comitente PJ residente passando a apiKey ITAUAPIINT
    ${body}=   Que eu crie um novo body a partir de um ${JSON_INC_MAX}
    Set Global Variable  ${body}
    ${body}=        Setar dados no body da API PJ residente
    ${body}=        Que eu altere o ${body} alterando o valor do campo addressTypeCode no objeto legalInvestor.addressLegalInvestor para RESIDENCIAL
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    #Que a ${resposta} tenha no erro o valor "Erro [DOMINIO_INVALIDO : RESIDENCIAL inválido] no campo \\u0027addressTypeCode\\u0027"
    Então a chamada deve ter status 422
TST0017: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (stateCode) Dado Invalido - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "UF" Dado invalido.
    [Tags]    NEGATIVO DOMINIO INVALIDO API
    ${TAG_NUMBER}=       Set Variable   TST0017
    ${PARTICIPANTE}=     Set Variable   ITAUBM
    ${DONO}=             Set Variable   SIM
    ${TOGGLE}=           Set Variable   S
    ${CNPJ_COMITENTE}=   Generate CNPJ with size   18
    Set Global Variable  ${TOGGLE}
    Set Global Variable  ${CNPJ_COMITENTE}
    Set Global Variable  ${DONO}
    Set Global Variable  ${PARTICIPANTE}
    Set Global Variable  ${TAG_NUMBER}

    Setar variaveis comitente PJ residente API
    Dado Que eu chame a api de inclusão de comitente PJ residente passando a apiKey ITAUAPIINT
    ${body}=   Que eu crie um novo body a partir de um ${JSON_INC_MAX}
    Set Global Variable  ${body}
    ${body}=        Setar dados no body da API PJ residente
    ${body}=        Que eu altere o ${body} alterando o valor do campo stateCode no objeto legalInvestor.addressLegalInvestor para 94
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "Erro [DOMINIO_INVALIDO : Domínio inválido] no campo \\u0027stateCode\\u0027"
    Então a chamada deve ter status 422
TST0018: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (countryCode) Dado Invalido - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "País" Dado invalido.
    [Tags]    NEGATIVO DOMINIO INVALIDO API
    ${TAG_NUMBER}=       Set Variable   TST0018
    ${PARTICIPANTE}=     Set Variable   ITAUBM
    ${DONO}=             Set Variable   SIM
    ${TOGGLE}=           Set Variable   S
    ${CNPJ_COMITENTE}=   Generate CNPJ with size   18
    Set Global Variable  ${TOGGLE}
    Set Global Variable  ${CNPJ_COMITENTE}
    Set Global Variable  ${DONO}
    Set Global Variable  ${PARTICIPANTE}
    Set Global Variable  ${TAG_NUMBER}

    Setar variaveis comitente PJ residente API
    Dado Que eu chame a api de inclusão de comitente PJ residente passando a apiKey ITAUAPIINT
    ${body}=   Que eu crie um novo body a partir de um ${JSON_INC_MAX}
    Set Global Variable  ${body}
    ${body}=        Setar dados no body da API PJ residente
    ${body}=        Que eu altere o ${body} alterando o valor do campo countryCode no objeto legalInvestor.addressLegalInvestor para 112233445
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "Erro [DOMINIO_INVALIDO : Domínio inválido] no campo \\u0027countryCode\\u0027"
    Então a chamada deve ter status 422
TST0019: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (emailTypeCode) Dominio invalido - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Tipo de E-mail" Dominio invalido. Valores aceitos: "COMERCIAL", "PARTICULAR"
    [Tags]    NEGATIVO DOMINIO INVALIDO API
    ${TAG_NUMBER}=       Set Variable   TST0019
    ${PARTICIPANTE}=     Set Variable   ITAUBM
    ${DONO}=             Set Variable   SIM
    ${TOGGLE}=           Set Variable   S
    ${CNPJ_COMITENTE}=   Generate CNPJ with size   18
    Set Global Variable  ${TOGGLE}
    Set Global Variable  ${CNPJ_COMITENTE}
    Set Global Variable  ${DONO}
    Set Global Variable  ${PARTICIPANTE}
    Set Global Variable  ${TAG_NUMBER}

    Setar variaveis comitente PJ residente API
    Dado Que eu chame a api de inclusão de comitente PJ residente passando a apiKey ITAUAPIINT
    ${body}=   Que eu crie um novo body a partir de um ${JSON_INC_MAX}
    Set Global Variable  ${body}
    ${body}=        Setar dados no body da API PJ residente
    ${body}=        Que eu altere o ${body} alterando o valor do campo emailTypeCode no objeto legalInvestor.addressLegalInvestor.emailLegalInvestor para PRIVADO
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    #Que a ${resposta} tenha no erro o valor "Erro [DOMINIO_INVALIDO : PRIVADO inválido] no campo \\u0027emailTypeCode\\u0027"
    Então a chamada deve ter status 422
TST0020: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (phoneTypeCode) Dominio invalido - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Tipo de Telefone" Dominio invalido. Valores aceitos: "COMERCIAL", "PARTICULAR"
    [Tags]    NEGATIVO DOMINIO INVALIDO API
    ${TAG_NUMBER}=       Set Variable   TST0020
    ${PARTICIPANTE}=     Set Variable   ITAUBM
    ${DONO}=             Set Variable   SIM
    ${TOGGLE}=           Set Variable   S
    ${CNPJ_COMITENTE}=   Generate CNPJ with size   18
    Set Global Variable  ${TOGGLE}
    Set Global Variable  ${CNPJ_COMITENTE}
    Set Global Variable  ${DONO}
    Set Global Variable  ${PARTICIPANTE}
    Set Global Variable  ${TAG_NUMBER}

    Setar variaveis comitente PJ residente API
    Dado Que eu chame a api de inclusão de comitente PJ residente passando a apiKey ITAUAPIINT
    ${body}=   Que eu crie um novo body a partir de um ${JSON_INC_MAX}
    Set Global Variable  ${body}
    ${body}=        Setar dados no body da API PJ residente
    ${body}=        Que eu altere o ${body} alterando o valor do campo phoneTypeCode no objeto legalInvestor.addressLegalInvestor.addressPhoneLegalInvestor para PRIVADO
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    #Que a ${resposta} tenha no erro o valor "Erro [DOMINIO_INVALIDO : PRIVADO inválido] no campo \\u0027phoneTypeCode\\u0027"
    Então a chamada deve ter status 422
TST0021: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (representativeTypeCode) Dominio Invalido - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Tipo de Representante" Dominio Invalido. Valores aceitos: "Controlador Direto PF", "Controlador Direto PJ", "Controladora", "Controlada", "Coligada", "Administrador", "Procurador", "Responsável pela Custódia", "Representante Legal"
    [Tags]    NEGATIVO DOMINIO INVALIDO API
    ${TAG_NUMBER}=       Set Variable   TST0021
    ${CNPJ_COMITENTE}=   Generate CNPJ with size   18
    ${PARTICIPANTE}=     Set Variable   ITAUBM
    ${DONO}=             Set Variable   SIM
    ${TOGGLE}=           Set Variable   S
    Set Global Variable  ${TOGGLE}
    Set Global Variable  ${CNPJ_COMITENTE}
    Set Global Variable  ${DONO}
    Set Global Variable  ${PARTICIPANTE}
    Set Global Variable  ${TAG_NUMBER}

    Setar variaveis comitente PJ residente API
    Dado Que eu chame a api de inclusão de comitente PJ residente passando a apiKey ITAUAPIINT
    ${body}=        Que eu crie um novo body a partir de um ${JSON_INC_MAX}
    Set Global Variable  ${body}
    ${body}=        Que eu altere o ${body} alterando o valor do campo representativeTypeCode no objeto representativeInvestor para Controlador
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    #Que a ${resposta} tenha no erro o valor "Erro [DOMINIO_INVALIDO : Controlador inválido] no campo \\u0027representativeTypeCode\\u0027"
    Então a chamada deve ter status 422
TST0022: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (documentTypeCode: Representante) Dominio invalido - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Tipo de Documento" -  Dominio invalido. Valores aceitos: "OUTROS", "CPF", "CNPJ"
    [Tags]    NEGATIVO DOMINIO INVALIDO API
    ${TAG_NUMBER}=       Set Variable   TST0022
    ${PARTICIPANTE}=     Set Variable   ITAUBM
    ${DONO}=             Set Variable   SIM
    ${TOGGLE}=           Set Variable   S
    ${CNPJ_COMITENTE}=   Generate CNPJ with size   18
    Set Global Variable  ${TOGGLE}
    Set Global Variable  ${CNPJ_COMITENTE}
    Set Global Variable  ${DONO}
    Set Global Variable  ${PARTICIPANTE}
    Set Global Variable  ${TAG_NUMBER}

    Setar variaveis comitente PJ residente API
    Dado Que eu chame a api de inclusão de comitente PJ residente passando a apiKey ITAUAPIINT
    ${body}=   Que eu crie um novo body a partir de um ${JSON_INC_MAX}
    Set Global Variable  ${body}
    ${body}=        Setar dados no body da API PJ residente
    ${body}=        Que eu altere o ${body} alterando o valor do campo documentTypeCode no objeto representativeInvestor para NENHUM
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "Erro [DOMINIO_INVALIDO : NENHUM inválido] no campo \\u0027documentTypeCode\\u0027"
    Então a chamada deve ter status 422
TST0023: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (politicallyExposedPersonCode: Representante) Dominio Invalido - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Pessoa Exposta Politicamente" -  Dominio Invalido. Valores aceitos: "VERDADEIRO", "FALSO", "NAO_INFORMADO"
    [Tags]    NEGATIVO DOMINIO INVALIDO API
    ${TAG_NUMBER}=       Set Variable   TST0023
    ${PARTICIPANTE}=     Set Variable   ITAUBM
    ${DONO}=             Set Variable   SIM
    ${TOGGLE}=           Set Variable   S
    ${CNPJ_COMITENTE}=   Generate CNPJ with size   18
    Set Global Variable  ${TOGGLE}
    Set Global Variable  ${CNPJ_COMITENTE}
    Set Global Variable  ${DONO}
    Set Global Variable  ${PARTICIPANTE}
    Set Global Variable  ${TAG_NUMBER}

    Setar variaveis comitente PJ residente API
    Dado Que eu chame a api de inclusão de comitente PJ residente passando a apiKey ITAUAPIINT
    ${body}=   Que eu crie um novo body a partir de um ${JSON_INC_MAX}
    Set Global Variable  ${body}
    ${body}=        Setar dados no body da API PJ residente
    ${body}=        Que eu altere o ${body} alterando o valor do campo politicallyExposedPersonCode no objeto representativeInvestor para TRUE
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "Erro [DOMINIO_INVALIDO : TRUE inválido] no campo \\u0027politicallyExposedPersonCode\\u0027"
    Então a chamada deve ter status 422
TST0024: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (addressTypeCode: Representante Procurador) Dado Invalido - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Tipo de Endereço" Dado invalido. Valores aceitos: "COMERCIAL", "RESIDENCIAL", "SEM TIPO DE ENDERECO"
    [Tags]    NEGATIVO DOMINIO INVALIDO API
    ${TAG_NUMBER}=       Set Variable   TST0024
    ${PARTICIPANTE}=     Set Variable   ITAUBM
    ${DONO}=             Set Variable   SIM
    ${TOGGLE}=           Set Variable   S
    ${CNPJ_COMITENTE}=   Generate CNPJ with size   18
    Set Global Variable  ${TOGGLE}
    Set Global Variable  ${CNPJ_COMITENTE}
    Set Global Variable  ${DONO}
    Set Global Variable  ${PARTICIPANTE}
    Set Global Variable  ${TAG_NUMBER}

    Setar variaveis comitente PJ residente API
    Dado Que eu chame a api de inclusão de comitente PJ residente passando a apiKey ITAUAPIINT
    ${body}=   Que eu crie um novo body a partir de um ${JSON_INC_MAX}
    Set Global Variable  ${body}
    ${body}=        Setar dados no body da API PJ residente
    ${body}=        Que eu altere o ${body} alterando o valor do campo addressTypeCode no objeto representativeInvestor.addressRepresentativeLegalInvestor para FILIAL
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "Erro [DOMINIO_INVALIDO : FILIAL inválido] no campo \\u0027addressTypeCode\\u0027"
    Então a chamada deve ter status 422
TST0025: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (stateCode: Representante Procurador) Dado Invalido - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "UF" Dado invalido.
    [Tags]    NEGATIVO DOMINIO INVALIDO API
    ${TAG_NUMBER}=       Set Variable   TST0025
    ${PARTICIPANTE}=     Set Variable   ITAUBM
    ${DONO}=             Set Variable   SIM
    ${TOGGLE}=           Set Variable   S
    ${CNPJ_COMITENTE}=   Generate CNPJ with size   18
    Set Global Variable  ${TOGGLE}
    Set Global Variable  ${CNPJ_COMITENTE}
    Set Global Variable  ${DONO}
    Set Global Variable  ${PARTICIPANTE}
    Set Global Variable  ${TAG_NUMBER}

    Setar variaveis comitente PJ residente API
    Dado Que eu chame a api de inclusão de comitente PJ residente passando a apiKey ITAUAPIINT
    ${body}=   Que eu crie um novo body a partir de um ${JSON_INC_MAX}
    Set Global Variable  ${body}
    ${body}=        Setar dados no body da API PJ residente
    ${body}=        Que eu altere o ${body} alterando o valor do campo stateCode no objeto representativeInvestor.addressRepresentativeLegalInvestor para 94
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "Erro [DOMINIO_INVALIDO : Domínio inválido] no campo \\u0027stateCode\\u0027"
    Então a chamada deve ter status 422
TST0026: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (countryCode: Representante Procurador) Dado Invalido - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "País" Dado invalido.
    [Tags]    NEGATIVO DOMINIO INVALIDO API
    ${TAG_NUMBER}=       Set Variable   TST0026
    ${PARTICIPANTE}=     Set Variable   ITAUBM
    ${DONO}=             Set Variable   SIM
    ${TOGGLE}=           Set Variable   S
    ${CNPJ_COMITENTE}=   Generate CNPJ with size   18
    Set Global Variable  ${TOGGLE}
    Set Global Variable  ${CNPJ_COMITENTE}
    Set Global Variable  ${DONO}
    Set Global Variable  ${PARTICIPANTE}
    Set Global Variable  ${TAG_NUMBER}

    Setar variaveis comitente PJ residente API
    Dado Que eu chame a api de inclusão de comitente PJ residente passando a apiKey ITAUAPIINT
    ${body}=   Que eu crie um novo body a partir de um ${JSON_INC_MAX}
    Set Global Variable  ${body}
    ${body}=        Setar dados no body da API PJ residente
    ${body}=        Que eu altere o ${body} alterando o valor do campo countryCode no objeto representativeInvestor.addressRepresentativeLegalInvestor para 112233445
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "Erro [DOMINIO_INVALIDO : Domínio inválido] no campo \\u0027countryCode\\u0027"
    Então a chamada deve ter status 422
TST0027: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (emailTypeCode: Representante Procurador) Dominio invalido - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Tipo de E-mail" Dominio invalido. Valores aceitos: "COMERCIAL", "PARTICULAR"
    [Tags]    NEGATIVO DOMINIO INVALIDO API
    ${TAG_NUMBER}=       Set Variable   TST0027
    ${PARTICIPANTE}=     Set Variable   ITAUBM
    ${DONO}=             Set Variable   SIM
    ${TOGGLE}=           Set Variable   S
    ${CNPJ_COMITENTE}=   Generate CNPJ with size   18
    Set Global Variable  ${TOGGLE}
    Set Global Variable  ${CNPJ_COMITENTE}
    Set Global Variable  ${DONO}
    Set Global Variable  ${PARTICIPANTE}
    Set Global Variable  ${TAG_NUMBER}

    Setar variaveis comitente PJ residente API
    Dado Que eu chame a api de inclusão de comitente PJ residente passando a apiKey ITAUAPIINT
    ${body}=   Que eu crie um novo body a partir de um ${JSON_INC_MAX}
    Set Global Variable  ${body}
    ${body}=        Setar dados no body da API PJ residente
    ${body}=        Que eu altere o ${body} alterando o valor do campo emailTypeCode no objeto representativeInvestor.addressRepresentativeLegalInvestor.emailRepresentativeLegalInvestor para PRIVADO
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "Domínio inválido para o campo Tipo Email : PRIVADO;"
    Então a chamada deve ter status 422
TST0028: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (phoneTypeCode: Representante Procurador) Dominio invalido - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Tipo de Telefone" Dominio invalido. Valores aceitos: "COMERCIAL", "PARTICULAR"
    [Tags]    NEGATIVO DOMINIO INVALIDO API
    ${TAG_NUMBER}=       Set Variable   TST0028
    ${PARTICIPANTE}=     Set Variable   ITAUBM
    ${DONO}=             Set Variable   SIM
    ${TOGGLE}=           Set Variable   S
    ${CNPJ_COMITENTE}=   Generate CNPJ with size   18
    Set Global Variable  ${TOGGLE}
    Set Global Variable  ${CNPJ_COMITENTE}
    Set Global Variable  ${DONO}
    Set Global Variable  ${PARTICIPANTE}
    Set Global Variable  ${TAG_NUMBER}

    Setar variaveis comitente PJ residente API
    Dado Que eu chame a api de inclusão de comitente PJ residente passando a apiKey ITAUAPIINT
    ${body}=   Que eu crie um novo body a partir de um ${JSON_INC_MAX}
    Set Global Variable  ${body}
    ${body}=        Setar dados no body da API PJ residente
    ${body}=        Que eu altere o ${body} alterando o valor do campo phoneTypeCode no objeto representativeInvestor.addressRepresentativeLegalInvestor.addressPhoneRepresentativeLegalInvestor para PRIVADO
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "Erro [DOMINIO_INVALIDO : PRIVADO inválido] no campo \\u0027phoneTypeCode\\u0027"
    Então a chamada deve ter status 422
    Sleep  2s
TST0029: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (emailName) Dominio invalido - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "E-mail" Dominio invalido
    [Tags]    NEGATIVO DOMINIO INVALIDO API
    ${TAG_NUMBER}=       Set Variable   TST0029
    ${PARTICIPANTE}=     Set Variable   ITAUBM
    ${DONO}=             Set Variable   SIM
    ${TOGGLE}=           Set Variable   S
    ${CNPJ_COMITENTE}=   Generate CNPJ with size   18
    Set Global Variable  ${TOGGLE}
    Set Global Variable  ${CNPJ_COMITENTE}
    Set Global Variable  ${DONO}
    Set Global Variable  ${PARTICIPANTE}
    Set Global Variable  ${TAG_NUMBER}

    Setar variaveis comitente PJ residente API
    Dado Que eu chame a api de inclusão de comitente PJ residente passando a apiKey ITAUAPIINT
    ${body}=   Que eu crie um novo body a partir de um ${JSON_INC_MAX}
    Set Global Variable  ${body}
    ${body}=        Setar dados no body da API PJ residente
    ${body}=        Que eu altere o ${body} alterando o valor do campo emailName no objeto legalInvestor.addressLegalInvestor.emailLegalInvestor para testeEmail.com.br
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "Erro [CONTEUDO_INVALIDO : Campo com conteúdo inválido testeEmail.com.br.] no campo \\u0027emailName\\u0027"
    Então a chamada deve ter status 422
TST0030: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (emailName: Representante Procurador) Dominio invalido - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "E-mail" Dominio invalido
    [Tags]    NEGATIVO DOMINIO INVALIDO API
    ${TAG_NUMBER}=       Set Variable   TST0030
    ${PARTICIPANTE}=     Set Variable   ITAUBM
    ${DONO}=             Set Variable   SIM
    ${TOGGLE}=           Set Variable   S
    ${CNPJ_COMITENTE}=   Generate CNPJ with size   18
    Set Global Variable  ${TOGGLE}
    Set Global Variable  ${CNPJ_COMITENTE}
    Set Global Variable  ${DONO}
    Set Global Variable  ${PARTICIPANTE}
    Set Global Variable  ${TAG_NUMBER}

    Setar variaveis comitente PJ residente API
    Dado Que eu chame a api de inclusão de comitente PJ residente passando a apiKey ITAUAPIINT
    ${body}=   Que eu crie um novo body a partir de um ${JSON_INC_MAX}
    Set Global Variable  ${body}
    ${body}=        Setar dados no body da API PJ residente
    ${body}=        Que eu altere o ${body} alterando o valor do campo emailName no objeto representativeInvestor.addressRepresentativeLegalInvestor.emailRepresentativeLegalInvestor para testeEmail.com.br
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "Erro [CONTEUDO_INVALIDO : Campo com conteúdo inválido testeEmail.com.br.] no campo \\u0027emailName\\u0027"
    Então a chamada deve ter status 422
#    #Parar Gravacao
*** Variable ***
${TIPO_ENDERECO}=     MATRIZ
${TIPO_PESSOA}=       Pessoa Jurídica
${TIPO_EMAIL}=        PARTICULAR
${BAIRRO}=            CENTRO
${PAIS}=              BRASIL
${JSON_INC_MIN}=      ${CURDIR}\\..\\..\\JSON\\JSON_COMITENTE_PJ_MINIMO.json
${JSON_INC_MAX}=      ${CURDIR}\\..\\..\\JSON\\JSON_COMITENTE_PJ_MAXIMO.json

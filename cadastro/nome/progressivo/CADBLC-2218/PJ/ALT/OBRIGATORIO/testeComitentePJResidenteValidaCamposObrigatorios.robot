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
TST0000: PJ RESIDENTE (API) - Massa Inclusão ITAUBM Dados Maximos e depara no NoMe - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar sucesso no cadastro com dados máximos preenchidos
    [Tags]    POSITIVO_API_1
    ${TAG_NUMBER}=       Set Variable   TST0000
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
    ${body}=        Que eu crie um novo body a partir de um ${JSON_INC_MIN}
    Set Global Variable  ${body}
    ${body}=    Setar dados no body da API PJ residente
    Set Global Variable  ${body}
    ${resposta}=         Que eu faça uma chamada POST enviando o ${body}
    Set Global Variable  ${resposta}
    #Então a chamada deve ter status 200
TST0001: PJ RESIDENTE (API) - Alteração ITAUBM Campo Obrigatorio (confirmationDataIndicator) - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Instituição Financeira confirma as informações cadastrais do cliente?" como obrigatório
    [Tags]    NEGATIVO CAMPO OBRIGATORIO API
    ${TAG_NUMBER}=       Set Variable   TST0001
    ${PARTICIPANTE}=     Set Variable   ITAUBM
    ${DONO}=             Set Variable   SIM
    ${TOGGLE}=           Set Variable   S
    Set Global Variable  ${TOGGLE}
    Set Global Variable  ${DONO}
    Set Global Variable  ${PARTICIPANTE}
    Set Global Variable  ${TAG_NUMBER}

    Setar variaveis comitente PJ residente API
    Dado Que eu chame a api de alteração de comitente PJ residente passando a apiKey ITAUAPIINT
    ${body}=        Que eu crie um novo body a partir de um ${JSON_INC_MIN}
    Set Global Variable  ${body}
    ${body}=        Que eu remova do ${body} o campo confirmationDataIndicator
    ${resposta}=    Que eu faça uma chamada PUT enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "O campo \\"confirmationDataIndicator\\" deve ser informado"
    Então a chamada deve ter status 422
TST0002: PJ RESIDENTE (API) - Alteração ITAUBM Campo Obrigatorio (customerAccountHolderCode) - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Titular da Conta Cliente (Conta Própria)" como obrigatório
    [Tags]    NEGATIVO CAMPO OBRIGATORIO API
    ${TAG_NUMBER}=       Set Variable   TST0002
    ${PARTICIPANTE}=     Set Variable   ITAUBM
    ${DONO}=             Set Variable   SIM
    ${TOGGLE}=           Set Variable   S
    Set Global Variable  ${TOGGLE}
    Set Global Variable  ${DONO}
    Set Global Variable  ${PARTICIPANTE}
    Set Global Variable  ${TAG_NUMBER}

    Setar variaveis comitente PJ residente API
    Dado Que eu chame a api de alteração de comitente PJ residente passando a apiKey ITAUAPIINT
    ${body}=        Que eu crie um novo body a partir de um ${JSON_INC_MIN}
    Set Global Variable  ${body}
    ${body}=        Que eu remova do ${body} o campo customerAccountHolderCode no objeto investor
    ${resposta}=    Que eu faça uma chamada PUT enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "O campo \\"customerAccountHolderCode\\" deve ser informado"
    Então a chamada deve ter status 422
TST0003: PJ RESIDENTE (API) - Alteração ITAUBM Campo Obrigatorio (documentNumber) - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "CPF/CNPJ do Comitente" como obrigatório
    [Tags]    NEGATIVO CAMPO OBRIGATORIO API
    ${TAG_NUMBER}=       Set Variable   TST0003
    ${PARTICIPANTE}=     Set Variable   ITAUBM
    ${DONO}=             Set Variable   SIM
    ${TOGGLE}=           Set Variable   S
    Set Global Variable  ${TOGGLE}
    Set Global Variable  ${DONO}
    Set Global Variable  ${PARTICIPANTE}
    Set Global Variable  ${TAG_NUMBER}

    Setar variaveis comitente PJ residente API
    Dado Que eu chame a api de alteração de comitente PJ residente passando a apiKey ITAUAPIINT
    ${body}=        Que eu crie um novo body a partir de um ${JSON_INC_MIN}
    Set Global Variable  ${body}
    ${body}=        Setar dados no body da API PJ residente
    ${body}=        Que eu remova do ${body} o campo documentNumber no objeto investor
    ${resposta}=    Que eu faça uma chamada PUT enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "O campo \\"documentNumber\\" deve ser informado"
    Então a chamada deve ter status 422
TST0004: PJ RESIDENTE (API) - Alteração ITAUBM Campo Obrigatorio (residenceCountryCode) - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "País de Residência" como obrigatório
    [Tags]    NEGATIVO CAMPO OBRIGATORIO API
    ${TAG_NUMBER}=       Set Variable   TST0004
    ${PARTICIPANTE}=     Set Variable   ITAUBM
    ${DONO}=             Set Variable   SIM
    ${TOGGLE}=           Set Variable   S
    Set Global Variable  ${TOGGLE}
    Set Global Variable  ${DONO}
    Set Global Variable  ${PARTICIPANTE}
    Set Global Variable  ${TAG_NUMBER}

    Setar variaveis comitente PJ residente API
    Dado Que eu chame a api de alteração de comitente PJ residente passando a apiKey ITAUAPIINT
    ${body}=        Que eu crie um novo body a partir de um ${JSON_INC_MIN}
    Set Global Variable  ${body}
    ${body}=        Setar dados no body da API PJ residente
    ${body}=        Que eu remova do ${body} o campo residenceCountryCode no objeto investor
    ${resposta}=    Que eu faça uma chamada PUT enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "O campo \\"residenceCountryCode\\" deve ser informado"
    Então a chamada deve ter status 422
TST0005: PJ RESIDENTE (API) - Alteração ITAUBM Campo Obrigatorio (taxNatureCode) - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Natureza Fiscal" como obrigatório
    [Tags]    NEGATIVO CAMPO OBRIGATORIO API
    ${TAG_NUMBER}=       Set Variable   TST0005
    ${PARTICIPANTE}=     Set Variable   ITAUBM
    ${DONO}=             Set Variable   SIM
    ${TOGGLE}=           Set Variable   S
    Set Global Variable  ${TOGGLE}
    Set Global Variable  ${DONO}
    Set Global Variable  ${PARTICIPANTE}
    Set Global Variable  ${TAG_NUMBER}

    Setar variaveis comitente PJ residente API
    Dado Que eu chame a api de alteração de comitente PJ residente passando a apiKey ITAUAPIINT
    ${body}=        Que eu crie um novo body a partir de um ${JSON_INC_MIN}
    Set Global Variable  ${body}
    ${body}=        Setar dados no body da API PJ residente
    ${body}=        Que eu remova do ${body} o campo taxNatureCode no objeto investor
    ${resposta}=    Que eu faça uma chamada PUT enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "O campo \\"taxNatureCode\\" deve ser informado"
    Então a chamada deve ter status 422
TST0006: PJ RESIDENTE (API) - Alteração ITAUBM Campo Obrigatorio (investorName) - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Comitente(Nome/Razão Social)" como obrigatório
    [Tags]    NEGATIVO CAMPO OBRIGATORIO API
    ${TAG_NUMBER}=       Set Variable   TST0006
    ${PARTICIPANTE}=     Set Variable   ITAUBM
    ${DONO}=             Set Variable   SIM
    ${TOGGLE}=           Set Variable   S
    Set Global Variable  ${TOGGLE}
    Set Global Variable  ${DONO}
    Set Global Variable  ${PARTICIPANTE}
    Set Global Variable  ${TAG_NUMBER}

    Setar variaveis comitente PJ residente API
    Dado Que eu chame a api de alteração de comitente PJ residente passando a apiKey ITAUAPIINT
    ${body}=        Que eu crie um novo body a partir de um ${JSON_INC_MIN}
    Set Global Variable  ${body}
    ${body}=        Setar dados no body da API PJ residente
    ${body}=        Que eu remova do ${body} o campo investorName no objeto investor
    ${resposta}=    Que eu faça uma chamada PUT enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "O campo \\"investorName\\" deve ser informado"
    Então a chamada deve ter status 422
TST0007: PJ RESIDENTE (API) - Alteração ITAUBM Campo Obrigatorio (companyStartDate) - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Data de Fundação/Constituição" como obrigatório
    [Tags]    NEGATIVO CAMPO OBRIGATORIO API
    ${TAG_NUMBER}=       Set Variable   TST0007
    ${PARTICIPANTE}=     Set Variable   ITAUBM
    ${DONO}=             Set Variable   SIM
    ${TOGGLE}=           Set Variable   S
    Set Global Variable  ${TOGGLE}
    Set Global Variable  ${DONO}
    Set Global Variable  ${PARTICIPANTE}
    Set Global Variable  ${TAG_NUMBER}

    Setar variaveis comitente PJ residente API
    Dado Que eu chame a api de alteração de comitente PJ residente passando a apiKey ITAUAPIINT
    ${body}=        Que eu crie um novo body a partir de um ${JSON_INC_MIN}
    Set Global Variable  ${body}
    ${body}=        Setar dados no body da API PJ residente
    ${body}=        Que eu remova do ${body} o campo companyStartDate no objeto legalInvestor
    ${resposta}=    Que eu faça uma chamada PUT enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "O campo \\"companyStartDate\\" deve ser informado"
    Então a chamada deve ter status 422
TST0008: PJ RESIDENTE (API) - Alteração ITAUBM Campo Obrigatorio (economicActivityCode) - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "CNAE - Atividade Principal Desenvolvida" como obrigatório
    [Tags]    NEGATIVO CAMPO OBRIGATORIO API
    ${TAG_NUMBER}=       Set Variable   TST0008
    ${PARTICIPANTE}=     Set Variable   ITAUBM
    ${DONO}=             Set Variable   SIM
    ${TOGGLE}=           Set Variable   S
    Set Global Variable  ${TOGGLE}
    Set Global Variable  ${DONO}
    Set Global Variable  ${PARTICIPANTE}
    Set Global Variable  ${TAG_NUMBER}

    Setar variaveis comitente PJ residente API
    Dado Que eu chame a api de alteração de comitente PJ residente passando a apiKey ITAUAPIINT
    ${body}=        Que eu crie um novo body a partir de um ${JSON_INC_MIN}
    Set Global Variable  ${body}
    ${body}=        Setar dados no body da API PJ residente
    ${body}=        Que eu remova do ${body} o campo economicActivityCode no objeto legalInvestor
    ${resposta}=    Que eu faça uma chamada PUT enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "O campo \\"economicActivityCode\\" deve ser informado"
    Então a chamada deve ter status 422
TST0009: PJ RESIDENTE (API) - Alteração ITAUBM Campo Obrigatorio (addressTypeCode) - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Tipo de Endereço" como obrigatório
    [Tags]    NEGATIVO CAMPO OBRIGATORIO API
    ${TAG_NUMBER}=       Set Variable   TST0009
    ${PARTICIPANTE}=     Set Variable   ITAUBM
    ${DONO}=             Set Variable   SIM
    ${TOGGLE}=           Set Variable   S
    Set Global Variable  ${TOGGLE}
    Set Global Variable  ${DONO}
    Set Global Variable  ${PARTICIPANTE}
    Set Global Variable  ${TAG_NUMBER}

    Setar variaveis comitente PJ residente API
    Dado Que eu chame a api de alteração de comitente PJ residente passando a apiKey ITAUAPIINT
    ${body}=   Que eu crie um novo body a partir de um ${JSON_INC_MIN}
    Set Global Variable  ${body}
    ${body}=   Setar dados no body da API PJ residente
    ${body}=   Que eu remova do ${body} o campo addressTypeCode no objeto legalInvestor.addressLegalInvestor
    ${resposta}=        Que eu faça uma chamada PUT enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "O campo \\"addressTypeCode\\" deve ser informado"
    Então a chamada deve ter status 422
TST0010: PJ RESIDENTE (API) - Alteração ITAUBM Campo Obrigatorio (addressTypeName) - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Logradouro" como obrigatório
    [Tags]    NEGATIVO CAMPO OBRIGATORIO API
    ${TAG_NUMBER}=       Set Variable   TST0010
    ${PARTICIPANTE}=     Set Variable   ITAUBM
    ${DONO}=             Set Variable   SIM
    ${TOGGLE}=           Set Variable   S
    Set Global Variable  ${TOGGLE}
    Set Global Variable  ${DONO}
    Set Global Variable  ${PARTICIPANTE}
    Set Global Variable  ${TAG_NUMBER}

    Setar variaveis comitente PJ residente API
    Dado Que eu chame a api de alteração de comitente PJ residente passando a apiKey ITAUAPIINT
    ${body}=   Que eu crie um novo body a partir de um ${JSON_INC_MIN}
    Set Global Variable  ${body}
    ${body}=   Setar dados no body da API PJ residente
    ${body}=   Que eu remova do ${body} o campo addressTypeName no objeto legalInvestor.addressLegalInvestor
    ${resposta}=        Que eu faça uma chamada PUT enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "O campo \\"addressTypeName\\" deve ser informado"
    Então a chamada deve ter status 422
TST0011: PJ RESIDENTE (API) - Alteração ITAUBM Campo Obrigatorio (addressNumber) - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Número Logradouro" como obrigatório
    [Tags]    NEGATIVO CAMPO OBRIGATORIO API
    ${TAG_NUMBER}=       Set Variable   TST0011
    ${PARTICIPANTE}=     Set Variable   ITAUBM
    ${DONO}=             Set Variable   SIM
    ${TOGGLE}=           Set Variable   S
    Set Global Variable  ${TOGGLE}
    Set Global Variable  ${DONO}
    Set Global Variable  ${PARTICIPANTE}
    Set Global Variable  ${TAG_NUMBER}

    Setar variaveis comitente PJ residente API
    Dado Que eu chame a api de alteração de comitente PJ residente passando a apiKey ITAUAPIINT
    ${body}=   Que eu crie um novo body a partir de um ${JSON_INC_MIN}
    Set Global Variable  ${body}
    ${body}=   Setar dados no body da API PJ residente
    ${body}=   Que eu remova do ${body} o campo addressNumber no objeto legalInvestor.addressLegalInvestor
    ${resposta}=    Que eu faça uma chamada PUT enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "O campo \\"addressNumber\\" deve ser informado"
    Então a chamada deve ter status 422
TST0012: PJ RESIDENTE (API) - Alteração ITAUBM Campo Obrigatorio (neighborhoodName) - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Bairro" como obrigatório
    [Tags]    NEGATIVO CAMPO OBRIGATORIO API
    ${TAG_NUMBER}=       Set Variable   TST0012
    ${PARTICIPANTE}=     Set Variable   ITAUBM
    ${DONO}=             Set Variable   SIM
    ${TOGGLE}=           Set Variable   S
    Set Global Variable  ${TOGGLE}
    Set Global Variable  ${DONO}
    Set Global Variable  ${PARTICIPANTE}
    Set Global Variable  ${TAG_NUMBER}

    Setar variaveis comitente PJ residente API
    Dado Que eu chame a api de alteração de comitente PJ residente passando a apiKey ITAUAPIINT
    ${body}=   Que eu crie um novo body a partir de um ${JSON_INC_MIN}
    Set Global Variable  ${body}
    ${body}=   Setar dados no body da API PJ residente
    ${body}=   Que eu remova do ${body} o campo neighborhoodName no objeto legalInvestor.addressLegalInvestor
    ${resposta}=    Que eu faça uma chamada PUT enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "O campo \\"neighborhoodName\\" deve ser informado"
    Então a chamada deve ter status 422
TST0013: PJ RESIDENTE (API) - Alteração ITAUBM Campo Obrigatorio (stateCode) - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "UF" como obrigatório
    [Tags]    NEGATIVO CAMPO OBRIGATORIO API
    ${TAG_NUMBER}=       Set Variable   TST0013
    ${PARTICIPANTE}=     Set Variable   ITAUBM
    ${DONO}=             Set Variable   SIM
    ${TOGGLE}=           Set Variable   S
    Set Global Variable  ${TOGGLE}
    Set Global Variable  ${DONO}
    Set Global Variable  ${PARTICIPANTE}
    Set Global Variable  ${TAG_NUMBER}

    Setar variaveis comitente PJ residente API
    Dado Que eu chame a api de alteração de comitente PJ residente passando a apiKey ITAUAPIINT
    ${body}=   Que eu crie um novo body a partir de um ${JSON_INC_MIN}
    Set Global Variable  ${body}
    ${body}=   Setar dados no body da API PJ residente
    ${body}=   Que eu remova do ${body} o campo stateCode no objeto legalInvestor.addressLegalInvestor
    ${resposta}=    Que eu faça uma chamada PUT enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "O campo \\"stateCode\\" deve ser informado"
    Então a chamada deve ter status 422
TST0014: PJ RESIDENTE (API) - Alteração ITAUBM Campo Obrigatorio (cityCode) - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Tipo Município" como obrigatório
    [Tags]    NEGATIVO CAMPO OBRIGATORIO API
    ${TAG_NUMBER}=       Set Variable   TST0014
    ${PARTICIPANTE}=     Set Variable   ITAUBM
    ${DONO}=             Set Variable   SIM
    ${TOGGLE}=           Set Variable   S
    Set Global Variable  ${TOGGLE}
    Set Global Variable  ${DONO}
    Set Global Variable  ${PARTICIPANTE}
    Set Global Variable  ${TAG_NUMBER}

    Setar variaveis comitente PJ residente API
    Dado Que eu chame a api de alteração de comitente PJ residente passando a apiKey ITAUAPIINT
    ${body}=   Que eu crie um novo body a partir de um ${JSON_INC_MIN}
    Set Global Variable  ${body}
    ${body}=   Setar dados no body da API PJ residente
    ${body}=   Que eu remova do ${body} o campo cityCode no objeto legalInvestor.addressLegalInvestor
    ${resposta}=    Que eu faça uma chamada PUT enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "O campo \\"cityCode\\" deve ser informado"
    Então a chamada deve ter status 422
TST0015: PJ RESIDENTE (API) - Alteração ITAUBM Campo Obrigatorio (zipCode) - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "CEP" como obrigatório
    [Tags]    NEGATIVO CAMPO OBRIGATORIO API
    ${TAG_NUMBER}=       Set Variable   TST0015
    ${PARTICIPANTE}=     Set Variable   ITAUBM
    ${DONO}=             Set Variable   SIM
    ${TOGGLE}=           Set Variable   S
    Set Global Variable  ${TOGGLE}
    Set Global Variable  ${DONO}
    Set Global Variable  ${PARTICIPANTE}
    Set Global Variable  ${TAG_NUMBER}

    Setar variaveis comitente PJ residente API
    Dado Que eu chame a api de alteração de comitente PJ residente passando a apiKey ITAUAPIINT
    ${body}=   Que eu crie um novo body a partir de um ${JSON_INC_MIN}
    Set Global Variable  ${body}
    ${body}=   Setar dados no body da API PJ residente
    ${body}=   Que eu remova do ${body} o campo zipCode no objeto legalInvestor.addressLegalInvestor
    ${resposta}=    Que eu faça uma chamada PUT enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "O campo \\"zipCode\\" deve ser informado"
    Então a chamada deve ter status 422
TST0016: PJ RESIDENTE (API) - Alteração ITAUBM Campo Obrigatorio (countryCode) - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "País" como obrigatório
    [Tags]    NEGATIVO CAMPO OBRIGATORIO API
    ${TAG_NUMBER}=       Set Variable   TST0016
    ${PARTICIPANTE}=     Set Variable   ITAUBM
    ${DONO}=             Set Variable   SIM
    ${TOGGLE}=           Set Variable   S
    Set Global Variable  ${TOGGLE}
    Set Global Variable  ${DONO}
    Set Global Variable  ${PARTICIPANTE}
    Set Global Variable  ${TAG_NUMBER}

    Setar variaveis comitente PJ residente API
    Dado Que eu chame a api de alteração de comitente PJ residente passando a apiKey ITAUAPIINT
    ${body}=   Que eu crie um novo body a partir de um ${JSON_INC_MIN}
    Set Global Variable  ${body}
    ${body}=   Setar dados no body da API PJ residente
    ${body}=   Que eu remova do ${body} o campo countryCode no objeto legalInvestor.addressLegalInvestor
    ${resposta}=        Que eu faça uma chamada PUT enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "O campo \\"countryCode\\" deve ser informado"
    Então a chamada deve ter status 422
TST0017: PJ RESIDENTE (API) - Alteração ITAUBM Campo Obrigatorio (representativeTypeCode) - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Tipo de Representante" como obrigatório quando prenchido algum campo de representante
    [Tags]    NEGATIVO CAMPO OBRIGATORIO API
    ${TAG_NUMBER}=       Set Variable   TST0017
    ${PARTICIPANTE}=     Set Variable   ITAUBM
    ${DONO}=             Set Variable   SIM
    ${TOGGLE}=           Set Variable   S
    Set Global Variable  ${TOGGLE}
    Set Global Variable  ${DONO}
    Set Global Variable  ${PARTICIPANTE}
    Set Global Variable  ${TAG_NUMBER}

    Setar variaveis comitente PJ residente API
    Dado Que eu chame a api de alteração de comitente PJ residente passando a apiKey ITAUAPIINT
    ${body}=        Que eu crie um novo body a partir de um ${JSON_INC_MAX}
    Set Global Variable  ${body}
    ${body}=        Que eu remova do ${body} o campo representativeTypeCode no objeto representativeInvestor
    ${resposta}=    Que eu faça uma chamada PUT enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "O campo \\"representativeTypeCode\\" deve ser informado"
    Então a chamada deve ter status 422
TST0018: PJ RESIDENTE (API) - Alteração ITAUBM Campo Obrigatorio (documentTypeCode) - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Tipo de Documento" como obrigatório quando prenchido algum campo de representante
    [Tags]    NEGATIVO CAMPO OBRIGATORIO API
    ${TAG_NUMBER}=       Set Variable   TST0018
    ${PARTICIPANTE}=     Set Variable   ITAUBM
    ${DONO}=             Set Variable   SIM
    ${TOGGLE}=           Set Variable   S
    Set Global Variable  ${TOGGLE}
    Set Global Variable  ${DONO}
    Set Global Variable  ${PARTICIPANTE}
    Set Global Variable  ${TAG_NUMBER}

    Setar variaveis comitente PJ residente API
    Dado Que eu chame a api de alteração de comitente PJ residente passando a apiKey ITAUAPIINT
    ${body}=        Que eu crie um novo body a partir de um ${JSON_INC_MAX}
    Set Global Variable  ${body}
    ${body}=        Que eu remova do ${body} o campo documentTypeCode no objeto representativeInvestor
    ${resposta}=    Que eu faça uma chamada PUT enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "O campo \\"documentTypeCode\\" deve ser informado"
    Então a chamada deve ter status 422
TST0019: PJ RESIDENTE (API) - Alteração ITAUBM Campo Obrigatorio (documentNumber) - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Documento" como obrigatório quando prenchido algum campo de representante
    [Tags]    NEGATIVO CAMPO OBRIGATORIO API
    ${TAG_NUMBER}=       Set Variable   TST0019
    ${PARTICIPANTE}=     Set Variable   ITAUBM
    ${DONO}=             Set Variable   SIM
    ${TOGGLE}=           Set Variable   S
    Set Global Variable  ${TOGGLE}
    Set Global Variable  ${DONO}
    Set Global Variable  ${PARTICIPANTE}
    Set Global Variable  ${TAG_NUMBER}

    Setar variaveis comitente PJ residente API
    Dado Que eu chame a api de alteração de comitente PJ residente passando a apiKey ITAUAPIINT
    ${body}=        Que eu crie um novo body a partir de um ${JSON_INC_MAX}
    Set Global Variable  ${body}
    ${body}=        Que eu remova do ${body} o campo documentNumber no objeto representativeInvestor
    ${resposta}=    Que eu faça uma chamada PUT enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "O campo \\"documentNumber\\" deve ser informado"
    Então a chamada deve ter status 422
TST0020: PJ RESIDENTE (API) - Alteração ITAUBM Campo (phoneNumber) Se informado o DDD precisa informar o Telefone - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Telefone" Se informado o DDD precisa informar o Telefone
    [Tags]    NEGATIVO CAMPO OBRIGATORIO API
    ${TAG_NUMBER}=       Set Variable   TST0020
    ${PARTICIPANTE}=     Set Variable   ITAUBM
    ${DONO}=             Set Variable   SIM
    ${TOGGLE}=           Set Variable   S
    Set Global Variable  ${TOGGLE}
    Set Global Variable  ${DONO}
    Set Global Variable  ${PARTICIPANTE}
    Set Global Variable  ${TAG_NUMBER}

    Setar variaveis comitente PJ residente API
    Dado Que eu chame a api de alteração de comitente PJ residente passando a apiKey ITAUAPIINT
    ${body}=   Que eu crie um novo body a partir de um ${JSON_INC_MAX}
    Set Global Variable  ${body}
    ${body}=        Setar dados no body da API PJ residente
    ${body}=        Que eu remova do ${body} o campo phoneNumber no objeto legalInvestor.addressLegalInvestor.addressPhoneLegalInvestor
    ${resposta}=    Que eu faça uma chamada PUT enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "O campo \\"phoneNumber\\" deve ser informado."
    Então a chamada deve ter status 422
TST0021: PJ RESIDENTE (API) - Alteração ITAUBM Campo (phoneAreaCodeNumber) Se informado o Telefone precisa informar o DDD - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "DDD" Se informado o Telefone precisa informar o DDD
    [Tags]    NEGATIVO CAMPO OBRIGATORIO API
    ${TAG_NUMBER}=       Set Variable   TST0021
    ${PARTICIPANTE}=     Set Variable   ITAUBM
    ${DONO}=             Set Variable   SIM
    ${TOGGLE}=           Set Variable   S
    Set Global Variable  ${TOGGLE}
    Set Global Variable  ${DONO}
    Set Global Variable  ${PARTICIPANTE}
    Set Global Variable  ${TAG_NUMBER}

    Setar variaveis comitente PJ residente API
    Dado Que eu chame a api de alteração de comitente PJ residente passando a apiKey ITAUAPIINT
    ${body}=   Que eu crie um novo body a partir de um ${JSON_INC_MAX}
    Set Global Variable  ${body}
    ${body}=        Setar dados no body da API PJ residente
    ${body}=        Que eu remova do ${body} o campo phoneAreaCodeNumber no objeto legalInvestor.addressLegalInvestor.addressPhoneLegalInvestor
    ${resposta}=    Que eu faça uma chamada PUT enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "O campo \\"phoneAreaCodeNumber\\" deve ser informado."
    Então a chamada deve ter status 422
TST0022: PJ RESIDENTE (API) - Alteração ITAUBM Campo (phoneTypeCode) Se informado o Telefone ou DD precisa informar o tipo do telefone - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Telefone" Se informado o Telefone ou DD precisa informar o tipo do telefone
    [Tags]    NEGATIVO CAMPO OBRIGATORIO API
    ${TAG_NUMBER}=       Set Variable   TST0022
    ${PARTICIPANTE}=     Set Variable   ITAUBM
    ${DONO}=             Set Variable   SIM
    ${TOGGLE}=           Set Variable   S
    Set Global Variable  ${TOGGLE}
    Set Global Variable  ${DONO}
    Set Global Variable  ${PARTICIPANTE}
    Set Global Variable  ${TAG_NUMBER}

    Setar variaveis comitente PJ residente API
    Dado Que eu chame a api de alteração de comitente PJ residente passando a apiKey ITAUAPIINT
    ${body}=   Que eu crie um novo body a partir de um ${JSON_INC_MAX}
    Set Global Variable  ${body}
    ${body}=        Setar dados no body da API PJ residente
    ${body}=        Que eu remova do ${body} o campo phoneTypeCode no objeto legalInvestor.addressLegalInvestor.addressPhoneLegalInvestor
    ${resposta}=    Que eu faça uma chamada PUT enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "O campo \\"phoneTypeCode\\" deve ser informado."
    Então a chamada deve ter status 422
TST0023: PJ RESIDENTE (API) - Alteração ITAUBM Campo (giinNumber) Quando um campo do bloco FATCA for preenchido, todos os outros devem ser preenchidos também. - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Número de identificação de intermediário global (GIIN)" Quando um campo do bloco FATCA for preenchido, todos os outros devem ser preenchidos também.
    [Tags]    NEGATIVO CAMPO OBRIGATORIO API
    ${TAG_NUMBER}=       Set Variable   TST0023
    ${CNPJ_COMITENTE}=   Generate CNPJ with size   14
    ${PARTICIPANTE}=     Set Variable   ITAUBM
    ${DONO}=             Set Variable   SIM
    ${TOGGLE}=           Set Variable   S
    Set Global Variable  ${TOGGLE}
    Set Global Variable  ${DONO}
    Set Global Variable  ${PARTICIPANTE}
    Set Global Variable  ${TAG_NUMBER}
    Set Global Variable  ${NOME_COMITENTE}

    Setar variaveis comitente PJ residente API
    Dado Que eu chame a api de alteração de comitente PJ residente passando a apiKey ITAUAPIINT
    ${body}=   Que eu crie um novo body a partir de um ${JSON_INC_MAX}
    Set Global Variable  ${body}
    ${body}=        Que eu remova do ${body} o campo giinNumber no objeto investor.fatca
    ${resposta}=    Que eu faça uma chamada PUT enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "O campo \\"giinNumber\\" deve ser informado."
    Então a chamada deve ter status 422
TST0024: PJ RESIDENTE (API) - Alteração ITAUBM Campo (relatedCountryCode) Quando um campo do bloco FATCA for preenchido, todos os outros devem ser preenchidos também. - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "País envolvido/relacionado" Quando um campo do bloco FATCA for preenchido, todos os outros devem ser preenchidos também.
    [Tags]    NEGATIVO CAMPO OBRIGATORIO API
    ${TAG_NUMBER}=       Set Variable   TST0024
    ${CNPJ_COMITENTE}=   Generate CNPJ with size   14
    ${PARTICIPANTE}=     Set Variable   ITAUBM
    ${DONO}=             Set Variable   SIM
    ${TOGGLE}=           Set Variable   S
    Set Global Variable  ${TOGGLE}
    Set Global Variable  ${DONO}
    Set Global Variable  ${PARTICIPANTE}
    Set Global Variable  ${TAG_NUMBER}
    Set Global Variable  ${NOME_COMITENTE}

    Setar variaveis comitente PJ residente API
    Dado Que eu chame a api de alteração de comitente PJ residente passando a apiKey ITAUAPIINT
    ${body}=   Que eu crie um novo body a partir de um ${JSON_INC_MAX}
    Set Global Variable  ${body}
    ${body}=        Que eu remova do ${body} o campo relatedCountryCode no objeto investor.fatca
    ${resposta}=    Que eu faça uma chamada PUT enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "O campo \\"relatedCountryCode\\" deve ser informado."
    Então a chamada deve ter status 422
TST0025: PJ RESIDENTE (API) - Alteração ITAUBM Campo (originCountryCode) Quando um campo do bloco FATCA for preenchido, todos os outros devem ser preenchidos também. - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "País de Origem do Investidor" Quando um campo do bloco FATCA for preenchido, todos os outros devem ser preenchidos também.
    [Tags]    NEGATIVO CAMPO OBRIGATORIO API
    ${TAG_NUMBER}=       Set Variable   TST0025
    ${CNPJ_COMITENTE}=   Generate CNPJ with size   14
    ${PARTICIPANTE}=     Set Variable   ITAUBM
    ${DONO}=             Set Variable   SIM
    ${TOGGLE}=           Set Variable   S
    Set Global Variable  ${TOGGLE}
    Set Global Variable  ${DONO}
    Set Global Variable  ${PARTICIPANTE}
    Set Global Variable  ${TAG_NUMBER}
    Set Global Variable  ${NOME_COMITENTE}

    Setar variaveis comitente PJ residente API
    Dado Que eu chame a api de alteração de comitente PJ residente passando a apiKey ITAUAPIINT
    ${body}=   Que eu crie um novo body a partir de um ${JSON_INC_MAX}
    Set Global Variable  ${body}
    ${body}=        Que eu remova do ${body} o campo originCountryCode no objeto investor.fatca
    ${resposta}=    Que eu faça uma chamada PUT enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "O campo \\"originCountryCode\\" deve ser informado."
    Então a chamada deve ter status 422
TST0026: PJ RESIDENTE (API) - Alteração ITAUBM Campo (phoneNumber: Representante Procurador) Se informado o DDD precisa informar o Telefone - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Telefone" Se informado o DDD precisa informar o Telefone
    [Tags]    NEGATIVO CAMPO OBRIGATORIO API
    ${TAG_NUMBER}=       Set Variable   TST0026
    ${PARTICIPANTE}=     Set Variable   ITAUBM
    ${DONO}=             Set Variable   SIM
    ${TOGGLE}=           Set Variable   S
    Set Global Variable  ${TOGGLE}
    Set Global Variable  ${DONO}
    Set Global Variable  ${PARTICIPANTE}
    Set Global Variable  ${TAG_NUMBER}

    Setar variaveis comitente PJ residente API
    Dado Que eu chame a api de alteração de comitente PJ residente passando a apiKey ITAUAPIINT
    ${body}=   Que eu crie um novo body a partir de um ${JSON_INC_MAX}
    Set Global Variable  ${body}
    ${body}=        Setar dados no body da API PJ residente
    ${body}=        Que eu remova do ${body} o campo phoneNumber no objeto representativeInvestor.addressRepresentativeLegalInvestor.addressPhoneRepresentativeLegalInvestor
    ${resposta}=    Que eu faça uma chamada PUT enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "O campo \\"phoneNumber\\" deve ser informado."
    Então a chamada deve ter status 422
TST0027: PJ RESIDENTE (API) - Alteração ITAUBM Campo (phoneAreaCodeNumber: Representante Procurador) Se informado o Telefone precisa informar o DDD - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "DDD" Se informado o Telefone precisa informar o DDD
    [Tags]    NEGATIVO CAMPO OBRIGATORIO API
    ${TAG_NUMBER}=       Set Variable   TST0027
    ${PARTICIPANTE}=     Set Variable   ITAUBM
    ${DONO}=             Set Variable   SIM
    ${TOGGLE}=           Set Variable   S
    Set Global Variable  ${TOGGLE}
    Set Global Variable  ${DONO}
    Set Global Variable  ${PARTICIPANTE}
    Set Global Variable  ${TAG_NUMBER}

    Setar variaveis comitente PJ residente API
    Dado Que eu chame a api de alteração de comitente PJ residente passando a apiKey ITAUAPIINT
    ${body}=   Que eu crie um novo body a partir de um ${JSON_INC_MAX}
    Set Global Variable  ${body}
    ${body}=        Setar dados no body da API PJ residente
    ${body}=        Que eu remova do ${body} o campo phoneAreaCodeNumber no objeto representativeInvestor.addressRepresentativeLegalInvestor.addressPhoneRepresentativeLegalInvestor
    ${resposta}=    Que eu faça uma chamada PUT enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "O campo \\"phoneAreaCodeNumber\\" deve ser informado."
    Então a chamada deve ter status 422
TST0028: PJ RESIDENTE (API) - Alteração ITAUBM Campo (phoneTypeCode: Representante Procurador) Se informado o Telefone ou DD precisa informar o tipo do telefone - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Telefone" Se informado o Telefone ou DD precisa informar o tipo do telefone
    [Tags]    NEGATIVO CAMPO OBRIGATORIO API
    ${TAG_NUMBER}=       Set Variable   TST0028
    ${PARTICIPANTE}=     Set Variable   ITAUBM
    ${DONO}=             Set Variable   SIM
    ${TOGGLE}=           Set Variable   S
    Set Global Variable  ${TOGGLE}
    Set Global Variable  ${DONO}
    Set Global Variable  ${PARTICIPANTE}
    Set Global Variable  ${TAG_NUMBER}

    Setar variaveis comitente PJ residente API
    Dado Que eu chame a api de alteração de comitente PJ residente passando a apiKey ITAUAPIINT
    ${body}=   Que eu crie um novo body a partir de um ${JSON_INC_MAX}
    Set Global Variable  ${body}
    ${body}=        Setar dados no body da API PJ residente
    ${body}=        Que eu remova do ${body} o campo phoneTypeCode no objeto representativeInvestor.addressRepresentativeLegalInvestor.addressPhoneRepresentativeLegalInvestor
    ${resposta}=    Que eu faça uma chamada PUT enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "O campo \\"phoneTypeCode\\" deve ser informado."
    Então a chamada deve ter status 422
*** Variable ***
${TIPO_ENDERECO}=     MATRIZ
${TIPO_PESSOA}=       Pessoa Jurídica
${TIPO_EMAIL}=        PARTICULAR
${BAIRRO}=            CENTRO
${PAIS}=              BRASIL
${JSON_INC_MIN}=      ${CURDIR}\\..\\..\\JSON\\JSON_COMITENTE_PJ_MINIMO.json
${JSON_INC_MAX}=      ${CURDIR}\\..\\..\\JSON\\JSON_COMITENTE_PJ_MAXIMO.json

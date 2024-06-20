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
TST0001: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (leiCode) Tamanho maximo 20 caracteres - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Código de LEI" Tamanho maximo 20 caracteres"
    [Tags]    NEGATIVO TAMANHO CAMPO API
    ${TAG_NUMBER}=       Set Variable   TST0001
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
    ${body}=   Que eu crie um novo body a partir de um ${JSON_INC_MAX}
    Set Global Variable  ${body}
    ${body}=        Que eu altere o ${body} alterando o valor do campo leiCode no objeto investor para 112233445566778899112
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "Erro [CONTEUDO_COM_TAMANHO_MAIOR_QUE_PERMITIDO : Tamanho do conteúdo maior do que o permitido.] no campo \\u0027leiCode\\u0027"
    Então a chamada deve ter status 422
TST0002: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (giinNumber) Tamanho maximo 19 caracteres - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Número de identificação de intermediário global (GIIN)" Tamanho maximo 19 caracteres"
    [Tags]    NEGATIVO TAMANHO CAMPO API
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
    ${body}=   Que eu crie um novo body a partir de um ${JSON_INC_MAX}
    Set Global Variable  ${body}
    ${body}=        Que eu altere o ${body} alterando o valor do campo giinNumber no objeto investor.fatca para 11223344556677889911
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "Erro [CONTEUDO_COM_TAMANHO_MAIOR_QUE_PERMITIDO : Tamanho do conteúdo maior do que o permitido.] no campo \\u0027giinNumber\\u0027"
    Então a chamada deve ter status 422
TST0003: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (economicGroupName) Tamanho maximo 20 caracteres - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Grupo Econômico" Tamanho maximo 20 caracteres"
    [Tags]    NEGATIVO TAMANHO CAMPO API
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
    ${body}=   Que eu crie um novo body a partir de um ${JSON_INC_MAX}
    Set Global Variable  ${body}
    ${body}=        Que eu altere o ${body} alterando o valor do campo economicGroupName no objeto legalInvestor para 112233445566778899112
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "Erro [CONTEUDO_COM_TAMANHO_MAIOR_QUE_PERMITIDO : Tamanho do conteúdo maior do que o permitido.] no campo \\u0027economicGroupName\\u0027"
    Então a chamada deve ter status 422
TST0004: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (riskClassificationName) Tamanho maximo 20 caracteres - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Descrição da Classificação de Risco" Tamanho maximo 20 caracteres"
    [Tags]    NEGATIVO TAMANHO CAMPO API
    ${TAG_NUMBER}=       Set Variable   TST0004
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
    ${body}=   Que eu crie um novo body a partir de um ${JSON_INC_MAX}
    Set Global Variable  ${body}
    ${body}=        Setar dados no body da API PJ residente
    ${body}=        Que eu altere o ${body} alterando o valor do campo riskClassificationName no objeto legalInvestor para 112233445566778899112
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "O campo COMITENTE_TXT_CLASS_RISCO.TextoAlfaNumerico deve ter no máximo 20 caracter(es)."
    Então a chamada deve ter status 422
TST0005: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (addressTypeName) Tamanho maximo 40 caracteres - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "addressTypeName" Tamanho maximo 40 caracteres"
    [Tags]    NEGATIVO TAMANHO CAMPO API
    ${TAG_NUMBER}=       Set Variable   TST0005
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
    ${body}=   Que eu crie um novo body a partir de um ${JSON_INC_MAX}
    Set Global Variable  ${body}
    ${body}=        Setar dados no body da API PJ residente
    ${body}=        Que eu altere o ${body} alterando o valor do campo addressTypeName no objeto legalInvestor.addressLegalInvestor para TESTE DE NOME LOGRADOURO PASSANDO DE 40 C
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "Erro [CONTEUDO_COM_TAMANHO_MAIOR_QUE_PERMITIDO : Tamanho do conteúdo maior do que o permitido.] no campo \\u0027addressTypeName\\u0027"
    Então a chamada deve ter status 422
TST0006: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (addressNumber) Tamanho maximo 20 caracteres - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "addressTypeName" Tamanho maximo 20 caracteres"
    [Tags]    NEGATIVO TAMANHO CAMPO API
    ${TAG_NUMBER}=       Set Variable   TST0006
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
    ${body}=   Que eu crie um novo body a partir de um ${JSON_INC_MAX}
    Set Global Variable  ${body}
    ${body}=        Setar dados no body da API PJ residente
    ${body}=        Que eu altere o ${body} alterando o valor do campo addressNumber no objeto legalInvestor.addressLegalInvestor para 112233445566778899112
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "Erro [CONTEUDO_COM_TAMANHO_MAIOR_QUE_PERMITIDO : Tamanho do conteúdo maior do que o permitido.] no campo \\u0027addressNumber\\u0027"
    Então a chamada deve ter status 422
TST0007: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (investorName) Tamanho maximo 100 caracteres - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Comitente(Nome/Razão Social)" Tamanho maximo 100 caracteres
    [Tags]    NEGATIVO TAMANHO CAMPO API
    ${TAG_NUMBER}=       Set Variable   TST0007
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
    ${body}=        Que eu altere o ${body} alterando o valor do campo investorName no objeto investor para TESTE DE NOME RAZAO SOCIAL PASSANDO DOS CEM CARACTERES TESTE DE NOME RAZAO SOCIAL PASSANDO DOS CEM CA
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "Erro [CONTEUDO_COM_TAMANHO_MAIOR_QUE_PERMITIDO : Tamanho do conteúdo maior do que o permitido.] no campo \\u0027investorName\\u0027"
    Então a chamada deve ter status 422
TST0008: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (addressComplementName) Tamanho maximo 40 caracteres - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Complemento" Tamanho maximo 40 caracteres
    [Tags]    NEGATIVO TAMANHO CAMPO API
    ${TAG_NUMBER}=       Set Variable   TST0008
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
    ${body}=        Que eu altere o ${body} alterando o valor do campo addressComplementName no objeto legalInvestor.addressLegalInvestor para TESTE DE NOME RAZAO SOCIAL PASSANDO DOS CEM CARACTERES TESTE DE NOME RAZAO SOCIAL PASSANDO DOS CEM CA
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "Erro [CONTEUDO_COM_TAMANHO_MAIOR_QUE_PERMITIDO : Tamanho do conteúdo maior do que o permitido.] no campo \\u0027addressComplementName\\u0027"
    Então a chamada deve ter status 422
TST0009: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (neighborhoodName) Tamanho maximo 40 caracteres - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Bairro" Tamanho maximo 40 caracteres
    [Tags]    NEGATIVO TAMANHO CAMPO API
    ${TAG_NUMBER}=       Set Variable   TST0009
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
    ${body}=        Que eu altere o ${body} alterando o valor do campo neighborhoodName no objeto legalInvestor.addressLegalInvestor para TESTE DE BAIRRO DE LOGRADOURO PASSANDO DE
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "Erro [CONTEUDO_COM_TAMANHO_MAIOR_QUE_PERMITIDO : Tamanho do conteúdo maior do que o permitido.] no campo \\u0027neighborhoodName\\u0027"
    Então a chamada deve ter status 422
TST0010: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (emailName) Tamanho maximo 100 caracteres - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "E-mail" Tamanho maximo 100 caracteres
    [Tags]    NEGATIVO TAMANHO CAMPO API
    ${TAG_NUMBER}=       Set Variable   TST0010
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
    ${body}=        Que eu altere o ${body} alterando o valor do campo emailName no objeto legalInvestor.addressLegalInvestor.emailLegalInvestor para TESTEDEEMAAAILPASSSSSSANDODOSCEMCARACTERESTEEEEEEESTEDEEMAILPASSANDODOSCEMCARACTERESSSS@TESTES.com.br
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "Erro [CONTEUDO_COM_TAMANHO_MAIOR_QUE_PERMITIDO : Tamanho do conteúdo maior do que o permitido.] no campo \\u0027emailName\\u0027"
    Então a chamada deve ter status 422
TST0011: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (phoneAreaCodeNumber) Tamanho maximo 3 caracteres - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Telefone DDD" Tamanho maximo 3 caracteres
    [Tags]    NEGATIVO TAMANHO CAMPO API
    ${TAG_NUMBER}=       Set Variable   TST0011
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
    ${body}=        Que eu altere o ${body} alterando o valor do campo phoneAreaCodeNumber no objeto legalInvestor.addressLegalInvestor.addressPhoneLegalInvestor para 1234
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "Erro [CONTEUDO_COM_TAMANHO_MAIOR_QUE_PERMITIDO : Tamanho do conteúdo maior do que o permitido.] no campo \\u0027phoneAreaCodeNumber\\u0027"
    Então a chamada deve ter status 422
TST0012: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (phoneNumber) Tamanho maximo 10 caracteres - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Telefone" Tamanho maximo 10 caracteres
    [Tags]    NEGATIVO TAMANHO CAMPO API
    ${TAG_NUMBER}=       Set Variable   TST0012
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
    ${body}=        Que eu altere o ${body} alterando o valor do campo phoneNumber no objeto legalInvestor.addressLegalInvestor.addressPhoneLegalInvestor para 11223344551
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "Erro [CONTEUDO_COM_TAMANHO_MAIOR_QUE_PERMITIDO : Tamanho do conteúdo maior do que o permitido.] no campo \\u0027phoneNumber\\u0027"
    Então a chamada deve ter status 422
TST0013: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (phoneExtension) Tamanho maximo 5 caracteres - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Telefone Ramal" Tamanho maximo 5 caracteres
    [Tags]    NEGATIVO TAMANHO CAMPO API
    ${TAG_NUMBER}=       Set Variable   TST0013
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
    ${body}=        Que eu altere o ${body} alterando o valor do campo phoneExtension no objeto legalInvestor.addressLegalInvestor.addressPhoneLegalInvestor para 123456
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "Erro [CONTEUDO_COM_TAMANHO_MAIOR_QUE_PERMITIDO : Tamanho do conteúdo maior do que o permitido.] no campo \\u0027phoneExtension\\u0027"
    Então a chamada deve ter status 422
TST0014: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (addressTypeName) Tamanho maximo 40 caracteres - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Logradouro do Representante" Tamanho maximo 40 caracteres
    [Tags]    NEGATIVO TAMANHO CAMPO API
    ${TAG_NUMBER}=       Set Variable   TST0014
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
    ${body}=        Setar dados no body da API PJ residente
    ${body}=        Que eu altere o ${body} alterando o valor do campo addressTypeName no objeto representativeInvestor.addressRepresentativeLegalInvestor para TESTE DE NOME LOGRADOURO PASSANDO DE 40 C
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "Erro [CONTEUDO_COM_TAMANHO_MAIOR_QUE_PERMITIDO : Tamanho do conteúdo maior do que o permitido.] no campo \\u0027addressTypeName\\u0027"
    Então a chamada deve ter status 422
TST0015: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (addressNumber) Tamanho maximo 20 caracteres - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Número Logradouro do Representante" Tamanho maximo 20 caracteres
    [Tags]    NEGATIVO TAMANHO CAMPO API
    ${TAG_NUMBER}=       Set Variable   TST0015
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
    ${body}=        Setar dados no body da API PJ residente
    ${body}=        Que eu altere o ${body} alterando o valor do campo addressNumber no objeto representativeInvestor.addressRepresentativeLegalInvestor para 112233445566778899112
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "Erro [CONTEUDO_COM_TAMANHO_MAIOR_QUE_PERMITIDO : Tamanho do conteúdo maior do que o permitido.] no campo \\u0027addressNumber\\u0027"
    Então a chamada deve ter status 422
TST0016: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (addressComplementName) Tamanho maximo 40 caracteres - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Complemento do Representante" Tamanho maximo 40 caracteres
    [Tags]    NEGATIVO TAMANHO CAMPO API
    ${TAG_NUMBER}=       Set Variable   TST0016
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
    ${body}=        Setar dados no body da API PJ residente
    ${body}=        Que eu altere o ${body} alterando o valor do campo addressComplementName no objeto representativeInvestor.addressRepresentativeLegalInvestor para TESTE DE COMPLEMENTO PASSANDO DOS QUARENT
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "Erro [CONTEUDO_COM_TAMANHO_MAIOR_QUE_PERMITIDO : Tamanho do conteúdo maior do que o permitido.] no campo \\u0027addressComplementName\\u0027"
    Então a chamada deve ter status 422
TST0017: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (neighborhoodName) Tamanho maximo 40 caracteres - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Bairro do Representante" Tamanho maximo 40 caracteres
    [Tags]    NEGATIVO TAMANHO CAMPO API
    ${TAG_NUMBER}=       Set Variable   TST0017
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
    ${body}=        Setar dados no body da API PJ residente
    ${body}=        Que eu altere o ${body} alterando o valor do campo neighborhoodName no objeto representativeInvestor.addressRepresentativeLegalInvestor para TESTE DE BAIRRO PASSANDO DOS QUARENTA CAR
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "Erro [CONTEUDO_COM_TAMANHO_MAIOR_QUE_PERMITIDO : Tamanho do conteúdo maior do que o permitido.] no campo \\u0027neighborhoodName\\u0027"
    Então a chamada deve ter status 422
TST0018: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (emailName) Tamanho maximo 100 caracteres - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "E-mail do Representante" Tamanho maximo 100 caracteres
    [Tags]    NEGATIVO TAMANHO CAMPO API
    ${TAG_NUMBER}=       Set Variable   TST0018
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
    ${body}=        Setar dados no body da API PJ residente
    ${body}=        Que eu altere o ${body} alterando o valor do campo emailName no objeto representativeInvestor.addressRepresentativeLegalInvestor.emailRepresentativeLegalInvestor para TESTEDEEMAAAILPASSSSSSANDODOSCEMCARACTERESTEEEEEEESTEDEEMAILPASSANDODOSCEMCARACTERESSSS@TESTES.com.br
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "Erro [CONTEUDO_COM_TAMANHO_MAIOR_QUE_PERMITIDO : Tamanho do conteúdo maior do que o permitido.] no campo \\u0027emailName\\u0027"
    Então a chamada deve ter status 422
TST0019: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (phoneAreaCodeNumber) Tamanho maximo 3 caracteres - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Telefone DDD do Representante" Tamanho maximo 3 caracteres
    [Tags]    NEGATIVO TAMANHO CAMPO API
    ${TAG_NUMBER}=       Set Variable   TST0019
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
    ${body}=        Setar dados no body da API PJ residente
    ${body}=        Que eu altere o ${body} alterando o valor do campo phoneAreaCodeNumber no objeto representativeInvestor.addressRepresentativeLegalInvestor.addressPhoneRepresentativeLegalInvestor para 1234
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "Erro [CONTEUDO_COM_TAMANHO_MAIOR_QUE_PERMITIDO : Tamanho do conteúdo maior do que o permitido.] no campo \\u0027phoneAreaCodeNumber\\u0027"
    Então a chamada deve ter status 422
TST0020: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (phoneExtension) Tamanho maximo 5 caracteres - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Telefone Ramal do Representante" Tamanho maximo 5 caracteres
    [Tags]    NEGATIVO TAMANHO CAMPO API
    ${TAG_NUMBER}=       Set Variable   TST0020
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
    ${body}=        Setar dados no body da API PJ residente
    ${body}=        Que eu altere o ${body} alterando o valor do campo phoneExtension no objeto representativeInvestor.addressRepresentativeLegalInvestor.addressPhoneRepresentativeLegalInvestor para 123456
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "Erro [CONTEUDO_COM_TAMANHO_MAIOR_QUE_PERMITIDO : Tamanho do conteúdo maior do que o permitido.] no campo \\u0027phoneExtension\\u0027"
    Então a chamada deve ter status 422
TST0021: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (phoneNumber) Tamanho maximo 10 caracteres - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Telefone do Representante" Tamanho maximo 10 caracteres
    [Tags]    NEGATIVO TAMANHO CAMPO API
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
    ${body}=        Setar dados no body da API PJ residente
    ${body}=        Que eu altere o ${body} alterando o valor do campo phoneNumber no objeto representativeInvestor.addressRepresentativeLegalInvestor.addressPhoneRepresentativeLegalInvestor para 11223344551
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "Erro [CONTEUDO_COM_TAMANHO_MAIOR_QUE_PERMITIDO : Tamanho do conteúdo maior do que o permitido.] no campo \\u0027phoneNumber\\u0027"
    Então a chamada deve ter status 422
TST0022: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (representativeName) Tamanho maximo 100 caracteres - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Nome do Representante" Tamanho maximo 100 caracteres
    [Tags]    NEGATIVO TAMANHO CAMPO API
    ${TAG_NUMBER}=       Set Variable   TST0022
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
    ${body}=        Setar dados no body da API PJ residente
    ${body}=        Que eu altere o ${body} alterando o valor do campo representativeName no objeto representativeInvestor para TESTE DE NOME RAZAO SOCIAL PASSANDO DOS CEM CARACTERES TESTE DE NOME RAZAO SOCIAL PASSANDO DOS CEM CA
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "O campo Nome Representante deve ter no máximo 100 caracter(es)"
    Então a chamada deve ter status 422
*** Variable ***
${TIPO_ENDERECO}=     MATRIZ
${TIPO_PESSOA}=       Pessoa Jurídica
${TIPO_EMAIL}=        PARTICULAR
${BAIRRO}=            CENTRO
${PAIS}=              BRASIL
${JSON_INC_MIN}=      ${CURDIR}\\..\\..\\JSON\\JSON_COMITENTE_PJ_MINIMO.json
${JSON_INC_MAX}=      ${CURDIR}\\..\\..\\JSON\\JSON_COMITENTE_PJ_MAXIMO.json

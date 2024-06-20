*** Settings ***
Documentation       Teste API Comitente /legal-investors
Suite Setup         Log    Suite Setup!
Suite Teardown      Log    Suite Teardown!
Resource            ${CURDIR}\\..\\..\\..\\..\\GENERIC_VAR\\Keywords.robot
Resource            ${CURDIR}\\..\\..\\..\\..\\GENERIC_VAR\\KeywordsAPI.robot
Resource            ${CURDIR}\\..\\..\\..\\..\\GENERIC_VAR\\Login.robot
Resource            ${CURDIR}\\..\\..\\..\\..\\GENERIC_VAR\\keywordConsultaComitente.robot

*** Test Cases ***
TST0001: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (updateDate) data formato invalido - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Data de Atualização do Cadastro" não aceita data inválida
    [Tags]    NEGATIVO API
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
    ${body}=   Que eu altere o ${body} alterando o valor do campo updateDate para 0000/00/00
    ${resposta}=        Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "Erro [DATA_INVALIDA : Data \\"0000/00/00\\" inválida.] no campo \\u0027updateDate\\u0027"
    Então a chamada deve ter status 422
TST0002: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (updateDate) data invalida - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Data de Atualização do Cadastro" não aceita data inválida
    [Tags]    NEGATIVO API
    ${TAG_NUMBER}=       Set Variable   TST0002
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
    ${body}=   Que eu altere o ${body} alterando o valor do campo updateDate para 12/13/2010
    ${resposta}=        Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "Erro [DATA_INVALIDA : Data \\"12/13/2010\\" inválida.] no campo \\u0027updateDate\\u0027"
    Então a chamada deve ter status 422
TST0003: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (updateDate) data futura - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Data de Atualização do Cadastro" não aceita data Futura
    [Tags]    NEGATIVO API
    ${TAG_NUMBER}=       Set Variable   TST0003
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
    ${body}=   Que eu altere o ${body} alterando o valor do campo updateDate para 02/05/2025
    ${resposta}=        Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "Data de Atualização do Cadastro Inválida"
    Então a chamada deve ter status 422
TST0004: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (customerAccountHolderCode) Conta Invalida - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Titular da Conta Cliente (Conta Própria)" conta invalida
    [Tags]    NEGATIVO API
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
    ${body}=   Que eu crie um novo body a partir de um ${JSON_INC_MIN}
    Set Global Variable  ${body}
    ${body}=        Setar dados no body da API PJ residente
    ${body}=        Que eu altere o ${body} alterando o valor do campo customerAccountHolderCode no objeto investor para 00000.0.0
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "Erro [CONTA_INVALIDA_PARA_MASCARA : Conta Inexistente.] no campo \\u0027customerAccountHolderCode\\u0027"
    Então a chamada deve ter status 422
TST0005: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (customerAccountHolderCode) Aceitar so miolo 00 - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Titular da Conta Cliente (Conta Própria)" aceitar somente conta miolo 00
    [Tags]    NEGATIVO API
    ${TAG_NUMBER}=       Set Variable   TST0005
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
    ${body}=        Setar dados no body da API PJ residente
    ${body}=        Que eu altere o ${body} alterando o valor do campo customerAccountHolderCode no objeto investor para 73410.44-5
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "Conta do 73410.44-5 deve ser própria."
    Então a chamada deve ter status 422
TST0006: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (individualDepositAccountCode) Não pode repetir conta de deposito - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Conta de Depósito" Não pode repetir conta de deposito
    [Tags]    NEGATIVO API
    ${TAG_NUMBER}=       Set Variable   TST0006
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
    ${body}=        Setar dados no body da API PJ residente
    ${body}=        Que eu altere o ${body} alterando o valor do campo individualDepositAccountCode no objeto investor para 12567853
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "Já existe a conta individual 12567853 para o participante 73410.00-5"
    Então a chamada deve ter status 422
TST0007: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (documentNumber) Não aceitar CPF - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "CPF/CNPJ do Comitente" Não aceitar CPF
    [Tags]    NEGATIVO API
    ${TAG_NUMBER}=       Set Variable   TST0007
    ${CNPJ_COMITENTE}=   Generate CPF with size   11
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
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "CPF ou CNPJ não é válido para tipo de pessoa informado."
    Então a chamada deve ter status 422
TST0008: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (documentNumber) Não aceitar CNPJ invalido - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "CPF/CNPJ do Comitente" Não aceitar dado invalido
    [Tags]    NEGATIVO API
    ${TAG_NUMBER}=       Set Variable   TST0008
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
    ${body}=        Que eu altere o ${body} alterando o valor do campo documentNumber no objeto investor para 12345678912345
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "Erro [DIGITO_VERIFICADOR_INVALIDO : 12.345.678/9123-45 tem dígito verificador inválido.] no campo \\u0027documentNumber\\u0027"
    Então a chamada deve ter status 422
TST0009: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (residenceCountryCode) Não aceita País diferente de Brasil - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "País de Residência" Não aceitar valor diferente de Brasil (1)
    [Tags]    NEGATIVO API
    ${TAG_NUMBER}=       Set Variable   TST0009
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
    ${body}=        Que eu altere o ${body} alterando o valor do campo residenceCountryCode no objeto investor para 3
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "País inválido para o campo País de Residência."
    Então a chamada deve ter status 422
TST0010: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (selicAccountCode) Conta Invalida - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Conta do Cliente SELIC" Conta Invalida"
    [Tags]    NEGATIVO API
    ${TAG_NUMBER}=       Set Variable   TST0010
    ${CNPJ_COMITENTE}=   Generate CNPJ with size   14
    ${PARTICIPANTE}=     Set Variable   ITAUBM
    ${DONO}=             Set Variable   SIM
    ${TOGGLE}=           Set Variable   S
    Set Global Variable  ${TOGGLE}
    Set Global Variable  ${CNPJ_COMITENTE}
    Set Global Variable  ${DONO}
    Set Global Variable  ${PARTICIPANTE}
    Set Global Variable  ${TAG_NUMBER}
    Set Global Variable  ${NOME_COMITENTE}

    Setar variaveis comitente PJ residente API
    Dado Que eu chame a api de inclusão de comitente PJ residente passando a apiKey ITAUAPIINT
    ${body}=   Que eu crie um novo body a partir de um ${JSON_INC_MAX}
    Set Global Variable  ${body}
    ${body}=        Que eu altere o ${body} alterando o valor do campo selicAccountCode no objeto investor para 112233445566
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "Erro [CONTA_INVALIDA_PARA_MASCARA : Conta Inexistente.] no campo \\u0027selicAccountCode\\u0027"
    Então a chamada deve ter status 422
TST0011: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (customerAccountHolderCode/documentNumber) CNPJ não pode já estar vinculado para a "Conta Cliente" - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "CPF/CNPJ do Comitente" Não pode já estar vinculado para a "Conta Cliente"
    [Tags]    NEGATIVO API
    ${TAG_NUMBER}=       Set Variable   TST0011
    ${PARTICIPANTE}=     Set Variable   ITAUBM
    ${DONO}=             Set Variable   SIM
    ${TOGGLE}=           Set Variable   S
    #${CNPJ_COMITENTE}=   Set Variable   ${CNPJ_COMITENTE_ITAUBM_MIN}
    ${CNPJ_COMITENTE}=   Set Variable   04371582000173
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
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "Existe mais de um comitente para o CPF/CNPJ informado. Situação do comitente: ATIVO"
    Então a chamada deve ter status 422
TST0012: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (annualIncomeValue) Nao deve ser preenchido se campo moeda vazio - DONO*
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Valor da Renda Anual" Nao deve ser preenchido se campo moeda vazio
    [Tags]    NEGATIVO API
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
    ${body}=        Que eu remova do ${body} o campo currencyCode no objeto investor.equitySituation
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "(Situação Patrimonial) Valor Patrimônio Líquido não pode ser preenchido se Moeda estiver vazio"
    Então a chamada deve ter status 422
TST0013: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (annualIncomeDate) Nao deve ser preenchido se campo Valor da Renda Anual vazio - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Data da Renda Anual" Nao deve ser preenchido se campo Valor da Renda Anual vazio
    [Tags]    NEGATIVO API
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
    ${body}=        Que eu remova do ${body} o campo annualIncomeValue no objeto investor.equitySituation
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "(Situação Patrimonial) Data do Faturamento Social não pode ser preenchido se Valor do Faturamento estiver vazio"
    Então a chamada deve ter status 422
TST0014: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (annualIncomeDate) Validar dado invalido - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Data da Renda Anual" Validar dado invalido com letra
    [Tags]    NEGATIVO API
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
    ${body}=        Que eu altere o ${body} alterando o valor do campo annualIncomeDate no objeto investor.equitySituation para A112212341
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "Erro [DATA_INVALIDA : Data \\"A112212341\\" inválida.] no campo \\u0027annualIncomeDate\\u0027"
    Então a chamada deve ter status 422
TST0015: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (annualIncomeDate) Validar data formato invalido - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Data da Renda Anual" Validar data formato invalido
    [Tags]    NEGATIVO API
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
    ${body}=        Que eu altere o ${body} alterando o valor do campo annualIncomeDate no objeto investor.equitySituation para 18042025
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "Erro [DATA_INVALIDA : Data \\"18042025\\" inválida.] no campo \\u0027annualIncomeDate\\u0027"
    Então a chamada deve ter status 422
TST0016: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (annualIncomeDate) Validar data futura - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Data da Renda Anual" Validar data futura
    [Tags]    NEGATIVO API
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
    ${body}=        Que eu altere o ${body} alterando o valor do campo annualIncomeDate no objeto investor.equitySituation para 18/04/2030
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "Data 18/04/2030 inválida para o campo Data Renda Anual."
    Então a chamada deve ter status 422
TST0017: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (equityValue) Nao deve ser preenchido se campo moeda vazio - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Valor da Situação Patrimonial" Nao deve ser preenchido se campo moeda vazio
    [Tags]    NEGATIVO API
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
    ${body}=        Que eu remova do ${body} o campo currencyCode no objeto investor.equitySituation
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "(Situação Patrimonial) Valor Patrimônio Líquido não pode ser preenchido se Moeda estiver vazio"
    Então a chamada deve ter status 422
TST0018: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (equityDate) Validar dado invalido - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Data da Renda Anual" Validar dado invalido com letra
    [Tags]    NEGATIVO API
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
    ${body}=        Que eu altere o ${body} alterando o valor do campo equityDate no objeto investor.equitySituation para A112212341
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "Erro [DATA_INVALIDA : Data \\"A112212341\\" inválida.] no campo \\u0027equityDate\\u0027"
    Então a chamada deve ter status 422
TST0019: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (equityDate) Validar data formato invalido - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Data da Renda Anual" Validar data formato invalido
    [Tags]    NEGATIVO API
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
    ${body}=        Que eu altere o ${body} alterando o valor do campo equityDate no objeto investor.equitySituation para 18042025
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "Erro [DATA_INVALIDA : Data \\"18042025\\" inválida.] no campo \\u0027equityDate\\u0027"
    Então a chamada deve ter status 422
TST0020: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (equityDate) Validar data futura - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Data da Renda Anual" Validar data futura
    [Tags]    NEGATIVO API
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
    ${body}=        Que eu altere o ${body} alterando o valor do campo equityDate no objeto investor.equitySituation para 18/04/2030
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "Data 18/04/2030 inválida para o campo Data Situação Patrimonial."
    Então a chamada deve ter status 422
TST0021: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (billingDate) Validar dado invalido - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Data da informação da Capacidade Financeira" Validar dado invalido com letra
    [Tags]    NEGATIVO API
    ${TAG_NUMBER}=       Set Variable   TST0021
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
    ${body}=        Que eu altere o ${body} alterando o valor do campo billingDate no objeto investor.equitySituation para A112212341
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "Erro [DATA_INVALIDA : Data \\"A112212341\\" inválida.] no campo \\u0027billingDate\\u0027"
    Então a chamada deve ter status 422
TST0022: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (billingDate) Validar data formato invalido - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Data da informação da Capacidade Financeira" Validar data formato invalido
    [Tags]    NEGATIVO API
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
    ${body}=        Que eu altere o ${body} alterando o valor do campo billingDate no objeto investor.equitySituation para 18042025
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "Erro [DATA_INVALIDA : Data \\"18042025\\" inválida.] no campo \\u0027billingDate\\u0027"
    Então a chamada deve ter status 422
TST0023: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (billingDate) Validar data futura - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Data da informação da Capacidade Financeira" Validar data futura
    [Tags]    NEGATIVO API
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
    ${body}=        Que eu altere o ${body} alterando o valor do campo billingDate no objeto investor.equitySituation para 18/04/2030
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "Data 18/04/2030 inválida para o campo Data Capacidade Financeira."
    Então a chamada deve ter status 422
TST0024: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (companyStartDate) Validar dado invalido - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Data de Fundação/Constituição" Validar dado invalido com letra
    [Tags]    NEGATIVO API
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
    ${body}=        Que eu altere o ${body} alterando o valor do campo companyStartDate no objeto legalInvestor para A112212341
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "Erro [DATA_INVALIDA : Data \\"A112212341\\" inválida.] no campo \\u0027companyStartDate\\u0027"
    Então a chamada deve ter status 422
TST0025: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (companyStartDate) Validar data formato invalido - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Data de Fundação/Constituição" Validar data formato invalido
    [Tags]    NEGATIVO API
    ${TAG_NUMBER}=       Set Variable   TST0025
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
    ${body}=        Que eu altere o ${body} alterando o valor do campo companyStartDate no objeto legalInvestor para 18042025
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "Erro [DATA_INVALIDA : Data \\"18042025\\" inválida.] no campo \\u0027companyStartDate\\u0027"
    Então a chamada deve ter status 422
TST0026: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (companyStartDate) Validar data futura - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Data de Fundação/Constituição" Validar data futura
    [Tags]    NEGATIVO API
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
    ${body}=        Que eu altere o ${body} alterando o valor do campo companyStartDate no objeto legalInvestor para 18/04/2030
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "Data Expedição é maior que a data de processamento."
    Então a chamada deve ter status 422
TST0027: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (riskClassificationName) Dado Obrigatorio se riskClassificationName igual O - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Descrição da Classificação de Risco" Obrigatorio se riskClassificationName igual O.
    [Tags]    NEGATIVO API
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
    ${body}=        Que eu altere o ${body} alterando o valor do campo riskClassificationCode no objeto legalInvestor para O
    ${body}=        Que eu remova do ${body} o campo riskClassificationName no objeto legalInvestor
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "Preenchimento obrigatório de \\u0027Descrição de Risco do Comitente\\u0027 se \\u0027Classificação de Risco do Comitente\\u0027 \\u003d \\u0027Outros\\u0027."
    Então a chamada deve ter status 422
TST0028: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (economicActivityCode) Dado Invalido 999 - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "CNAE - Atividade Principal Desenvolvida" Dado invalido 999.
    [Tags]    NEGATIVO API
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
    ${body}=        Que eu altere o ${body} alterando o valor do campo economicActivityCode no objeto legalInvestor para 999
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "CNAE - Atividade Principal Desenvolvida inválida"
    Então a chamada deve ter status 422
TST0029: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (economicActivityCode) Dado Invalido 55 - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "CNAE - Atividade Principal Desenvolvida" Dado invalido 55.
    [Tags]    NEGATIVO API
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
    ${body}=        Que eu altere o ${body} alterando o valor do campo economicActivityCode no objeto legalInvestor para 55
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "CNAE - Atividade Principal Desenvolvida inválida"
    Então a chamada deve ter status 422
TST0030: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (stateCode) Dado Invalido "ZZ"(99)- DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "UF" Dado invalido 99.
    [Tags]    NEGATIVO API
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
    ${body}=        Que eu altere o ${body} alterando o valor do campo stateCode no objeto legalInvestor.addressLegalInvestor para 99
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    #Que a ${resposta} tenha no erro o valor "UF inválido para o campo UF."
    Então a chamada deve ter status 422
TST0031: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (stateCode) Dado Invalido "UF"(00)- DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "UF" Dado invalido 0.
    [Tags]    NEGATIVO API
    ${TAG_NUMBER}=       Set Variable   TST0031
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
    ${body}=        Que eu altere o ${body} alterando o valor do campo stateCode no objeto legalInvestor.addressLegalInvestor para 0
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    #Que a ${resposta} tenha no erro o valor "UF inválido para o campo UF."
    Então a chamada deve ter status 422
TST0032: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (cityCode) Dado Invalido 0 - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Tipo Município" Dado invalido 0.
    [Tags]    NEGATIVO API
    ${TAG_NUMBER}=       Set Variable   TST0032
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
    ${body}=        Que eu altere o ${body} alterando o valor do campo cityCode no objeto legalInvestor.addressLegalInvestor para 0
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "Município 0 inválido para o UF 26."
    Então a chamada deve ter status 422
TST0033: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (cityCode) Dado Invalido 999 - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Tipo Município" Dado invalido 999.
    [Tags]    NEGATIVO API
    ${TAG_NUMBER}=       Set Variable   TST0033
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
    ${body}=        Que eu altere o ${body} alterando o valor do campo cityCode no objeto legalInvestor.addressLegalInvestor para 999
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "Município 999 inválido para o UF 26."
    Então a chamada deve ter status 422
TST0034: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (zipCode) Dado Invalido - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "CEP" Dado invalido.
    [Tags]    NEGATIVO API
    ${TAG_NUMBER}=       Set Variable   TST0034
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
    ${body}=        Que eu altere o ${body} alterando o valor do campo zipCode no objeto legalInvestor.addressLegalInvestor para 112233445
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "Erro [CONTEUDO_INCOMPATIVEL_COM_MASCARA : Campo com conteúdo inválido 112233445.] no campo \\u0027zipCode\\u0027"
    Então a chamada deve ter status 422
TST0035: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (representativeTypeCode) Se valor preenchido for igual a "Procurador", o campo "authorizeOrderTransmissionByThird" precisa ser = "P" - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Tipo de Representante" Se valor preenchido for igual a "Procurador", o campo "authorizeOrderTransmissionByThird" precisa ser = "P"
    [Tags]    NEGATIVO API
    ${TAG_NUMBER}=       Set Variable   TST0035
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
    ${body}=        Que eu altere o ${body} alterando o valor do campo representativeTypeCode no objeto representativeInvestor para Procurador
    ${body}=        Que eu altere o ${body} alterando o valor do campo authorizeOrderTransmissionByThird no objeto legalInvestor para A
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "A informação \\u0027Autoriza Transmissão de Ordem por Terceiros\\u0027 deve ser \\u003d \\u0027Procurador\\u0027"
    Então a chamada deve ter status 422
TST0036: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (representativeTypeCode) Tipo de representante Responsável pela Custódia não permite o preenchimento de nenhum campo referente a endereço. - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Tipo de Representante" Tipo de representante Responsável pela Custódia não permite o preenchimento de nenhum campo referente a endereço.
    [Tags]    NEGATIVO API
    ${TAG_NUMBER}=       Set Variable   TST0036
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
    ${body}=        Que eu altere o ${body} alterando o valor do campo representativeTypeCode no objeto representativeInvestor para Responsavel pela Custodia
    ${body}=        Que eu altere o ${body} alterando o valor do campo authorizeOrderTransmissionByThird no objeto legalInvestor para A
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    #Que a ${resposta} tenha no erro o valor "Tipo de representante Responsável pela Custódia não permite o preenchimento de nenhum campo referente a endereço."
    Então a chamada deve ter status 422
TST0037: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (documentTypeCode: Representante) Valor "OUTROS" pode ser indicado para representantes do tipo "Controlada" e "Coligada" - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Tipo de Documento" - Valor "OUTROS" pode ser indicado para representantes do tipo "Controlada" e "Coligada"
    [Tags]    NEGATIVO API
    ${TAG_NUMBER}=       Set Variable   TST0037
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
    ${body}=        Que eu altere o ${body} alterando o valor do campo documentTypeCode no objeto representativeInvestor para OUTROS
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "Para Representante Procurador Não residente , o Tipo de documento deve ser CPF."
    Então a chamada deve ter status 422
TST0038: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (documentTypeCode: Representante) Valor "CNPJ" pode ser indicado para representantes do tipo "Controlador Direto PJ", "Controladora", "Controlada" e "Coligada" - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Tipo de Documento" - Valor "CNPJ" pode ser indicado para representantes do tipo "Controlador Direto PJ", "Controladora", "Controlada" e "Coligada"
    [Tags]    NEGATIVO API
    ${TAG_NUMBER}=       Set Variable   TST0038
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
    ${body}=        Que eu altere o ${body} alterando o valor do campo documentTypeCode no objeto representativeInvestor para CNPJ
    ${body}=        Que eu altere o ${body} alterando o valor do campo documentNumber no objeto representativeInvestor para ${CNPJ_COMITENTE}
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "Para Representante Procurador Não residente , o Tipo de documento deve ser CPF."
    Então a chamada deve ter status 422
TST0039: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (politicallyExposedPersonCode: Representante) Não é permitido o preenchimento caso o representante seja igual a "Administrador", "Coligada", "Controlada", "Controladora", "Controlador Direto PJ", "Responsavel pela Custodia" - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Pessoa Exposta Politicamente" -  Não é permitido o preenchimento caso o representante seja igual a "Administrador", "Coligada", "Controlada", "Controladora", "Controlador Direto PJ", "Responsavel pela Custodia"
    [Tags]    NEGATIVO API
    ${TAG_NUMBER}=       Set Variable   TST0039
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
    ${body}=        Que eu altere o ${body} alterando o valor do campo representativeTypeCode no objeto representativeInvestor para Administrador
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    #Que a ${resposta} tenha no erro o valor "Campo PPE não permitido para tipo de representante Administrador. "
    Então a chamada deve ter status 422
TST0040: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (stateCode: Representante Procurador) Dado Invalido "ZZ"(99)- DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "UF" Dado invalido 99.
    [Tags]    NEGATIVO API
    ${TAG_NUMBER}=       Set Variable   TST0040
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
    ${body}=        Que eu altere o ${body} alterando o valor do campo stateCode no objeto representativeInvestor.addressRepresentativeLegalInvestor para 99
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    #Que a ${resposta} tenha no erro o valor "UF inválido para o campo UF (Representante)"
    Então a chamada deve ter status 422
TST0041: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (stateCode: Representante Procurador) Dado Invalido "UF"(00)- DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "UF" Dado invalido 0.
    [Tags]    NEGATIVO API
    ${TAG_NUMBER}=       Set Variable   TST0041
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
    ${body}=        Que eu altere o ${body} alterando o valor do campo stateCode no objeto representativeInvestor.addressRepresentativeLegalInvestor para 0
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    #Que a ${resposta} tenha no erro o valor "UF inválido para o campo UF (Representante)"
    Então a chamada deve ter status 422
TST0042: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (cityCode: Representante Procurador) Dado Invalido 0 - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Tipo Município" Dado invalido 0.
    [Tags]    NEGATIVO API
    ${TAG_NUMBER}=       Set Variable   TST0042
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
    ${body}=        Que eu altere o ${body} alterando o valor do campo cityCode no objeto representativeInvestor.addressRepresentativeLegalInvestor para 0
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    #Que a ${resposta} tenha no erro o valor "Município inválido para o campo Código do Município (Representante)"
    #Que a ${resposta} tenha no erro o valor "Município 0 inválido para o UF 26."
    Então a chamada deve ter status 422
TST0043: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (cityCode: Representante Procurador) Dado Invalido 999 - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "Tipo Município" Dado invalido 999.
    [Tags]    NEGATIVO API
    ${TAG_NUMBER}=       Set Variable   TST0043
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
    ${body}=        Que eu altere o ${body} alterando o valor do campo cityCode no objeto representativeInvestor.addressRepresentativeLegalInvestor para 999
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "Município 999 inválido para o UF 26."
    Então a chamada deve ter status 422
TST0044: PJ RESIDENTE (API) - Inclusão ITAUBM Campo (zipCode: Representante Procurador) Dado Invalido - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar campo "CEP" Dado invalido.
    [Tags]    NEGATIVO API
    ${TAG_NUMBER}=       Set Variable   TST0044
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
    ${body}=        Que eu altere o ${body} alterando o valor do campo zipCode no objeto representativeInvestor.addressRepresentativeLegalInvestor para 112233445
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "Erro [CONTEUDO_INCOMPATIVEL_COM_MASCARA : Campo com conteúdo inválido 112233445.] no campo \\u0027zipCode\\u0027"
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

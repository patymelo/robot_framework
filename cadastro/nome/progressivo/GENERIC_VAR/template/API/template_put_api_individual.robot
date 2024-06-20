*** Keywords ***
Template alteração api comitente PF Residente minimo sem campos aleatorios
    [Tags]        ALTERACAO API ${TAG_NUMBER}
    Setar numero da TAG

    [Arguments]   ${PARTICIPANTE}   ${DONO}   ${CPF_COMITENTE}   ${API_KEY}   ${RETORNO}
    Log Many      ${PARTICIPANTE}   ${DONO}   ${CPF_COMITENTE}   ${API_KEY}   ${RETORNO}

    Set Global Variable  ${PARTICIPANTE}
    Set Global Variable  ${DONO}

    IF   "${CPF_COMITENTE}" == "Aleatorio"
         ${CPF_COMITENTE}=      Generate CPF with size   11
         Set Global Variable  ${CPF_COMITENTE}
    END

    Setar variaveis comitente PF residente API
    Dado Que eu chame a api de alteração de comitente PF residente passando a apiKey ITAUAPIINT
    ${body}=             Que eu crie um novo body a partir de um ${JSON_INC_MIN}
    Set Global Variable  ${body}
    ${body}=             Setar dados no body da API PF residente com dados basicos
    ${resposta}=         Que eu faça uma chamada PUT enviando o ${body}
    Set Global Variable  ${resposta}
    Então a chamada deve ter status ${RETORNO}
Template alteração api comitente PF Residente minimo com campos aleatorios
    [Tags]        ALTERACAO API ${TAG_NUMBER}
    Setar numero da TAG

    [Arguments]   ${PARTICIPANTE}   ${DONO}   ${CPF_COMITENTE}   ${API_KEY}   ${RETORNO}
    Log Many      ${PARTICIPANTE}   ${DONO}   ${CPF_COMITENTE}   ${API_KEY}   ${RETORNO}

    Set Global Variable  ${PARTICIPANTE}
    Set Global Variable  ${DONO}

    IF   "${CPF_COMITENTE}" == "Aleatorio"
         ${CPF_COMITENTE}=      Generate CPF with size   11
         Set Global Variable  ${CPF_COMITENTE}
    END

    Setar variaveis comitente PF residente API
    Dado Que eu chame a api de alteração de comitente PF residente passando a apiKey ITAUAPIINT
    ${body}=             Que eu crie um novo body a partir de um ${JSON_INC_MIN}
    Set Global Variable  ${body}
    ${body}=             Setar dados no body da API PF residente
    ${resposta}=         Que eu faça uma chamada PUT enviando o ${body}
    Set Global Variable  ${resposta}
    Então a chamada deve ter status ${RETORNO}
Template alteração api comitente PF Residente completo sem campos aleatorios
    [Tags]        ALTERACAO API ${TAG_NUMBER}
    Setar numero da TAG

    [Arguments]   ${PARTICIPANTE}   ${DONO}   ${CPF_COMITENTE}   ${API_KEY}   ${RETORNO}
    Log Many      ${PARTICIPANTE}   ${DONO}   ${CPF_COMITENTE}   ${API_KEY}   ${RETORNO}

    Set Global Variable  ${PARTICIPANTE}
    Set Global Variable  ${DONO}

    IF   "${CPF_COMITENTE}" == "Aleatorio"
         ${CPF_COMITENTE}=      Generate CPF with size   11
         Set Global Variable  ${CPF_COMITENTE}
    END

    Setar variaveis comitente PF residente API
    Dado Que eu chame a api de alteração de comitente PF residente passando a apiKey ITAUAPIINT
    ${body}=             Que eu crie um novo body a partir de um ${JSON_INC_MAX}
    Set Global Variable  ${body}
    ${body}=             Setar dados no body da API PF residente com dados basicos
    ${resposta}=         Que eu faça uma chamada PUT enviando o ${body}
    Set Global Variable  ${resposta}
    Então a chamada deve ter status ${RETORNO}
Template alteração api comitente PF Residente completo com campos aleatorios
    [Tags]        ALTERACAO API ${TAG_NUMBER}
    Setar numero da TAG

    [Arguments]   ${PARTICIPANTE}   ${DONO}   ${CPF_COMITENTE}   ${API_KEY}   ${RETORNO}
    Log Many      ${PARTICIPANTE}   ${DONO}   ${CPF_COMITENTE}   ${API_KEY}   ${RETORNO}

    Set Global Variable  ${PARTICIPANTE}
    Set Global Variable  ${DONO}

    IF   "${CPF_COMITENTE}" == "Aleatorio"
         ${CPF_COMITENTE}=      Generate CPF with size   11
         Set Global Variable  ${CPF_COMITENTE}
    END

    Setar variaveis comitente PF residente API
    Dado Que eu chame a api de alteração de comitente PF residente passando a apiKey ITAUAPIINT
    ${body}=             Que eu crie um novo body a partir de um ${JSON_INC_MAX}
    Set Global Variable  ${body}
    ${body}=             Setar dados no body da API PF residente
    ${body}=             Que eu altere o ${body} alterando o valor do campo birthDate no objeto individualInvestor para 02/02/2010
    ${resposta}=         Que eu faça uma chamada PUT enviando o ${body}
    Set Global Variable  ${resposta}
    Então a chamada deve ter status ${RETORNO}
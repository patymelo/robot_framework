*** Keywords ***
Template Regras Preenchimento Campos - Validar que response retornou com erro 422
    [Tags]        REGRAS API ${TAG_NUMBER}
    Setar numero da TAG

    [Arguments]   ${CAMPO_JSON}   ${OBJETO_JSON}   ${VALOR}   ${METHOD}
    Log Many      ${CAMPO_JSON}   ${OBJETO_JSON}   ${VALOR}   ${METHOD}

    ${body}=         Que eu altere o ${body} alterando o valor do campo ${CAMPO_JSON} no objeto ${OBJETO_JSON} para ${VALOR}
    IF   "${METHOD}" == "POST"
        ${resposta}=     Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    ELSE
        ${resposta}=     Que eu faça uma chamada PUT enviando o ${body} com erro de negocio
    END
    Set Global Variable  ${resposta}
    Então a chamada deve ter status 422
Template Regras Preenchimento Campos - Validar response com mensagem de erro expecifica
    [Tags]        REGRAS API ${TAG_NUMBER}
    Setar numero da TAG

    [Arguments]   ${CAMPO_JSON}   ${OBJETO_JSON}   ${VALOR}   ${METHOD}
    Log Many      ${CAMPO_JSON}   ${OBJETO_JSON}   ${VALOR}   ${METHOD}

    ${body}=         Que eu altere o ${body} alterando o valor do campo ${CAMPO_JSON} no objeto ${OBJETO_JSON} para ${VALOR}
    IF   "${METHOD}" == "POST"
        ${resposta}=     Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    ELSE
        ${resposta}=     Que eu faça uma chamada PUT enviando o ${body} com erro de negocio
    END
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "${MENSAGEM}"
    Então a chamada deve ter status 422
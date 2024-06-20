*** Keywords ***
Template Domínio Campos - Validar que response retornou com erro 422
    [Tags]        DOMINIO INVALIDO API ${TAG_NUMBER}
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
Template Domínio Campos - Validar response com mensagem de erro expecifica
    [Tags]        DOMINIO INVALIDO API ${TAG_NUMBER}
    Setar numero da TAG

    [Arguments]   ${CAMPO_JSON}   ${OBJETO_JSON}    ${MENSAGEM}   ${METHOD}
    Log Many      ${CAMPO_JSON}   ${OBJETO_JSON}    ${MENSAGEM}   ${METHOD}

    ${body}=         Que eu altere o ${body} alterando o valor do campo ${CAMPO_JSON} no objeto ${OBJETO_JSON} para ${VALOR}
    ${resposta}=     Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "${MENSAGEM}"
    Então a chamada deve ter status 422

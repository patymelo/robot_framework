*** Keywords ***
Template Tamanho Campos - Validar que response retornou com erro 422
    [Tags]        TAMANHO MAXIMO API ${TAG_NUMBER}
    Setar numero da TAG

    [Arguments]   ${CAMPO_JSON}   ${OBJETO_JSON}   ${SIZE_MAX}   ${TYPE}   ${METHOD}
    Log Many      ${CAMPO_JSON}   ${OBJETO_JSON}   ${SIZE_MAX}   ${TYPE}   ${METHOD}

    ${SIZE}=         Convert To Integer   ${SIZE_MAX}

    IF   "${TYPE}" == "STRING"
        ${CAMPO_SIZE}=   Generate random string with size   ${SIZE+1}
    ELSE
        ${CAMPO_SIZE}=   Generate random number with size   ${SIZE+1}
    END

    ${body}=         Que eu altere o ${body} alterando o valor do campo ${CAMPO_JSON} no objeto ${OBJETO_JSON} para ${CAMPO_SIZE}
    IF   "${METHOD}" == "POST"
        ${resposta}=     Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    ELSE
        ${resposta}=     Que eu faça uma chamada PUT enviando o ${body} com erro de negocio
    END
    Set Global Variable  ${resposta}
    #Que a ${resposta} tenha no erro o valor "Erro [CONTEUDO_COM_TAMANHO_MAIOR_QUE_PERMITIDO : Tamanho do conteúdo maior do que o permitido.] no campo \\u0027${CAMPO_JSON}\\u0027"
    Então a chamada deve ter status 422
Template Tamanho Campos - Validar response com mensagem de erro expecifica
    [Tags]        TAMANHO MAXIMO API ${TAG_NUMBER}
    Setar numero da TAG

    [Arguments]   ${CAMPO_JSON}   ${OBJETO_JSON}   ${SIZE_MAX}   ${TYPE}  ${MENSAGEM}   ${METHOD}
     Log Many     ${CAMPO_JSON}   ${OBJETO_JSON}   ${SIZE_MAX}   ${TYPE}  ${MENSAGEM}   ${METHOD}

    ${SIZE}=         Convert To Integer   ${SIZE_MAX}

    IF   "${TYPE}" == "STRING"
        ${CAMPO_SIZE}=   Generate random string with size   ${SIZE+1}
    ELSE
        ${CAMPO_SIZE}=   Generate random number with size   ${SIZE+1}
    END

    ${body}=         Que eu altere o ${body} alterando o valor do campo ${CAMPO_JSON} no objeto ${OBJETO_JSON} para ${CAMPO_SIZE}
    IF   "${METHOD}" == "POST"
        ${resposta}=     Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    ELSE
        ${resposta}=     Que eu faça uma chamada PUT enviando o ${body} com erro de negocio
    END    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "${MENSAGEM}"
    Então a chamada deve ter status 422


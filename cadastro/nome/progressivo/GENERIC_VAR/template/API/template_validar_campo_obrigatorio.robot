*** Keywords ***
Template Campos Obrigatórios - Validar response com mensagem de erro
    [Tags]        CAMPOS OBRIGATORIOS API ${TAG_NUMBER}
    Setar numero da TAG

    [Arguments]   ${CAMPO_JSON}   ${OBJETO_JSON}   ${METHOD}
    Log Many      ${CAMPO_JSON}   ${OBJETO_JSON}   ${METHOD}
    
    Que eu gere dados aleatorios API

    ${body}=        Que eu remova do ${body} o campo ${CAMPO_JSON} no objeto ${OBJETO_JSON}
    IF   "${METHOD}" == "POST"
        ${resposta}=     Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    ELSE
        ${resposta}=     Que eu faça uma chamada PUT enviando o ${body} com erro de negocio
    END
    Set Global Variable  ${resposta}
    
    TRY
        Então que a ${resposta} tenha no erro o valor "O campo \\"${CAMPO_JSON}\\" deve ser informado"
    EXCEPT
        TRY
            Então que a ${resposta} tenha no erro o valor "Preenchimento obrigatório dos campos de Telefone, se qualquer dado do telefone estiver preenchido (Endereço Comitente)"
        EXCEPT    
            TRY
                Então que a ${resposta} tenha no erro o valor "Quando um campo do bloco FATCA for preenchido, todos os outros devem ser preenchidos também."
            EXCEPT    
                Então a chamada deve ter status 422
                Log    ${resposta}
            END
        END
    END
Template Campos Obrigatórios NULL - Validar response com mensagem de erro
    [Tags]        CAMPOS OBRIGATORIOS API ${TAG_NUMBER}
    Setar numero da TAG

    [Arguments]   ${CAMPO_JSON}   ${OBJETO_JSON}   ${METHOD}
    Log Many      ${CAMPO_JSON}   ${OBJETO_JSON}   ${METHOD}
    ${body}=   Que eu altere o ${body} alterando o valor do campo ${CAMPO_JSON} no objeto ${OBJETO_JSON} para null

    IF   "${METHOD}" == "POST"
        ${resposta}=     Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    ELSE
        ${resposta}=     Que eu faça uma chamada PUT enviando o ${body} com erro de negocio
    END
    Set Global Variable  ${resposta}
    TRY
        Então que a ${resposta} tenha no erro o valor "Erro [CAMPO_OBRIGATORIO_NULO : Campo obrigatório nulo.] no campo \\u0027${CAMPO_JSON}\\u0027"
    EXCEPT
        TRY
            Então que a ${resposta} tenha no erro o valor "OBRIGATORIO"
        EXCEPT    
            Então a chamada deve ter status 422
            Log    ${resposta}
        END
    END
    #Então a chamada deve ter status 422
Template Valida Grupo de Campos Obrigatórios - Validar response com status code 422
    [Documentation]     Altera o valor de um campo conforme informado nos argumentos... Realiza uma chamada REST esperando erro de negócio 422... Valida a mensagem de retorno com o valor passado nos argumentos...
    [Tags]        PROGRESSIVO_CADBLC_2370 ${TAG_NUMBER}
    Setar numero da TAG

    [Arguments]   ${CAMPO_JSON}   ${OBJETO_JSON}   ${METHOD}   ${NOVO_VALOR}   ${MSG_ERRO}
    Log Many      ${CAMPO_JSON}   ${OBJETO_JSON}   ${METHOD}   ${NOVO_VALOR}   ${MSG_ERRO}
    ${body}=        Que eu altere o ${body} alterando o valor do campo ${CAMPO_JSON} no objeto ${OBJETO_JSON} para ${NOVO_VALOR}
    IF   "${METHOD}" == "POST"
        ${resposta}=     Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    ELSE
        ${resposta}=     Que eu faça uma chamada PUT enviando o ${body} com erro de negocio
    END
    Log Many      ${resposta.json()}
    Set Global Variable  ${resposta}
    Que a ${resposta} tenha no erro o valor "${MSG_ERRO}"
    Então a chamada deve ter status 422

Que eu altere o ${json} alterando o valor do campo ${nomeCampo} no objeto ${nomeObjeto} para null
    ${body_alterado}=                       Update Value To Json                                    ${json}                             $.data.${nomeObjeto}.${nomeCampo}      ${None}
    Log         ${body_alterado}
    [Return]    ${body_alterado}
Que eu altere o ${json} alterando o valor do campo ${nomeCampo} para ${novoValor} para null
    ${body_alterado}=                       Update Value To Json                                    ${json}                             $.data.${nomeCampo}      ${None}
    Log         ${body_alterado}
    [Return]    ${body_alterado}

Que eu gere dados aleatorios API
    
    ${CPF_COMITENTE}=      Generate CPF with size   11
    Set Global Variable  ${CPF_COMITENTE}
    
    Setar variaveis comitente PF residente API
    Dado Que eu chame a api de inclusão de comitente PF residente passando a apiKey ${API_KEY}
    ${body}=             Que eu crie um novo body a partir de um ${JSON_INC_MAX}
    Set Global Variable  ${body}
    ${body}=             Setar dados no body da API PF residente com dados basicos    
    Set Global Variable  ${body}
Language: pt-br

*** Settings ***
Documentation       Geração de Massa - Inclusão Contas 00, 10, 20, 40 e 69

*** Keywords ***
Gerado massa - Inclusão Contas
    ${OPEN}=   Set Variable   NAO
    Setar numero da TAG
    Set Global Variable     ${TAG_NUMBER}  
    
    que eu defina a variavel MALOTE_TITULAR com o valor Sim como uma variavel global
    que eu defina a variavel MALOTE_PRACA com o valor PR como uma variavel global
    que eu defina a variavel LIQUIDANTE com o valor ITAUBM como uma variavel global

    ${CONTA_PRINCIPAL}=          Que eu execute a consulta pegando a conta principal do participante
    ${MIOLO_CONTA_PRINCIPAL}=    Get Substring   ${CONTA_PRINCIPAL}   6   8
    LOG    ${MIOLO_CONTA_PRINCIPAL}
    Set Global Variable  ${CONTA_PRINCIPAL}
    
    ${CONTA}=  que eu execute a consulta validando se ja existe conta 00 para o participante
    IF  "${MIOLO_CONTA_PRINCIPAL}" == "00" 
        IF    "${CONTA}" == "${EMPTY}"
            IF  "${OPEN}" == "NAO"
                Dado o usuario loga no NoMe como CETIP
                E o Usuario acessa o menu de Alteracao de Participante e faz a busca pelo CNPJ

                ${OPEN}=   Set Variable   SIM
            ELSE
                Dado o Usuario acessa novamente o menu de Alteracao de Participante e faz a busca pelo CNPJ
                E o usuario realiza a inclusão de uma nova conta com tipo PROPRIA (00)
                E Pega valor do campo conta e armazena na variavel CONTA_00
            END
        END
        IF    "${CONTA}" == "${CONTA_PRINCIPAL}"
            IF  "${OPEN}" == "NAO"
                Dado o usuario loga no NoMe como CETIP
                E o Usuario acessa o menu de Alteracao de Participante e faz a busca pelo CNPJ

                ${OPEN}=   Set Variable   SIM
            ELSE
                Dado o Usuario acessa novamente o menu de Alteracao de Participante e faz a busca pelo CNPJ
                E o usuario realiza a inclusão de uma nova conta com tipo PROPRIA (00)
                E Pega valor do campo conta e armazena na variavel CONTA_00
            END
        END
    END

    ${CONTA}=  que eu execute a consulta validando se ja existe conta 10 para o participante
    IF  "${CONTA}" == "${EMPTY}"
        IF  "${OPEN}" == "NAO"
            Dado o usuario loga no NoMe como CETIP
            E o Usuario acessa o menu de Alteracao de Participante e faz a busca pelo CNPJ

            ${OPEN}=   Set Variable   SIM
        ELSE
            Dado o Usuario acessa novamente o menu de Alteracao de Participante e faz a busca pelo CNPJ
        END
        E o usuario realiza a inclusão de uma nova conta com tipo CLIENTE 1 - GERAL (10)
        E Pega valor do campo conta e armazena na variavel CONTA_10
    ELSE
        que eu defina a variavel CONTA_10 com o valor ${CONTA} como uma variavel global
    END

    ${CONTA}=  que eu execute a consulta validando se ja existe conta 20 para o participante
    IF  "${CONTA}" == "${EMPTY}"
        IF  "${OPEN}" == "NAO"
            Dado o usuario loga no NoMe como CETIP
            E o Usuario acessa o menu de Alteracao de Participante e faz a busca pelo CNPJ

            ${OPEN}=   Set Variable   SIM
        ELSE
            Dado o Usuario acessa novamente o menu de Alteracao de Participante e faz a busca pelo CNPJ
        END
        E o usuario realiza a inclusão de uma nova conta com tipo CLIENTE 2 - GERAL (20)
        E Pega valor do campo conta e armazena na variavel CONTA_20
    ELSE
        que eu defina a variavel CONTA_20 com o valor ${CONTA} como uma variavel global
    END

    ${CONTA}=  que eu execute a consulta validando se ja existe conta 40 para o participante
    IF  "${CONTA}" == "${EMPTY}"
        IF  "${OPEN}" == "NAO"
            Dado o usuario loga no NoMe como CETIP
            E o Usuario acessa o menu de Alteracao de Participante e faz a busca pelo CNPJ

            ${OPEN}=   Set Variable   SIM
        ELSE
            Dado o Usuario acessa novamente o menu de Alteracao de Participante e faz a busca pelo CNPJ
        END
        E o usuario realiza a inclusão de uma nova conta com tipo EMISSORA CETIP (40)
        E Pega valor do campo conta e armazena na variavel CONTA_40
    ELSE
        que eu defina a variavel CONTA_40 com o valor ${CONTA} como uma variavel global
    END

    ${CONTA}=  que eu execute a consulta validando se ja existe conta 69 para o participante
    IF  "${CONTA}" == "${EMPTY}"
        IF  "${OPEN}" == "NAO"
            Dado o usuario loga no NoMe como CETIP
            E o Usuario acessa o menu de Alteracao de Participante e faz a busca pelo CNPJ

            ${OPEN}=   Set Variable   SIM
        ELSE
            Dado o Usuario acessa novamente o menu de Alteracao de Participante e faz a busca pelo CNPJ
        END
        E o usuario realiza a inclusão de uma nova conta com tipo INTERMEDIACAO (69)
        E Pega valor do campo conta e armazena na variavel CONTA_69
    ELSE
        que eu defina a variavel CONTA_69 com o valor ${CONTA} como uma variavel global
    END

    ${CONTA}=  que eu execute a consulta validando se ja existe conta 70 para o participante
    IF  "${CONTA}" == "${EMPTY}"
        IF  "${OPEN}" == "NAO"
            Dado o usuario loga no NoMe como CETIP
            E o Usuario acessa o menu de Alteracao de Participante e faz a busca pelo CNPJ

            ${OPEN}=   Set Variable   SIM
        ELSE
            Dado o Usuario acessa novamente o menu de Alteracao de Participante e faz a busca pelo CNPJ
        END
        E o usuario realiza a inclusão de uma nova conta com tipo PROPRIA (70)
        E Pega valor do campo conta e armazena na variavel CONTA_70
    ELSE
        que eu defina a variavel CONTA_70 com o valor ${CONTA} como uma variavel global
    END

    IF  "${OPEN}" == "SIM"
        Close Browser
    END

*** Variables ***
${NUMBER}=    0

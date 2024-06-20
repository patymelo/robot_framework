Language: pt-br

*** Settings ***
Documentation       Geração de Massa para INR

*** Keywords ***
Gerado massa para participante INR
    Delete Directory If Exists    ${DIRETORIO_IMAGENS}
    Setar numero da TAG
    Set Global Variable     ${TAG_NUMBER}  
    ${miolo_contas_comparacao}     Create List     .00-  .10-  .20-

    Dado eu busco os tipos de miolo de conta que estão habilitados na tabela parametro config
    Que eu valide que esses miolos de conta ${miolo_contas_habilitado} seja igual a lista ${miolo_contas_comparacao}
   
    ${CNPJ_PARTICIPANTE}=     Que eu execute a query consultando validando se ja existe cadastro para o participante INR
    IF  "${CNPJ_PARTICIPANTE}" == "${EMPTY}"
        Então que eu realize o cadastro de um novo participante INVESTIDOR NAO RESIDENTE utilizando dados do RIOBM para preencher a familia
    ELSE
        Set Global Variable   ${CNPJ_PARTICIPANTE}
    END

*** Variables ***
${NUMBER}=    0
${OCULTO}=    SIM
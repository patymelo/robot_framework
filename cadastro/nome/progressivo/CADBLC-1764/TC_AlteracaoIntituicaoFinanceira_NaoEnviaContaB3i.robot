Language: pt-br

*** Settings ***
Documentation       Realizando a manutenção de vários dados cadastrais
...                 do participante sem alterar a Razão social.
...                 ** ATENÇÃO **:
...                 O CNPJ deve ser um participante existente e que não tenha gerado
...                 nenhum evento na fila utilizando a data de execução desse script.
Resource            ${CURDIR}/../GENERIC_VAR/Keywords.robot
Resource            ${CURDIR}/../GENERIC_VAR/Login.robot
Resource            ${CURDIR}/../GENERIC_VAR/KeywordsManutencaoParticipante.robot
#Resource            ${CURDIR}/../GENERIC_VAR/keywordConsultaBD.robot
Suite Setup         configuracao inicial
Test Teardown       Close Browser
Suite Teardown      Close All Browsers

*** Variables ***
${DIRETORIO_IMAGENS}                ${CURDIR}/Resultados/NaoGeraEvento/img
${var_amb}=                         qaa

*** Test Cases ***
TST0001: Realizar alteração em vários campos dos dados do participante sem alterar a razão social
    [Tags]    PROGRESSIVO_FILA_EVENTO_PARTICIPANTE_NAO_GERA_EVENTO
    O usuario possui acesso ao NoMe como CETIP

*** Keywords ***
configuracao inicial
    Delete Directory If Exists    ${DIRETORIO_IMAGENS}
que o teste seja concluido com sucesso
    Log     Teste Finalizado com Sucesso!

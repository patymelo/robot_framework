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
    Abrir o navegador e acessar o site Organo
    Preencher os campos do formulário

*** Keywords ***
configuracao inicial
    Delete Directory If Exists    ${DIRETORIO_IMAGENS}
Abrir o navegador e acessar o site Organo
    ${URL}=   Set Variable    https://www.google.com/
    ${chrome_options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --disable-extensions
    Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Create Webdriver    Chrome    options=${chrome_options}
    Go To    ${URL}
Preencher os campos do formulário
    Input Text       id:APjFqb       robot framework
que o teste seja concluido com sucesso
    Log     Teste Finalizado com Sucesso!

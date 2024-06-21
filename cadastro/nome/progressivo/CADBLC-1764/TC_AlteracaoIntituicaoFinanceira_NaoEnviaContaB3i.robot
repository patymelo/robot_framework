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
    ${URL}=   Set Variable    https://www.google.com/
    ${chrome_options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --disable-extensions
    Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Create Webdriver    Chrome    chrome_options=${chrome_options}
    Create Webdriver    Chrome    options=${chrome_options}
    Go To    ${URL}
Preencher os campos do formulário
    Input Text       id:APjFqb       robot framework

*** Keywords ***
configuracao inicial
    Delete Directory If Exists    ${DIRETORIO_IMAGENS}
que o usuário realize login no sistema NoMe como interno B3
    o usuario loga no NoMe como CETIP
que seja acessado a ação ${acao}
    O Usuario seleciona na label Ação valor igual a ${acao}
    O Usuario clica na seta
    capturar e salvar imagem com o nome TelaAposAcao
que seja alterado varios campos referente a tela Dados do Participante
    que seja alterado o valor no campo Habilitado para Op. Compromissada?
    que seja alterado o valor no campo Atua como Intermediador?
    que seja alterado o valor no campo Natureza Jurídica
    que seja alterado o valor no campo Controle Acionário
    que seja alterado o valor no campo Origem de Capital
    que seja alterado o valor no campo Grupo Econômico
    que seja alterado o valor no campo Participante (Mnemônico)
    que seja alterado o valor no campo Isento de Inscrição Estadual?
    que seja alterado o valor no campo Isento de Inscrição Municipal?
#    que seja alterado o valor no campo Isenção de Pagamento?
    que seja alterado o valor no campo Habilitado ao Reune?
    que seja alterado o valor no campo Integrado ao Reune?

que o teste seja concluido com sucesso
    Log     Teste Finalizado com Sucesso!

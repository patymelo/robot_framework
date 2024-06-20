Language: pt-br

*** Settings ***
Documentation       Inclusão de conta 00,10,20 e 69 para participante INR
...                 Incluindo cadastro web e efetivando no sistema NoMe (Geração de massa).
...                 Incluido contas para o participante.
...                 ** ATENÇÃO **: Variáveis dentro dos casos de teste precisa utilizar Set Global Variable
...                 para ficar visivel nos Resources dentro do diretório GENERIC_VAR.
Resource            ${CURDIR}\\..\\..\\GENERIC_VAR\\shared\\Participante\\suit_setup_cadastro_INR.robot
Resource            ${CURDIR}\\..\\..\\GENERIC_VAR\\Login.robot
Resource            ${CURDIR}\\..\\..\\GENERIC_VAR\\Keywords.robot
Resource            ${CURDIR}\\..\\..\\GENERIC_VAR\\KeywordsFichaCadastroPrevio.robot
Resource            ${CURDIR}\\..\\..\\GENERIC_VAR\\KeywordsEfetivarParticipante.robot
Resource            ${CURDIR}\\..\\..\\GENERIC_VAR\\KeywordsManutencaoParticipante.robot
Resource            ${CURDIR}\\..\\..\\GENERIC_VAR\\keywordConsultaBD.robot
Resource            ${CURDIR}\\..\\..\\GENERIC_VAR\\KeywordsNovosParticipantes.robot
Suite Setup         Run Keywords 
...                 Gerado massa para participante INR   AND
...                 Log    Suite Setup!
Test Setup          setup inicial  
Test Teardown       Close Browser 
Suite Teardown      Run keywords 
...                 Log    Suite Teardown!    AND
...                 Close All Browsers   AND
...                 anexar log de execução no JIRA

*** Variable ***
${DIRETORIO_IMAGENS}                ${CURDIR}\\Resultados\\img
${PATH_CSV}                         ${CURDIR}\\Resultados\\csv
${var_amb}=                         qaa
${TOGGLE}=                          NAO
${CAPTCHA_HABILITADO}=              NAO
${EMAIL_TOKEN_CADASTRO_PREVIO}=     prestador-william.silva@b3.com.br
@{header_resultado}                 DATA_EXECUCAO_TESTE  NUM_ID_EVENTO_CADASTRO_B3I  DAT_INCLUSAO  NUM_ID_SERVICO  RAZAO_SOCIAL  CNPJ  CONTA  SITUACAO_CONTA  NUM_STATUS_ESPERADO  NUM_STATUS_RETORNO  DAT_PROCESSAMENTO


*** Test Cases ***
TST0001: Incluindo nova conta miolo (00) para participante INR BANCO MULTIPLO 01 no sistema NoMe
    [Tags]      PROGRESSIVO_FILA_EVENTO_PARTICIPANTE_INR_ON
    [Setup]     Atualizar Status     QBEF-64228   QBEF-64227   EXECUTING
    [Teardown]  Atualizar Status     QBEF-64228   QBEF-64227   ${TEST_STATUS}

    que eu defina a variavel MALOTE_TITULAR com o valor Sim como uma variavel global
    que eu defina a variavel MALOTE_PRACA com o valor PR como uma variavel global
    que eu defina a variavel LIQUIDANTE com o valor ITAUBM como uma variavel global

    Dado o usuario loga no NoMe como CETIP
    E o Usuario acessa o menu de Alteracao de Participante e faz a busca pelo CNPJ
    E o usuario realiza a inclusão de uma nova conta com tipo PROPRIA (00)
    E Pega valor do campo conta e armazena na variavel CONTA_00
    Close Browser
TST0002: Incluindo nova conta miolo (10) para participante INR BANCO MULTIPLO 01 no sistema NoMe
    [Tags]      PROGRESSIVO_FILA_EVENTO_PARTICIPANTE_INR_ON
    [Setup]     Atualizar Status     QBEF-64229   QBEF-64227   EXECUTING
    [Teardown]  Atualizar Status     QBEF-64229   QBEF-64227   ${TEST_STATUS}

    que eu defina a variavel MALOTE_TITULAR com o valor Sim como uma variavel global
    que eu defina a variavel MALOTE_PRACA com o valor PR como uma variavel global
    que eu defina a variavel LIQUIDANTE com o valor ITAUBM como uma variavel global

    Dado o usuario loga no NoMe como CETIP
    E o Usuario acessa o menu de Alteracao de Participante e faz a busca pelo CNPJ
    E o usuario realiza a inclusão de uma nova conta com tipo CLIENTE 1 - GERAL (10)
    E Pega valor do campo conta e armazena na variavel CONTA_10
    Close Browser
TST0003: Incluindo nova conta miolo (20) para participante INR BANCO MULTIPLO 01 no sistema NoMe
    [Tags]      PROGRESSIVO_FILA_EVENTO_PARTICIPANTE_INR_ON
    [Setup]     Atualizar Status     QBEF-64230   QBEF-64227   EXECUTING
    [Teardown]  Atualizar Status     QBEF-64230   QBEF-64227   ${TEST_STATUS}

    que eu defina a variavel MALOTE_TITULAR com o valor Sim como uma variavel global
    que eu defina a variavel MALOTE_PRACA com o valor PR como uma variavel global
    que eu defina a variavel LIQUIDANTE com o valor ITAUBM como uma variavel global

    Dado o usuario loga no NoMe como CETIP
    E o Usuario acessa o menu de Alteracao de Participante e faz a busca pelo CNPJ
    E o usuario realiza a inclusão de uma nova conta com tipo CLIENTE 2 - GERAL (20)
    E Pega valor do campo conta e armazena na variavel CONTA_20
    Close Browser
TST0004: Incluindo nova conta miolo (69) para participante INR BANCO MULTIPLO 01 no sistema NoMe
    [Tags]      PROGRESSIVO_FILA_EVENTO_PARTICIPANTE_INR_ON
    [Setup]     Atualizar Status     QBEF-64232   QBEF-64227   EXECUTING
    [Teardown]  Atualizar Status     QBEF-64232   QBEF-64227   ${TEST_STATUS}

    que eu defina a variavel MALOTE_TITULAR com o valor Sim como uma variavel global
    que eu defina a variavel MALOTE_PRACA com o valor PR como uma variavel global
    que eu defina a variavel LIQUIDANTE com o valor ITAUBM como uma variavel global

    Dado o usuario loga no NoMe como CETIP
    E o Usuario acessa o menu de Alteracao de Participante e faz a busca pelo CNPJ
    E o usuario realiza a inclusão de uma nova conta com tipo INTERMEDIACAO (69)
    E Pega valor do campo conta e armazena na variavel CONTA_69     
    Close Browser   
TST0005: Valida miolos de conta INR BANCO MULTIPLO 01 que serão enviados para o B3i
    [Tags]    PROGRESSIVO_FILA_EVENTO_PARTICIPANTE_INR_ON
    [Setup]     Atualizar Status     QBEF-64233   QBEF-64227   EXECUTING
    [Teardown]  Atualizar Status     QBEF-64233   QBEF-64227   ${TEST_STATUS}

    ${list_contas}      Set Variable       '${CONTA_00}','${CONTA_10}','${CONTA_20}','${CONTA_69}'
    Dado que eu defina a variavel list_contas com o valor ${list_contas} como uma variavel global
    Dado que eu defina a variavel NAME_CSV com o valor ${TAG_NUMBER}-BANCO-MULTIPLO-01-InclusaoContas como uma variavel global
    
    E que eu execute a query consultando as contas na fila de eventos de participante e exporte o resultado para csv
    Então eu valido os tipos de contas ${miolo_contas_habilitado} no arquivo ${NAME_CSV} exportado para o diretorio ${PATH_CSV}

*** Keywords ***
eu valido os tipos de contas ${miolo_contas_habilitado} no arquivo ${nome_arquivo} exportado para o diretorio ${path_diretorio}
    Verificar valores na coluna 6 do CSV ${path_diretorio}\\${nome_arquivo} permitindo ao menos um valor da lista ${miolo_contas_habilitado}
que o teste seja concluido com sucesso
    Log     Teste Finalizado com Sucesso!
setup inicial    
    Setar numero da TAG
    Set Global Variable     ${TAG_NUMBER}  
anexar log de execução no JIRA
    Remover log de execução no JIRA ${DIR_LOG_EXEC} ${NAME_ZIP_IMG}
    Remover log de execução no JIRA ${DIR_LOG_EXEC} ${NAME_ZIP_CSV}
    Remover log de execução no JIRA ${DIR_LOG_EXEC} ${NAME_LOG_EXEC}
    Zipar log das imagens ${PATH_IMG} ${PATH_EXEC}\\${NAME_ZIP_IMG}
    Zipar log das imagens ${PATH_CSV} ${PATH_EXEC}\\${NAME_ZIP_CSV}
    Anexar log de execução no JIRA ${PATH_EXEC}\\${NAME_ZIP_IMG} ${NAME_ZIP_IMG}
    Anexar log de execução no JIRA ${PATH_EXEC}\\${NAME_ZIP_CSV} ${NAME_ZIP_CSV}
*** Variable ***    
${TEST_KEY}=              64227
${TEST_EXEC_KEY}=         64227
${PATH_EXEC}=             ${CURDIR}\\Resultados
${NAME_ZIP_IMG}=          imgTelaNoMe.zip
${NAME_ZIP_CSV}=          csvFilaBancoDeDados.zip
${NAME_LOG_EXEC}=         log.html
${DIR_LOG_EXEC}=          ${PATH_EXEC}\\${NAME_LOG_EXEC}
${PATH_IMG}=              ${PATH_EXEC}\\img
${PATH_CSV}=              ${PATH_EXEC}\\csv
${DIR_OUTPUT}=            ${PATH_EXEC}\\output.xml

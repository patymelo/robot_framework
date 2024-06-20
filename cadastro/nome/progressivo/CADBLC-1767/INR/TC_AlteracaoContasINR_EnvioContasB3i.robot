Language: pt-br

*** Settings ***
Documentation       Alteração de conta 00,10,20 e 69 para participante INR.
...                 Incluindo cadastro web e efetivando no sistema NoMe (Geração de massa).
...                 Alteração contas para o participante.
...                 ** ATENÇÃO **: Variáveis dentro dos casos de teste precisa utilizar Set Global Variable
...                 para ficar visivel nos Resources dentro do diretório GENERIC_VAR.
Resource            ${CURDIR}\\..\\..\\GENERIC_VAR\\shared\\Participante\\suit_setup_cadastro_INR.robot
Resource            ${CURDIR}\\..\\..\\GENERIC_VAR\\shared\\Participante\\suit_setup_inclusao_contas.robot
Resource            ${CURDIR}\\..\\..\\GENERIC_VAR\\Login.robot
Resource            ${CURDIR}\\..\\..\\GENERIC_VAR\\Keywords.robot
Resource            ${CURDIR}\\..\\..\\GENERIC_VAR\\KeywordsFichaCadastroPrevio.robot
Resource            ${CURDIR}\\..\\..\\GENERIC_VAR\\KeywordsEfetivarParticipante.robot
Resource            ${CURDIR}\\..\\..\\GENERIC_VAR\\KeywordsManutencaoParticipante.robot
Resource            ${CURDIR}\\..\\..\\GENERIC_VAR\\keywordConsultaBD.robot
Resource            ${CURDIR}\\..\\..\\GENERIC_VAR\\KeywordsNovosParticipantes.robot
Suite Setup         Run Keywords 
...                 Gerado massa para participante INR  AND
...                 Gerado massa - Inclusão Contas   AND
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
TST0001: Usuário altera dados de conta PROPRIA (00) e não altera a situação
    [Tags]    PROGRESSIVO_CADBLC_1767       PROGRESSIVO_FILA_EVENTO_PARTICIPANTE_INR_ON
    [Setup]         Atualizar Status    QBEF-64274    QBEF-64238    EXECUTING
    [Teardown]      Atualizar Status    QBEF-64274    QBEF-64238    ${TEST_STATUS}
    
    que eu defina a variavel BROWSER_OPEN com o valor NAO como uma variavel global

    Dado que eu acesse menu de Alteracao de Participante verifica a situação atual da conta ${CONTA_00}
    E o usuário altera diversos campos da conta ${CONTA_00} sem alterar a situação da conta
    Então o usuário verifica que não houve inclusão de registro na fila TCTPEVENTO_CADASTRO_B3I entre ${hora_inicio_alteracao_dados_conta} e ${hora_fim_alteracao_dados_conta} para a conta ${CONTA_00}
TST0002: Usuário altera dados de conta CLIENTE 1 - GERAL (10) e não altera a situação
    [Tags]    PROGRESSIVO_CADBLC_1767       PROGRESSIVO_FILA_EVENTO_PARTICIPANTE_INR_ON
    [Setup]         Atualizar Status    QBEF-64275    QBEF-64238    EXECUTING
    [Teardown]      Atualizar Status    QBEF-64275    QBEF-64238    ${TEST_STATUS}
    Dado que eu acesse menu de Alteracao de Participante verifica a situação atual da conta ${CONTA_10}
    E o usuário altera diversos campos da conta ${CONTA_10} sem alterar a situação da conta
    Então o usuário verifica que não houve inclusão de registro na fila TCTPEVENTO_CADASTRO_B3I entre ${hora_inicio_alteracao_dados_conta} e ${hora_fim_alteracao_dados_conta} para a conta ${CONTA_10}
TST0003: Usuário altera dados de conta CLIENTE 2 - GERAL (20) e não altera a situação
    [Tags]    PROGRESSIVO_CADBLC_1767       PROGRESSIVO_FILA_EVENTO_PARTICIPANTE_INR_ON
    [Setup]         Atualizar Status    QBEF-64276    QBEF-64238    EXECUTING
    [Teardown]      Atualizar Status    QBEF-64276    QBEF-64238    ${TEST_STATUS}
    Dado que eu acesse menu de Alteracao de Participante verifica a situação atual da conta ${CONTA_20}
    E o usuário altera diversos campos da conta ${CONTA_20} sem alterar a situação da conta
    Então o usuário verifica que não houve inclusão de registro na fila TCTPEVENTO_CADASTRO_B3I entre ${hora_inicio_alteracao_dados_conta} e ${hora_fim_alteracao_dados_conta} para a conta ${CONTA_20}
TST0004: Usuário altera dados de conta INTERMEDIACAO (69) e não altera a situação
    [Tags]    PROGRESSIVO_CADBLC_1767       PROGRESSIVO_FILA_EVENTO_PARTICIPANTE_INR_ON
    [Setup]         Atualizar Status    QBEF-64277    QBEF-64238    EXECUTING
    [Teardown]      Atualizar Status    QBEF-64277    QBEF-64238    ${TEST_STATUS}
    Dado que eu acesse menu de Alteracao de Participante verifica a situação atual da conta ${CONTA_69}
    E o usuário altera diversos campos da conta ${CONTA_69} sem alterar a situação da conta
    Então o usuário verifica que não houve inclusão de registro na fila TCTPEVENTO_CADASTRO_B3I entre ${hora_inicio_alteracao_dados_conta} e ${hora_fim_alteracao_dados_conta} para a conta ${CONTA_69}
TST0005: Usuário altera situacão de conta PROPRIA (00)
    [Tags]    PROGRESSIVO_CADBLC_1767       PROGRESSIVO_FILA_EVENTO_PARTICIPANTE_INR_ON
    [Setup]         Atualizar Status    QBEF-64278    QBEF-64238    EXECUTING
    [Teardown]      Atualizar Status    QBEF-64278    QBEF-64238    ${TEST_STATUS}
    Dado que eu acesse menu de Alteracao de Participante verifica a situação atual da conta ${CONTA_00}
    Então o usuário altera a situação da conta ${CONTA_00} de acordo com a situação atual
TST0006: Usuário altera situacão de conta CLIENTE 1 - GERAL (10)
    [Tags]    PROGRESSIVO_CADBLC_1767       PROGRESSIVO_FILA_EVENTO_PARTICIPANTE_INR_ON
    [Setup]         Atualizar Status    QBEF-64279    QBEF-64238    EXECUTING
    [Teardown]      Atualizar Status    QBEF-64279    QBEF-64238    ${TEST_STATUS}
    Dado que eu acesse menu de Alteracao de Participante verifica a situação atual da conta ${CONTA_10}
    Então o usuário altera a situação da conta ${CONTA_10} de acordo com a situação atual
TST0007: Usuário altera situacão de conta CLIENTE 2 - GERAL (20)
    [Tags]    PROGRESSIVO_CADBLC_1767       PROGRESSIVO_FILA_EVENTO_PARTICIPANTE_INR_ON
    [Setup]         Atualizar Status    QBEF-64280    QBEF-64238    EXECUTING
    [Teardown]      Atualizar Status    QBEF-64280    QBEF-64238    ${TEST_STATUS}
    Dado que eu acesse menu de Alteracao de Participante verifica a situação atual da conta ${CONTA_20}
    Então o usuário altera a situação da conta ${CONTA_20} de acordo com a situação atual
TST0008: Usuário altera situacão de conta INTERMEDIACAO (69)
    [Tags]    PROGRESSIVO_CADBLC_1767       PROGRESSIVO_FILA_EVENTO_PARTICIPANTE_INR_ON
    [Setup]         Atualizar Status    QBEF-64281    QBEF-64238    EXECUTING
    [Teardown]      Atualizar Status    QBEF-64281    QBEF-64238    ${TEST_STATUS}
    Dado que eu acesse menu de Alteracao de Participante verifica a situação atual da conta ${CONTA_69}
    Então o usuário altera a situação da conta ${CONTA_69} de acordo com a situação atual
TST0009: Valida miolos de conta INR BANCO MULTIPLO 01 que serão enviados para o B3i
    [Tags]    PROGRESSIVO_CADBLC_1767       PROGRESSIVO_FILA_EVENTO_PARTICIPANTE_INR_ON
    [Setup]     Atualizar Status     QBEF-64282   QBEF-64238   EXECUTING
    [Teardown]  Atualizar Status     QBEF-64282   QBEF-64238   ${TEST_STATUS}

    ${list_contas}      Set Variable       '${CONTA_00}','${CONTA_10}','${CONTA_20}','${CONTA_69}'
    que eu defina a variavel list_contas com o valor ${list_contas} como uma variavel global
    que eu defina a variavel NAME_CSV com o valor ${TAG_NUMBER}-BANCO-MULTIPLO-01-AlteracaoContas como uma variavel global
    
    Dado que eu execute a query consultando as contas na fila de eventos de participante e exporte o resultado para csv
    Então eu valido os tipos de contas ${miolo_contas_habilitado} no arquivo ${NAME_CSV} exportado para o diretorio ${PATH_CSV}

*** Keywords ***
que eu acesse menu de Alteracao de Participante verifica a situação atual da conta ${conta}
    LOG  ${BROWSER_OPEN}
    IF  "${BROWSER_OPEN}" == "NAO"
        Dado o usuario loga no NoMe como CETIP
        E o Usuario acessa o menu de Alteracao de Participante e faz a busca pelo CNPJ
        E o usuario verifica a situação atual da conta ${conta}
        ${BROWSER_OPEN}=  Set Variable  SIM
        Set Global Variable  ${BROWSER_OPEN}
    ELSE
        Dado o usuario verifica a situação atual da conta ${conta}
    END
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
${TEST_KEY}=              64238
${TEST_EXEC_KEY}=         64238
${PATH_EXEC}=             ${CURDIR}\\Resultados
${NAME_ZIP_IMG}=          imgTelaNoMe.zip
${NAME_ZIP_CSV}=          csvFilaBancoDeDados.zip
${NAME_LOG_EXEC}=         log.html
${DIR_LOG_EXEC}=          ${PATH_EXEC}\\${NAME_LOG_EXEC}
${PATH_IMG}=              ${PATH_EXEC}\\img
${PATH_CSV}=              ${PATH_EXEC}\\csv
${DIR_OUTPUT}=            ${PATH_EXEC}\\output.xml

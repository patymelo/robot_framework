Language: pt-br

*** Settings ***
Documentation       Bloqueio de conta 00,10,20,40 e 69 para participante Emissor.
...                 Incluindo cadastro web e efetivando no sistema NoMe (Geração de massa).
...                 Alteração contas para o participante.
...                 ** ATENÇÃO **: Variáveis dentro dos casos de teste precisa utilizar Set Global Variable
...                 para ficar visivel nos Resources dentro do diretório GENERIC_VAR.
Resource            ${CURDIR}\\..\\..\\GENERIC_VAR\\shared\\Participante\\suit_setup_cadastro_emissor.robot
Resource            ${CURDIR}\\..\\..\\GENERIC_VAR\\shared\\Participante\\suit_setup_inclusao_contas.robot
Resource            ${CURDIR}\\..\\..\\GENERIC_VAR\\Login.robot
Resource            ${CURDIR}\\..\\..\\GENERIC_VAR\\Keywords.robot
Resource            ${CURDIR}\\..\\..\\GENERIC_VAR\\KeywordsFichaCadastroPrevio.robot
Resource            ${CURDIR}\\..\\..\\GENERIC_VAR\\KeywordsEfetivarParticipante.robot
Resource            ${CURDIR}\\..\\..\\GENERIC_VAR\\KeywordsManutencaoParticipante.robot
Resource            ${CURDIR}\\..\\..\\GENERIC_VAR\\keywordConsultaBD.robot
Resource            ${CURDIR}\\..\\..\\GENERIC_VAR\\KeywordsNovosParticipantes.robot
Suite Setup         Run Keywords 
...                 Gerado massa para participante Emissor  AND
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
TST0001: Usuário bloqueia a conta PROPRIA (00)
    [Tags]       PROGRESSIVO_CADBLC_1768          PROGRESSIVO_FILA_BLOQUEIA_CONTA_EVENTO_PARTICIPANTE_EMISSOR_ON
    [Setup]         Atualizar Status    QBEF-64306    QBEF-64295    EXECUTING
    [Teardown]      Atualizar Status    QBEF-64306    QBEF-64295    ${TEST_STATUS}

    que eu defina a variavel BROWSER_OPEN com o valor NAO como uma variavel global

    Dado que eu acesse menu de Alteracao de Participante
    Quando o usuário entra na ação BLOQUEAR e faz o bloqueio da conta ${CONTA_00} informando a justificativa (Teste Envia Bloqueio conta 00) e nova conta cobrança/principal ${CONTA_PRINCIPAL}
    Então o usuario verifica se o ultimo registro incluido na fila TCTPEVENTO_CADASTRO_B3I entre ${hora_inicio_bloqueio_conta} e ${hora_fim_bloqueio_conta} para a conta ${CONTA_00} foi com situação BLOQUEADA
TST0002: Usuário bloqueia a conta CLIENTE 1 - GERAL (10)
    [Tags]       PROGRESSIVO_CADBLC_1768          PROGRESSIVO_FILA_BLOQUEIA_CONTA_EVENTO_PARTICIPANTE_EMISSOR_ON
    [Setup]         Atualizar Status    QBEF-64307    QBEF-64295    EXECUTING
    [Teardown]      Atualizar Status    QBEF-64307    QBEF-64295    ${TEST_STATUS}
  
    Dado que eu acesse menu de Alteracao de Participante
    Quando o usuário entra na ação BLOQUEAR e faz o bloqueio da conta ${CONTA_10} informando a justificativa (Teste Envia Bloqueio conta 10) e nova conta cobrança/principal ${CONTA_PRINCIPAL}
    Então o usuario verifica se o ultimo registro incluido na fila TCTPEVENTO_CADASTRO_B3I entre ${hora_inicio_bloqueio_conta} e ${hora_fim_bloqueio_conta} para a conta ${CONTA_10} foi com situação BLOQUEADA
TST0003: Usuário bloqueia a conta CLIENTE 2 - GERAL (20)
    [Tags]       PROGRESSIVO_CADBLC_1768          PROGRESSIVO_FILA_BLOQUEIA_CONTA_EVENTO_PARTICIPANTE_EMISSOR_ON
    [Setup]         Atualizar Status    QBEF-64308    QBEF-64295    EXECUTING
    [Teardown]      Atualizar Status    QBEF-64308    QBEF-64295    ${TEST_STATUS}
 
    Dado que eu acesse menu de Alteracao de Participante
    Quando o usuário entra na ação BLOQUEAR e faz o bloqueio da conta ${CONTA_20} informando a justificativa (Teste Envia Bloqueio conta 20) e nova conta cobrança/principal ${CONTA_PRINCIPAL}
    Então o usuario verifica se o ultimo registro incluido na fila TCTPEVENTO_CADASTRO_B3I entre ${hora_inicio_bloqueio_conta} e ${hora_fim_bloqueio_conta} para a conta ${CONTA_20} foi com situação BLOQUEADA
TST0004: Usuário bloqueia a conta INTERMEDIACAO (69)
    [Tags]    PROGRESSIVO_CADBLC_1768          PROGRESSIVO_FILA_BLOQUEIA_CONTA_EVENTO_PARTICIPANTE_EMISSOR_ON
    [Setup]         Atualizar Status    QBEF-64309    QBEF-64295    EXECUTING
    [Teardown]      Atualizar Status    QBEF-64309    QBEF-64295    ${TEST_STATUS}
  
    Dado que eu acesse menu de Alteracao de Participante
    Quando o usuário entra na ação BLOQUEAR e faz o bloqueio da conta ${CONTA_69} informando a justificativa (Teste Envia Bloqueio conta 69) e nova conta cobrança/principal ${CONTA_PRINCIPAL}
    Então o usuário verifica que não houve inclusão de registro na fila TCTPEVENTO_CADASTRO_B3I entre ${hora_inicio_bloqueio_conta} e ${hora_fim_bloqueio_conta} para a conta ${CONTA_69}
TST0005: Valida miolos de conta do participante Emissor que serão enviados para o B3i
    [Tags]    PROGRESSIVO_CADBLC_1768          PROGRESSIVO_FILA_BLOQUEIA_CONTA_EVENTO_PARTICIPANTE_EMISSOR_ON
    [Setup]     Atualizar Status     QBEF-64310   QBEF-64295   EXECUTING
    [Teardown]  Atualizar Status     QBEF-64310   QBEF-64295   ${TEST_STATUS}

    ${list_contas}      Set Variable       '${CONTA_00}','${CONTA_10}','${CONTA_20}','${CONTA_69}'
    ${miolo_contas_habilitado}     Create List     .00-  .10-  .20-

    que eu defina a variavel list_contas com o valor ${list_contas} como uma variavel global
    que eu defina a variavel NAME_CSV com o valor ${TAG_NUMBER}-BANCO-MULTIPLO-01-BloqueioContas como uma variavel global
    
    Dado que eu execute a query consultando as contas na fila de eventos de participante e exporte o resultado para csv
    Então eu valido os tipos de contas ${miolo_contas_habilitado} no arquivo ${NAME_CSV} exportado para o diretorio ${PATH_CSV}

*** Keywords ***
que eu acesse menu de Alteracao de Participante
    LOG  ${BROWSER_OPEN}
    IF  "${BROWSER_OPEN}" == "NAO"
        Dado o usuario loga no NoMe como CETIP
        E o Usuario acessa o menu de Alteracao de Participante e faz a busca pelo CNPJ
        ${BROWSER_OPEN}=  Set Variable  SIM
        Set Global Variable  ${BROWSER_OPEN}
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
${TEST_KEY}=              64295
${TEST_EXEC_KEY}=         64295
${PATH_EXEC}=             ${CURDIR}\\Resultados
${NAME_ZIP_IMG}=          imgTelaNoMeBloqueioContaEmissor.zip
${NAME_ZIP_CSV}=          csvFilaBancoDeDadosBloqueioContaEmissor.zip
${NAME_LOG_EXEC}=         log.html
${DIR_LOG_EXEC}=          ${PATH_EXEC}\\${NAME_LOG_EXEC}
${PATH_IMG}=              ${PATH_EXEC}\\img
${PATH_CSV}=              ${PATH_EXEC}\\csv
${DIR_OUTPUT}=            ${PATH_EXEC}\\output.xml

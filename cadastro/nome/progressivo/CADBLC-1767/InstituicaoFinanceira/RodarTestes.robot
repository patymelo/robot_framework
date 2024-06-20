*** Settings ***
Documentation       Anexo Log Jira CADBLC1767 - Instituição Financeira
Suite Setup         Log    Suite Setup!
Suite Teardown      Log    Suite Teardown!
Resource            ${CURDIR}\\..\\..\\GENERIC_VAR\\Keywords.robot

*** Variable ***    
${TEST_KEY}=              64237
${TEST_EXEC_KEY}=         64237
${PATH_EXEC}=             ${CURDIR}\\Resultados
${NAME_ZIP_IMG}=          imgTelaNoMe.zip
${NAME_ZIP_CSV}=          csvFilaBancoDeDados.zip
${NAME_LOG_EXEC}=         log.html
${DIR_LOG_EXEC}=          ${PATH_EXEC}\\${NAME_LOG_EXEC}
${PATH_IMG}=              ${PATH_EXEC}\\img
${PATH_CSV}=              ${PATH_EXEC}\\csv
${DIR_OUTPUT}=            ${PATH_EXEC}\\output.xml

*** Test Cases ***
Anexar log de execução no JIRA
    Executar teste      ${CURDIR}    Progressivo: Alteração Contas Participante Instituição Financeira     ${CURDIR}\\Resultados     PROGRESSIVO_FILA_EVENTO_PARTICIPANTE_INSTITUICAO_FINANCEIRA_ON
    Anexar log de execução no JIRA ${DIR_LOG_EXEC} ${NAME_LOG_EXEC}
*** Settings ***
Documentation       Anexo Log Jira CADBLC1769 - INR
Suite Setup         Log    Suite Setup!
Suite Teardown      Log    Suite Teardown!
Resource            ${CURDIR}\\..\\..\\GENERIC_VAR\\Keywords.robot

*** Variable ***    
${TEST_KEY}=              64376
${TEST_EXEC_KEY}=         64376
${PATH_EXEC}=             ${CURDIR}\\Resultados
${NAME_ZIP_IMG}=          imgTelaNoMeINR.zip
${NAME_ZIP_CSV}=          csvFilaBancoDeDadosINR.zip
${NAME_LOG}=              log.html
${NAME_LOG_EXEC}=         logCADBLC1769INR.html
${DIR_LOG_EXEC}=          ${PATH_EXEC}\\${NAME_LOG}
${PATH_IMG}=              ${PATH_EXEC}\\img
${PATH_CSV}=              ${PATH_EXEC}\\csv
${DIR_OUTPUT}=            ${PATH_EXEC}\\output.xml

*** Test Cases ***
Anexar log de execução no JIRA
    Executar teste      ${CURDIR}    Progressivo: Encerrar Contas Participante INR     ${CURDIR}\\Resultados     PROGRESSIVO_CADBLC_1769
    Anexar log de execução no JIRA ${DIR_LOG_EXEC} ${NAME_LOG_EXEC}
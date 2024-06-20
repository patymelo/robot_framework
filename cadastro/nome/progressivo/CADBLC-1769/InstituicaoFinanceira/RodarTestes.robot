*** Settings ***
Documentation       Anexo Log Jira CADBLC1769 - Instituição Financeira
Suite Setup         Log    Suite Setup!
Suite Teardown      Log    Suite Teardown!
Resource            ${CURDIR}\\..\\..\\GENERIC_VAR\\Keywords.robot

*** Variable ***    
${TEST_KEY}=              64378
${TEST_EXEC_KEY}=         64378
${PATH_EXEC}=             ${CURDIR}\\Resultados
${NAME_LOG}=              log.html
${NAME_LOG_EXEC}=         logCADBLC1769InsituicaoFinanceira.html
${DIR_LOG_EXEC}=          ${PATH_EXEC}\\${NAME_LOG}

*** Test Cases ***
Anexar log de execução no JIRA
    Executar teste      ${CURDIR}    Progressivo: Encerrar Contas Participante Instituição Financeira     ${CURDIR}\\Resultados     PROGRESSIVO_CADBLC_1769
    Anexar log de execução no JIRA ${DIR_LOG_EXEC} ${NAME_LOG_EXEC}
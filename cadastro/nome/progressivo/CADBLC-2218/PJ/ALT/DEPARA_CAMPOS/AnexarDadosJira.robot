*** Settings ***
Documentation       Teste API Comitente /legal-investors
Suite Setup         Log    Suite Setup!
Suite Teardown      Log    Suite Teardown!
Resource            ${CURDIR}\\..\\..\\..\\..\\GENERIC_VAR\\Keywords.robot

*** Test Cases ***
TST0001: Anexar log de execução no JIRA
    [Tags]    ANEXO_ZIRA
    Remover log de execução no JIRA ${DIR_LOG_EXEC} ${NAME_LOG_EXEC}
    Zipar log das imagens ${PATH_IMG} ${PATH_EXEC}\\${NAME_ZIP_IMG}
    Anexar log de execução no JIRA ${PATH_EXEC}\\${NAME_ZIP_IMG} ${NAME_ZIP_IMG}
    Anexar log de execução no JIRA ${DIR_LOG_EXEC} ${NAME_LOG_EXEC}
    ${status}=   consultar status  ${DIR_OUTPUT}
    Atualizacao status Jira ${TEST_EXEC_KEY} ${TEST_KEY} ${status}
*** Variable ***
${TEST_EXEC_KEY}=     63378
${TEST_KEY}=          63379
${PATH_EXEC}=         ${CURDIR}\\Resultados\\log
${DIR_LOG_EXEC}=      ${PATH_EXEC}\\log.html
${NAME_LOG_EXEC}=     log.html
${PATH_IMG}=          ${PATH_EXEC}\\img
${NAME_ZIP_IMG}=      imgCADBLC2218PJResidenteDepara.zip
${DIR_OUTPUT}=        ${PATH_EXEC}\\output.xml
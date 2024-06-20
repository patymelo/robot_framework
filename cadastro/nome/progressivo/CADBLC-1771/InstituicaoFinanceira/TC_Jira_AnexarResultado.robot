*** Settings ***
Documentation       Anexo Log Jira CADBLC1765 - Instituicao Financeira
Suite Setup         Log    Suite Setup!
Suite Teardown      Log    Suite Teardown!
Resource            ${CURDIR}\\..\\..\\GENERIC_VAR\\Keywords.robot

*** Variable ***

*** Test Cases ***
TST0001: Anexar log de execução no JIRA para o teste que encerra participante INR
    [Tags]    UPLOAD_RESULTADO_JIRA
    ${TEST_KEY}=            Set Variable        64133
    ${TEST_EXEC_KEY}=       Set Variable        64138
    ${PATH_EXEC}=           Set Variable        ${CURDIR}\\Resultados
    ${NAME_ZIP_IMG}=        Set Variable        imgTelaNoMe.zip
    ${NAME_ZIP_CSV}=        Set Variable        csvFilaBancoDeDados.zip
    ${NAME_LOG_EXEC}=       Set Variable        log.html
    ${DIR_LOG_EXEC}=        Set Variable        ${PATH_EXEC}\\${NAME_LOG_EXEC}
    ${PATH_IMG}=            Set Variable        ${PATH_EXEC}\\img
    ${PATH_CSV}=            Set Variable        ${PATH_EXEC}\\csv
    ${DIR_OUTPUT}=          Set Variable        ${PATH_EXEC}\\output.xml

    Set test Variable       ${TEST_KEY}
    Set test Variable       ${TEST_EXEC_KEY}
    Set test Variable       ${PATH_EXEC}
    Set test Variable       ${NAME_ZIP_IMG}
    Set test Variable       ${NAME_ZIP_CSV}
    Set test Variable       ${NAME_LOG_EXEC}
    Set test Variable       ${DIR_LOG_EXEC}
    Set test Variable       ${PATH_IMG}
    Set test Variable       ${PATH_CSV}
    Set test Variable       ${DIR_OUTPUT}

    Remover log de execução no JIRA ${DIR_LOG_EXEC} ${NAME_ZIP_IMG}
    Remover log de execução no JIRA ${DIR_LOG_EXEC} ${NAME_ZIP_CSV}
    Remover log de execução no JIRA ${DIR_LOG_EXEC} ${NAME_LOG_EXEC}
    Zipar log das imagens ${PATH_IMG} ${PATH_EXEC}\\${NAME_ZIP_IMG}
    Zipar log das imagens ${PATH_CSV} ${PATH_EXEC}\\${NAME_ZIP_CSV}
    Anexar log de execução no JIRA ${PATH_EXEC}\\${NAME_ZIP_IMG} ${NAME_ZIP_IMG}
    Anexar log de execução no JIRA ${PATH_EXEC}\\${NAME_ZIP_CSV} ${NAME_ZIP_CSV}
    Anexar log de execução no JIRA ${DIR_LOG_EXEC} ${NAME_LOG_EXEC}
    ${status}=   consultar status  ${DIR_OUTPUT}
    Atualizacao status Jira ${TEST_EXEC_KEY} ${TEST_KEY} ${status}
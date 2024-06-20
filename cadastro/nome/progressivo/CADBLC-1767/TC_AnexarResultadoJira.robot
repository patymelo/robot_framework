*** Settings ***
Documentation       Anexar evidência no JIra
Suite Setup         Log    Suite Setup!
Suite Teardown      Log    Suite Teardown!
Resource            ${CURDIR}\\..\\..\\GENERIC_VAR\\Keywords.robot

*** Variable ***
${TEST_KEY}=            64153
${TEST_EXEC_KEY}=       64153
${PATH_EXEC}=           ${CURDIR}\\Resultados\\log
${NAME_ZIP_IMG}=        imgTelaNoMe.zip
${NAME_ZIP_CSV}=        csvFilaBancoDeDados.zip
${NAME_LOG_EXEC}=       log.html
${DIR_LOG_EXEC}=        ${PATH_EXEC}\\${NAME_LOG_EXEC}
${PATH_IMG}=            ${PATH_EXEC}\\img
${PATH_CSV}=            ${PATH_EXEC}\\csv
${DIR_OUTPUT}=          ${PATH_EXEC}\\output.xml

*** Test Cases ***
TST0001: Anexar log de execução no JIRA
    [Tags]    UPLOAD_RESULTADO_JIRA

#    Remover zip de imagens
#    Remover zip de arquivos csv
#    Remover log de resultado
#    Zipar imagens
#    Zipar arquivos csv
#    Anexar zip de imagens
#    Anexar zip de arquivos csv
#    Anexar log de resultado

*** Keywords ***
Remover zip de imagens
    Remover log de execução no JIRA ${DIR_LOG_EXEC} ${NAME_ZIP_IMG}
Remover zip de arquivos csv
    Remover log de execução no JIRA ${DIR_LOG_EXEC} ${NAME_ZIP_CSV}
Remover log de resultado
    Remover log de execução no JIRA ${DIR_LOG_EXEC} ${NAME_LOG_EXEC}
Zipar imagens
    Zipar log das imagens ${PATH_IMG} ${PATH_EXEC}\\${NAME_ZIP_IMG}
Zipar arquivos csv
    Zipar log das imagens ${PATH_CSV} ${PATH_EXEC}\\${NAME_ZIP_CSV}
Anexar zip de imagens
    Anexar log de execução no JIRA ${PATH_EXEC}\\${NAME_ZIP_IMG} ${NAME_ZIP_IMG}
Anexar zip de arquivos csv
    Anexar log de execução no JIRA ${PATH_EXEC}\\${NAME_ZIP_CSV} ${NAME_ZIP_CSV}
Anexar log de resultado
    Anexar log de execução no JIRA ${DIR_LOG_EXEC} ${NAME_LOG_EXEC}
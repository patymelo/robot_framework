*** Settings ***
Library       ${CURDIR}/../jira/jira_anexo.py
Library       ${CURDIR}/executarTestes.py
Library       ${CURDIR}/genericFunctions.py
Library       ${CURDIR}/../jira/ExecutionTimeChecker.py
Library       ${CURDIR}/../oracle/initConfigDB.py
Library       ${CURDIR}/RandomNumberGenerator.py
Library       OperatingSystem
Library       SeleniumLibrary
Library       String
Library       FakerLibrary    locale=pt_BR
Library       DateTime
Library       ArchiveLibrary
Library       ScreenCapLibrary
Library       Dialogs
Library       RequestsLibrary
Library       JSONLibrary
Library       Collections
Library       DatabaseLibrary
Library       XML
*** Variable ***
${path_oracle_client}  ${CURDIR}/../oracle/instantclient_19_22

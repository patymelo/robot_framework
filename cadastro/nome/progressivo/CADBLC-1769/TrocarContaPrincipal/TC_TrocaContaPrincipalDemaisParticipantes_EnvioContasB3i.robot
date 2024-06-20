Language: pt-br

*** Settings ***
Documentation       Trocar conta principal participante.
...                 Incluindo cadastro web e efetivando no sistema NoMe (Geração de massa).
...                 Alteração contas para o participante.
...                 ** ATENÇÃO **: Variáveis dentro dos casos de teste precisa utilizar Set Global Variable
...                 para ficar visivel nos Resources dentro do diretório GENERIC_VAR.

Resource            ${CURDIR}\\..\\..\\GENERIC_VAR\\shared\\Participante\\suit_setup_cadastro_Demais_Participantes.robot
Resource            ${CURDIR}\\..\\..\\GENERIC_VAR\\shared\\Participante\\suit_setup_cadastro_INR.robot
Resource            ${CURDIR}\\..\\..\\GENERIC_VAR\\shared\\Participante\\suit_setup_cadastro_emissor.robot
Resource            ${CURDIR}\\..\\..\\GENERIC_VAR\\shared\\Participante\\suit_setup_cadastro_instituicao_financeira.robot
Resource            ${CURDIR}\\..\\..\\GENERIC_VAR\\shared\\Participante\\suit_setup_inclusao_contas.robot
Resource            ${CURDIR}\\..\\..\\GENERIC_VAR\\Login.robot
Resource            ${CURDIR}\\..\\..\\GENERIC_VAR\\Keywords.robot
Resource            ${CURDIR}\\..\\..\\GENERIC_VAR\\KeywordsFichaCadastroPrevio.robot
Resource            ${CURDIR}\\..\\..\\GENERIC_VAR\\KeywordsEfetivarParticipante.robot
Resource            ${CURDIR}\\..\\..\\GENERIC_VAR\\KeywordsManutencaoParticipante.robot
Resource            ${CURDIR}\\..\\..\\GENERIC_VAR\\keywordConsultaBD.robot
Resource            ${CURDIR}\\..\\..\\GENERIC_VAR\\KeywordsNovosParticipantes.robot

Suite Setup         Log    Suite Setup!
Suite Teardown      Run keywords
...                     Log    Suite Teardown!
...                     AND    Close All Browsers
...                     AND    anexar log de execução no JIRA
Test Setup          setup inicial

*** Variables ***
${DIRETORIO_IMAGENS}                ${CURDIR}\\Resultados\\img
${PATH_CSV}                         ${CURDIR}\\Resultados\\csv
${var_amb}=                         qaa
${TOGGLE}=                          NAO
${CAPTCHA_HABILITADO}=              NAO
${EMAIL_TOKEN_CADASTRO_PREVIO}=     prestador-william.silva@b3.com.br
@{header_resultado}
...    DATA_EXECUCAO_TESTE
...    NUM_ID_EVENTO_CADASTRO_B3I
...    DAT_INCLUSAO
...    NUM_ID_SERVICO
...    RAZAO_SOCIAL
...    CNPJ
...    CONTA
...    SITUACAO_CONTA
...    NUM_STATUS_ESPERADO
...    NUM_STATUS_RETORNO
...    DAT_PROCESSAMENTO

${TEST_KEY}=                        64563
${TEST_EXEC_KEY}=                   64563
${PATH_EXEC}=                       ${CURDIR}\\Resultados
${NAME_ZIP_IMG}=                    imgTelaNoMeBloquearContaPrincipalParticipantes.zip
${NAME_ZIP_CSV}=                    csvFilaBancoDeDadosBloquearContaPrincipalParticipantes.zip
${NAME_LOG_EXEC}=                   log.html
${DIR_LOG_EXEC}=                    ${PATH_EXEC}\\${NAME_LOG_EXEC}
${PATH_IMG}=                        ${PATH_EXEC}\\img
${PATH_CSV}=                        ${PATH_EXEC}\\csv
${DIR_OUTPUT}=                      ${PATH_EXEC}\\output.xml


*** Test Cases ***
TST0001: Usuário troca a conta principal - Demais Participantes
    [Tags]    progressivo_cadblc_1769_troca_conta_principal_participante_on
    [Setup]    Run keywords
    ...    Atualizar Status    QBEF-64567    QBEF-64563    EXECUTING
    ...    AND    Gerado massa para participante DemaisParticipantes
    ...    AND    Gerado massa - Inclusão Contas

    ${list_contas}    Set Variable    '${CONTA_70}'
    LOG    ${list_contas}
    que eu defina a variavel list_contas com o valor ${list_contas} como uma variavel global

    Dado que eu acesse menu de Alteracao de Participante
    Quando o usuário entra na ação TROCAR CONTA PRINCIPAL e faz a troca da conta ${CONTA_70} informando a justificativa (Teste encerramento conta principal ${CONTA_PRINCIPAL})
    Então o usuario verifica se o ultimo registro incluido na fila TCTPEVENTO_CADASTRO_B3I entre ${hora_inicio_trocar_conta} e ${hora_fim_trocar_conta} para a conta ${CONTA_70} foi com situação ATIVA
    [Teardown]    Run keywords
    ...           Close Browser    AND
    ...           Atualizar Status    QBEF-64567    QBEF-64563    ${TEST_STATUS}

TST0002: Usuário troca a conta principal - INR
    [Tags]    progressivo_cadblc_1769_troca_conta_principal_participante_on
    [Setup]    Run keywords
    ...    Atualizar Status    QBEF-64565    QBEF-64563    EXECUTING
    ...    AND    Gerado massa para participante INR
    ...    AND    Gerado massa - Inclusão Contas

    ${list_contas}    Set Variable    ${list_contas}',${CONTA_70}'
    LOG    ${list_contas}
    que eu defina a variavel list_contas com o valor ${list_contas} como uma variavel global

    Dado que eu acesse menu de Alteracao de Participante
    Quando o usuário entra na ação TROCAR CONTA PRINCIPAL e faz a troca da conta ${CONTA_70} informando a justificativa (Teste encerramento conta principal ${CONTA_PRINCIPAL})
    Então o usuario verifica se o ultimo registro incluido na fila TCTPEVENTO_CADASTRO_B3I entre ${hora_inicio_trocar_conta} e ${hora_fim_trocar_conta} para a conta ${CONTA_70} foi com situação ATIVA
    [Teardown]    Run keywords
    ...           Close Browser    AND
    ...           Atualizar Status    QBEF-64565    QBEF-64563    ${TEST_STATUS}

TST0003: Usuário troca a conta principal - Emissor
    [Tags]    progressivo_cadblc_1769_troca_conta_principal_participante_on
    [Setup]    Run keywords
    ...    Atualizar Status    QBEF-64564    QBEF-64563    EXECUTING
    ...    AND    Gerado massa para participante Emissor
    ...    AND    Gerado massa - Inclusão Contas

    ${list_contas}    Set Variable    ${list_contas}',${CONTA_70}'
    LOG    ${list_contas}
    que eu defina a variavel list_contas com o valor ${list_contas} como uma variavel global

    Dado que eu acesse menu de Alteracao de Participante
    Quando o usuário entra na ação TROCAR CONTA PRINCIPAL e faz a troca da conta ${CONTA_70} informando a justificativa (Teste encerramento conta principal ${CONTA_PRINCIPAL})
    Então o usuario verifica se o ultimo registro incluido na fila TCTPEVENTO_CADASTRO_B3I entre ${hora_inicio_trocar_conta} e ${hora_fim_trocar_conta} para a conta ${CONTA_70} foi com situação ATIVA
    [Teardown]    Run keywords
    ...           Close Browser    AND
    ...           Atualizar Status    QBEF-64564    QBEF-64563    ${TEST_STATUS}

TST0004: Usuário troca a conta principal - Instituição Financeira
    [Tags]    progressivo_cadblc_1769_troca_conta_principal_participante_on
    [Setup]    Run keywords
    ...    Atualizar Status    QBEF-64566    QBEF-64563    EXECUTING
    ...    AND    Gerado massa para participante Instituição Financeira
    ...    AND    Gerado massa - Inclusão Contas

    ${list_contas}    Set Variable    ${list_contas}',${CONTA_PRINCIPAL}'
    LOG    ${list_contas}
    que eu defina a variavel list_contas com o valor ${list_contas} como uma variavel global

    Dado que eu acesse menu de Alteracao de Participante
    Quando o usuário entra na ação TROCAR CONTA PRINCIPAL e faz a troca da conta ${CONTA_70} informando a justificativa (Teste encerramento conta principal ${CONTA_PRINCIPAL})
    Então o usuario verifica se o ultimo registro incluido na fila TCTPEVENTO_CADASTRO_B3I entre ${hora_inicio_trocar_conta} e ${hora_fim_trocar_conta} para a conta ${CONTA_70} foi com situação ATIVA
    [Teardown]    Run keywords
    ...           Close Browser    AND
    ...           Atualizar Status    QBEF-64566    QBEF-64563    ${TEST_STATUS}

#TST0005: Valida miolos de contas dos participantes que serão enviados para o B3i
    #[Tags]    progressivo_cadblc_1769_troca_conta_principal_participante_on
    #[Setup]    Atualizar Status    QBEF-64567    QBEF-64563    EXECUTING

    #LOG    ${list_contas}
    #${miolo_contas_habilitado}    Create List    .00-    .10-    .20-

    #que eu defina a variavel NAME_CSV com o valor ${TAG_NUMBER}-TrocaContaPrincipal como uma variavel global

    #Dado que eu execute a query consultando as contas na fila de eventos de participante e exporte o resultado para csv
    #Então eu valido os tipos de contas ${miolo_contas_habilitado} no arquivo ${NAME_CSV} exportado para o diretorio ${PATH_CSV}
    #[Teardown]    Atualizar Status    QBEF-64567    QBEF-64563    ${TEST_STATUS}


*** Keywords ***
que eu acesse menu de Alteracao de Participante
    Dado o usuario loga no NoMe como CETIP
    E o Usuario acessa o menu de Alteracao de Participante e faz a busca pelo CNPJ

eu valido os tipos de contas ${miolo_contas_habilitado} no arquivo ${nome_arquivo} exportado para o diretorio ${path_diretorio}
    Verificar valores na coluna 6 do CSV ${path_diretorio}\\${nome_arquivo} permitindo ao menos um valor da lista ${miolo_contas_habilitado}

que o teste seja concluido com sucesso
    Log    Teste Finalizado com Sucesso!

setup inicial
    Setar numero da TAG
    Set Global Variable    ${TAG_NUMBER}

anexar log de execução no JIRA
    Remover log de execução no JIRA ${DIR_LOG_EXEC} ${NAME_ZIP_IMG}
    Remover log de execução no JIRA ${DIR_LOG_EXEC} ${NAME_ZIP_CSV}
    Remover log de execução no JIRA ${DIR_LOG_EXEC} ${NAME_LOG_EXEC}
    Zipar log das imagens ${PATH_IMG} ${PATH_EXEC}\\${NAME_ZIP_IMG}
    Zipar log das imagens ${PATH_CSV} ${PATH_EXEC}\\${NAME_ZIP_CSV}
    Anexar log de execução no JIRA ${PATH_EXEC}\\${NAME_ZIP_IMG} ${NAME_ZIP_IMG}
    Anexar log de execução no JIRA ${PATH_EXEC}\\${NAME_ZIP_CSV} ${NAME_ZIP_CSV}

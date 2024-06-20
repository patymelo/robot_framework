Language: pt-br

*** Settings ***
Documentation       Bloqueio de contas com diferentes miolos.
...                 Obter um participante existente ou cadastrar um novo (Geração de Massa).
...                 Bloqueio de conta principal e miolos 00, 10, 20, 40 e 68.
...                 ** ATENÇÃO **: Variáveis dentro dos casos de teste precisa utilizar Set Global Variable
...                 para ficar visivel nos Resources dentro do diretório GENERIC_VAR.
Library             XML
Resource            ${CURDIR}\\..\\GENERIC_VAR\\Login.robot
Resource            ${CURDIR}\\..\\GENERIC_VAR\\Keywords.robot
Resource            ${CURDIR}\\..\\GENERIC_VAR\\KeywordsFichaCadastroPrevio.robot
Resource            ${CURDIR}\\..\\GENERIC_VAR\\KeywordsEfetivarParticipante.robot
Resource            ${CURDIR}\\..\\GENERIC_VAR\\KeywordsManutencaoParticipante.robot
Resource            ${CURDIR}\\..\\GENERIC_VAR\\keywordConsultaBD.robot
Resource            ${CURDIR}\\..\\GENERIC_VAR\\KeywordsNovosParticipantes.robot
Suite Setup         configuracao inicial
Test Teardown       Close Browser
Suite Teardown      configuracao final

*** Variable ***
${DIRETORIO_LOG}                    ${CURDIR}\\Resultados\\log
${DIRETORIO_IMAGENS}                ${DIRETORIO_LOG}\\img
${PATH_CSV}                         ${DIRETORIO_LOG}\\csv
${var_amb}=                         qaa
${TOGGLE}=                          NAO
${CAPTCHA_HABILITADO}=              NAO
${EMAIL_TOKEN_CADASTRO_PREVIO}=     prestador-william.silva@b3.com.br
@{header_resultado}                 DATA_EXECUCAO_TESTE  NUM_ID_EVENTO_CADASTRO_B3I  DAT_INCLUSAO  NUM_ID_SERVICO  DES_PATRAMETROS  NUM_STATUS_ESPERADO  NUM_STATUS_RETORNO  DAT_PROCESSAMENTO

*** Test Cases ***
TST0000: Gerar Massa
    [Tags]    PROGRESSIVO_CADBLC_1768       PROGRESSIVO_FILA_EVENTO_PARTICIPANTE_EMISS_INSTITUICAO_FINANCEIRA
    ${miolo_contas_comparacao}     Create List     .00-  .10-  .20-

    Dado que eu defina a variavel TAG_NUMBER com o valor TST0000 como uma variavel global
    E eu busco os tipos de miolo de conta que estão habilitados na tabela parametro config
    E que esses miolos de conta ${miolo_contas_habilitado} seja igual a lista ${miolo_contas_comparacao}
#    Quando o usuário buscar um participante existente no NoMe que não seja titular de familia nem titular de malote com contas miolo 00 10 20 40 60 e 68
#    consultaParticipanteRobotContas00-10-20-40-60-68.sql
#    E o usuário troca a conta principal para a conta 05430.96-0
#    Então o usuário define as variaveis para uso nos testes seguinte
    Set Global Variable         ${CNPJ_PARTICIPANTE}                30.471.952/0001-54
    Set Global Variable         ${NOVA_CONTA_COBRANCA_PRINCIPAL}    05430.69-9
    Set Global Variable         ${CONTA_PARTICIPANTE_PRINCIPAL}     05430.96-7
    Set Global Variable         ${CONTA_PARTICIPANTE_00}            05430.00-8
    Set Global Variable         ${CONTA_PARTICIPANTE_10}            05430.10-1
    Set Global Variable         ${CONTA_PARTICIPANTE_20}            05430.20-4
    Set Global Variable         ${CONTA_PARTICIPANTE_40}            05430.40-0
    Set Global Variable         ${CONTA_PARTICIPANTE_60}            05430.60-6
    Set Global Variable         ${CONTA_PARTICIPANTE_68}            05430.68-2

TST0001: Usuário bloqueia conta GRAVAME SOBRE ATIVOS FINANCEIROS (68)
    [Tags]    PROGRESSIVO_CADBLC_1768       PROGRESSIVO_FILA_EVENTO_PARTICIPANTE_EMISS_INSTITUICAO_FINANCEIRA
#    [Setup]         Atualizar Status    QBEF-64154    QBEF-64153    EXECUTING
#    [Teardown]      Atualizar Status    QBEF-64154    QBEF-64153    ${TEST_STATUS}

    Dado que eu defina a variavel TAG_NUMBER com o valor TST0001 como uma variavel global
    E o usuario loga no NoMe como CETIP
    E o Usuario acessa o menu de Alteracao de Participante e faz a busca pelo CNPJ
    Quando o usuário entra na ação BLOQUEAR e faz o bloqueio da conta ${CONTA_PARTICIPANTE_68} informando a justificativa (Teste Não Envia Situação Conta 68) e nova conta cobrança/principal ${NOVA_CONTA_COBRANCA_PRINCIPAL}
    Então o usuário verifica que não houve inclusão de registro na fila TCTPEVENTO_CADASTRO_B3I entre ${hora_inicio_bloqueio_conta} e ${hora_fim_bloqueio_conta} para a conta ${CONTA_PARTICIPANTE_68}

TST0002: Usuário bloqueia conta EMISSORA CETIP (40)
    [Tags]    PROGRESSIVO_CADBLC_1768       PROGRESSIVO_FILA_EVENTO_PARTICIPANTE_EMISS_INSTITUICAO_FINANCEIRA
#    [Setup]         Atualizar Status    QBEF-64154    QBEF-64153    EXECUTING
#    [Teardown]      Atualizar Status    QBEF-64154    QBEF-64153    ${TEST_STATUS}

    Dado que eu defina a variavel TAG_NUMBER com o valor TST0002 como uma variavel global
    E o usuario loga no NoMe como CETIP
    E o Usuario acessa o menu de Alteracao de Participante e faz a busca pelo CNPJ
    E O Usuario altera o status da conta ${CONTA_PARTICIPANTE_40} para ATIVA
	Quando o usuário entra na ação BLOQUEAR e faz o bloqueio da conta ${CONTA_PARTICIPANTE_40} informando a justificativa (Teste Não Envia Situação Conta 40) e nova conta cobrança/principal ${NOVA_CONTA_COBRANCA_PRINCIPAL}
    Então o usuário verifica que não houve inclusão de registro na fila TCTPEVENTO_CADASTRO_B3I entre ${hora_inicio_bloqueio_conta} e ${hora_fim_bloqueio_conta} para a conta ${CONTA_PARTICIPANTE_40}

TST0003: Usuário bloqueia conta CLIENTE 2 - GERAL (20)
    [Tags]    PROGRESSIVO_CADBLC_1768       PROGRESSIVO_FILA_EVENTO_PARTICIPANTE_EMISS_INSTITUICAO_FINANCEIRA
#    [Setup]         Atualizar Status    QBEF-64154    QBEF-64153    EXECUTING
#    [Teardown]      Atualizar Status    QBEF-64154    QBEF-64153    ${TEST_STATUS}

    Dado que eu defina a variavel TAG_NUMBER com o valor TST0003 como uma variavel global
    E o usuario loga no NoMe como CETIP
    E o Usuario acessa o menu de Alteracao de Participante e faz a busca pelo CNPJ
    Quando o usuário entra na ação BLOQUEAR e faz o bloqueio da conta ${CONTA_PARTICIPANTE_20} informando a justificativa (Teste Envia Situação Conta 20) e nova conta cobrança/principal ${NOVA_CONTA_COBRANCA_PRINCIPAL}
    Então o usuario verifica se o ultimo registro incluido na fila TCTPEVENTO_CADASTRO_B3I entre ${hora_inicio_bloqueio_conta} e ${hora_fim_bloqueio_conta} para a conta ${CONTA_PARTICIPANTE_20} foi com situação BLOQUEADA
TST0004: Usuário bloqueia conta CLIENTE 1 - GERAL (10)
    [Tags]    PROGRESSIVO_CADBLC_1768       PROGRESSIVO_FILA_EVENTO_PARTICIPANTE_EMISS_INSTITUICAO_FINANCEIRA
#    [Setup]         Atualizar Status    QBEF-64154    QBEF-64153    EXECUTING
#    [Teardown]      Atualizar Status    QBEF-64154    QBEF-64153    ${TEST_STATUS}

    Dado que eu defina a variavel TAG_NUMBER com o valor TST0004 como uma variavel global
    E o usuario loga no NoMe como CETIP
    E o Usuario acessa o menu de Alteracao de Participante e faz a busca pelo CNPJ
    Quando o usuário entra na ação BLOQUEAR e faz o bloqueio da conta ${CONTA_PARTICIPANTE_10} informando a justificativa (Teste Envia Situação Conta 10) e nova conta cobrança/principal ${NOVA_CONTA_COBRANCA_PRINCIPAL}
    Então o usuario verifica se o ultimo registro incluido na fila TCTPEVENTO_CADASTRO_B3I entre ${hora_inicio_bloqueio_conta} e ${hora_fim_bloqueio_conta} para a conta ${CONTA_PARTICIPANTE_10} foi com situação BLOQUEADA

TST0005: Usuário bloqueia conta PROPRIA (00) vinculada a uma conta GARANTIA (60)
    [Tags]    PROGRESSIVO_CADBLC_1768       PROGRESSIVO_FILA_EVENTO_PARTICIPANTE_EMISS_INSTITUICAO_FINANCEIRA
#    [Setup]         Atualizar Status    QBEF-64154    QBEF-64153    EXECUTING
#    [Teardown]      Atualizar Status    QBEF-64154    QBEF-64153    ${TEST_STATUS}

    Dado que eu defina a variavel TAG_NUMBER com o valor TST0005 como uma variavel global
    E o usuario loga no NoMe como CETIP
    E o Usuario acessa o menu de Alteracao de Participante e faz a busca pelo CNPJ
    E o usuário verifica que a conta ${CONTA_PARTICIPANTE_00} é uma conta própria vinculada a conta ${CONTA_PARTICIPANTE_60}
    Quando o usuário entra na ação BLOQUEAR e faz o bloqueio da conta ${CONTA_PARTICIPANTE_00} informando a justificativa (Teste Envia Situação Conta 00) e nova conta cobrança/principal ${NOVA_CONTA_COBRANCA_PRINCIPAL}
    Então o usuario verifica se o ultimo registro incluido na fila TCTPEVENTO_CADASTRO_B3I entre ${hora_inicio_bloqueio_conta} e ${hora_fim_bloqueio_conta} para a conta ${CONTA_PARTICIPANTE_00} foi com situação BLOQUEADA
    E o usuário verifica que não houve inclusão de registro na fila TCTPEVENTO_CADASTRO_B3I entre ${hora_inicio_bloqueio_conta} e ${hora_fim_bloqueio_conta} para a conta ${CONTA_PARTICIPANTE_60}

TST0006: Usuário bloqueia CONTA PRINCIPAL
    [Tags]    PROGRESSIVO_CADBLC_1768       PROGRESSIVO_FILA_EVENTO_PARTICIPANTE_EMISS_INSTITUICAO_FINANCEIRA
#    [Setup]         Atualizar Status    QBEF-64154    QBEF-64153    EXECUTING
#    [Teardown]      Atualizar Status    QBEF-64154    QBEF-64153    ${TEST_STATUS}

    Dado que eu defina a variavel TAG_NUMBER com o valor TST0006 como uma variavel global
    E o usuario loga no NoMe como CETIP
    E o Usuario acessa o menu de Alteracao de Participante e faz a busca pelo CNPJ
    Quando o usuário entra na ação BLOQUEAR e faz o bloqueio da conta ${CONTA_PARTICIPANTE_PRINCIPAL} informando a justificativa (Teste Envia Situação Conta Principal) e nova conta cobrança/principal ${NOVA_CONTA_COBRANCA_PRINCIPAL}
    Então o usuario verifica se o ultimo registro incluido na fila TCTPEVENTO_CADASTRO_B3I entre ${hora_inicio_bloqueio_conta} e ${hora_fim_bloqueio_conta} para a conta ${CONTA_PARTICIPANTE_PRINCIPAL} foi com situação BLOQUEADA
    E o usuario verifica se o ultimo registro incluido na fila TCTPEVENTO_CADASTRO_B3I entre ${hora_inicio_bloqueio_conta} e ${hora_fim_bloqueio_conta} para a conta ${NOVA_CONTA_COBRANCA_PRINCIPAL} foi com situação ATIVA

TST0007: Usuário verifica que não foi enviado nenhum registro de participante-conta para a fila do extrato
    [Tags]    PROGRESSIVO_CADBLC_1768x       PROGRESSIVO_FILA_EVENTO_PARTICIPANTE_EMISS_INSTITUICAO_FINANCEIRA

    Dado que eu execute a consulta ao banco de dados verificando que nao retornou nenhum resultado na fila do extrato
    Então que o teste seja concluido com sucesso

*** Keywords ***
configuracao inicial
    Delete Directory If Exists    ${DIRETORIO_IMAGENS}
    Delete Directory If Exists    ${PATH_CSV}
configuracao final
    Close All Browsers
que eu execute a consulta ao banco de dados verificando que nao retornou nenhum resultado na fila do extrato
    ${query}=       Set Variable        SELECT * FROM CETIP.EXTR_FILA_ATUALIZACAO efa WHERE 1=1 AND efa.nom_url LIKE '%participante-conta%' AND TO_CHAR(DAT_SOLICITACAO,'dd/mm/yyyy') = TO_CHAR(sysdate,'dd/mm/yyyy') ORDER BY efa.DAT_SOLICITACAO DESC
    executo a consulta no ambiente ${var_amb} validando que nao retornou nenhum resultado para a query ${query}
que o teste seja concluido com sucesso
    Log     Teste Finalizado com Sucesso!
que esses miolos de conta ${miolo_contas} seja igual a lista ${miolos_habilitado_comparacao}
    ordenar e comparar duas listas      ${miolo_contas}     ${miolos_habilitado_comparacao}
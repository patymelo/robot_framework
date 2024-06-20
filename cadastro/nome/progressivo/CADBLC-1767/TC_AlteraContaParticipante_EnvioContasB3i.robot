Language: pt-br

*** Settings ***
Documentation       Alteração de contas com diferentes miolos.
...                 Obter um participante existente ou cadastrar um novo (Geração de Massa).
...                 Ateração de conta principal e miolos 00, 10, 20, 40, 68.
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
    [Tags]    PROGRESSIVO_CADBLC_1767       PROGRESSIVO_FILA_EVENTO_PARTICIPANTE_EMISS_INSTITUICAO_FINANCEIRA
    ${miolo_contas_comparacao}     Create List     .00-  .10-  .20-

    Dado que eu defina a variavel TAG_NUMBER com o valor TST0000 como uma variavel global
    E eu busco os tipos de miolo de conta que estão habilitados na tabela parametro config
    E que esses miolos de conta ${miolo_contas_habilitado} seja igual a lista ${miolo_contas_comparacao}
#    Quando o usuário buscar um participante existente no NoMe com contas miolo 00 10 e 20
#    consultaParticipanteRobotContasPropriaC1C2.sql
#    Então o usuário define as variaveis para uso nos testes seguinte
    Set Global Variable         ${CNPJ_PARTICIPANTE}                70.215.348/0001-81
    Set Global Variable         ${CONTA_PARTICIPANTE_PRINCIPAL}     05167.00-3
    Set Global Variable         ${CONTA_PARTICIPANTE_00}            05167.00-3
    Set Global Variable         ${CONTA_PARTICIPANTE_10}            05166.10-7
    Set Global Variable         ${CONTA_PARTICIPANTE_20}            05166.20-0
    Set Global Variable         ${CONTA_PARTICIPANTE_40}            05166.40-6
    Set Global Variable         ${CONTA_PARTICIPANTE_68}            05166.68-8

TST0001: Usuário altera situacão da CONTA PRINCIPAL
    [Tags]    PROGRESSIVO_CADBLC_1767       PROGRESSIVO_FILA_EVENTO_PARTICIPANTE_EMISS_INSTITUICAO_FINANCEIRA
#    [Setup]         Atualizar Status    QBEF-64154    QBEF-64153    EXECUTING
#    [Teardown]      Atualizar Status    QBEF-64154    QBEF-64153    ${TEST_STATUS}
    Dado que eu defina a variavel TAG_NUMBER com o valor TST0001 como uma variavel global
    E o usuario loga no NoMe como CETIP
    E o Usuario acessa o menu de Alteracao de Participante e faz a busca pelo CNPJ
    E o usuario verifica a situação atual da conta ${CONTA_PARTICIPANTE_PRINCIPAL}
    Quando o usuário altera a situação da conta ${CONTA_PARTICIPANTE_PRINCIPAL} de acordo com a situação atual
    Então o usuario verifica se o ultimo registro incluido na fila TCTPEVENTO_CADASTRO_B3I entre ${hora_inicio_alteracao_situacao_conta} e ${hora_fim_alteracao_situacao_conta} para a conta ${CONTA_PARTICIPANTE_PRINCIPAL} foi com situação ${situacao_conta}

TST0002: Usuário altera dados da CONTA PRINCIPAL e não altera a situação
    [Tags]    PROGRESSIVO_CADBLC_1767       PROGRESSIVO_FILA_EVENTO_PARTICIPANTE_EMISS_INSTITUICAO_FINANCEIRA
#    [Setup]         Atualizar Status    QBEF-64154    QBEF-64153    EXECUTING
#    [Teardown]      Atualizar Status    QBEF-64154    QBEF-64153    ${TEST_STATUS}
    Dado que eu defina a variavel TAG_NUMBER com o valor TST0002 como uma variavel global
    E o usuario loga no NoMe como CETIP
    E o Usuario acessa o menu de Alteracao de Participante e faz a busca pelo CNPJ
    E o usuario verifica a situação atual da conta ${CONTA_PARTICIPANTE_PRINCIPAL}
    Quando o usuário altera diversos campos da conta ${CONTA_PARTICIPANTE_PRINCIPAL} sem alterar a situação da conta
    Então o usuário verifica que não houve inclusão de registro na fila TCTPEVENTO_CADASTRO_B3I entre ${hora_inicio_alteracao_dados_conta} e ${hora_fim_alteracao_dados_conta} para a conta ${CONTA_PARTICIPANTE_PRINCIPAL}

TST0003: Usuário altera situacão de conta PROPRIA (00)
    [Tags]    PROGRESSIVO_CADBLC_1767       PROGRESSIVO_FILA_EVENTO_PARTICIPANTE_EMISS_INSTITUICAO_FINANCEIRA
#    [Setup]         Atualizar Status    QBEF-64154    QBEF-64153    EXECUTING
#    [Teardown]      Atualizar Status    QBEF-64154    QBEF-64153    ${TEST_STATUS}
    Dado que eu defina a variavel TAG_NUMBER com o valor TST0003 como uma variavel global
    E o usuario loga no NoMe como CETIP
    E o Usuario acessa o menu de Alteracao de Participante e faz a busca pelo CNPJ
    E o usuario verifica a situação atual da conta ${CONTA_PARTICIPANTE_00}
    Quando o usuário altera a situação da conta ${CONTA_PARTICIPANTE_00} de acordo com a situação atual
    Então o usuario verifica se o ultimo registro incluido na fila TCTPEVENTO_CADASTRO_B3I entre ${hora_inicio_alteracao_situacao_conta} e ${hora_fim_alteracao_situacao_conta} para a conta ${CONTA_PARTICIPANTE_00} foi com situação ${situacao_conta}

TST0004: Usuário altera dados de conta PROPRIA (00) e não altera a situação
    [Tags]    PROGRESSIVO_CADBLC_1767       PROGRESSIVO_FILA_EVENTO_PARTICIPANTE_EMISS_INSTITUICAO_FINANCEIRA
#    [Setup]         Atualizar Status    QBEF-64154    QBEF-64153    EXECUTING
#    [Teardown]      Atualizar Status    QBEF-64154    QBEF-64153    ${TEST_STATUS}
    Dado que eu defina a variavel TAG_NUMBER com o valor TST0004 como uma variavel global
    E o usuario loga no NoMe como CETIP
    E o Usuario acessa o menu de Alteracao de Participante e faz a busca pelo CNPJ
    E o usuario verifica a situação atual da conta ${CONTA_PARTICIPANTE_00}
    Quando o usuário altera diversos campos da conta ${CONTA_PARTICIPANTE_00} sem alterar a situação da conta
    Então o usuário verifica que não houve inclusão de registro na fila TCTPEVENTO_CADASTRO_B3I entre ${hora_inicio_alteracao_dados_conta} e ${hora_fim_alteracao_dados_conta} para a conta ${CONTA_PARTICIPANTE_00}

TST0005: Usuário altera situacão de conta CLIENTE 1 - GERAL (10)
    [Tags]    PROGRESSIVO_CADBLC_1767       PROGRESSIVO_FILA_EVENTO_PARTICIPANTE_EMISS_INSTITUICAO_FINANCEIRA
#    [Setup]         Atualizar Status    QBEF-64154    QBEF-64153    EXECUTING
#    [Teardown]      Atualizar Status    QBEF-64154    QBEF-64153    ${TEST_STATUS}
    Dado que eu defina a variavel TAG_NUMBER com o valor TST0005 como uma variavel global
    E o usuario loga no NoMe como CETIP
    E o Usuario acessa o menu de Alteracao de Participante e faz a busca pelo CNPJ
    E o usuario verifica a situação atual da conta ${CONTA_PARTICIPANTE_10}
    Quando o usuário altera a situação da conta ${CONTA_PARTICIPANTE_10} de acordo com a situação atual
    Então o usuario verifica se o ultimo registro incluido na fila TCTPEVENTO_CADASTRO_B3I entre ${hora_inicio_alteracao_situacao_conta} e ${hora_fim_alteracao_situacao_conta} para a conta ${CONTA_PARTICIPANTE_10} foi com situação ${situacao_conta}

TST0006: Usuário altera dados de conta CLIENTE 1 - GERAL (10) e não altera a situação
    [Tags]    PROGRESSIVO_CADBLC_1767       PROGRESSIVO_FILA_EVENTO_PARTICIPANTE_EMISS_INSTITUICAO_FINANCEIRA
#    [Setup]         Atualizar Status    QBEF-64154    QBEF-64153    EXECUTING
#    [Teardown]      Atualizar Status    QBEF-64154    QBEF-64153    ${TEST_STATUS}
    Dado que eu defina a variavel TAG_NUMBER com o valor TST0006 como uma variavel global
    E o usuario loga no NoMe como CETIP
    E o Usuario acessa o menu de Alteracao de Participante e faz a busca pelo CNPJ
    E o usuario verifica a situação atual da conta ${CONTA_PARTICIPANTE_10}
    Quando o usuário altera diversos campos da conta ${CONTA_PARTICIPANTE_10} sem alterar a situação da conta
    Então o usuário verifica que não houve inclusão de registro na fila TCTPEVENTO_CADASTRO_B3I entre ${hora_inicio_alteracao_dados_conta} e ${hora_fim_alteracao_dados_conta} para a conta ${CONTA_PARTICIPANTE_10}

TST0007: Usuário altera situacão de conta CLIENTE 2 - GERAL (20)
    [Tags]    PROGRESSIVO_CADBLC_1767       PROGRESSIVO_FILA_EVENTO_PARTICIPANTE_EMISS_INSTITUICAO_FINANCEIRA
#    [Setup]         Atualizar Status    QBEF-64154    QBEF-64153    EXECUTING
#    [Teardown]      Atualizar Status    QBEF-64154    QBEF-64153    ${TEST_STATUS}
    Dado que eu defina a variavel TAG_NUMBER com o valor TST0007 como uma variavel global
    E o usuario loga no NoMe como CETIP
    E o Usuario acessa o menu de Alteracao de Participante e faz a busca pelo CNPJ
    E o usuario verifica a situação atual da conta ${CONTA_PARTICIPANTE_20}
    Quando o usuário altera a situação da conta ${CONTA_PARTICIPANTE_20} de acordo com a situação atual
    Então o usuario verifica se o ultimo registro incluido na fila TCTPEVENTO_CADASTRO_B3I entre ${hora_inicio_alteracao_situacao_conta} e ${hora_fim_alteracao_situacao_conta} para a conta ${CONTA_PARTICIPANTE_20} foi com situação ${situacao_conta}

TST0008: Usuário altera dados de conta CLIENTE 2 - GERAL (20) e não altera a situação
    [Tags]    PROGRESSIVO_CADBLC_1767       PROGRESSIVO_FILA_EVENTO_PARTICIPANTE_EMISS_INSTITUICAO_FINANCEIRA
#    [Setup]         Atualizar Status    QBEF-64154    QBEF-64153    EXECUTING
#    [Teardown]      Atualizar Status    QBEF-64154    QBEF-64153    ${TEST_STATUS}
    Dado que eu defina a variavel TAG_NUMBER com o valor TST0008 como uma variavel global
    E o usuario loga no NoMe como CETIP
    E o Usuario acessa o menu de Alteracao de Participante e faz a busca pelo CNPJ
    E o usuario verifica a situação atual da conta ${CONTA_PARTICIPANTE_20}
    Quando o usuário altera diversos campos da conta ${CONTA_PARTICIPANTE_20} sem alterar a situação da conta
    Então o usuário verifica que não houve inclusão de registro na fila TCTPEVENTO_CADASTRO_B3I entre ${hora_inicio_alteracao_dados_conta} e ${hora_fim_alteracao_dados_conta} para a conta ${CONTA_PARTICIPANTE_20}

TST0009: Usuário altera situacão de conta EMISSORA CETIP (40)
    [Tags]    PROGRESSIVO_CADBLC_1767       PROGRESSIVO_FILA_EVENTO_PARTICIPANTE_EMISS_INSTITUICAO_FINANCEIRA
#    [Setup]         Atualizar Status    QBEF-64154    QBEF-64153    EXECUTING
#    [Teardown]      Atualizar Status    QBEF-64154    QBEF-64153    ${TEST_STATUS}
    Dado que eu defina a variavel TAG_NUMBER com o valor TST0009 como uma variavel global
    E o usuario loga no NoMe como CETIP
    E o Usuario acessa o menu de Alteracao de Participante e faz a busca pelo CNPJ
    E o usuario verifica a situação atual da conta ${CONTA_PARTICIPANTE_40}
    Quando o usuário altera a situação da conta ${CONTA_PARTICIPANTE_40} de acordo com a situação atual
    Então o usuário verifica que não houve inclusão de registro na fila TCTPEVENTO_CADASTRO_B3I entre ${hora_inicio_alteracao_situacao_conta} e ${hora_fim_alteracao_situacao_conta} para a conta ${CONTA_PARTICIPANTE_40}

TST0010: Usuário altera dados de conta EMISSORA CETIP (40) e não altera a situação
    [Tags]    PROGRESSIVO_CADBLC_1767       PROGRESSIVO_FILA_EVENTO_PARTICIPANTE_EMISS_INSTITUICAO_FINANCEIRA
#    [Setup]         Atualizar Status    QBEF-64154    QBEF-64153    EXECUTING
#    [Teardown]      Atualizar Status    QBEF-64154    QBEF-64153    ${TEST_STATUS}
    Dado que eu defina a variavel TAG_NUMBER com o valor TST0010 como uma variavel global
    E o usuario loga no NoMe como CETIP
    E o Usuario acessa o menu de Alteracao de Participante e faz a busca pelo CNPJ
    E o usuario verifica a situação atual da conta ${CONTA_PARTICIPANTE_40}
    Quando o usuário altera diversos campos da conta ${CONTA_PARTICIPANTE_40} sem alterar a situação da conta
    Então o usuário verifica que não houve inclusão de registro na fila TCTPEVENTO_CADASTRO_B3I entre ${hora_inicio_alteracao_dados_conta} e ${hora_fim_alteracao_dados_conta} para a conta ${CONTA_PARTICIPANTE_40}

TST0011: Usuário altera situacão de conta GRAVAME SOBRE ATIVOS FINANCEIROS (68)
    [Tags]    PROGRESSIVO_CADBLC_1767       PROGRESSIVO_FILA_EVENTO_PARTICIPANTE_EMISS_INSTITUICAO_FINANCEIRA
#    [Setup]         Atualizar Status    QBEF-64154    QBEF-64153    EXECUTING
#    [Teardown]      Atualizar Status    QBEF-64154    QBEF-64153    ${TEST_STATUS}
    Dado que eu defina a variavel TAG_NUMBER com o valor TST0011 como uma variavel global
    E o usuario loga no NoMe como CETIP
    E o Usuario acessa o menu de Alteracao de Participante e faz a busca pelo CNPJ
    E o usuario verifica a situação atual da conta ${CONTA_PARTICIPANTE_68}
    Quando o usuário altera a situação da conta ${CONTA_PARTICIPANTE_68} de acordo com a situação atual    
    Então o usuário verifica que não houve inclusão de registro na fila TCTPEVENTO_CADASTRO_B3I entre ${hora_inicio_alteracao_situacao_conta} e ${hora_fim_alteracao_situacao_conta} para a conta ${CONTA_PARTICIPANTE_68}

TST0012: Usuário altera dados de conta GRAVAME SOBRE ATIVOS FINANCEIROS (68) e não altera a situação
    [Tags]    PROGRESSIVO_CADBLC_1767       PROGRESSIVO_FILA_EVENTO_PARTICIPANTE_EMISS_INSTITUICAO_FINANCEIRA
#    [Setup]         Atualizar Status    QBEF-64154    QBEF-64153    EXECUTING
#    [Teardown]      Atualizar Status    QBEF-64154    QBEF-64153    ${TEST_STATUS}
    Dado que eu defina a variavel TAG_NUMBER com o valor TST0012 como uma variavel global
    E o usuario loga no NoMe como CETIP
    E o Usuario acessa o menu de Alteracao de Participante e faz a busca pelo CNPJ
    E o usuario verifica a situação atual da conta ${CONTA_PARTICIPANTE_68}
    Quando o usuário altera diversos campos da conta ${CONTA_PARTICIPANTE_68} sem alterar a situação da conta
    Então o usuário verifica que não houve inclusão de registro na fila TCTPEVENTO_CADASTRO_B3I entre ${hora_inicio_alteracao_dados_conta} e ${hora_fim_alteracao_dados_conta} para a conta ${CONTA_PARTICIPANTE_68}

TST0013: Usuário verifica que não foi enviado nenhum registro de participante-conta para a fila do extrato
    [Tags]    PROGRESSIVO_CADBLC_1767       PROGRESSIVO_FILA_EVENTO_PARTICIPANTE_EMISS_INSTITUICAO_FINANCEIRA

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

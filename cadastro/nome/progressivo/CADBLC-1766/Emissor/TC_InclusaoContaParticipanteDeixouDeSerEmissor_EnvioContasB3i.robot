Language: pt-br

*** Settings ***
Documentation       Inclusão de novas contas para participante Emissor que passou a ser considerado Instituição Financeira.
...                 Incluindo cadastro web e efetivando no sistema NoMe (Geração de Massa).
...                 Incluíndo novas contas com miolos, radicais e situações diferentes.
...                 Encerramento do participante com diversas contas.
...                 ** ATENÇÃO **: Variáveis dentro dos casos de teste precisa utilizar Set Global Variable
...                 para ficar visivel nos Resources dentro do diretório GENERIC_VAR.
Resource            ${CURDIR}\\..\\..\\GENERIC_VAR\\Login.robot
Resource            ${CURDIR}\\..\\..\\GENERIC_VAR\\Keywords.robot
Resource            ${CURDIR}\\..\\..\\GENERIC_VAR\\KeywordsFichaCadastroPrevio.robot
Resource            ${CURDIR}\\..\\..\\GENERIC_VAR\\KeywordsEfetivarParticipante.robot
Resource            ${CURDIR}\\..\\..\\GENERIC_VAR\\KeywordsManutencaoParticipante.robot
Resource            ${CURDIR}\\..\\..\\GENERIC_VAR\\keywordConsultaBD.robot
Resource            ${CURDIR}\\..\\..\\GENERIC_VAR\\KeywordsNovosParticipantes.robot
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
    [Tags]    PROGRESSIVO_FILA_EVENTO_PARTICIPANTE_EMISS_INSTITUICAO_FINANCEIRA
    ${miolo_contas_comparacao}     Create List     .00-  .10-  .20-

    Dado que eu defina a variavel TAG_NUMBER com o valor TST0000 como uma variavel global
    E eu busco os tipos de miolo de conta que estão habilitados na tabela parametro config
    E que esses miolos de conta ${miolo_contas_habilitado} seja igual a lista ${miolo_contas_comparacao}
    Então que eu realize o cadastro de um novo participante emissor BANCO MULTIPLO 01 utilizando dados do ITAUBM para preencher a familia

TST0001: Usuário inclui novas contas PROPRIA (00) para um participante emissor com conta principal miolo 40
    [Tags]    PROGRESSIVO_FILA_EVENTO_PARTICIPANTE_EMISS_INSTITUICAO_FINANCEIRA
    [Setup]         Atualizar Status    QBEF-64154    QBEF-64153    EXECUTING
    [Teardown]      Atualizar Status    QBEF-64154    QBEF-64153    ${TEST_STATUS}

    ${radical}=     Set Variable     ${EMPTY}
    Dado que eu defina a variavel TAG_NUMBER com o valor TST0001 como uma variavel global
    E o usuário inclui uma nova conta PROPRIA (00) utilizando radical ${radical} liquidante ITAUBM e situacao EM PROCESSO DE ABERTURA                                   Sim     ${EMPTY}        SP
    E o usuário inclui uma nova conta PROPRIA (00) utilizando radical ${radical} liquidante ITAUBM e situacao ATIVA SOMENTE PARA RESGATE                                Sim     ${EMPTY}        SP
    E o usuário inclui uma nova conta ativa PROPRIA (00) independente do radical, configuração e liquidante

TST0002: Usuário inclui novas contas CLIENTE 1 - GERAL (10) para um participante emissor com conta principal miolo 40
    [Tags]    PROGRESSIVO_FILA_EVENTO_PARTICIPANTE_EMISS_INSTITUICAO_FINANCEIRA
    [Setup]       Atualizar Status    QBEF-64155    QBEF-64153    EXECUTING
    [Teardown]    Atualizar Status    QBEF-64155    QBEF-64153    ${TEST_STATUS}

    ${radical}=     Set Variable     ${EMPTY}
    Dado que eu defina a variavel TAG_NUMBER com o valor TST0002 como uma variavel global
    E o usuário inclui uma nova conta CLIENTE 1 - GERAL (10) utilizando radical ${radical} liquidante ITAUBM e situacao EM PROCESSO DE ABERTURA                         Sim     ${EMPTY}        SP
    E o usuário inclui uma nova conta CLIENTE 1 - GERAL (10) utilizando radical ${radical} liquidante ITAUBM e situacao ATIVA SOMENTE PARA RESGATE                      Sim     ${EMPTY}        SP
    E o usuário inclui uma nova conta ativa CLIENTE 1 - GERAL (10) independente do radical, configuração e liquidante

TST0003: Usuário inclui novas contas CLIENTE 2 - GERAL (20) para um participante emissor com conta principal miolo 40
    [Tags]    PROGRESSIVO_FILA_EVENTO_PARTICIPANTE_EMISS_INSTITUICAO_FINANCEIRA
    [Setup]       Atualizar Status    QBEF-64156    QBEF-64153    EXECUTING
    [Teardown]    Atualizar Status    QBEF-64156    QBEF-64153    ${TEST_STATUS}

    ${radical}=     Set Variable     ${EMPTY}
    Dado que eu defina a variavel TAG_NUMBER com o valor TST0003 como uma variavel global
    E o usuário inclui uma nova conta CLIENTE 2 - GERAL (20) utilizando radical ${radical} liquidante ITAUBM e situacao EM PROCESSO DE ABERTURA                         Sim     ${EMPTY}        SP
    E o usuário inclui uma nova conta CLIENTE 2 - GERAL (20) utilizando radical ${radical} liquidante ITAUBM e situacao ATIVA SOMENTE PARA RESGATE                      Sim     ${EMPTY}        SP
    E o usuário inclui uma nova conta ativa CLIENTE 2 - GERAL (20) independente do radical, configuração e liquidante

TST0004: Usuário inclui novas contas GRAVAME SOBRE ATIVOS FINANCEIROS (68) para um participante emissor com conta principal miolo 40
    [Tags]    PROGRESSIVO_FILA_EVENTO_PARTICIPANTE_EMISS_INSTITUICAO_FINANCEIRA
    [Setup]       Atualizar Status    QBEF-64158    QBEF-64153    EXECUTING
    [Teardown]    Atualizar Status    QBEF-64158    QBEF-64153    ${TEST_STATUS}

    ${radical}=     Set Variable     ${EMPTY}
    Dado que eu defina a variavel TAG_NUMBER com o valor TST0004 como uma variavel global
    E o usuário inclui uma nova conta GRAVAME SOBRE ATIVOS FINANCEIROS (68) utilizando radical ${radical} liquidante ITAUBM e situacao EM PROCESSO DE ABERTURA          Sim     ${EMPTY}        SP
    E o usuário inclui uma nova conta ativa GRAVAME SOBRE ATIVOS FINANCEIROS (68) independente do radical, configuração e liquidante

TST0005: Usuário inclui novas contas EMISSORA SNA/SFF (44) para um participante emissor com conta principal miolo 40
    [Tags]    PROGRESSIVO_FILA_EVENTO_PARTICIPANTE_EMISS_INSTITUICAO_FINANCEIRA
    [Setup]       Atualizar Status    QBEF-64157    QBEF-64153    EXECUTING
    [Teardown]    Atualizar Status    QBEF-64157    QBEF-64153    ${TEST_STATUS}

    ${radical}=     Set Variable     ${EMPTY}
    Dado que eu defina a variavel TAG_NUMBER com o valor TST0005 como uma variavel global
    E o usuário inclui uma nova conta EMISSORA SNA/SFF (44) utilizando radical ${radical} liquidante ITAUBM e situacao ATIVA SOMENTE PARA RESGATE                       Sim     ${EMPTY}        SP
    E o usuário inclui uma nova conta ativa EMISSORA SNA/SFF (44) independente do radical, configuração e liquidante

TST0006: Usuário inclui novas contas INTERMEDIACAO (69) para um participante emissor com conta principal miolo 40
    [Tags]    PROGRESSIVO_FILA_EVENTO_PARTICIPANTE_EMISS_INSTITUICAO_FINANCEIRA

    ${radical}=     Set Variable     ${EMPTY}
    Dado que eu defina a variavel TAG_NUMBER com o valor TST0006 como uma variavel global
    E o usuário inclui uma nova conta INTERMEDIACAO (69) utilizando radical ${radical} liquidante ITAUBM e situacao EM PROCESSO DE ABERTURA                             Sim     ${EMPTY}        SP
    E o usuário inclui uma nova conta ativa INTERMEDIACAO (69) independente do radical, configuração e liquidante

TST0007: Usuário inclui novas contas RESERVA TECNICA (97) para um participante emissor com conta principal miolo 40
    [Tags]    PROGRESSIVO_FILA_EVENTO_PARTICIPANTE_EMISS_INSTITUICAO_FINANCEIRA

    ${radical}=     Set Variable     ${EMPTY}
    Dado que eu defina a variavel TAG_NUMBER com o valor TST0007 como uma variavel global
    E o usuário inclui uma nova conta RESERVA TECNICA (97) utilizando radical ${radical} liquidante ITAUBM e situacao EM PROCESSO DE ABERTURA                           Sim     ${EMPTY}        SP
    E o usuário inclui uma nova conta ativa RESERVA TECNICA (97) independente do radical, configuração e liquidante

TST0008: Usuário verifica envio de novas contas de acordo com os tipos habilitados
    [Tags]    PROGRESSIVO_FILA_EVENTO_PARTICIPANTE_EMISS_INSTITUICAO_FINANCEIRA
    [Setup]       Atualizar Status    QBEF-64159    QBEF-64153    EXECUTING
    [Teardown]    Atualizar Status    QBEF-64159    QBEF-64153    ${TEST_STATUS}

    Dado que eu defina a variavel TAG_NUMBER com o valor TST0008 como uma variavel global
    E que eu defina a variavel NAME_CSV com o valor ${TAG_NUMBER}-InclusaoContasEmissorPassandoParaInstituicaoFinanceira como uma variavel global
    E que eu execute a query consultando a fila de eventos de participante e exporte o resultado para csv
    Quando eu busco os tipos de miolo de conta que estão habilitados na tabela parametro config
    Append To List  ${miolo_contas_habilitado}  .40-
    E o usuário valida os tipos de contas ${miolo_contas_habilitado} no arquivo ${NAME_CSV} exportado para o diretorio ${PATH_CSV}
    Então o usuário valida que existem 10 linha(s) no arquivo ${NAME_CSV} exportado para o diretorio ${PATH_CSV}

TST0009: Usuário encerra completamente um participante com diversas contas
    [Tags]    PROGRESSIVO_FILA_EVENTO_PARTICIPANTE_EMISS_INSTITUICAO_FINANCEIRA

    Dado que eu defina a variavel TAG_NUMBER com o valor TST0009 como uma variavel global
    E que seja encerrado o participante com o CNPJ ${CNPJ_PARTICIPANTE} utilizando a justificativa Encerrando participante para validar eventos enviados ao B3I
    Então deve retornar a mensagem  Encerramento realizado com sucesso.

TST0010: Usuário verifica todas as contas enviada a outros sistemas após encerramento
    [Tags]    PROGRESSIVO_FILA_EVENTO_PARTICIPANTE_EMISS_INSTITUICAO_FINANCEIRA
    [Setup]       Atualizar Status    QBEF-64160    QBEF-64153    EXECUTING
    [Teardown]    Atualizar Status    QBEF-64160    QBEF-64153    ${TEST_STATUS}

    Dado que eu defina a variavel TAG_NUMBER com o valor TST0010 como uma variavel global
    E que eu defina a variavel NAME_CSV com o valor ${TAG_NUMBER}-EncerramentoEmissorPassandoParaInstituicaoFinanceira como uma variavel global
    E que eu execute a query consultando a fila de eventos após encerramento de participante e exporte o resultado para csv
    Quando eu busco os tipos de miolo de conta que estão habilitados na tabela parametro config
    Append To List  ${miolo_contas_habilitado}  .40-
    E o usuário valida os tipos de contas ${miolo_contas_habilitado} no arquivo ${NAME_CSV} exportado para o diretorio ${PATH_CSV}
    Então o usuário valida que existem 10 linha(s) no arquivo ${NAME_CSV} exportado para o diretorio ${PATH_CSV}

TST0011: Usuário verifica que não foi enviado nenhum registro de participante-conta para a fila do extrato
    [Tags]    PROGRESSIVO_FILA_EVENTO_PARTICIPANTE_EMISS_INSTITUICAO_FINANCEIRA

    Dado que eu execute a consulta ao banco de dados verificando que nao retornou nenhum resultado na fila do extrato
    Então que o teste seja concluido com sucesso

*** Keywords ***
configuracao inicial
    Delete Directory If Exists    ${DIRETORIO_IMAGENS}
    Delete Directory If Exists    ${PATH_CSV}
configuracao final
    Close All Browsers
que o usuário realize login no sistema NoMe como interno B3
    o usuario loga no NoMe como CETIP
que seja acessado a ação ${acao}
    O Usuario seleciona na label Ação valor igual a ${acao}
    O Usuario clica na seta
    capturar e salvar imagem com o nome TelaAposAcao
o usuário valida os tipos de contas ${miolo_contas_habilitado} no arquivo ${nome_arquivo} exportado para o diretorio ${path_diretorio}
    Verificar valores na coluna 4 do CSV ${path_diretorio}\\${nome_arquivo} permitindo ao menos um valor da lista ${miolo_contas_habilitado}
que eu execute a consulta ao banco de dados verificando que nao retornou nenhum resultado na fila do extrato
    ${query}=       Set Variable        SELECT * FROM CETIP.EXTR_FILA_ATUALIZACAO efa WHERE 1=1 AND efa.nom_url LIKE '%participante-conta%' AND TO_CHAR(DAT_SOLICITACAO,'dd/mm/yyyy') = TO_CHAR(sysdate,'dd/mm/yyyy') ORDER BY efa.DAT_SOLICITACAO DESC
    executo a consulta no ambiente ${var_amb} validando que nao retornou nenhum resultado para a query ${query}
que o teste seja concluido com sucesso
    Log     Teste Finalizado com Sucesso!
que esses miolos de conta ${miolo_contas} seja igual a lista ${miolos_habilitado_comparacao}
    ordenar e comparar duas listas      ${miolo_contas}     ${miolos_habilitado_comparacao}
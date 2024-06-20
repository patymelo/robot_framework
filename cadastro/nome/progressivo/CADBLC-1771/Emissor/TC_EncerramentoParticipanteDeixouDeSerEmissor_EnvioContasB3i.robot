Language: pt-br

*** Settings ***
Documentation       Encerramento de participante Emissor que passou a ser considerado Instituição Financeira.
...                 Incluindo cadastro web e efetivando no sistema NoMe.
...                 Incluíndo novas contas com miolo 00, 10, 20 e 68.
...                 Encerrando completamente o participante.
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
Suite Teardown      Close All Browsers

*** Variable ***
${DIRETORIO_IMAGENS}                ${CURDIR}\\Resultados\\DeixandoDeSerEmissor\\img
${PATH_CSV}                         ${CURDIR}\\Resultados\\DeixandoDeSerEmissor\\csv
${var_amb}=                         qaa
${TOGGLE}=                          NAO
${CAPTCHA_HABILITADO}=              NAO
${EMAIL_TOKEN_CADASTRO_PREVIO}=     prestador-william.silva@b3.com.br
@{header_resultado}                 DATA_EXECUCAO_TESTE  NUM_ID_EVENTO_CADASTRO_B3I  DAT_INCLUSAO  NUM_ID_SERVICO  DES_PATRAMETROS  NUM_STATUS_ESPERADO  NUM_STATUS_RETORNO  DAT_PROCESSAMENTO

*** Test Cases ***
TST0000: Miolo de contas habilitados na tabela parametro config
    [Tags]    PROGRESSIVO_FILA_EVENTO_PARTICIPANTE_EMISS_INSTITUICAO_FINANCEIRA
    ${miolo_contas_comparacao}     Create List     .00-  .10-  .20-

    Dado eu busco os tipos de miolo de conta que estão habilitados na tabela parametro config
    Então que esses miolos de conta ${miolo_contas_habilitado} seja igual a lista ${miolo_contas_comparacao}

TST0001: Contas enviadas a outros sistemas quando participante efetivado emissor passa a ser considerado participante instituição financeira
    [Tags]    PROGRESSIVO_FILA_EVENTO_PARTICIPANTE_EMISS_INSTITUICAO_FINANCEIRA

    Dado que eu defina a variavel TAG_NUMBER com o valor TST0001 como uma variavel global
    E que eu realize o cadastro de um novo participante emissor BANCO MULTIPLO 01 utilizando dados do ITAUBM para preencher a familia
    E o usuário inclui uma nova conta ativa PROPRIA (00) independente do radical, configuração e liquidante
    E o usuário inclui uma nova conta ativa CLIENTE 1 - GERAL (10) independente do radical, configuração e liquidante
    E o usuário inclui uma nova conta ativa CLIENTE 2 - GERAL (20) independente do radical, configuração e liquidante
    E o usuário inclui uma nova conta ativa GRAVAME SOBRE ATIVOS FINANCEIROS (68) independente do radical, configuração e liquidante
    E que eu defina a variavel NAME_CSV com o valor TST0001-AlteracaoEmissorPassandoParaInstituicaoFinanceira como uma variavel global
    E que eu execute a query consultando a fila de eventos de participante e exporte o resultado para csv
    Quando eu busco os tipos de miolo de conta que estão habilitados na tabela parametro config
    Append To List  ${miolo_contas_habilitado}  .40-
    Então eu valido os tipos de contas ${miolo_contas_habilitado} no arquivo ${NAME_CSV} exportado para o diretorio ${PATH_CSV}

TST0002: Encerramento de participante emissor que passou a ser considerado participante instituição financeira no sistema NoMe
    [Tags]    PROGRESSIVO_FILA_EVENTO_PARTICIPANTE_EMISS_INSTITUICAO_FINANCEIRA
    Set Global Variable     ${TAG_NUMBER}               TST0002

    Dado que seja encerrado o participante com o CNPJ ${CNPJ_PARTICIPANTE} utilizando a justificativa Encerrando participante para validar eventos enviados ao B3I
    Então deve retornar a mensagem  Encerramento realizado com sucesso.

TST0003: Contas enviada a outros sistemas quando participante emissor passa a ser considerado participante instituição financeira e é encerrado no sistema NoMe
    [Tags]    PROGRESSIVO_FILA_EVENTO_PARTICIPANTE_EMISS_INSTITUICAO_FINANCEIRA

    Dado que eu defina a variavel NAME_CSV com o valor TST0003-EncerramentoEmissorPassandoParaInstituicaoFinanceira como uma variavel global
    E que eu execute a query consultando a fila de eventos após encerramento de participante e exporte o resultado para csv
    Quando eu busco os tipos de miolo de conta que estão habilitados na tabela parametro config
    Append To List  ${miolo_contas_habilitado}  .40-
    Então eu valido os tipos de contas ${miolo_contas_habilitado} no arquivo ${NAME_CSV} exportado para o diretorio ${PATH_CSV}

TST0004: Não deve ser enviado nenhum registro de participante-conta para a fila do extrato
    [Tags]    PROGRESSIVO_FILA_EVENTO_PARTICIPANTE_EMISS_INSTITUICAO_FINANCEIRA
    Dado que eu execute a consulta ao banco de dados verificando que nao retornou nenhum resultado na fila do extrato
    Então que o teste seja concluido com sucesso

*** Keywords ***
configuracao inicial
    Delete Directory If Exists    ${DIRETORIO_IMAGENS}
que o usuário realize login no sistema NoMe como interno B3
    o usuario loga no NoMe como CETIP
que seja acessado a ação ${acao}
    O Usuario seleciona na label Ação valor igual a ${acao}
    O Usuario clica na seta
    capturar e salvar imagem com o nome TelaAposAcao
eu valido os tipos de contas ${miolo_contas_habilitado} no arquivo ${nome_arquivo} exportado para o diretorio ${path_diretorio}
    Verificar valores na coluna 4 do CSV ${path_diretorio}\\${nome_arquivo} permitindo ao menos um valor da lista ${miolo_contas_habilitado}

que eu execute a consulta ao banco de dados verificando que nao retornou nenhum resultado na fila do extrato
    ${query}=       Set Variable        SELECT * FROM CETIP.EXTR_FILA_ATUALIZACAO efa WHERE 1=1 AND efa.nom_url LIKE '%participante-conta%' AND TO_CHAR(DAT_SOLICITACAO,'dd/mm/yyyy') = TO_CHAR(sysdate,'dd/mm/yyyy') ORDER BY efa.DAT_SOLICITACAO DESC
    executo a consulta no ambiente ${var_amb} validando que nao retornou nenhum resultado para a query ${query}
que o teste seja concluido com sucesso
    Log     Teste Finalizado com Sucesso!
que esses miolos de conta ${miolo_contas} seja igual a lista ${miolos_habilitado_comparacao}
    ordenar e comparar duas listas      ${miolo_contas}     ${miolos_habilitado_comparacao}

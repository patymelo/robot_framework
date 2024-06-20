Language: pt-br

*** Settings ***
Documentation       Inclusão de Participante Fundo Aberto para o custodiante RIOBM.
...                 Incluindo cadastro de fundo e iniciando o fluxo no sistema NoMe.
...                 Realizando as aprovações como usuário B3 no sistema NoMe.
...                 Exportando os registros incluido na tabela TCTPEVENTO_CADASTRO_B3I.
...                 Exportando os registros incluido na tabela EXTR_FILA_ATUALIZACAO.
Resource            ${CURDIR}\\..\\..\\GENERIC_VAR\\Login.robot
Resource            ${CURDIR}\\..\\..\\GENERIC_VAR\\Keywords.robot
Resource            ${CURDIR}\\..\\..\\GENERIC_VAR\\keywordConsultaBD.robot
Resource            ${CURDIR}\\..\\..\\GENERIC_VAR\\keywordsCSV.robot
Resource            ${CURDIR}\\..\\..\\GENERIC_VAR\\keywordsFundosInvestimento.robot
Resource            ${CURDIR}\\..\\..\\GENERIC_VAR\\keywordsAberturaDeFundos.robot
Resource            ${CURDIR}\\..\\..\\GENERIC_VAR\\keywordsManutencaoDeFundos.robot
Resource            ${CURDIR}\\..\\..\\GENERIC_VAR\\keywordsEncerramentoDeFundos.robot
Suite Setup         configuracao inicial
Test Teardown       Close Browser
Suite Teardown      configuracao final

*** Variable ***
${DIRETORIO_IMAGENS}                        ${CURDIR}\\Resultados\\img
${PATH_CSV}                                 ${CURDIR}\\Resultados\\csv
${var_amb}=                                 qaa
@{header_resultado_extrato}                 NUM_ID_EXTR_FILA_ATUALIZACAO  NOM_URL  NOM_METODO  DAT_CONF_ENVIO  DAT_SOLICITACAO  NUM_ID_ENTIDADE_ATUALIZ  NUM_STATUS_RETORNO  NUM_GRUPO_PROCESSAMENTO  IND_PROCESSA_REGISTRO  DES_PARAMETROS
@{header_resultado_evento_cadastro}         DATA_EXECUCAO_TESTE  NUM_ID_EVENTO_CADASTRO_B3I  DAT_INCLUSAO  NUM_ID_SERVICO  DES_PATRAMETROS  NUM_STATUS_ESPERADO  NUM_STATUS_RETORNO  DAT_PROCESSAMENTO

*** Test Cases ***
TST0001: Incluindo participante fundo aberto no sistema NoMe e realizando as aprovações com usuario interno B3
    [Tags]      PROGRESSIVO_CADBLC_2244
    ${hora_inicio}=         Generate Current Date and Time
    Set test Variable       ${hora_inicio}
    Dado o usuário define o TAG_NUMBER com a sigla TST0001
    E o usuário realiza a inclusão de um novo fundo para o custodiante RIOBM utilizando o BANCO COSIPB UM como Gestor/Liquidante/Adm. Legal
    E o usuário logado inicia o fluxo informando o protocolo ${numberProtocol} e tipo solicitação ABERTURA
    E o usuário interno B3 realiza as aprovações necessárias para abertura de um novo fundo ${cnpj_novo_fundo} com protocolo ${protocolo_iniciado_fluxo}
    ${hora_fim}=            Generate Current Date and Time
    Set test Variable       ${hora_fim}
    Então o usuário exporta em arquivo CSV os registros inluidos na tabela TCTPEVENTO_CADASTRO_B3I para o CNPJ ${cnpj_novo_fundo}
    E o usuário exporta em arquivo CSV os registros inluidos na tabela EXTR_FILA_ATUALIZACAO para o CNPJ ${cnpj_novo_fundo}

*** Keywords ***
configuracao inicial
    Delete Directory If Exists    ${DIRETORIO_IMAGENS}
    Delete Directory If Exists    ${PATH_CSV}
configuracao final
    Close All Browsers
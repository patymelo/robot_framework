Language: pt-br

*** Settings ***
Documentation       Novo cadastro participante Instituição Financeira.
...                 Incluindo cadastro web
...                 e Efetivando cadastro no sistema NoMe.
...                 ** ATENÇÃO **: Variáveis dentro dos casos de teste precisa utilizar Set Global Variable
...                 para ficar visivel nos Resources dentro do diretório GENERIC_VAR.
Resource            ${CURDIR}\\..\\..\\GENERIC_VAR\\Login.robot
Resource            ${CURDIR}\\..\\..\\GENERIC_VAR\\Keywords.robot
Resource            ${CURDIR}\\..\\..\\GENERIC_VAR\\KeywordsFichaCadastroPrevio.robot
Resource            ${CURDIR}\\..\\..\\GENERIC_VAR\\KeywordsEfetivarParticipante.robot
Resource            ${CURDIR}\\..\\..\\GENERIC_VAR\\KeywordsManutencaoParticipante.robot
Resource            ${CURDIR}\\..\\..\\GENERIC_VAR\\keywordConsultaBD.robot
Suite Setup         configuracao inicial
Test Teardown       Close Browser
Suite Teardown      Close All Browsers

*** Variable ***
${DIRETORIO_IMAGENS}                ${CURDIR}\\Resultados\\img
${PATH_CSV}                         ${CURDIR}\\Resultados\\csv
${var_amb}=                         qaa
${TOGGLE}=                          NAO
${CAPTCHA_HABILITADO}=              NAO
${EMAIL_TOKEN_CADASTRO_PREVIO}=     prestador-william.silva@b3.com.br
@{header_resultado}                 DATA_EXECUCAO_TESTE  NUM_ID_EVENTO_CADASTRO_B3I  DAT_INCLUSAO  NUM_ID_SERVICO  DES_PATRAMETROS  NUM_STATUS_ESPERADO  NUM_STATUS_RETORNO  DAT_PROCESSAMENTO


*** Test Cases ***
TST0000: Verificar miolo de contas habilitados na tabela parametro config
    [Tags]    PROGRESSIVO_FILA_EVENTO_PARTICIPANTE_ON
    ${miolo_contas_comparacao}     Create List     .00-  .10-  .20-
    Dado eu busco os tipos de miolo de conta que estão habilitados na tabela parametro config
    Então que esses miolos de conta ${miolo_contas_habilitado} seja igual a lista ${miolo_contas_comparacao}

TST0001: Inclusão Cadastro Web Natureza Econômica BANCO MULTIPLO 01
    [Tags]    PROGRESSIVO_FILA_EVENTO_PARTICIPANTE_ON

    Dado que eu defina a variavel TIPO_PARTICIPACAO com o valor PARTICIPANTE como uma variavel global
    E que eu defina a variavel NATUREZA_JURIDICA com o valor EMPRESA PUBLICA como uma variavel global
    E que eu defina a variavel GRUPOECON com o valor WILLIAN-ROBOT como uma variavel global
    E que eu defina a variavel TAG_NUMBER com o valor TST0001 como uma variavel global
    E que eu defina a variavel HABILITA_COMPROMISSADA com o valor Sim como uma variavel global
    E que eu realize o cadastro previo de um participante INSTITUICAO com natureza economica BANCO MULTIPLO 01
    Então que eu valide se o cadastro web foi realizado com sucesso

TST0002: Efetivação do Cadastro WEB Natureza Econômica BANCO MULTIPLO 01 no sistema NoMe logado como usuário B3
    [Tags]    PROGRESSIVO_FILA_EVENTO_PARTICIPANTE_ON

    Dado que eu defina a variavel TIPO_PARTICIPACAO com o valor PARTICIPANTE como uma variavel global
    E que eu defina a variavel TAG_NUMBER com o valor TST0002 como uma variavel global
    E que eu defina a variavel tipo_ficha com o valor INSTITUICAO como uma variavel global
    E que eu defina a variavel HABILITA_COMPROMISSADA com o valor Sim como uma variavel global
    E que eu defina a variavel NATUREZA_ECONOMICA com o valor BANCO MULTIPLO 01 como uma variavel global
    E que eu defina a variavel TIPO_CONTA com o valor PROPRIA (00) como uma variavel global
    E que eu defina a variavel MALOTE_PRACA com o valor SP como uma variavel global
    E que eu defina a variavel AREA_ATUACAO com o valor BACK OFFICE como uma variavel global
    E que eu defina a variavel FAMILIA_TIPO com o valor PRÓPRIA como uma variavel global
    E que eu defina a variavel LIQUIDANTE com o valor ITAUBM como uma variavel global
    E que eu defina a variavel SIGLA_NOME_SIMPL com o valor BM como uma variavel global
    E que eu realize a efetivacao basica do cadastro no sistema NoMe utilizando o protocolo ${numberProtocol}

TST0003: Verificar miolo de contas de participante BANCO MULTIPLO 01 que serão enviados para outros sistemas após efetivação
    [Tags]    PROGRESSIVO_FILA_EVENTO_PARTICIPANTE_ON

    Dado que eu defina a variavel NAME_CSV com o valor TST0003-BANCO-MULTIPLO-01-Efetivacao como uma variavel global
    E que eu execute a query consultando a fila de eventos de participante e exporte o resultado para csv
    Quando eu busco os tipos de miolo de conta que estão habilitados na tabela parametro config
    Então eu valido os tipos de contas ${miolo_contas_habilitado} no arquivo ${NAME_CSV} exportado para o diretorio ${PATH_CSV}

TST0004: Inclusão Cadastro Web Natureza Econômica ACUCAR E ALCOOL
    [Tags]    PROGRESSIVO_FILA_EVENTO_PARTICIPANTE_ON

    Dado que eu defina a variavel TIPO_PARTICIPACAO com o valor PARTICIPANTE como uma variavel global
    E que eu defina a variavel NATUREZA_JURIDICA com o valor EMPRESA PUBLICA como uma variavel global
    E que eu defina a variavel GRUPOECON com o valor WILLIAN-ROBOT como uma variavel global
    E que eu defina a variavel TAG_NUMBER com o valor TST0004 como uma variavel global
    E que eu defina a variavel HABILITA_COMPROMISSADA com o valor Não como uma variavel global
    E que eu realize o cadastro previo de um participante INSTITUICAO com natureza economica ACUCAR E ALCOOL
    Então que eu valide se o cadastro web foi realizado com sucesso

TST0005: Efetivação do Cadastro WEB Natureza Econômica ACUCAR E ALCOOL no sistema NoMe logado como usuário B3
    [Tags]    PROGRESSIVO_FILA_EVENTO_PARTICIPANTE_ON

    Dado que eu defina a variavel TIPO_PARTICIPACAO com o valor PARTICIPANTE como uma variavel global
    E que eu defina a variavel TAG_NUMBER com o valor TST0005 como uma variavel global
    E que eu defina a variavel tipo_ficha com o valor INSTITUICAO como uma variavel global
    E que eu defina a variavel HABILITA_COMPROMISSADA com o valor Não como uma variavel global
    E que eu defina a variavel NATUREZA_ECONOMICA com o valor ACUCAR E ALCOOL como uma variavel global
    E que eu defina a variavel TIPO_CONTA com o valor PROPRIA (00) como uma variavel global
    E que eu defina a variavel MALOTE_PRACA com o valor SP como uma variavel global
    E que eu defina a variavel AREA_ATUACAO com o valor BACK OFFICE como uma variavel global
    E que eu defina a variavel FAMILIA_TIPO com o valor PRÓPRIA como uma variavel global
    E que eu defina a variavel LIQUIDANTE com o valor ITAUBM como uma variavel global
    E que eu defina a variavel SIGLA_NOME_SIMPL com o valor ${EMPTY} como uma variavel global
    E que eu realize a efetivacao basica do cadastro no sistema NoMe utilizando o protocolo ${numberProtocol}

TST0006: Verificar miolo de contas de participante ACUCAR E ALCOOL que serão enviados para outros sistemas após efetivação
    [Tags]    PROGRESSIVO_FILA_EVENTO_PARTICIPANTE_ON

    Dado que eu defina a variavel NAME_CSV com o valor TST0006-ACUCAR-E-ALCOOL-Efetivacao como uma variavel global
    E que eu execute a query consultando a fila de eventos de participante e exporte o resultado para csv
    Quando eu busco os tipos de miolo de conta que estão habilitados na tabela parametro config
    Então eu valido os tipos de contas ${miolo_contas_habilitado} no arquivo ${NAME_CSV} exportado para o diretorio ${PATH_CSV}

TST0007: Verificar que não foi enviado nenhum registro para a fila do extrato
    [Tags]    PROGRESSIVO_FILA_EVENTO_PARTICIPANTE_OFF
    Dado que eu execute a consulta ao banco de dados verificando que nao retornou nenhum resultado na fila do extrato
    Então que o teste seja concluido com sucesso

*** Keywords ***
configuracao inicial
    Delete Directory If Exists    ${DIRETORIO_IMAGENS}

eu valido os tipos de contas ${miolo_contas_habilitado} no arquivo ${nome_arquivo} exportado para o diretorio ${path_diretorio}
    Verificar valores na coluna 4 do CSV ${path_diretorio}\\${nome_arquivo} permitindo ao menos um valor da lista ${miolo_contas_habilitado}

que eu execute a consulta ao banco de dados verificando que nao retornou nenhum resultado na fila do extrato
    ${query}=       Set Variable        SELECT * FROM CETIP.EXTR_FILA_ATUALIZACAO efa WHERE 1=1 AND efa.nom_url LIKE '%participante-conta%' AND TO_CHAR(DAT_SOLICITACAO,'dd/mm/yyyy') = TO_CHAR(sysdate,'dd/mm/yyyy') ORDER BY efa.DAT_SOLICITACAO DESC
    executo a consulta no ambiente ${var_amb} validando que nao retornou nenhum resultado para a query ${query}
que o teste seja concluido com sucesso
    Log     Teste Finalizado com Sucesso!
que esses miolos de conta ${miolo_contas} seja igual a lista ${miolos_habilitado_comparacao}
    ordenar e comparar duas listas      ${miolo_contas}     ${miolos_habilitado_comparacao}
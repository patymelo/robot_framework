Language: pt-br

*** Settings ***
Documentation       Incluindo participante e Alterando dados cadastrais.
...                 Realizando a manutenção da Razão social e CNPJ
...                 de um participante.
...                 ** ATENÇÃO **: Variáveis dentro dos casos de teste precisa utilizar Set Global Variable
...                 para ficar visivel nos Resources dentro do diretório GENERIC_VAR.
Resource            ${CURDIR}\\..\\GENERIC_VAR\\Keywords.robot
Resource            ${CURDIR}\\..\\GENERIC_VAR\\Login.robot
Resource            ${CURDIR}\\..\\GENERIC_VAR\\KeywordsFichaCadastroPrevio.robot
Resource            ${CURDIR}\\..\\GENERIC_VAR\\KeywordsEfetivarParticipante.robot
Resource            ${CURDIR}\\..\\GENERIC_VAR\\KeywordsManutencaoParticipante.robot
Resource            ${CURDIR}\\..\\GENERIC_VAR\\keywordConsultaBD.robot
Suite Setup         configuracao inicial
Test Teardown       Close Browser
Suite Teardown      Close All Browsers

*** Variable ***
${DIRETORIO_IMAGENS}                ${CURDIR}\\Resultados\\GeraEvento\\img
${var_amb}=                         qaa
${TOGGLE}=                          NAO
${CAPTCHA_HABILITADO}=              NAO
${EMAIL_TOKEN_CADASTRO_PREVIO}=     prestador-william.silva@b3.com.br

*** Test Cases ***
TST0001: Inclusão Cadastro Web Instituição Financeira com Natureza Econômica BANCO MULTIPLO 01
    [Tags]    PROGRESSIVO_FILA_EVENTO_PARTICIPANTE_GERA_EVENTO

    Dado que eu defina a variavel TIPO_PARTICIPACAO com o valor PARTICIPANTE como uma variavel global
    E que eu defina a variavel NATUREZA_JURIDICA com o valor EMPRESA PUBLICA como uma variavel global
    E que eu defina a variavel GRUPOECON com o valor WILLIAN-ROBOT como uma variavel global
    E que eu defina a variavel TAG_NUMBER com o valor TST0001 como uma variavel global
    E que eu defina a variavel HABILITA_COMPROMISSADA com o valor Sim como uma variavel global
    E que eu realize o cadastro previo de um participante INSTITUICAO com natureza economica BANCO MULTIPLO 01
    Então que eu valide se o cadastro web foi realizado com sucesso

TST0002: Efetivação do Cadastro WEB Instituição Financeira com Natureza Econômica BANCO MULTIPLO 01 no sistema NoMe logado como usuário B3
    [Tags]    PROGRESSIVO_FILA_EVENTO_PARTICIPANTE_GERA_EVENTO

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
    Então que eu realize a efetivacao basica do cadastro no sistema NoMe utilizando o protocolo ${numberProtocol}

TST0003: Realizar alteração na Razão Social e Mnemônico do participante
    [Tags]    PROGRESSIVO_FILA_EVENTO_PARTICIPANTE_GERA_EVENTO
#        Set Global Variable     ${TAG_NUMBER}               TST0003
#        Set Global Variable     ${CNPJ_PARTICIPANTE}        91.540.267/0001-27
        Dado que o usuário realize login no sistema NoMe como interno B3
        E o Usuario acessa o menu de Alteracao de Participante e faz a busca pelo CNPJ
        E que seja acessado a ação DADOS DO PARTICIPANTE
        E que seja alterado o valor no campo Participante (Razão Social)
        E que seja alterado o valor no campo Participante (Mnemônico)
        E O Usuario justifica no campo Justificativa valor igual a Alterando os campos razão social e mnemônico
        E O Usuario clica no botao Enviar
        capturar e salvar imagem com o nome DadosParticipanteAlteraEnviar
        E O Usuario clica no botao Confirmar
        capturar e salvar imagem com o nome DadosParticipanteAlteraConfirmar
        Então deve retornar a mensagem  Dados alterados com sucesso

TST0004: Verificar que a atualização será enviada para outros sistemas após alteração da Razão Social
    [Tags]    PROGRESSIVO_FILA_EVENTO_PARTICIPANTE_GERA_EVENTO
    ${campo_like_payload}=      Set Variable        ${RAZAO_SOCIAL_PARTICIPANTE}
    ${query}=                   Set Variable        SELECT NUM_ID_EVENTO_CADASTRO_B3I, DAT_INCLUSAO, NUM_ID_SERVICO, DBMS_LOB.SUBSTR(DES_PATRAMETROS, 4000, 1), NUM_STATUS_ESPERADO, NUM_STATUS_RETORNO, DAT_PROCESSAMENTO FROM CETIP.TCTPEVENTO_CADASTRO_B3I WHERE 1=1 AND NUM_ID_SERVICO = 276 AND DES_PATRAMETROS LIKE '%${campo_like_payload}%' AND TO_CHAR(DAT_INCLUSAO,'dd/mm/yyyy') = TO_CHAR(sysdate,'dd/mm/yyyy')
    Dado que eu execute a consulta ${query} no ambiente ${var_amb} verificando que retornou 1 registros no resultado
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
que o teste seja concluido com sucesso
    Log     Teste Finalizado com Sucesso!

Language: pt-br

*** Settings ***
Documentation       Grava Step
Suite Setup         Log    Suite Setup!
Suite Teardown      Log    Suite Teardown!
Resource            ${CURDIR}\\..\\..\\GENERIC_VAR\\Login.robot
Resource            ${CURDIR}\\..\\..\\GENERIC_VAR\\Keywords.robot
Resource            ${CURDIR}\\..\\..\\GENERIC_VAR\\KeywordsFichaCadastroPrevio.robot
Resource            ${CURDIR}\\..\\..\\GENERIC_VAR\\KeywordsEfetivarParticipante.robot
Resource            ${CURDIR}\\..\\..\\GENERIC_VAR\\KeywordsManutencaoParticipante.robot
Resource            ${CURDIR}\\..\\..\\GENERIC_VAR\\keywordConsultaBD.robot

*** Test Cases ***
TST0000: Inicia Jira X-Ray CADBLC-1765
    [Tags]    GRAVACAO
    [Setup]   Atualizar Status    QBEF-63895    QBEF-63894    EXECUTING
    ${URL_PLAN}=            Set Variable     https://jira.intraservice.corp/browse/QBEF-63894
    ${URL_EXECUTION}=       Set Variable     https://jira.intraservice.corp/browse/QBEF-63895    

    E que eu defina a variavel TEST_KEY com o valor 63894 como uma variavel global
    E que eu defina a variavel TEST_EXEC_KEY com o valor 63895 como uma variavel global
    Remover log de execução no JIRA ${DIR_LOG_EXEC} ${NAME_ZIP_IMG}
    Remover log de execução no JIRA ${DIR_LOG_EXEC} ${NAME_ZIP_CSV}
    Remover log de execução no JIRA ${DIR_LOG_EXEC} ${NAME_LOG_EXEC}

    Open Browser                    ${URL_PLAN}     ${BROWSER}
    Maximize Browser Window
    O Usuario loga no jira
    Sleep    2s
    Scroll Element Into View        xpath://h4[text()="Details"]
    Iniciar Gravacao
    Sleep    2s
    Scroll Element Into View        xpath://a[text()="[Test Set] Efetivação de Participantes Balcão e envio de contas para o B3i"]
    Sleep   2s
    Scroll Element Into View        xpath://a[text()="[Test Plan] Integração de dados cadastrais e contas de Participante do NoMe com B3I"]
    Sleep   2s
    Scroll Element Into View        xpath://a[text()="[Test Execution] Validar envio contas miolo 00,10 e 20 para o B3i (Instituição Financeira)"]
    Sleep   4s

    Click Element                   xpath://a[@href="/browse/QBEF-63895"]
    Sleep    2s
    Scroll Element Into View        xpath://h4[text()="Description"]
    Sleep    2s
    Scroll Element Into View        xpath://h4[text()="Tests"]
    Sleep    2s
    Scroll Element Into View         xpath://a[text()="[Test] Efetivação Instituição Financeira"]
    Sleep    2s
    Scroll Element Into View        xpath://div[@id="attachmentmodule"]
    Sleep    2s
    Scroll Element Into View        xpath://h4[text()="Issue Links"]
    Sleep    2s
    Pausar Gravacao
    Close Browser
    
TST0001: Inclusão Cadastro Web Natureza Econômica BANCO MULTIPLO 01
    [Tags]    GRAVACAO
    [Setup]   Atualizar Status    QBEF-63895    QBEF-63894    EXECUTING
    
    Dado que eu defina a variavel TIPO_PARTICIPACAO com o valor PARTICIPANTE como uma variavel global
    E que eu defina a variavel NATUREZA_JURIDICA com o valor EMPRESA PUBLICA como uma variavel global
    E que eu defina a variavel GRUPOECON com o valor WILLIAN-ROBOT como uma variavel global
    E que eu defina a variavel TAG_NUMBER com o valor TST0001 como uma variavel global
    E que eu defina a variavel HABILITA_COMPROMISSADA com o valor Sim como uma variavel global
    Retomar Gravacao
    E que eu realize o cadastro previo de um participante INSTITUICAO com natureza economica BANCO MULTIPLO 01
    Então que eu valide se o cadastro web foi realizado com sucesso
    Parar Gravacao
    Close Browser
TST0002: Efetivação do Cadastro WEB Natureza Econômica BANCO MULTIPLO 01 no sistema NoMe logado como usuário B3
    [Tags]          GRAVACAO
    [Teardown]      Atualizar Status    QBEF-63895    QBEF-63894    ${TEST_STATUS}

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
    Iniciar Gravacao
    E que eu realize a efetivacao basica do cadastro no sistema NoMe utilizando o protocolo ${numberProtocol}
    Sleep  2s
    Pausar Gravacao
    Sleep  4s
    Log To Console   ${CNPJ_PARTICIPANTE}
    Close Browser
TST0003: Finaliza Jira X-Ray CADBLC-1765
    [Tags]     GRAVACAO
    ${URL_PLAN}=            Set Variable     https://jira.intraservice.corp/browse/QBEF-63894
    ${URL_EXECUTION}=       Set Variable     https://jira.intraservice.corp/browse/QBEF-63895 
    
    E que eu defina a variavel TEST_KEY com o valor 63894 como uma variavel global
    E que eu defina a variavel TEST_EXEC_KEY com o valor 63895 como uma variavel global
    anexar log de execução no JIRA

    Open Browser                    ${URL_EXECUTION}     ${BROWSER}
    Maximize Browser Window
    O Usuario loga no jira
    Retomar Gravacao
    Scroll Element Into View         xpath://h4[text()="Description"]
    Sleep    2s
    Scroll Element Into View         xpath://h4[text()="Tests"]
    Sleep    2s
    Scroll Element Into View         xpath://a[text()="[Test] Efetivação Instituição Financeira"]
    Sleep    3s
    Scroll Element Into View         xpath://div[@id="attachmentmodule"]
    Sleep    2s
    Scroll Element Into View         xpath://h4[text()="Issue Links"]
    Sleep    2s
    Scroll Element Into View         xpath://h4[text()="Activity"]
    Sleep    4s
    Close Browser
    Parar Gravacao
TST0004: Inicia Jira X-Ray CADBLC-1764
    [Tags]    GRAVACAO
    [Setup]   Atualizar Status    QBEF-64107    QBEF-64105    EXECUTING
    ${URL_PLAN}=            Set Variable     https://jira.intraservice.corp/browse/QBEF-64105
    ${URL_EXECUTION}=       Set Variable     https://jira.intraservice.corp/browse/QBEF-64107    
    
    E que eu defina a variavel TEST_KEY com o valor 64105 como uma variavel global
    E que eu defina a variavel TEST_EXEC_KEY com o valor 64107 como uma variavel global
    Remover log de execução no JIRA ${DIR_LOG_EXEC} ${NAME_ZIP_IMG}
    Remover log de execução no JIRA ${DIR_LOG_EXEC} ${NAME_ZIP_CSV}
    Remover log de execução no JIRA ${DIR_LOG_EXEC} ${NAME_LOG_EXEC}

    Open Browser                    ${URL_PLAN}     ${BROWSER}
    Maximize Browser Window
    O Usuario loga no jira
    Sleep    2s
    Scroll Element Into View        xpath://h4[text()="Details"]
    Iniciar Gravacao
    Sleep    2s
    Scroll Element Into View        xpath://a[text()="[Test Set] Alteração Dados do Participante gera evento para o B3I"]
    Sleep   2s
    Scroll Element Into View        xpath://a[text()="[Test Plan] Integração de dados cadastrais e contas de Participante do NoMe com B3I"]
    Sleep   2s
    Scroll Element Into View        xpath://a[text()="[Test execution] Usuário interno alterando a Razão Social de um participante"]
    Sleep   4s

    Click Element                   xpath://a[@href="/browse/QBEF-64107"]
    Sleep    2s
    Scroll Element Into View        xpath://h4[text()="Description"]
    Sleep    2s
    Scroll Element Into View        xpath://h4[text()="Tests"]
    Sleep    2s
    Scroll Element Into View         xpath://a[text()="[Test] Alteração Dados do Participante que gera evento para o B3i"]
    Sleep    2s
    Scroll Element Into View        xpath://div[@id="attachmentmodule"]
    Sleep    2s
    Scroll Element Into View        xpath://h4[text()="Issue Links"]
    Sleep    3s
    Pausar Gravacao
    Log To Console   ${CNPJ_PARTICIPANTE}
    Close Browser
TST0005: Realizar alteração na Razão Social e Mnemônico do participante
    [Tags]          GRAVACAO
    [Teardown]      Atualizar Status    QBEF-64107    QBEF-64105    ${TEST_STATUS}
    
    Dado que o usuário realize login no sistema NoMe como interno B3
    Sleep  2s
    
    O Usuário possui autorização no NoMe para acessar Adm. de Participantes
    capturar e salvar imagem com o nome Login
    Sleep  2s
    Retomar Gravacao
    E o Usuário acessa o menu Adm. de Participantes > Manutenção > Alteração de Participante
    capturar e salvar imagem com o nome AlteracaoDeParticipante
    O Usuario informa no campo Participante (CNPJ) valor igual a ${CNPJ_PARTICIPANTE}
    capturar e salvar imagem com o nome FiltroAlteracaoDeParticipante
    O Usuario clica no botao Pesquisar

    E que seja acessado a ação DADOS DO PARTICIPANTE
    E que seja alterado o valor no campo Participante (Razão Social)
    E que seja alterado o valor no campo Participante (Mnemônico)
    E O Usuario justifica no campo Justificativa valor igual a Alterando os campos razão social e mnemônico
    E O Usuario clica no botao Enviar
    capturar e salvar imagem com o nome DadosParticipanteAlteraEnviar
    E O Usuario clica no botao Confirmar
    capturar e salvar imagem com o nome DadosParticipanteAlteraConfirmar
    Sleep  2s
    Pausar Gravacao
    Então deve retornar a mensagem  Dados alterados com sucesso 
    Close Browser
TST0006: Finaliza Jira X-Ray CADBLC-1764
    [Tags]     GRAVACAO
    ${URL_PLAN}=            Set Variable     https://jira.intraservice.corp/browse/QBEF-64105
    ${URL_EXECUTION}=       Set Variable     https://jira.intraservice.corp/browse/QBEF-64107 

    E que eu defina a variavel TEST_KEY com o valor 64105 como uma variavel global
    E que eu defina a variavel TEST_EXEC_KEY com o valor 64107 como uma variavel global
    anexar log de execução no JIRA

    Open Browser                    ${URL_EXECUTION}     ${BROWSER}
    Maximize Browser Window
    O Usuario loga no jira
    Retomar Gravacao
    Scroll Element Into View         xpath://h4[text()="Description"]
    Sleep    2s
    Scroll Element Into View         xpath://h4[text()="Tests"]
    Sleep    2s
    Scroll Element Into View         xpath://a[text()="[Test] Alteração Dados do Participante que gera evento para o B3i"]
    Sleep    3s
    Scroll Element Into View         xpath://div[@id="attachmentmodule"]
    Sleep    2s
    Scroll Element Into View         xpath://h4[text()="Issue Links"]
    Sleep    2s
    Scroll Element Into View         xpath://h4[text()="Activity"]
    Sleep    4s
    Close Browser
    Parar Gravacao 
TST0007: Inicia Jira X-Ray CADBLC-1771
    [Tags]    GRAVACAO
    [Setup]   Atualizar Status    QBEF-64138    QBEF-64133    EXECUTING
    ${URL_PLAN}=            Set Variable     https://jira.intraservice.corp/browse/QBEF-64133
    ${URL_EXECUTION}=       Set Variable     https://jira.intraservice.corp/browse/QBEF-64138   
    
    E que eu defina a variavel TEST_KEY com o valor 64133 como uma variavel global
    E que eu defina a variavel TEST_EXEC_KEY com o valor 64138 como uma variavel global
    Remover log de execução no JIRA ${DIR_LOG_EXEC} ${NAME_ZIP_IMG}
    Remover log de execução no JIRA ${DIR_LOG_EXEC} ${NAME_ZIP_CSV}
    Remover log de execução no JIRA ${DIR_LOG_EXEC} ${NAME_LOG_EXEC}

    Open Browser                    ${URL_PLAN}     ${BROWSER}
    Maximize Browser Window
    O Usuario loga no jira
    Sleep    2s
    Scroll Element Into View        xpath://h4[text()="Details"]
    Iniciar Gravacao
    Sleep    2s
    Scroll Element Into View        xpath://a[text()="[Test Set] Encerramento de Participante e envio de contas para o B3I"]
    Sleep   2s
    Scroll Element Into View        xpath://a[text()="[Test Plan] Integração de dados cadastrais e contas de Participante do NoMe com B3I"]
    Sleep   2s
    Scroll Element Into View        xpath://a[text()="[Test execution] Validar envio de contas encerradas com miolo 00,10 e 20 para o B3I (Instituição Financeira)"]
    Sleep   4s

    Click Element                   xpath://a[@href="/browse/QBEF-64138"]
    Sleep    2s
    Scroll Element Into View        xpath://h4[text()="Description"]
    Sleep    2s
    Scroll Element Into View        xpath://h4[text()="Tests"]
    Sleep    2s
    Scroll Element Into View         xpath://a[text()="[Test] Encerramento Instituição Financeira"]
    Sleep    2s
    Scroll Element Into View        xpath://div[@id="attachmentmodule"]
    Sleep    2s
    Scroll Element Into View        xpath://h4[text()="Issue Links"]
    Sleep    3s
    Pausar Gravacao
    Close Browser
    Sleep    3s
 TST0008: Encerramento de participante instituição financeira BANCO MULTIPLO 01 no sistema NoMe
    [Tags]          GRAVACAO
    [Teardown]      Atualizar Status    QBEF-64138    QBEF-64133    ${TEST_STATUS}
    
    que eu defina a variavel ${CNPJ_PARTICIPANTE} com o valor ${cnpj_participante} como uma variavel global
    que o usuário realize login no sistema NoMe como interno B3
    Sleep    2s
    #Select Frame                    id:main

    O Usuário possui autorização no NoMe para acessar Adm. de Participantes
    capturar e salvar imagem com o nome Login
    Sleep  2s
    Retomar Gravacao
    capturar e salvar imagem com o nome Login
    Retomar Gravacao
    E o Usuário acessa o menu Adm. de Participantes > Manutenção > Alteração de Participante
    capturar e salvar imagem com o nome AlteracaoDeParticipante
    O Usuario informa no campo Participante (CNPJ) valor igual a ${CNPJ_PARTICIPANTE}
    capturar e salvar imagem com o nome FiltroAlteracaoDeParticipante
    O Usuario clica no botao Pesquisar

    E que seja acessado a ação ENCERRAR
    E O Usuario justifica no campo Justificativa valor igual a Encerrando participante para validar eventos enviados ao B3I
    E O Usuario clica no botao Enviar
    capturar e salvar imagem com o nome EncerramentoParticipanteEnviar
    E O Usuario clica no botao Confirmar
    capturar e salvar imagem com o nome EncerramentoParticipanteConfirmar
    Sleep  2s
    Pausar Gravacao
    Então deve retornar a mensagem  Encerramento realizado com sucesso.
    Close Browser
 
TST0009: Finaliza Jira X-Ray CADBLC-1771
    [Tags]     GRAVACAO
    ${URL_PLAN}=            Set Variable     https://jira.intraservice.corp/browse/QBEF-64133
    ${URL_EXECUTION}=       Set Variable     https://jira.intraservice.corp/browse/QBEF-64138

    E que eu defina a variavel TEST_KEY com o valor 64133 como uma variavel global
    E que eu defina a variavel TEST_EXEC_KEY com o valor 64138 como uma variavel global
    anexar log de execução no JIRA

    Open Browser                    ${URL_EXECUTION}     ${BROWSER}
    Maximize Browser Window
    O Usuario loga no jira
    Retomar Gravacao
     Scroll Element Into View        xpath://h4[text()="Description"]
    Sleep    2s
    Scroll Element Into View        xpath://h4[text()="Tests"]
    Sleep    2s
    Scroll Element Into View         xpath://a[text()="[Test] Encerramento Instituição Financeira"]
    Sleep    2s
    Scroll Element Into View        xpath://div[@id="attachmentmodule"]
    Sleep    2s
    Scroll Element Into View        xpath://h4[text()="Issue Links"]
    Sleep    2s
    Scroll Element Into View         xpath://h4[text()="Activity"]
    Sleep    4s
    Close Browser
    Parar Gravacao        
*** Keywords ***
O Usuario loga no jira
    Input Text          id:login-form-username      p-pamelo
    Input Text          id:login-form-password      HopeDay#24
    Click Element       id:login-form-submit
    #Sleep   5s
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
anexar log de execução no JIRA
    Zipar log das imagens ${PATH_IMG} ${PATH_EXEC}\\${NAME_ZIP_IMG}
    Zipar log das imagens ${PATH_CSV} ${PATH_EXEC}\\${NAME_ZIP_CSV}
    Anexar log de execução no JIRA ${PATH_EXEC}\\${NAME_ZIP_IMG} ${NAME_ZIP_IMG}
    Anexar log de execução no JIRA ${PATH_EXEC}\\${NAME_ZIP_CSV} ${NAME_ZIP_CSV}    
    Anexar log de execução no JIRA ${DIR_LOG_EXEC} ${NAME_LOG_EXEC} 
*** Variable ***
${BROWSER}=             chrome

${VideoAlias}=          VideoCADBLC1765
${VideoName}=           video/${VideoAlias}

${DIRETORIO_IMAGENS}                ${CURDIR}\\Resultados\\img
${PATH_CSV}                         ${CURDIR}\\Resultados\\csv
${var_amb}=                         qaa
${TOGGLE}=                          NAO
${CAPTCHA_HABILITADO}=              NAO
${EMAIL_TOKEN_CADASTRO_PREVIO}=     prestador-william.silva@b3.com.br
@{header_resultado}                 DATA_EXECUCAO_TESTE  NUM_ID_EVENTO_CADASTRO_B3I  DAT_INCLUSAO  NUM_ID_SERVICO  DES_PATRAMETROS  NUM_STATUS_ESPERADO  NUM_STATUS_RETORNO  DAT_PROCESSAMENTO

${PATH_EXEC}=             ${CURDIR}\\Resultados
${NAME_ZIP_IMG}=          imgTelaNoMe.zip
${NAME_ZIP_CSV}=          csvFilaBancoDeDados.zip
${NAME_LOG_EXEC}=         log.html
${DIR_LOG_EXEC}=          ${PATH_EXEC}\\${NAME_LOG_EXEC}
${PATH_IMG}=              ${PATH_EXEC}\\img
${PATH_CSV}=              ${PATH_EXEC}\\csv
${DIR_OUTPUT}=            ${PATH_EXEC}\\output.xml

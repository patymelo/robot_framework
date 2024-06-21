*** Settings ***
Resource    Keywords.robot
*** Keywords ***
o usuário inclui uma nova conta ${tipo_conta} utilizando radical ${radical} liquidante ${liquidante} e situacao ${situacao_nova_conta}
    #[Arguments]     ${malote_titular}   ${malote_nome}   ${malote_praca}
    #que eu defina a variavel MALOTE_TITULAR com o valor ${malote_titular} como uma variavel global
    #que eu defina a variavel MALOTE_NOME com o valor ${malote_nome} como uma variavel global
    #que eu defina a variavel MALOTE_PRACA com o valor ${malote_praca} como uma variavel global
    que eu defina a variavel LIQUIDANTE com o valor ${liquidante} como uma variavel global
    que eu defina a variavel SITUACAO_CONTA com o valor ${situacao_nova_conta} como uma variavel global

    o usuario loga no NoMe como CETIP
    o Usuario acessa o menu de Alteracao de Participante e faz a busca pelo CNPJ
    o usuario realiza a inclusão de uma nova conta com tipo ${tipo_conta} para o radical ${radical}
    Close Browser

o usuário inclui uma nova conta ativa ${tipo_conta} independente do radical, configuração e liquidante
    que eu defina a variavel MALOTE_TITULAR com o valor Sim como uma variavel global
    que eu defina a variavel MALOTE_PRACA com o valor SP como uma variavel global
    que eu defina a variavel MALOTE_NOME com o valor ${EMPTY} como uma variavel global
    que eu defina a variavel LIQUIDANTE com o valor ITAUBM como uma variavel global
    que eu defina a variavel SITUACAO_CONTA com o valor ATIVA como uma variavel global

    o usuario loga no NoMe como CETIP
    o Usuario acessa o menu de Alteracao de Participante e faz a busca pelo CNPJ
    o usuario realiza a inclusão de uma nova conta com tipo ${tipo_conta} para o radical ${EMPTY}
    Close Browser
o usuario realiza a inclusão de uma nova conta com tipo ${tipo_conta}
    O Usuario seleciona na label Ação valor igual a CONTAS
    O Usuario clica na seta
    O Usuario seleciona na label Ação valor igual a INCLUIR
    O Usuario clica na seta
    ${NUMBERFAKE}=             FakerLibrary.RandomNumber
    ${STRING}=                 Generate Random String    3    [NUMBERS]

    O Usuario informa no campo Conta (Nome) valor igual a ROBOT CONTA ${NUMBERFAKE}${STRING}
    O Usuario seleciona na combo Tipo da Conta valor igual a ${tipo_conta}
    O Usuario seleciona na combo Cartão de Autógrafos (É Titular?) valor igual a Sim
    O Usuario seleciona na combo Malote (É Titular?) valor igual a ${MALOTE_TITULAR}
    O Usuario seleciona na combo Malote (Praça) valor igual a ${MALOTE_PRACA}
    O Usuario informa no campo Malote (Nome) valor igual a ${EMPTY}
    O Usuario informa no campo Liquidante/Agente de Liquidação (Nome Simplificado) valor igual a ${LIQUIDANTE}
    O Usuario seleciona na combo Conta (Situação) valor igual a ATIVA
    O Usuario justifica no campo Justificativa valor igual a Teste Inclusão da Conta
    O Usuario seleciona na combo Tipo de Abertura de Conta valor igual a Abertura
    O Usuario seleciona na combo Faixa de Cobrança valor igual a FAIXA 3
    O Usuario clica no botao Enviar
    capturar e salvar imagem com o nome CriarContaEnviar
    O Usuario clica no botao Confirmar
    capturar e salvar imagem com o nome CriarContaConfirmar
    Então deve retornar a mensagem  Conta incluída com sucesso.
o usuario realiza a inclusão de uma nova conta com tipo ${tipo_conta} para o radical ${radical}
    O Usuario seleciona na label Ação valor igual a CONTAS
    O Usuario clica na seta
    O Usuario seleciona na label Ação valor igual a INCLUIR
    O Usuario clica na seta
    ${NUMBERFAKE}=             FakerLibrary.RandomNumber
    ${STRING}=                 Generate Random String    3    [NUMBERS]


    IF     "${radical}"=="${EMPTY}"
        ${radical_nova_conta}=                 Set Variable     ${EMPTY}
    ELSE
        ${radical_nova_conta}=                 Set Variable     ${radical}
    END

    Log     ${radical_nova_conta}

    O Usuario informa no campo Conta (Nome) valor igual a ROBOT CONTA ${NUMBERFAKE}${STRING}
    O Usuario informa no campo Radical da Conta valor igual a ${radical_nova_conta}
    O Usuario seleciona na combo Tipo da Conta valor igual a ${tipo_conta}
    O Usuario seleciona na combo Cartão de Autógrafos (É Titular?) valor igual a Sim
    O Usuario seleciona na combo Malote (É Titular?) valor igual a ${MALOTE_TITULAR}
    O Usuario seleciona na combo Malote (Praça) valor igual a ${MALOTE_PRACA}
    O Usuario informa no campo Malote (Nome) valor igual a ${MALOTE_NOME}
    O Usuario informa no campo Liquidante/Agente de Liquidação (Nome Simplificado) valor igual a ${LIQUIDANTE}
    O Usuario seleciona na combo Liquidante (Confirmado?) valor igual a Sim
    O Usuario seleciona na combo Conta (Situação) valor igual a ${SITUACAO_CONTA}
    O Usuario justifica no campo Justificativa valor igual a Teste Inclusão da Conta
    O Usuario seleciona na combo Tipo de Abertura de Conta valor igual a Abertura
    O Usuario seleciona na combo Faixa de Cobrança valor igual a FAIXA 3
    O Usuario clica no botao Enviar
    capturar e salvar imagem com o nome CriarContaEnviar
    O Usuario clica no botao Confirmar
    capturar e salvar imagem com o nome CriarContaConfirmar
    Então deve retornar a mensagem  Conta incluída com sucesso.
que seja encerrado o participante com o CNPJ ${cnpj_participante} utilizando a justificativa ${justificativa_encerramento}
    que eu defina a variavel ${CNPJ_PARTICIPANTE} com o valor ${cnpj_participante} como uma variavel global
    que o usuário realize login no sistema NoMe como interno B3
    o Usuario acessa o menu de Alteracao de Participante e faz a busca pelo CNPJ
    que seja acessado a ação ENCERRAR
    O Usuario justifica no campo Justificativa valor igual a ${justificativa_encerramento}
    O Usuario clica no botao Enviar
    capturar e salvar imagem com o nome EncerramentoParticipanteEnviar
    O Usuario clica no botao Confirmar
    capturar e salvar imagem com o nome EncerramentoParticipanteConfirmar
que eu verifique a situação do participante no sistema NoMe como ATIVO
    Dado o usuario loga no NoMe como CETIP
    E o Usuario acessa o menu de Alteracao de Participante e faz a busca pelo CNPJ
    Então que eu verifique o campo Participante (Situação) com o valor ATIVO
que seja alterado o valor no campo Participante (Razão Social)
    ${complemento_razao_social}=        Generate Random String      83      [UPPER]
    ${RAZAO_SOCIAL}=                    Set Variable                ROBOT-ALTERACAO-${complemento_razao_social}

    ${RAZAO_SOCIAL_PARTICIPANTE}=       Pega valor do campo Participante (Razão Social)

    O Usuario informa no campo Participante (Razão Social) valor igual a ${RAZAO_SOCIAL}

    Should Not Be Equal     ${RAZAO_SOCIAL_PARTICIPANTE}        ${RAZAO_SOCIAL}
    Set Global Variable     ${RAZAO_SOCIAL_PARTICIPANTE}        ${RAZAO_SOCIAL}
que seja alterado o valor no campo Participante (Mnemônico)
    ${MNEMONICO}=                       Generate Random String      5       [UPPER]

    ${MNEMONICO_PARTICIPANTE}=          Pega valor do campo Participante (Mnemônico)

    O Usuario informa no campo Participante (Mnemônico) valor igual a ${MNEMONICO}

    Should Not Be Equal     ${MNEMONICO_PARTICIPANTE}        ${MNEMONICO}
    Set Global Variable     ${MNEMONICO_PARTICIPANTE}        ${MNEMONICO}
que seja alterado o valor no campo Mnemônico da Conta
    ${mnemonico}=        Generate random string with size   5
    O Usuario informa no campo Mnemônico da Conta valor igual a ${mnemonico}
que seja alterado o valor no campo Habilitado para Op. Compromissada?
    ${nome_campo}=                          Set Variable        Habilitado para Op. Compromissada?
    ${habilitado_compromissada}=            Pega valor da combobox ${nome_campo}
    IF     "${habilitado_compromissada}"=="Sim"
        O Usuario seleciona na combo ${nome_campo} valor igual a Não
    ELSE
        O Usuario seleciona na combo ${nome_campo} valor igual a Sim
    END
que seja alterado o valor no campo Atua como Intermediador?
    ${nome_campo}=                  Set Variable        Atua como Intermediador?
    ${atua_intermediador}=          Pega valor da combobox ${nome_campo}

    IF     "${atua_intermediador}"=="Sim"
        O Usuario seleciona na combo ${nome_campo} valor igual a Não
    ELSE
        O Usuario seleciona na combo ${nome_campo} valor igual a Sim
    END
que seja alterado o valor no campo Natureza Jurídica
    ${nome_campo}=                  Set Variable        Natureza Jurídica
    ${natureza_juridica}=           Pega valor da combobox ${nome_campo}

    IF     "${natureza_juridica}"=="EMPRESA PUBLICA"
        O Usuario seleciona na combo ${nome_campo} valor igual a CONSORCIO
    ELSE IF     "${natureza_juridica}"=="FIRMA INDIVIDUAL"
        O Usuario seleciona na combo ${nome_campo} valor igual a EMPRESA PUBLICA
    ELSE IF     "${natureza_juridica}"=="GRUPOS DE SOCIEDADES"
        O Usuario seleciona na combo ${nome_campo} valor igual a FIRMA INDIVIDUAL
    ELSE IF     "${natureza_juridica}"=="AUTARQUIA"
        O Usuario seleciona na combo ${nome_campo} valor igual a GRUPOS DE SOCIEDADES
    ELSE
        O Usuario seleciona na combo ${nome_campo} valor igual a AUTARQUIA
    END
que seja alterado o valor no campo Controle Acionário
    ${nome_campo}=                  Set Variable        Controle Acionário
    ${controle_acionario}=           Pega valor da combobox ${nome_campo}

    IF     "${controle_acionario}"=="PRIVADO"
        O Usuario seleciona na combo ${nome_campo} valor igual a PUBLICO
    ELSE IF     "${controle_acionario}"=="PUBLICO"
        O Usuario seleciona na combo ${nome_campo} valor igual a PUBLICO EM PROCESSO DE PRIVATIZACAO
    ELSE IF     "${controle_acionario}"=="PUBLICO EM PROCESSO DE PRIVATIZACAO"
        O Usuario seleciona na combo ${nome_campo} valor igual a PRIVADO
    ELSE
        O Usuario seleciona na combo ${nome_campo} valor igual a PUBLICO
    END
que seja alterado o valor no campo Origem de Capital
    ${nome_campo}=                  Set Variable        Origem de Capital
    ${origem_capital}=           Pega valor da combobox ${nome_campo}

    IF     "${origem_capital}"=="NACIONAL"
        O Usuario seleciona na combo ${nome_campo} valor igual a ESTRANGEIRA
    ELSE IF     "${origem_capital}"=="ESTRANGEIRA"
        O Usuario seleciona na combo ${nome_campo} valor igual a MULTINACIONAL
    ELSE IF     "${origem_capital}"=="MULTINACIONAL"
        O Usuario seleciona na combo ${nome_campo} valor igual a NACIONAL
    ELSE
        O Usuario seleciona na combo ${nome_campo} valor igual a NACIONAL
    END
que seja alterado o valor no campo Isento de Inscrição Estadual?
    ${nome_campo}=                  Set Variable        Isento de Inscrição Estadual?
    ${isento_estadual}=             Pega valor da combobox ${nome_campo}

    IF     "${isento_estadual}"=="Sim"
        O Usuario seleciona na combo ${nome_campo} valor igual a Não
        ${inscricao_estadual}=          Generate Random String      19       [NUMBERS]
        O Usuario informa no campo Inscrição Estadual valor igual a ${inscricao_estadual}
    ELSE
        O Usuario seleciona na combo ${nome_campo} valor igual a Sim
        O Usuario informa no campo Inscrição Estadual valor igual a ${EMPTY}
    END
que seja alterado o valor no campo Isento de Inscrição Municipal?
    ${nome_campo}=                  Set Variable        Isento de Inscrição Municipal?
    ${isento_municipal}=             Pega valor da combobox ${nome_campo}

    IF     "${isento_municipal}"=="Sim"
        O Usuario seleciona na combo ${nome_campo} valor igual a Não
        ${inscricao_municipal}=         Generate Random String      19       [NUMBERS]
        O Usuario informa no campo Inscrição Municipal valor igual a ${inscricao_municipal}
    ELSE
        O Usuario seleciona na combo ${nome_campo} valor igual a Sim
        O Usuario informa no campo Inscrição Municipal valor igual a ${EMPTY}
    END
que seja alterado o valor no campo Isenção de Pagamento?
    ${nome_campo}=                  Set Variable        Isenção de Pagamento?
    ${isento_pagamento}=             Pega valor da combobox ${nome_campo}

    IF     "${isento_pagamento}"=="Sim"
        O Usuario seleciona na combo ${nome_campo} valor igual a Não
        O Usuario informa no campo Motivo de Isenção valor igual a ${EMPTY}
    ELSE
        O Usuario seleciona na combo ${nome_campo} valor igual a Sim
        ${motivo}=                      Generate Random String      20       [UPPER]
        O Usuario informa no campo Motivo de Isenção valor igual a Robot-Isenção-${motivo}
    END
que seja alterado o valor no campo Habilitado ao Reune?
    ${nome_campo}=                  Set Variable        Habilitado ao Reune?
    ${habilitado_reune}=            Pega valor da combobox ${nome_campo}

    IF     "${habilitado_reune}"=="Sim"
        O Usuario seleciona na combo ${nome_campo} valor igual a Não
    ELSE
        O Usuario seleciona na combo ${nome_campo} valor igual a Sim
    END
que seja alterado o valor no campo Integrado ao Reune?
    ${nome_campo}=                  Set Variable        Integrado ao Reune?
    ${integrado_reune}=             Pega valor da combobox ${nome_campo}

    IF     "${integrado_reune}"=="Sim"
        O Usuario seleciona na combo ${nome_campo} valor igual a Não
    ELSE
        O Usuario seleciona na combo ${nome_campo} valor igual a Sim
    END
que seja alterado o valor no campo Grupo Econômico
    ${grupo_economico}=             Generate Random String      19       [UPPER]
    O Usuario informa no campo Grupo Econômico valor igual a ${grupo_economico}

O Usuario acessa o menu de Alteracao de Participante e faz a busca pelo CNPJ
    O Usuário possui autorização no NoMe para acessar Adm. de Participantes
    capturar e salvar imagem com o nome Login
    E o Usuário acessa o menu Adm. de Participantes > Manutenção > Alteração de Participante
    capturar e salvar imagem com o nome AlteracaoDeParticipante
    O Usuario informa no campo Participante (CNPJ) valor igual a ${CNPJ_PARTICIPANTE}
    capturar e salvar imagem com o nome FiltroAlteracaoDeParticipante
    O Usuario clica no botao Pesquisar

O Usuario acessa novamente o menu de Alteracao de Participante e faz a busca pelo CNPJ
    E o Usuário acessa novamente o menu    Adm. de Participantes     Adm. de Participantes > Manutenção > Alteração de Participante
    O Usuario clica no botao Pesquisar   
O Usuario preenche os Dados do Participante e altera Razao Social e CNPJ
    ${CNPJ}=            Generate CNPJ with size   18
    ${NUMBERFAKE}=      FakerLibrary.RandomNumber
    ${RAZAO_SOCIAL}=    Set Variable   ROBOTALT${NUMBERFAKE}
    ${MNEMONICO}=       Generate Random String    5    [UPPER]

    O Usuario seleciona na label Ação valor igual a DADOS DO PARTICIPANTE
    O Usuario clica na seta
    Capture Page Screenshot    img/${TAG_NUMBER}_4DadosParticipante.png

    ${CNPJ_PARTICIPANTE}=           Pega valor do campo Participante (CNPJ)
    ${RAZAO_SOCIAL_PARTICIPANTE}=   Pega valor do campo Participante (CNPJ)

    O Usuario informa no campo Participante (Razão Social) valor igual a ${RAZAO_SOCIAL}
    O Usuario informa no campo Participante (CNPJ) valor igual a ${CNPJ}
    O Usuario informa no campo Participante (Mnemônico) valor igual a ${MNEMONICO}

    Should Not Be Equal  ${CNPJ_PARTICIPANTE}  ${CNPJ}
    Should Not Be Equal  ${RAZAO_SOCIAL_PARTICIPANTE}  ${RAZAO_SOCIAL}

    O Usuario justifica no campo Justificativa valor igual a Teste Alteração

    ${CNPJ_PARTICIPANTE}=     Set Variable       ${CNPJ}
    Set Global Variable   ${CNPJ_PARTICIPANTE}

    O Usuario clica no botao Enviar
    Capture Page Screenshot    img/${TAG_NUMBER}_5DadosParticipanteEnviar.png
    O Usuario clica no botao Confirmar
    Capture Page Screenshot    img/${TAG_NUMBER}_6DadosParticipanteConfirmar.png
    Então deve retornar a mensagem  Dados alterados com sucesso
O Usuario altera o status da conta para ${STATUS_CONTA}
    O Usuario seleciona na label Ação valor igual a CONTAS
    O Usuario clica na seta
    Busca na tabela workspaceTable o id do campo ${NOME_CONTA}
    ${id_label}=    Set Variable   ${id_value}
    Set Global Variable  ${id_label}
    O Usuario seleciona na label id ${id_label} valor igual a ALTERAR
    Capture Page Screenshot    img/${TAG_NUMBER}_3Acao.png
    O Usuario clica na seta da ação
    Capture Page Screenshot    img/${TAG_NUMBER}_4TelaDeAlteracao.png
    O Usuario seleciona na combo Situação da Conta valor igual a ${STATUS_CONTA}
    O Usuario justifica no campo Justificativa valor igual a Teste Alteração de status da conta para ${STATUS_CONTA}
    O Usuario clica no botao Enviar
    Capture Page Screenshot    img/${TAG_NUMBER}_5AlteracaoContaStatusEnviar.png
    O Usuario clica no botao Confirmar
    Capture Page Screenshot    img/${TAG_NUMBER}_6AlteracaoContaStatusConfirmar.png
Busca na tabela ${id} o id do campo ${column_find_text}
    ${list}=    Create List
    Append To List    ${list}    ${column_find_text}
    Busca na tabela ${id} o index da linha que possui os campos ${list}
Busca na tabela o id da coluna ${column_find_text}
    ${ColumnsHeader}=    SeleniumLibrary.Get Element Count  xpath://table[@id='${id}']/tbody/tr[1]/th

    Set Global Variable  ${id}
    Set Global Variable  ${ColumnsHeader}

    FOR    ${rowIndexHeader}  IN  ${ColumnsHeader}
        ${curText}     get text     //table[@id='${id}']/tbody/tr[1]/th[${rowIndexHeader}]
        IF  "${curText}" == "${column_find_text}"
            ${id_column}=    Set Variable  ${rowIndexHeader}
            ${id_column}=    Convert To Integer  ${id_column}
            Set Global Variable  ${id_column}
        END
        Exit FOR Loop
    END
Busca valor ${find_valor} na coluna ${column_find_text}
    O Usuario seleciona na label Ação valor igual a CONTAS
    O Usuario clica na seta
    O usuario clica no botao Atualizar
    Busca na tabela o id da coluna ${column_find_text}
    LOG   ${id}
    LOG   ${id_label}
    LOG   ${id_column}
    ${curText}     get text     //table[@id='${id}']/tbody/tr[${id_label+1}]/td[${id_column}]
    LOG   ${curText}
    Should Be Equal  ${curText}  ${STATUS_CONTA}
O Usuario faz o bloqueio de uma conta
    O Usuario seleciona na label Ação valor igual a BLOQUEAR
    O Usuario clica na seta
    Capture Page Screenshot    img/${TAG_NUMBER}_3Acao.png
    LOG  ${COD_CONTA}
    Busca na tabela workspaceTable o id do campo ${COD_CONTA}
    ${id_label}=    Set Variable   ${id_value}
    Set Global Variable  ${id_label}
    O Usuario seleciona na label id ${id_label} valor igual a BLOQUEAR
    Capture Page Screenshot    img/${TAG_NUMBER}_3Acao.png
    O Usuario clica na seta da ação
    Capture Page Screenshot    img/${TAG_NUMBER}_4TelaDeAlteracao.png

O Usuario cria uma nova conta propria
    O Usuario seleciona na label Ação valor igual a CONTAS
    O Usuario clica na seta
    O Usuario seleciona na label Ação valor igual a INCLUIR
    O Usuario clica na seta
    ${NUMBERFAKE}=             FakerLibrary.RandomNumber
    ${STRING}=                 Generate Random String    3    [NUMBERS]
    ${NOME_CONTA}=             ROBOT CONTA ${NUMBERFAKE}
    O Usuario informa no campo Conta (Nome) valor igual a ${NOME_CONTA}
    O Usuario seleciona na combo Tipo da Conta valor igual a ${TIPO_CONTA}
    O Usuario seleciona na combo Cartão de Autógrafos (É Titular?) valor igual a Sim
    O Usuario limpa campo conta do cartão
    O Usuario seleciona na combo Malote (É Titular?) valor igual a Sim
    O Usuario seleciona na combo Malote (Praça) valor igual a ${MALOTE_PRACA}
    O Usuario informa no campo Liquidante/Agente de Liquidação (Nome Simplificado) valor igual a ${LIQUIDANTE}
    O Usuario seleciona na combo Conta (Situação) valor igual a ATIVA
    O Usuario justifica no campo Justificativa valor igual a Teste Inclusão da Conta
    O Usuario seleciona na combo Tipo de Abertura de Conta valor igual a Abertura
    O Usuario seleciona na combo Faixa de Cobrança valor igual a FAIXA 3
    #Sleep  3s
    O Usuario clica no botao Enviar
    Capture Page Screenshot    img/${TAG_NUMBER}_4CriarContaEnviar.png
    #Sleep  3s
    O Usuario clica no botao Confirmar
    Capture Page Screenshot    img/${TAG_NUMBER}_4CriarConfirmarEnviar.png
    Então deve retornar a mensagem  Conta incluída com sucesso.
#O Usuario clica na seta
#    Click Element   //input[@name="command"]
O Usuario clica na seta da ação
    Click Element   //select[@id='e${id_label}']//following::input[@name="command"]
pega valor do campo conta e armazena na variavel ${VAR}
    ${VALOR}=           pega valor do campo conta
    Set Global Variable         ${${VAR}}  ${VALOR}
pega valor do campo conta
   Select Frame              id:main
   ${dataValue}              Get Text                     xpath://td[@class='notificacao'] 
   ${dataValue}              Replace String               ${dataValue}    Conta incluída com sucesso.   ${EMPTY}
   ${dataValue}              Replace String               ${dataValue}    Conta:    ${EMPTY}
   ${dataValue}              Replace String               ${dataValue}    .    ${EMPTY}
   ${dataValue}              Replace String               ${dataValue}    -    ${EMPTY}
   ${dataValue}              clear string          ${dataValue}
   ${conta1}                 Get Substring         ${dataValue}    0       5      
   ${conta2}                 Get Substring         ${dataValue}    5       7   
   ${conta3}                 Get Substring         ${dataValue}    7       8       
   ${dataValue}              Set Variable          ${conta1}.${conta2}-${conta3}
   [Return]   ${dataValue}    
que seja alterado o valor no campo Faixa de Cobrança
    ${nome_campo}=                  Set Variable        Faixa de Cobrança
    ${faixa_cobranca}=              Pega valor da combobox ${nome_campo}

    IF     "${faixa_cobranca}"=="FAIXA 0"
        O Usuario seleciona na combo ${nome_campo} valor igual a FAIXA 1
    ELSE IF     "${faixa_cobranca}"=="FAIXA 1"
        O Usuario seleciona na combo ${nome_campo} valor igual a FAIXA 2
    ELSE IF     "${faixa_cobranca}"=="FAIXA 2"
        O Usuario seleciona na combo ${nome_campo} valor igual a FAIXA 3
    ELSE IF     "${faixa_cobranca}"=="FAIXA 3"
        O Usuario seleciona na combo ${nome_campo} valor igual a FAIXA 4
    ELSE IF     "${faixa_cobranca}"=="FAIXA 4"
        O Usuario seleciona na combo ${nome_campo} valor igual a FAIXA 5
    ELSE IF     "${faixa_cobranca}"=="FAIXA 5"
        O Usuario seleciona na combo ${nome_campo} valor igual a FAIXA 6
    ELSE
        O Usuario seleciona na combo ${nome_campo} valor igual a FAIXA 0
    END
que seja alterado o valor no campo Conta (Nome)
    ${string_fake}=         Generate Random String    80    [UPPER]
    O Usuario informa no campo Conta (Nome) valor igual a ROBOT ALTERA CONTA ${string_fake}
o usuario verifica a situação atual da conta ${cod_conta}
    O Usuario seleciona na label Ação valor igual a CONTAS
    O Usuario clica na seta
    Log   ${cod_conta}
    Busca na tabela workspaceTable o id do campo ${cod_conta}
    ${id_label}=    Set Variable   ${id_value}
    Set Global Variable  ${id_label}
    O Usuario seleciona na label id ${id_label} valor igual a ALTERAR
    capturar e salvar imagem com o nome AcaoAlterarConta
    O Usuario clica na seta da ação
    capturar e salvar imagem com o nome SituacaoConta
    ${situacao_conta}=      Pega valor da combobox Situação da Conta
    Set Test Variable       ${situacao_conta}
    Set Test Variable       ${cod_conta}
    O Usuario clica no botao Voltar
    O Usuario clica no botao Voltar
o usuário altera diversos campos da conta ${codigo_conta} sem alterar a situação da conta
    ${hora_inicio_alteracao_dados_conta}=       Generate Current Date and Time
    O Usuario seleciona na label Ação valor igual a CONTAS
    O Usuario clica na seta
    Busca na tabela workspaceTable o id do campo ${codigo_conta}
    ${id_label}=    Set Variable   ${id_value}
    Set Global Variable  ${id_label}
    O Usuario seleciona na label id ${id_label} valor igual a ALTERAR
    capturar e salvar imagem com o nome Acao
    O Usuario clica na seta da ação
    capturar e salvar imagem com o nome TelaDeAlteracaoConta
    que seja alterado o valor no campo Conta (Nome)
    O Usuario seleciona na combo Cartão de Autógrafos Próprio? valor igual a Sim
    O Usuario informa no campo Conta do Cartão a conta ${EMPTY}.${EMPTY}-${EMPTY}
    O Usuario justifica no campo Justificativa valor igual a Teste Alteração dados da conta sem mudar a situação
    que seja alterado o valor no campo Tipo de Abertura de Conta
    que seja alterado o valor no campo Faixa de Cobrança
    O Usuario justifica no campo Justificativa para a Faixa de Cobrança valor igual a Teste Alteração dados da conta sem mudar a situação
    O Usuario clica no botao Enviar
    capturar e salvar imagem com o nome AlteracaoDadosContaEnviar
    O Usuario clica no botao Confirmar
    capturar e salvar imagem com o nome AlteracaoDadosContaConfirmar
    ${hora_fim_alteracao_dados_conta}=       Generate Current Date and Time
    Set test Variable       ${hora_inicio_alteracao_dados_conta}
    Set test Variable       ${hora_fim_alteracao_dados_conta}
o usuário altera a situação da conta ${cod_conta} de acordo com a situação atual
    ${hora_inicio_alteracao_situacao_conta}=       Generate Current Date and Time
    IF     "${situacao_conta}"=="ATIVA"
        O Usuario altera o status da conta ${cod_conta} para EM PROCESSO DE ABERTURA
        ${situacao_conta}=      Set Variable        EM PROCESSO DE ABERTURA
    ELSE IF     "${situacao_conta}"=="EM PROCESSO DE ABERTURA"
        O Usuario altera o status da conta ${cod_conta} para ATIVA SOMENTE PARA RESGATE
        ${situacao_conta}=      Set Variable        ATIVA SOMENTE PARA RESGATE
    ELSE IF     "${situacao_conta}"=="ATIVA SOMENTE PARA RESGATE"
        O Usuario altera o status da conta ${cod_conta} para ATIVA
        ${situacao_conta}=      Set Variable        ATIVA
    ELSE
        O Usuario altera o status da conta ${cod_conta} para ATIVA
        ${situacao_conta}=      Set Variable        ATIVA
    END
    ${hora_fim_alteracao_situacao_conta}=       Generate Current Date and Time

    Set test Variable       ${hora_inicio_alteracao_situacao_conta}
    Set test Variable       ${situacao_conta}
    Set test Variable       ${hora_fim_alteracao_situacao_conta}
O Usuario altera o status da conta ${codigo_conta} para ${status_conta}
    O Usuario seleciona na label Ação valor igual a CONTAS
    O Usuario clica na seta
    Busca na tabela workspaceTable o id do campo ${codigo_conta}
    ${id_label}=    Set Variable   ${id_value}
    Set Global Variable  ${id_label}
    O Usuario seleciona na label id ${id_label} valor igual a ALTERAR
    capturar e salvar imagem com o nome Acao
    O Usuario clica na seta da ação
    capturar e salvar imagem com o nome TelaDeAlteracaoConta
    O Usuario seleciona na combo Cartão de Autógrafos Próprio? valor igual a Sim
    O Usuario informa no campo Conta do Cartão a conta ${EMPTY}.${EMPTY}-${EMPTY}
    ${contains}=    Run Keyword And Return Status       Should Contain      ${codigo_conta}     .40-
    IF    ${contains}
        que seja alterado o valor no campo Mnemônico da Conta
    END
    O Usuario seleciona na combo Situação da Conta valor igual a ${status_conta}
    O Usuario justifica no campo Justificativa valor igual a Teste Alteração de status da conta para ${status_conta}
    que seja alterado o valor no campo Tipo de Abertura de Conta
    que seja alterado o valor no campo Faixa de Cobrança
    O Usuario justifica no campo Justificativa para a Faixa de Cobrança valor igual a Teste Alteração de status da conta para ${status_conta}
    O Usuario clica no botao Enviar
    capturar e salvar imagem com o nome AlteracaoContaStatusEnviar
    O Usuario clica no botao Confirmar
    capturar e salvar imagem com o nome AlteracaoContaStatusConfirmar

o usuário verifica que a conta ${conta_propria} é uma conta própria vinculada a conta ${conta_garantia}
    O Usuario seleciona na label Ação valor igual a CONTAS
    O Usuario clica na seta
    Wait Until Page Contains        ${conta_garantia}
    Busca na tabela workspaceTable o id do campo ${conta_garantia}
    ${id_label}=    Set Variable   ${id_value}
    Set Global Variable  ${id_label}
    O Usuario seleciona na label id ${id_label} valor igual a ALTERAR
    capturar e salvar imagem com o nome AcaoAlterarConta
    O Usuario clica na seta da ação
    capturar e salvar imagem com o nome ContaPropriaVinculada
    Wait Until Page Contains        Conta Própria Vinculada
    Wait Until Page Contains        ${conta_propria}
    O Usuario clica no botao Voltar
    O Usuario clica no botao Voltar
o usuário entra na ação BLOQUEAR e faz o bloqueio da conta ${codigo_conta} informando a justificativa ${justificativa} e nova conta cobrança/principal ${nova_conta_cobranca_principal}
    ${hora_inicio_bloqueio_conta}=       Generate Current Date and Time
    O Usuario seleciona na label Ação valor igual a BLOQUEAR
    O Usuario clica na seta
	capturar e salvar imagem com o nome Acao
    LOG  ${codigo_conta}
    Wait Until Page Contains        ${codigo_conta}
    Busca na tabela workspaceTable o id do campo ${codigo_conta}
    ${id_label}=    Set Variable   ${id_value}
    Set Global Variable  ${id_label}
    O Usuario seleciona na label id ${id_label} valor igual a BLOQUEAR
	capturar e salvar imagem com o nome BloqueioConta
    O Usuario clica na seta da ação
    ${contains}=    Run Keyword And Return Status    Page Should Contain    Nova Conta Principal
    Unselect frame
    Select Frame                    id:main
    IF    ${contains}
        O Usuario seleciona na combo Nova Conta Principal valor igual a ${nova_conta_cobranca_principal}
    END
    O Usuario justifica no campo Motivo da Situação valor igual a ${justificativa}
    O Usuario seleciona na combo Nova Conta para Cobrança valor igual a ${nova_conta_cobranca_principal}
	capturar e salvar imagem com o nome BloqueioContaEnviar
	O Usuario clica no botao Enviar
	capturar e salvar imagem com o nome BloqueioContaConfirmar
	O Usuario clica no botao Confirmar
	${hora_fim_bloqueio_conta}=       Generate Current Date and Time
    Set test Variable       ${hora_inicio_bloqueio_conta}
    Set test Variable       ${hora_fim_bloqueio_conta}
o usuário entra na ação ENCERRAR e faz o encerramento da conta ${codigo_conta} informando a justificativa ${justificativa} e nova conta cobrança/principal ${nova_conta_cobranca_principal}
    ${hora_inicio_encerra_conta}=       Generate Current Date and Time
    O Usuario seleciona na label Ação valor igual a ENCERRAR CONTAS
    O Usuario clica na seta
	capturar e salvar imagem com o nome Acao
    LOG  ${codigo_conta}
    Wait Until Page Contains        ${codigo_conta}
    Busca na tabela workspaceTable o id do campo ${codigo_conta}
    ${id_label}=    Set Variable   ${id_value}
    Set Global Variable  ${id_label}
    O Usuario seleciona na label id ${id_label} valor igual a ENCERRAR CONTAS
	capturar e salvar imagem com o nome EncerrarConta
    O Usuario clica na seta da ação
    ${contains}=    Run Keyword And Return Status    Page Should Contain    Nova Conta Principal
    Unselect frame
    Select Frame                    id:main
    IF    ${contains}
        O Usuario seleciona na combo Nova Conta Principal valor igual a ${nova_conta_cobranca_principal}
    END
    O Usuario justifica no campo Motivo do Encerramento valor igual a ${justificativa}
    O Usuario seleciona na combo Nova Conta para Cobrança valor igual a ${nova_conta_cobranca_principal}
	capturar e salvar imagem com o nome EncerrarContaEnviar
	O Usuario clica no botao Enviar
	capturar e salvar imagem com o nome EncerrarContaConfirmar
	O Usuario clica no botao Confirmar
	${hora_fim_encerrar_conta}=       Generate Current Date and Time
    Set test Variable       ${hora_inicio_encerra_conta}
    Set test Variable       ${hora_fim_encerrar_conta}    
o usuário entra na ação TROCAR CONTA PRINCIPAL e faz a troca da conta ${codigo_conta} informando a justificativa ${justificativa}
    ${hora_inicio_trocar_conta}=       Generate Current Date and Time
    O Usuario seleciona na label Ação valor igual a TROCAR CONTA PRINCIPAL
    O Usuario clica na seta
	capturar e salvar imagem com o nome Acao
    LOG  ${codigo_conta}
    Wait Until Page Contains        ${codigo_conta}
    Busca na tabela workspaceTable o id do campo ${codigo_conta}
    ${id_label}=    Set Variable   ${id_value}
    Set Global Variable  ${id_label}
    O Usuario seleciona na label id ${id_label} valor igual a TROCAR PRINCIPAL
	capturar e salvar imagem com o nome TrocarContaPrincipal
    O Usuario clica na seta da ação
    Unselect frame
    Select Frame                    id:main 
    O Usuario justifica no campo Justificativa valor igual a ${justificativa}
	capturar e salvar imagem com o nome TrocarContaPrincipalEnviar
	O Usuario clica no botao Enviar
	capturar e salvar imagem com o nome TrocarContaPrincipalConfirmar
	O Usuario clica no botao Confirmar
	${hora_fim_trocar_conta}=       Generate Current Date and Time
    Set test Variable       ${hora_inicio_trocar_conta}
    Set test Variable       ${hora_fim_trocar_conta}        
o usuário entra na ação EMAIL PARA CORRESPONDENCIA e faz a alteração do email para ${email}
    ${hora_inicio_encerra_conta}=       Generate Current Date and Time
    O Usuario seleciona na label Ação valor igual a EMAIL PARA CORRESPONDENCIA
    O Usuario clica na seta
	capturar e salvar imagem com o nome Acao
    O Usuario informa no campo E-mail para correspondência valor igual a ${email}
    capturar e salvar imagem com o nome AlterarEmailEnviar
	O Usuario clica no botao Enviar
	capturar e salvar imagem com o nome AlterarEmailConfirmar
	O Usuario clica no botao Confirmar
que seja alterado o valor no campo Tipo de Abertura de Conta
    ${nome_campo}=                  Set Variable        Tipo de Abertura de Conta
    ${tipo_abertura_conta}=         Pega valor da combobox ${nome_campo}

    IF     "${tipo_abertura_conta}"=="Abertura"
        O Usuario seleciona na combo ${nome_campo} valor igual a Abertura 50%
    ELSE IF     "${tipo_abertura_conta}"=="Abertura 50%"
        O Usuario seleciona na combo ${nome_campo} valor igual a Abertura
    ELSE
        O Usuario seleciona na combo ${nome_campo} valor igual a Abertura
    END
O Usuario limpa campo conta do cartão   
    ${inputTextConta}=    Set Variable   //td[text()='Conta do Cartão']//following::input[1]
    Input Text      ${inputTextConta}    ${EMPTY}
    ${inputTextRadical}=  Set Variable   //td[text()='Conta do Cartão']//following::input[2]
    Input Text      ${inputTextRadical}    ${EMPTY}
    ${inputTextDigito}=   Set Variable   //td[text()='Conta do Cartão']//following::input[3]
    Input Text      ${inputTextDigito}    ${EMPTY}    
*** Variable ***
${TIPO_CONTA}=      PROPRIA (00)
${MALOTE_PRACA}=    RJ
${AREA_ATUACAO}=    BACK OFFICE
${FAMILIA_TIPO}=    PRÓPRIA
${LIQUIDANTE}=      ITAUBM
${NOME_CONTA}=      ROBOT CONTA 7625

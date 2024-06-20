*** Keywords ***
que eu realize a efetivacao no sistema NoMe informando familia de outro participante e utilizando o protocolo ${numberProtocol}
    Dado que eu defina a variavel PROTOCOLO com o valor ${numberProtocol} como uma variavel global
    E o usuario loga no NoMe como CETIP
    IF   "${tipo_ficha}" == "INR"
        E o Usuario acessa o menu de efetivação e faz a busca pelo protocolo
        E o usuario preenche os dados de contato
        Unselect Frame
        E o Usuário acessa o menu Adm. de Participantes > Cadastro Prévio > Manutenção > Reativar
    END
    E o Usuario acessa o menu de efetivação e faz a busca pelo protocolo
    E o Usuario preenche os Dados do Participante
    E O Usuario preenche os Dados da Familia de outro participante
    E o Usuario preenche os Dados para Cobrança
    E o Usuario faz a Efetivação do Participante
que eu realize a efetivacao basica do cadastro no sistema NoMe utilizando o protocolo ${numberProtocol}
    Dado que eu defina a variavel PROTOCOLO com o valor ${numberProtocol} como uma variavel global
    E o usuario loga no NoMe como CETIP
    IF   "${tipo_ficha}" == "INR"
        E o Usuario acessa o menu de efetivação e faz a busca pelo protocolo
        E o usuario preenche os dados de contato
        Unselect Frame
        E o Usuário acessa o menu Adm. de Participantes > Cadastro Prévio > Manutenção > Reativar
#        Unselect Frame
    END
    E o Usuario acessa o menu de efetivação e faz a busca pelo protocolo
    E o Usuario preenche os Dados do Participante
    E o Usuario preenche os Dados da Familia Propria
    E o Usuario preenche os Dados para Cobrança
    E o Usuario faz a Efetivação do Participante
#    Close Browser
O Usuario acessa o menu de efetivação e faz a busca pelo protocolo
    O Usuário possui autorização no NoMe para acessar Adm. de Participantes
    capturar e salvar imagem com o nome Login
    E o Usuário acessa o menu Adm. de Participantes > Cadastro Prévio > Manutenção > Efetivar
    capturar e salvar imagem com o nome CadastroPrevioEfetivar
    O Usuario informa no campo Protocolo valor igual a ${PROTOCOLO}
    capturar e salvar imagem com o nome FiltroProtocolo
    O Usuario clica no botao Pesquisar
O Usuario preenche os Dados do Participante
    O Usuario seleciona na label Ação valor igual a DADOS PARTICIPANTE
    O Usuario clica na seta
    capturar e salvar imagem com o nome DadosParticipante
    ${NUMBERFAKE}=                 Generate Random String    8    [UPPER]
    O Usuario informa no campo Participante (Nome Simplificado) valor igual a ROBOT${NUMBERFAKE}${SIGLA_NOME_SIMPL}
    ${CNPJ_PARTICIPANTE}=   Pega valor do campo Participante (CNPJ)
    Set Global Variable    ${CNPJ_PARTICIPANTE}

    IF   "${tipo_ficha}" == "EMISSOR"
        O Usuario seleciona na combo Habilitado para Operação Compromissada? valor igual a ${HABILITA_COMPROMISSADA}
        O Usuario seleciona na combo Tipo Participação valor igual a ${TIPO_PARTICIPACAO}
    END
    IF   "${tipo_ficha}" == "INR"
        O Usuario seleciona na combo Habilitado para Operação Compromissada? valor igual a ${HABILITA_COMPROMISSADA}
        O Usuario seleciona na combo Tipo Participação valor igual a ${TIPO_PARTICIPACAO}
    END

    O Usuario clica no botao Enviar
    capturar e salvar imagem com o nome DadosParticipanteEnviar
    O Usuario clica no botao Confirmar
    capturar e salvar imagem com o nome DadosParticipanteConfirmar
O Usuario preenche os Dados da Familia Propria
    O Usuario seleciona na label Ação valor igual a FAMILIA
    O Usuario clica na seta
    capturar e salvar imagem com o nome DadosFamilia
    ${NUMBERFAKE}=             FakerLibrary.RandomNumber
    ${STRING}=                 Generate Random String    9    [UPPER]
    O Usuario informa no campo Conta (Nome) valor igual a ROBOT CONTA ${NUMBERFAKE}
    O Usuario seleciona na combo Conta (Tipo) valor igual a ${TIPO_CONTA}
    O Usuario informa no campo Conta (Mnemônico) valor igual a ${STRING}
    O Usuario seleciona na combo Cartão de Autógrafos (É Titular?) valor igual a Sim
    IF   "${tipo_ficha}" == "INR"
        O Usuario informa no campo Malote (Nome da Conta) valor igual a ${MALOTE_NOME_CONTA}
        O Usuario seleciona na combo Malote (É Titular?) valor igual a Não
        O Usuario informa no campo Malote (Nome) valor igual a ${MALOTE_NOME}
        O Usuario seleciona na combo Malote (Praça) valor igual a ${MALOTE_PRACA}
        O Usuario seleciona na combo Família (Só Consulta?) valor igual a Não
        O Usuario informa no campo Família (Nome Simplificado do Titular) valor igual a ${LIQUIDANTE_FAMILIA_NOME_SIMPLIFICADO}
        O Usuario informa no campo Família (Nome) valor igual a ${LIQUIDANTE_FAMILIA_NOME}
        O Usuario informa no campo Liquidante (Nome Simplificado) valor igual a ${LIQUIDANTE}
    ELSE
        O Usuario seleciona na combo Malote (É Titular?) valor igual a Sim
        O Usuario seleciona na combo Malote (Praça) valor igual a ${MALOTE_PRACA}
        O Usuario seleciona na combo Família (É Titular?) valor igual a Sim
        O Usuario seleciona na combo Família (Área de Atuação) valor igual a ${AREA_ATUACAO}
        O Usuario seleciona na combo Família (Tipo) valor igual a ${FAMILIA_TIPO}
        O Usuario informa no campo Família (Nome) valor igual a ROBOTFAM${STRING}
        O Usuario informa no campo Liquidante (Nome Simplificado) valor igual a ${LIQUIDANTE}
    END
    O Usuario clica no botao Enviar
    capturar e salvar imagem com o nome DadosFamiliaEnviar
    O Usuario clica no botao Confirmar
    capturar e salvar imagem com o nome DadosFamiliaConfirmar
O Usuario preenche os Dados da Familia de outro participante
    O Usuario seleciona na label Ação valor igual a FAMILIA
    O Usuario clica na seta
    capturar e salvar imagem com o nome DadosFamilia
    ${NUMBERFAKE}=             FakerLibrary.RandomNumber
    ${STRING}=                 Generate Random String    9    [UPPER]
    O Usuario informa no campo Conta (Nome) valor igual a ROBOT CONTA ${NUMBERFAKE}
    O Usuario seleciona na combo Conta (Tipo) valor igual a ${TIPO_CONTA}
    O Usuario informa no campo Conta (Mnemônico) valor igual a ${STRING}
    O Usuario seleciona na combo Cartão de Autógrafos (É Titular?) valor igual a Sim
    IF   "${tipo_ficha}" == "INR"
        O Usuario informa no campo Malote (Nome da Conta) valor igual a ${MALOTE_NOME_CONTA}
        O Usuario seleciona na combo Malote (É Titular?) valor igual a Não
        O Usuario informa no campo Malote (Nome) valor igual a ${MALOTE_NOME}
        O Usuario seleciona na combo Malote (Praça) valor igual a ${MALOTE_PRACA}
        O Usuario seleciona na combo Família (Só Consulta?) valor igual a Não
        O Usuario informa no campo Família (Nome Simplificado do Titular) valor igual a ${LIQUIDANTE_FAMILIA_NOME_SIMPLIFICADO}
        O Usuario informa no campo Família (Nome) valor igual a ${LIQUIDANTE_FAMILIA_NOME}
        O Usuario informa no campo Liquidante (Nome Simplificado) valor igual a ${LIQUIDANTE}
    ELSE
        O Usuario informa no campo Malote (Nome da Conta) valor igual a ${MALOTE_NOME_CONTA}
        O Usuario seleciona na combo Malote (É Titular?) valor igual a Não
        O Usuario informa no campo Malote (Nome) valor igual a ${MALOTE_NOME}
        O Usuario seleciona na combo Malote (Praça) valor igual a ${MALOTE_PRACA}
        O Usuario seleciona na combo Família (É Titular?) valor igual a Não
        O Usuario seleciona na combo Família (Só Consulta?) valor igual a Não
        O Usuario informa no campo Família (Nome Simplificado do Titular) valor igual a ${LIQUIDANTE_FAMILIA_NOME_SIMPLIFICADO}
        O Usuario informa no campo Família (Nome) valor igual a ${LIQUIDANTE_FAMILIA_NOME}
        O Usuario informa no campo Liquidante (Nome Simplificado) valor igual a ${LIQUIDANTE}
    END
    O Usuario clica no botao Enviar
    capturar e salvar imagem com o nome DadosFamiliaEnviar
    O Usuario clica no botao Confirmar
    capturar e salvar imagem com o nome DadosFamiliaConfirmar
O Usuario preenche os Dados para Cobrança
    O Usuario seleciona na label Ação valor igual a DADOS PARA COBRANCA
    O Usuario clica na seta
    capturar e salvar imagem com o nome DadosCobranca
    ${NUMBERFAKE}=                 FakerLibrary.RandomNumber
    O Usuario seleciona na combo Tipo de Abertura de Conta valor igual a Abertura
    O Usuario seleciona na combo Faixa de Cobrança valor igual a FAIXA 3
    O Usuario clica no botao Enviar
    capturar e salvar imagem com o nome DadosCobrancaEnviar
    O Usuario clica no botao Confirmar
    capturar e salvar imagem com o nome DadosCobrancaConfirmar
O Usuario faz a Efetivação do Participante
    O Usuario seleciona na label Ação valor igual a EFETIVAR PARTICIPANTE
    O Usuario clica na seta
    capturar e salvar imagem com o nome DadosEfetivacaoEnviar
    O Usuario clica no botao Confirmar
    capturar e salvar imagem com o nome DadosEfetivacaoConfirmar
o usuario preenche os dados de contato
    O Usuario seleciona na label Ação valor igual a CONTATO
    O Usuario clica na seta
    capturar e salvar imagem com o nome ListaDeContatos
    O Usuario seleciona na label Ação valor igual a ALTERAR
    O Usuario clica na seta
    capturar e salvar imagem com o nome DadosContato
    O Usuario informa no campo DDI valor igual a 55
    O Usuario clica no botao Enviar
    capturar e salvar imagem com o nome DadosContato_Enviar
    O Usuario clica no botao Confirmar
    capturar e salvar imagem com o nome DadosContato_Confirmar
#O Usuario clica na seta
#    Click Element   //input[@name="command"]




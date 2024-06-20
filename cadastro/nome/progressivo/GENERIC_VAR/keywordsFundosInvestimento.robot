*** Keywords ***
o usuário define o TAG_NUMBER com a sigla ${sigla}
    que eu defina a variavel TAG_NUMBER com o valor ${sigla} como uma variavel global

o usuário realiza login no sistema NoMe como custodiante RIOBM
    O usuario possui acesso ao NoMe como RIOBM
    capturar e salvar imagem com o nome loginRIOBM

o usuário logado realiza a aprovação em nome do Aprovador ${papel_aprovador} do Fundo (CNPJ) ${cnpj_fundo} protocolo ${numero_protocolo} para o tipo solicitação ${tipo_solicitacao}
    O Usuário possui autorização no NoMe para acessar Adm. de Participantes
    E o Usuário acessa o menu Adm. de Participantes > Cadastro de Fundos > Abertura de Conta
    capturar e salvar imagem com o nome acessaMenuDiferente
    O Usuário possui autorização no NoMe para acessar Adm. de Participantes
    capturar e salvar imagem com o nome acessaMenuAdmParticipantes
    E o Usuário acessa o menu Adm. de Participantes > Cadastro de Fundos > Aprovação
    O Usuario informa no campo Fundo (CNPJ) valor igual a ${cnpj_fundo}
    O Usuario seleciona na combo Solicitação (Tipo) valor igual a ${tipo_solicitacao}
    capturar e salvar imagem com o nome aprovacaoSolicitacao${tipo_solicitacao}
    O Usuario clica no botao Pesquisar

    ${new_list_valores}=        Create List
    ${list_valores}=        Incluir o valor ${cnpj_fundo} na lista ${new_list_valores}
    ${list_valores}=        Incluir o valor ${papel_aprovador} na lista ${list_valores}
    ${list_valores}=        Incluir o valor ${numero_protocolo} na lista ${list_valores}
    ${list_valores}=        Incluir o valor ${tipo_solicitacao} na lista ${list_valores}

    Busca na tabela workspaceTable o index da linha que possui os campos ${list_valores}
    O Usuario seleciona na label id ${id_label} valor igual a APROVAR
	capturar e salvar imagem com o nome aprovaçãoPapel${papel_aprovador}
    O Usuario clica na seta da ação
    IF      "${papel_aprovador}"=="B3"
        IF      "${tipo_solicitacao}"=="ABERTURA"
            O Usuario seleciona na combo Abertura 50%? valor igual a Não
            O Usuario seleciona na combo Faixa de Cobrança valor igual a FAIXA 4
            O Usuario justifica no campo Justificativa valor igual a Teste SQUAD CADASTRO utilizando ROBOT FRAMEWORK
            capturar e salvar imagem com o nome aprovaçãoPapel${papel_aprovador}Enviar
            O Usuario clica no botao Enviar
        ELSE IF      "${tipo_solicitacao}"=="ENCERRAMENTO"
            O Usuario justifica no campo Justificativa valor igual a Teste SQUAD CADASTRO encerrando fundo utilizando ROBOT FRAMEWORK
            capturar e salvar imagem com o nome aprovaçãoPapel${papel_aprovador}Enviar
            O Usuario clica no botao Enviar
        ELSE IF      "${tipo_solicitacao}"=="MANUTENCAO"
            O Usuario justifica no campo Justificativa valor igual a Teste SQUAD CADASTRO MANUTENCAO fundo utilizando ROBOT FRAMEWORK
            capturar e salvar imagem com o nome aprovaçãoPapel${papel_aprovador}Enviar
            O Usuario clica no botao Enviar
        END
    END
    capturar e salvar imagem com o nome aprovaçãoPapel${papel_aprovador}Confirmar
    O Usuario clica no botao Confirmar
    capturar e salvar imagem com o nome aprovaçãoPapel${papel_aprovador}Mensagem
    IF      "${papel_aprovador}"=="B3"
        IF      "${tipo_solicitacao}"=="ABERTURA"
            Então deve retornar a mensagem  A Abertura do Fundo ${razao_social_fundo} foi realizada com sucesso.
            Então deve retornar a mensagem  CNPJ: ${cnpj_fundo}
        ELSE
            Então deve retornar a mensagem  Solicitação aprovada com sucesso.
        END
    ELSE
        Então deve retornar a mensagem  Solicitação aprovada com sucesso.
    END

o usuário logado inicia o fluxo informando o protocolo ${numero_protocolo} e tipo solicitação ${tipo_solicitacao}
    O Usuário possui autorização no NoMe para acessar Transf.de Arquivo
    capturar e salvar imagem com o nome acessaMenuTransfArquivo
    E o Usuário acessa o menu Transf.de Arquivo > Envio de Documentos Digitalizados > Upload
    O Usuario seleciona na combo Tipo Solicitação valor igual a CADASTRO DE FUNDO
    capturar e salvar imagem com o nome iniciarFluxoFundo
    O Usuario clica no botao Confirmar
    O Usuario informa no campo Cadastro Prévio (Protocolo) valor igual a ${numero_protocolo}
    O Usuario seleciona na combo Tipo Solicitação valor igual a ${tipo_solicitacao}
    capturar e salvar imagem com o nome pesquisarSolicitacao${tipo_solicitacao}
    O Usuario clica no botao Pesquisar
    O Usuario seleciona na label Ação valor igual a INICIAR FLUXO
    capturar e salvar imagem com o nome acaoIniciarFluxo
    O Usuario clica na seta
    ${protocolo_iniciado_fluxo}=    Extrair da Tela o Número do Protocolo Iniciado o Fluxo
    Set Test Variable               ${protocolo_iniciado_fluxo}
    capturar e salvar imagem com o nome iniciarFluxoConfirmar
    O Usuario clica no botao Confirmar
    Então deve retornar a mensagem  Fluxo Iniciado com Sucesso.
    Close Browser

o usuário logado inicia o fluxo informando o cnpj ${cnpj_fundo} e tipo solicitação ${tipo_solicitacao}
    O Usuário possui autorização no NoMe para acessar Transf.de Arquivo
    capturar e salvar imagem com o nome acessaMenuTransfArquivo
    E o Usuário acessa o menu Transf.de Arquivo > Envio de Documentos Digitalizados > Upload

    O Usuario seleciona na combo Tipo Solicitação valor igual a CADASTRO DE FUNDO
    capturar e salvar imagem com o nome iniciarFluxoFundo
    O Usuario clica no botao Confirmar
    O Usuario informa no campo Participante (CNPJ) valor igual a ${cnpj_fundo}
    O Usuario seleciona na combo Tipo Solicitação valor igual a ${tipo_solicitacao}
    capturar e salvar imagem com o nome pesquisarSolicitacao${tipo_solicitacao}
    O Usuario clica no botao Pesquisar

    ${new_list_valores}=        Create List
    ${list_valores}=            Incluir o valor ${cnpj_fundo} na lista ${new_list_valores}
    ${list_valores}=            Incluir o valor ${tipo_solicitacao} na lista ${list_valores}
    ${list_valores}=            Incluir o valor Não na lista ${list_valores}

    Busca na tabela workspaceTable o index da linha que possui os campos ${list_valores}
    O Usuario seleciona na label id ${id_label} valor igual a INICIAR FLUXO
    capturar e salvar imagem com o nome acaoIniciarFluxo
    O Usuario clica na seta
    ${protocolo_iniciado_fluxo}=    Extrair da Tela o Número do Protocolo Iniciado o Fluxo
    Set Test Variable               ${protocolo_iniciado_fluxo}
    capturar e salvar imagem com o nome iniciarFluxoConfirmar
    O Usuario clica no botao Confirmar
    Então deve retornar a mensagem  Fluxo Iniciado com Sucesso.
    Close Browser

Extrair da Tela o Número do Protocolo Iniciado o Fluxo
    ${message}=                 Get Text    id:formArea  # Use o seletor apropriado para o seu caso
    ${protocol_number}=         Get Regexp Matches    ${message}    N0......            flags=IGNORECASE
    [Return]    ${protocol_number}[0]

O Usuario clica na seta da ação
    Click Element   //select[@id='e${id_label}']//following::input[@name="command"]
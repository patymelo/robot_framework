*** Keywords ***
o usuário realiza o encerramento do fundo ${cnpj_fundo} para o custodiante RIOBM
    o usuário realiza login no sistema NoMe como custodiante RIOBM
    O Usuário possui autorização no NoMe para acessar Adm. de Participantes
    capturar e salvar imagem com o nome acessaMenuAdmParticipantes
    E o Usuário acessa o menu Adm. de Participantes > Cadastro de Fundos > Encerramento de Participante
    O Usuario informa no campo Fundo (CNPJ) valor igual a ${cnpj_fundo}
    capturar e salvar imagem com o nome encerramentoDeFundo
    O Usuario clica no botao Pesquisar

    ${new_list_valores}=        Create List
    ${list_valores}=            Incluir o valor ${cnpj_fundo} na lista ${new_list_valores}

    Busca na tabela workspaceTable o index da linha que possui os campos ${list_valores}
    O Usuario seleciona na label id ${id_label} valor igual a CONFIRMAR
	capturar e salvar imagem com o nome confirmarEncerramento
    O Usuario clica na seta da ação
    capturar e salvar imagem com o nome encerramentoConfirmar
    O Usuario clica no botao Confirmar
    Então deve retornar a mensagem  Solicitação de encerramento enviada com sucesso.

o usuário interno B3 realiza as aprovações necessárias para encerramento do fundo ${cnpj_fundo} com protocolo ${protocolo}
    O usuario loga no NoMe como CETIP
    o usuário logado realiza a aprovação em nome do Aprovador ADMINISTRADOR do Fundo (CNPJ) ${cnpj_fundo} protocolo ${protocolo} para o tipo solicitação ENCERRAMENTO
    o usuário logado realiza a aprovação em nome do Aprovador B3 do Fundo (CNPJ) ${cnpj_fundo} protocolo ${protocolo} para o tipo solicitação ENCERRAMENTO
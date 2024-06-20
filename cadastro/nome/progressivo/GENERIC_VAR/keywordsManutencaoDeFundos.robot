*** Keywords ***
o usuário logado consulta o fundo informando o cnpj ${cnpj_fundo}
    o usuário logado acessa o menu de Manutenção de Dados de Conta e faz a busca pelo CNPJ ${cnpj_fundo}
    capturar e salvar imagem com o nome situacaoFundo

o usuário logado acessa o menu de Manutenção de Dados de Conta e faz a busca pelo CNPJ ${cnpj_fundo_x}
    O Usuário possui autorização no NoMe para acessar Adm. de Participantes
    capturar e salvar imagem com o nome acessaMenuAdmParticipantes
    E o Usuário acessa o menu Adm. de Participantes > Cadastro de Fundos > Manutenção de Dados de Conta
    O Usuario informa no campo Fundo (CNPJ) valor igual a ${cnpj_fundo_x}
    capturar e salvar imagem com o nome manutencaoDadosContaDeFundo
    O Usuario clica no botao Pesquisar

o usuário logado acessa a Ação ${acao}
    O Usuario seleciona na label Ação valor igual a ${acao}
    capturar e salvar imagem com o nome acaoSelecionada
    O Usuario clica na seta

o usuário logado preenche o campo Fundo (Razão Social)
    ${codigo_unico}=                        generate unique code based on current date and time
    ${razao_social_fundo_altr}=             Set Variable       ROBOT FUNDO ALTERACAO ${codigo_unico}
    O Usuario informa no campo Fundo (Razão Social) valor igual a ${razao_social_fundo_altr}
    capturar e salvar imagem com o nome alteracaoRazaoSocial

o usuário logado preenche os dados do Responsável pelo preenchimento
    O Usuario informa no campo Responsável pelo preenchimento valor igual a robot preenchendo dados de fundo
    O Usuario informa no campo E-mail valor igual a robot-CADBLC@teste-fundo.com
    O Usuario informa no campo Telefone para contato valor igual a 011998877558

o usuário logado finaliza o preenchimento dos Dados do Fundo de Investimento
    O Usuario clica no botao Confirmar

o usuário logado finaliza o preenchimento dos Dados de Endereços
    O Usuario clica no botao Confirmar

o usuário logado finaliza o preenchimento dos Dados do Contato Principal(Diretoria)
    O Usuario clica no botao Confirmar

o usuário logado finaliza o preenchimento dos Dados de Escrituradores
    O Usuario clica no botao Confirmar

o usuário logado finaliza o preenchimento dos Dados do Serviço de Digitação e/ou Consulta
    O Usuario clica no botao Confirmar

o usuário logado finaliza o preenchimento dos Dados das contas Back-Office e Front-Office
    O Usuario clica no botao Confirmar

o usuário logado valida a mensagem de sucesso na tela Manutenção de Dados de Conta
    ${numberProtocol}=      Extrair da Tela o Número do Protocolo para Manutenção do Fundo
    Set Test Variable       ${numberProtocol}
    capturar e salvar imagem com o nome manutencaoDadosFundo

o usuário interno B3 realiza as aprovações necessárias para manutencao do fundo ${cnpj_fundo} com protocolo ${protocolo}
    O usuario loga no NoMe como CETIP
    o usuário logado realiza a aprovação em nome do Aprovador ADMINISTRADOR do Fundo (CNPJ) ${cnpj_fundo} protocolo ${numberProtocol} para o tipo solicitação MANUTENCAO
    o usuário logado realiza a aprovação em nome do Aprovador B3 do Fundo (CNPJ) ${cnpj_fundo} protocolo ${protocolo} para o tipo solicitação MANUTENCAO

Extrair da Tela o Número do Protocolo para Manutenção do Fundo
    ${message}=                 Get Text    id:formArea  # Use o seletor apropriado para o seu caso
    ${protocol_number}=         Get Regexp Matches    ${message}    N0......            flags=IGNORECASE
    [Return]    ${protocol_number}[0]
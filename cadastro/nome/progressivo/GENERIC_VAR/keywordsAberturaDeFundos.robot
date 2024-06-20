*** Keywords ***
o usuário realiza a inclusão de um novo fundo para o custodiante RIOBM utilizando o BANCO COSIPB UM como Gestor/Liquidante/Adm. Legal
    o usuário realiza login no sistema NoMe como custodiante RIOBM
    o usuário entra no menu para abertura de uma nova conta de fundo
    o usuário preenche os Dados do Fundo de Investimento utilizando custodiado RIOBM
    o usuário preenche os Dados do Fundo de Investimento utilizando Adm. Legal BANCO COSIPB UM
    o usuário preenche os Dados do Fundo de Investimento utilizando o Liquidante BANCO COSIPB UM
    o usuário preenche os Dados do Fundo de Investimento utilizando o Gestor BANCO COSIPB UM
    o usuário preenche os Dados do Fundo de Investimento para renda fixa e fundo aberto
    o usuário preenche os Dados de Endereços
    o usuário preenche os Dados do Contato Principal(Diretoria)
    o usuário preenche os Dados de Escrituradores
    o usuário preenche os Dados do Serviço de Digitação e/ou Consulta
    o usuário preenche as contas Área de Atuação Back-Office(Lançamento/Consulta)
    o usuário preenche Cadastro de Ativo de Fundo Aberto
    o usuário validar a mensagem de sucesso na tela para Abertura de Fundo

o usuário interno B3 realiza as aprovações necessárias para abertura de um novo fundo ${cnpj_novo} com protocolo ${protocolo}
    O usuario loga no NoMe como CETIP
    o usuário logado realiza a aprovação em nome do Aprovador ADMINISTRADOR do Fundo (CNPJ) ${cnpj_novo} protocolo ${protocolo} para o tipo solicitação ABERTURA
    o usuário logado realiza a aprovação em nome do Aprovador ESCRITURADOR 1 do Fundo (CNPJ) ${cnpj_novo} protocolo ${protocolo} para o tipo solicitação ABERTURA
    o usuário logado realiza a aprovação em nome do Aprovador BANCO LIQUIDANTE 00 do Fundo (CNPJ) ${cnpj_novo} protocolo ${protocolo} para o tipo solicitação ABERTURA
    o usuário logado realiza a aprovação em nome do Aprovador BANCO LIQUIDANTE 44 do Fundo (CNPJ) ${cnpj_novo} protocolo ${protocolo} para o tipo solicitação ABERTURA
    o usuário logado realiza a aprovação em nome do Aprovador DIGITADOR 00 do Fundo (CNPJ) ${cnpj_novo} protocolo ${protocolo} para o tipo solicitação ABERTURA
    o usuário logado realiza a aprovação em nome do Aprovador DIGITADOR 44 do Fundo (CNPJ) ${cnpj_novo} protocolo ${protocolo} para o tipo solicitação ABERTURA
    o usuário logado realiza a aprovação em nome do Aprovador B3 do Fundo (CNPJ) ${cnpj_novo} protocolo ${protocolo} para o tipo solicitação ABERTURA


o usuário entra no menu para abertura de uma nova conta de fundo
    O Usuário possui autorização no NoMe para acessar Adm. de Participantes
    capturar e salvar imagem com o nome acessaMenuAdmParticipantes
    E o Usuário acessa o menu Adm. de Participantes > Cadastro de Fundos > Abertura de Conta
    O Usuario seleciona na combo Ação valor igual a INCLUIR
    capturar e salvar imagem com o nome aberturaContaDeFundo
    O Usuario clica no botao Pesquisar
    capturar e salvar imagem com o nome preencherDadosFundoInvestimento

o usuário preenche os Dados do Fundo de Investimento utilizando custodiado RIOBM
    ${conta_custodiante}=                               Set Variable        05000.00-5*?*?RIO
    O Usuario seleciona na combo Conta Responsável pelo Custodiado valor igual a ${conta_custodiante}

o usuário preenche os Dados do Fundo de Investimento utilizando Adm. Legal BANCO COSIPB UM
    O Usuario informa no campo Adm. Legal (Razão Social) valor igual a BANCO COSIPB UM
    O Usuario informa no campo Adm. Legal (CNPJ) valor igual a 31.151.183/0001-70

o usuário preenche os Dados do Fundo de Investimento utilizando o Liquidante BANCO COSIPB UM
    O Usuario informa no campo Banco Liquidante Conta Própria (00) (CNPJ) valor igual a 31.151.183/0001-70
    O Usuario informa no campo Banco Liquidante Conta Emissora (44) (CNPJ) valor igual a 31.151.183/0001-70

o usuário preenche os Dados do Fundo de Investimento utilizando o Gestor BANCO COSIPB UM
    O Usuario informa no campo Gestor (Nome/Razão Social) valor igual a BANCO COSIPB UM
    O Usuario informa no campo Gestor (CPF/CNPJ) valor igual a 31.151.183/0001-70

o usuário preenche os Dados do Fundo de Investimento para renda fixa e fundo aberto
    ${complemento_razao_social_fundo}=                  Generate Random String    87    [UPPER]
    ${razao_social_fundo}=                              Set Variable       ROBOT FUNDO ${complemento_razao_social_fundo}
    Set Test Variable                                   ${razao_social_fundo}
    O Usuario informa no campo Fundo (Razão Social) valor igual a ${razao_social_fundo}
    ${cnpj_novo_fundo}=                                 FakerLibrary.cnpj
    Set Test Variable                                   ${cnpj_novo_fundo}
    O Usuario informa no campo Fundo (CNPJ) valor igual a ${cnpj_novo_fundo}
    O Usuario seleciona na combo Natureza Econômica valor igual a FUNDO DE INVESTIMENTO EM RENDA FIXA DE LONGO PRAZO
    O Usuario seleciona na combo Natureza Jurídica valor igual a FUNDO ABERTO
    O Usuario seleciona na combo Classe Fundo valor igual a Fundo de Renda Fixa
    O Usuario seleciona na combo Subclasse Fundo valor igual a Longo prazo
    O Usuario seleciona na combo Controle Acionário valor igual a PUBLICO
    O Usuario seleciona na combo Origem de Capital valor igual a NACIONAL
    ${nome}=                                            FakerLibrary.name
    O Usuario informa no campo Responsável pelo preenchimento valor igual a ${nome}
    ${emailFaker}=                                      FakerLibrary.email
    O Usuario informa no campo E-mail valor igual a ${emailFaker}
    O Usuario informa no campo Telefone para contato valor igual a 01199887766
    capturar e salvar imagem com o nome DadosFundoConfirmar
    O Usuario clica no botao Confirmar

o usuário preenche os Dados de Endereços
    capturar e salvar imagem com o nome DadosEnderecoConfirmar
    O Usuario clica no botao Confirmar

o usuário preenche os Dados do Contato Principal(Diretoria)
    capturar e salvar imagem com o nome DadosContatoPrincipalConfirmar
    O Usuario clica no botao Confirmar

o usuário preenche os Dados de Escrituradores
    capturar e salvar imagem com o nome DadosEscrituradoresConfirmar
    O Usuario informa no campo Escriturador Inicial (Razão Social) valor igual a ESCRITURADOR DOIS
    O Usuario informa no campo Escriturador Inicial (CNPJ) valor igual a 64.480.276/0001-05
    capturar e salvar imagem com o nome DadosEscrituradoresConfirmar
    O Usuario clica no botao Confirmar

o usuário preenche os Dados do Serviço de Digitação e/ou Consulta
    capturar e salvar imagem com o nome DadosServicoDigitacaoConfirmar
    O Usuario informa no campo Quantidade Back Office(Consulta) 00 valor igual a 0
    O Usuario informa no campo Quantidade Back Office(Consulta) 44 valor igual a 0
    O Usuario informa no campo Quantidade Front Office valor igual a 0
    capturar e salvar imagem com o nome DadosServicoDigitacaoConfirmar
    O Usuario clica no botao Confirmar

o usuário preenche as contas Área de Atuação Back-Office(Lançamento/Consulta)
    O Usuario informa no campo Digitador Conta Emissora(44) a conta 01417.44-1
    capturar e salvar imagem com o nome DadosContasServicoDigitacaoEnviar
    O Usuario clica no botao Enviar
    capturar e salvar imagem com o nome DadosContasServicoDigitacaoConfirmar
    O Usuario clica no botao Confirmar

o usuário preenche Cadastro de Ativo de Fundo Aberto
    O Usuario seleciona na combo Deseja utilizar os dados do cadastro para cadastramento do ativo? valor igual a Não
    capturar e salvar imagem com o nome CadastroAtivosEnviar
    O Usuario clica no botao Enviar
    capturar e salvar imagem com o nome CadastroAtivosConfirmar
    O Usuario clica no botao Confirmar
    capturar e salvar imagem com o nome AutorgaProsseguir
    O Usuario clica no botao Prosseguir
    capturar e salvar imagem com o nome AutorgaConfirmar
    O Usuario clica no botao Confirmar

o usuário validar a mensagem de sucesso na tela para Abertura de Fundo
    ${numberProtocol}=      Extrair da Tela o Número do Protocolo para Abertura de Fundo
    Set Test Variable       ${numberProtocol}
    capturar e salvar imagem com o nome CadastroFundoFinalizado
    Então deve retornar a mensagem  Solicitação do Fundo${SPACE}${SPACE}sob o protocolo ${numberProtocol} outorgada com sucesso.

Extrair da Tela o Número do Protocolo para Abertura de Fundo
    ${message}=                 Get Text    id:formArea  # Use o seletor apropriado para o seu caso
    ${protocol_number}=         Get Regexp Matches    ${message}    N0......            flags=IGNORECASE
    [Return]    ${protocol_number}[0]

*** Keywords ***
Setar variaveis comitente
    IF   "${DONO}" == "SIM"
        ${SEXO}=              Set Variable    Feminino
        ${ESTADO_CIVIL}=      Set Variable    CASADO(A) COMUNHAO UNIVERSAL DE BENS
        ${UF}=                Set Variable    RJ
        ${MUNICIPIO}=         Set Variable    RIO DE JANEIRO
        ${MUNICIPIO_COMBO}=   Set Variable    RIO DE JANEIRO
        ${ATIVIDADE}=         Set Variable    JORNALISTA
        ${ATIVIDADE_COMBO}=   Set Variable    JORNALISTA E REPÓRTER
        ${TIPO_DOCUMENTO}=    Set Variable    CPF
        ${ORGAO_EXPEDIDOR}=   Set Variable    SSP
        ${IS_PPE}=            Set Variable    Não
        ${MOTHER}=            Set Variable    NOME MAE ITAU
    ELSE IF   "${DONO}" == "NAO"
        ${SEXO}=              Set Variable    Masculino
        ${ESTADO_CIVIL}=      Set Variable    SOLTEIRO (A)
        ${UF}=                Set Variable    SP
        ${MUNICIPIO}=         Set Variable    SÃO PAULO
        ${MUNICIPIO_COMBO}=   Set Variable    SÃO PAULO
        ${ATIVIDADE}=         Set Variable    BIÓLOGO
        ${ATIVIDADE_COMBO}=   Set Variable    BIÓLOGO, BIOMÉDICO E AFINS
        ${TIPO_DOCUMENTO}=    Set Variable    CARTEIRA IDENTIDADE
        ${ORGAO_EXPEDIDOR}=   Set Variable    SRJ
        ${IS_PPE}=            Set Variable    Sim
        ${MOTHER}=            Set Variable    NOME MAE RIOBM
    ELSE IF   "${DONO}" == "B3"
        ${SEXO}=              Set Variable    Não binário
        ${ESTADO_CIVIL}=      Set Variable    DIVORCIADO(A)
        ${UF}=                Set Variable    DF
        ${MUNICIPIO}=         Set Variable    BRASÍLIA
        ${MUNICIPIO_COMBO}=   Set Variable    BRASÍLIA
        ${ATIVIDADE}=         Set Variable    CANTOR E COMPOSITOR
        ${ATIVIDADE_COMBO}=   Set Variable    CANTOR E COMPOSITOR
        ${TIPO_DOCUMENTO}=    Set Variable    CARTEIRA FUNCIONAL
        ${ORGAO_EXPEDIDOR}=   Set Variable    SDF
        ${IS_PPE}=            Set Variable    Não informado
        ${MOTHER}=            Set Variable    NOME MAE B3
    ELSE
        ${SEXO}=              Set Variable    Prefiro não informar
        ${ESTADO_CIVIL}=      Set Variable    DESQUITADO (A)
        ${UF}=                Set Variable    PR
        ${MUNICIPIO}=         Set Variable    CURITIBA
        ${MUNICIPIO_COMBO}=   Set Variable    CURITIBA
        ${ATIVIDADE}=         Set Variable    TITULAR DE CARTÓRIO
        ${ATIVIDADE_COMBO}=   Set Variable    TITULAR DE CARTÓRIO
        ${TIPO_DOCUMENTO}=    Set Variable    CARTEIRA NACIONAL DE HABILITAÇÃO (CNH)
        ${ORGAO_EXPEDIDOR}=   Set Variable    SPR
        ${IS_PPE}=            Set Variable    Não
        ${MOTHER}=            Set Variable    NOME MAE ALTERACAO
    END
    Set Global Variable    ${SEXO}
    Set Global Variable    ${ESTADO_CIVIL}
    Set Global Variable    ${UF}
    Set Global Variable    ${MUNICIPIO}
    Set Global Variable    ${MUNICIPIO_COMBO}
    Set Global Variable    ${ATIVIDADE}
    Set Global Variable    ${ATIVIDADE_COMBO}
    Set Global Variable    ${TIPO_DOCUMENTO}
    Set Global Variable    ${ORGAO_EXPEDIDOR}
    Set Global Variable    ${IS_PPE}
    Set Global Variable    ${MOTHER}
O usuario preenche - Dados Básicos do Comitente conta ${acao}
    Set Global Variable  ${acao}
    Setar variaveis comitente
    O Usuário possui autorização no NoMe para acessar Identificação de Comitentes
    Capture Page Screenshot     img/${TAG_NUMBER}_1Login.png
    E o Usuário acessa o menu Identificação de Comitentes > Cadastro > Cadastro de Comitente
    Capture Page Screenshot     img/${TAG_NUMBER}_2CadastroComitente.png
    IF   "${PARTICIPANTE}" == "ITAUBM"
          ${conta}=     Set Variable   73410
          ${radical}=   Set Variable   00
          ${digito}=    Set Variable   5
    ELSE IF   "${PARTICIPANTE}" == "RIOBM"
         ${conta}=     Set Variable   05000
         ${radical}=   Set Variable   00
         ${digito}=    Set Variable   5
    ELSE
        ${conta}=     Set Variable   10020
        ${radical}=   Set Variable   00
        ${digito}=    Set Variable   1
    END
    O Usuario informa no campo Titular da Conta Cliente (Conta Própria) a conta ${conta}.${radical}-${digito}
    O Usuario seleciona na combo Tipo Pessoa valor igual a Pessoa Física
    O Usuario informa no campo CPF/CNPJ do Comitente valor igual a ${CPF_COMITENTE}
    O Usuario seleciona na combo Ação valor igual a ${acao}
    Capture Page Screenshot    img/${TAG_NUMBER}_3FiltroComitente.png
    O Usuario clica no botao Enviar
O usuario preenche - Dados Básicos PF Residente
    ${NOMECOMITENTE}=   FakerLibrary.name
    ${NOMECOMITENTE}=   Replace String     ${NOMECOMITENTE}     .   	${EMPTY}

    ${CPF_COMITENTE}=      SeleniumLibrary.Get Element Attribute    //td[text()='CPF/CNPJ do Comitente']//following::input[1]  value
    Set Global Variable    ${CPF_COMITENTE}
    LOG  "CPF_COMITENTE is ${CPF_COMITENTE}"  console=True

    O Usuario seleciona na combo Natureza Fiscal valor igual a Isento
    O Usuario seleciona na combo Tipo de Investidor valor igual a Investidor Residente
    IF   "${DONO}" == "SIM" or "${DONO}" == "B3"
        O Usuario informa no campo Comitente(Nome/Razão Social) valor igual a ${NOMECOMITENTE}
    END
    O Usuario seleciona na combo País de Residência valor igual a BRASIL
    Capture Page Screenshot    img/${TAG_NUMBER}_4DadosBasicosComitente.png
    O Usuario clica no botao Enviar
O usuario preenche - Dados Básicos PF Residente Nome Comitente B3
    ${NOMECOMITENTE}=   FakerLibrary.name
    ${NOMECOMITENTE}=   Replace String     ${NOMECOMITENTE}     .   	${EMPTY}

    ${CPF_COMITENTE}=      SeleniumLibrary.Get Element Attribute    //td[text()='CPF/CNPJ do Comitente']//following::input[1]  value
    Set Global Variable    ${CPF_COMITENTE}
    LOG  "CPF_COMITENTE is ${CPF_COMITENTE}"  console=True

    O Usuario seleciona na combo Natureza Fiscal valor igual a Isento
    O Usuario seleciona na combo Tipo de Investidor valor igual a Investidor Residente
    O Usuario seleciona na combo País de Residência valor igual a BRASIL
    O Usuario clica no botao Enviar
    Então deve retornar a mensagem  Nome Comitente é inválido.O campo deve conter apenas letras
    Capture Page Screenshot    img/${TAG_NUMBER}_6CampoNomeComitenteInvalido.png
    Select Frame                    id:main
    O Usuario informa no campo Comitente(Nome/Razão Social) valor igual a ${NOMECOMITENTE}
    O Usuario clica no botao Enviar
O usuario preenche - Dados Básicos PF Residente Nome Comitente Invalido
    ${CPF_COMITENTE}=      SeleniumLibrary.Get Element Attribute    //td[text()='CPF/CNPJ do Comitente']//following::input[1]  value
    Set Global Variable    ${CPF_COMITENTE}
    LOG  "CPF_COMITENTE is ${CPF_COMITENTE}"  console=True

    O Usuario seleciona na combo Natureza Fiscal valor igual a Isento
    O Usuario seleciona na combo Tipo de Investidor valor igual a Investidor Residente
    IF   "${DONO}" == "SIM" or "${DONO}" == "B3"
        O Usuario informa no campo Comitente(Nome/Razão Social) valor igual a ${EMPTY}
        O Usuario seleciona na combo País de Residência valor igual a BRASIL
        Capture Page Screenshot    img/${TAG_NUMBER}_4DadosBasicosComitente.png
        O Usuario clica no botao Enviar
        Então deve retornar a mensagem  Preenchimento obrigatório
        Capture Page Screenshot    img/${TAG_NUMBER}_5CampoNomeComitenteObrigatorio.png
        Select Frame                    id:main

        O Usuario informa no campo Comitente(Nome/Razão Social) valor igual a 23456
        O Usuario clica no botao Enviar
        Então deve retornar a mensagem  Nome Comitente é inválido.O campo deve conter apenas letras
        Capture Page Screenshot    img/${TAG_NUMBER}_6CampoNomeComitenteInvalido.png
        Select Frame                    id:main

        O Usuario informa no campo Comitente(Nome/Razão Social) valor igual a Teste1234
        O Usuario clica no botao Enviar
        Então deve retornar a mensagem  Nome Comitente é inválido.O campo deve conter apenas letras
        Capture Page Screenshot    img/${TAG_NUMBER}_7CampoNomeComitenteInvalido.png
        Select Frame                    id:main

        O Usuario informa no campo Comitente(Nome/Razão Social) valor igual a *$%&
        O Usuario clica no botao Enviar
        Então deve retornar a mensagem  Nome Comitente é inválido.O campo deve conter apenas letras
        Capture Page Screenshot    img/${TAG_NUMBER}_8CampoNomeComitenteInvalido.png
        Select Frame                    id:main

        O Usuario informa no campo Comitente(Nome/Razão Social) valor igual a teste*$%&
        O Usuario clica no botao Enviar
        Então deve retornar a mensagem  Nome Comitente é inválido.O campo deve conter apenas letras
        Capture Page Screenshot    img/${TAG_NUMBER}_9CampoNomeComitenteInvalido.png
        Select Frame                    id:main

        O Usuario informa no campo Comitente(Nome/Razão Social) valor igual a teste
        O Usuario clica no botao Enviar
        Então deve retornar a mensagem  (Dados Básicos do Comitente) Deve-se informar no mínimo dois nomes no campo 'Comitente(Nome/Razão Social)'
        Capture Page Screenshot    img/${TAG_NUMBER}_10CampoNomeComitenteInvalido.png
        Select Frame                    id:main
    END

O usuario preenche - Dados da Pessoa Fisica
    ${DATAFAKE}=           FakerLibrary.DayOfMonth
    ${MESFAKE}=            FakerLibrary.Month
    ${ANOFAKE}=            Set Variable   1998
    Set Global Variable    ${ANOFAKE}
    ${FATHER}=             FakerLibrary.nameMale
    Set Global Variable    ${FATHER}
    ${NOME_SOCIAL}=        FakerLibrary.name
    Set Global Variable    ${NOME_SOCIAL}
    ${CPF_DOC}=            FakerLibrary.cpf
    Set Global Variable    ${CPF_DOC}
    ${DATAFAKE}=           FakerLibrary.DayOfMonth
    Set Global Variable    ${DATAFAKE}
    ${MESFAKE}=            FakerLibrary.Month
    Set Global Variable    ${MESFAKE}
    IF   "${DONO}" == "SIM" or "${DONO}" == "B3"
        O Usuario informa no campo Data de Nascimento valor igual a ${DATAFAKE}11${ANOFAKE}
    END
    O Usuario seleciona na combo Gênero valor igual a ${SEXO}
    O Usuario informa no campo Filiação - Nome do Pai valor igual a ${FATHER}
    IF   "${DONO}" == "SIM" or "${DONO}" == "B3"
        O Usuario informa no campo Filiação - Nome da Mãe valor igual a ${MOTHER}
    END
    O Usuario seleciona na combo Estado Civil valor igual a ${ESTADO_CIVIL}
    O Usuario seleciona na combo Naturalidade (UF) valor igual a ${UF}
    O Usuario informa no campo Filtro de Naturalidade (Município) valor igual a ${MUNICIPIO}
    O Usuario clica na seta 1
    Scroll campo Nacionalidade
    O Usuario seleciona na combo Naturalidade (Município) valor igual a ${MUNICIPIO_COMBO}
    O Usuario seleciona na combo Nacionalidade valor igual a BRASIL
    O Usuario informa no campo Filtro Ocupação Profissional (Principal) valor igual a ${ATIVIDADE}
    O Usuario clica na seta 2
    Scroll campo Número do Documento de Identificação
    O Usuario seleciona na combo Ocupação Profissional (Principal) valor igual a ${ATIVIDADE_COMBO}
    O Usuario seleciona na combo Tipo de Documento de Identificação valor igual a ${TIPO_DOCUMENTO}
    O Usuario informa no campo Número do Documento de Identificação valor igual a ${CPF_DOC}
    O Usuario informa no campo Orgão Expedidor valor igual a ${ORGAO_EXPEDIDOR}
    O Usuario informa no campo Data de Expedição valor igual a ${DATAFAKE}${MESFAKE}${ANOFAKE}
    O Usuario informa no campo Nome Social valor igual a ${NOME_SOCIAL}
    O Usuario seleciona na combo Pessoa Exposta Politicamente? valor igual a ${IS_PPE}
    O Usuario seleciona na combo Autoriza Transmissão de Ordem por Terceiros? valor igual a Procurador
    Capture Page Screenshot    img/${TAG_NUMBER}_5DadosPessoaFisica.png
O usuario preenche - Endereço Pessoa Física
    #${ADDRESS}=            FakerLibrary.Address
    ${NUMBERFAKE}=         FakerLibrary.RandomNumber
    ${CEP}=                FakerLibrary.postcode
    ${EMAIL}=              FakerLibrary.email

    O Usuario seleciona na combo Tipo de Endereço valor igual a ${TIPO_ENDERECO}
    O Usuario informa no campo Logradouro valor igual a TESTE LOGRADOURO
    O Usuario informa no campo Número Logradouro valor igual a ${NUMBERFAKE}
    O Usuario informa no campo Complemento valor igual a COMPLEMENTO
    O Usuario informa no campo Bairro valor igual a ${BAIRRO}
    O Usuario seleciona na combo UF valor igual a ${UF}
    O Usuario informa no campo Filtro Munícipio valor igual a ${MUNICIPIO}
    O Usuario clica na seta 3
    Scroll campo CEP
    O Usuario seleciona na combo Tipo Município valor igual a ${MUNICIPIO}
    O Usuario informa no campo CEP valor igual a ${CEP}
    Capture Page Screenshot     img/${TAG_NUMBER}_6DadosEndereco.png
    O Usuario seleciona na combo País valor igual a ${PAIS}
    O Usuario informa no campo E-mail valor igual a ${EMAIL}
    O Usuario seleciona na combo Tipo E-mail valor igual a ${TIPO_EMAIL}
O usuario preenche - Confirmar dados Pessoa Fisíca
    O Usuario seleciona na combo Instituição Financeira confirma as informações cadastrais do cliente? valor igual a Sim
    Capture Page Screenshot    img/${TAG_NUMBER}_7ConfirmaDados.png
    O Usuario clica no botao Enviar
    Capture Page Screenshot    img/${TAG_NUMBER}_8ConfirmaDadosEnviar.png
    O Usuario clica no botao Confirmar
    Sleep  2s
O usuario valida os dados invalidos e finaliza o cadastro
    O Usuario seleciona na combo Instituição Financeira confirma as informações cadastrais do cliente? valor igual a Sim
    Capture Page Screenshot    img/${TAG_NUMBER}_7EnviarDados.png
    O Usuario clica no botao Enviar
    ##VALIDA ESTADO CIVIL##
    Então deve retornar a mensagem  Estado Civil inválido
    Capture Page Screenshot    img/${TAG_NUMBER}_8EstadoCivilInvalido.png
    Select Frame                    id:main
    O Usuario seleciona na combo Estado Civil valor igual a ${ESTADO_CIVIL}
    O Usuario clica no botao Enviar

    ##VALIDA Tipo Documento Identificacao##
    Então deve retornar a mensagem  Tipo de Documento de Identificação inválido
    Capture Page Screenshot    img/${TAG_NUMBER}_9DocIdentificacaoInvalido.png
    Select Frame                    id:main
    O Usuario seleciona na combo Tipo de Documento de Identificação valor igual a ${TIPO_DOCUMENTO}
    O Usuario clica no botao Enviar

    ##VALIDA OCUPACAO##
    Então deve retornar a mensagem  Ocupação profissional inválida
    Capture Page Screenshot    img/${TAG_NUMBER}_10OcupacaoInvalida.png
    Select Frame                    id:main
    O Usuario informa no campo Filtro Ocupação Profissional (Principal) valor igual a ${ATIVIDADE}
    O Usuario clica na seta 2
    Scroll campo Número do Documento de Identificação
    O Usuario seleciona na combo Ocupação Profissional (Principal) valor igual a ${ATIVIDADE_COMBO}
    O Usuario clica no botao Enviar

    ##VALIDA UF Naturalidade##
    Então deve retornar a mensagem  UF inválido para o campo Naturalidade (UF).
    Capture Page Screenshot    img/${TAG_NUMBER}_11UFNaturalidadeInvalido.png
    Select Frame                    id:main
    O Usuario seleciona na combo Naturalidade (UF) valor igual a ${UF}
    O Usuario clica no botao Enviar

    ##VALIDA Municipio inválido##
    Então deve retornar a mensagem  Município inválido para o campo Naturalidade (
    Capture Page Screenshot    img/${TAG_NUMBER}_12MunicipioNaturalidadeInvalido.png
    Select Frame                    id:main
    O Usuario informa no campo Filtro de Naturalidade (Município) valor igual a ${MUNICIPIO}
    O Usuario clica na seta 1
    Scroll campo Nacionalidade
    O Usuario seleciona na combo Naturalidade (Município) valor igual a ${MUNICIPIO_COMBO}
    O Usuario clica no botao Enviar
    O Usuario clica no botao Confirmar
    Parar Gravacao
    Valida mensagem
    Close browser
Valida mensagem
    IF   "${acao}" == "Inclusão"
        ${mensagem}=   Set Variable   Comitente incluído com Sucesso, deseja prosseguir com os dados dos Representantes do Comitente?
    END
    IF   "${acao}" == "Alteração"
        ${mensagem}=   Set Variable   Comitente alterado com Sucesso, deseja prosseguir com os dados dos Representantes do Comitente?
    END
    IF   "${acao}" == "Inativação"
        ${mensagem}=   Set Variable   Inativação de Comitente realizado com sucesso. Conta de Depósito
    END
    IF   "${acao}" == "Ativação"
        ${mensagem}=   Set Variable   Ativação de Comitente realizado com sucesso. Conta de Depósito
    END
    IF   "${acao}" == "COMPLETO PARA SIMPLIFICADO"
        ${mensagem}=   Set Variable   O cadastro do comitente foi alterado para simplificado com sucesso
    END
    IF   "${acao}" == "SIMPLIFICADO PARA COMPLETO"
        ${mensagem}=   Set Variable   O cadastro do comitente foi alterado para completo com sucesso
    END
    Então deve retornar a mensagem  ${mensagem}
    Capture Page Screenshot    img/${TAG_NUMBER}_9MensagemSucesso.png
Imprimir log de variaveis
    Log  "COD_SEXO: ${SEXO} NOME_PAI: ${FATHER} MUNICIPIO: ${MUNICIPIO} UF: ${UF} ESTADO CIVIL: ${ESTADO_CIVIL} TIPO DOCUMENTO: ${TIPO_DOCUMENTO} COD_DOCUMENTO: ${CPF_DOC} ORGAO EXPEDIDOR: ${ORGAO_EXPEDIDOR} DATA EMISSAO: ${DATAFAKE}${MESFAKE}${ANOFAKE} ATIVIDADE: ${ATIVIDADE} PPE: ${IS_PPE} NOME SOCIAL: ${NOME_SOCIAL}"   console=True
O Usuario clica na seta ${number}
    Click Element   //*[@id="/SIC21/ctp/FormularioPessoaFisicaNovoFluxo:br.com.cetip.infra.atributo.tipo.web.FiltroDeDominio:${number}:2:java.lang.String"]

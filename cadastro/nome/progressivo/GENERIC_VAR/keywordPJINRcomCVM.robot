*** Keywords ***
O usuario preenche - Dados Básicos do Comitente conta ${acao}
    Set Global Variable  ${acao}
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
    O Usuario seleciona na combo Tipo Pessoa valor igual a Pessoa Jurídica
    O Usuario informa no campo CPF/CNPJ do Comitente valor igual a ${CNPJ_COMITENTE}
    O Usuario seleciona na combo Ação valor igual a ${acao}
    Capture Page Screenshot    img/${TAG_NUMBER}_3FiltroComitente.png
    O Usuario clica no botao Enviar
O usuario preenche - Dados Básicos PJ INR com CVM
    ${NOMECOMITENTE}=   FakerLibrary.name
    ${NOMECOMITENTE}=   Replace String     ${NOMECOMITENTE}     .   	${EMPTY}

    ${CNPJ_COMITENTE}=      SeleniumLibrary.Get Element Attribute    //td[text()='CPF/CNPJ do Comitente']//following::input[1]  value
    Set Global Variable    ${CNPJ_COMITENTE}
    LOG  "CNPJ_COMITENTE is ${CNPJ_COMITENTE}"  console=True

    O Usuario seleciona na combo Natureza Fiscal valor igual a Isento
    O Usuario seleciona na combo Tipo de Investidor valor igual a Investidor Não Residente com CVM
    IF   "${DONO}" == "SIM" or "${DONO}" == "B3"
        O Usuario informa no campo Comitente(Nome/Razão Social) valor igual a ${NOMECOMITENTE}
    END
    O Usuario seleciona na combo País de Residência valor igual a ALEMANHA
    Capture Page Screenshot    img/${TAG_NUMBER}_4DadosBasicosComitente.png
    O Usuario clica no botao Enviar
O usuario preenche - Dados da Pessoa Jurídica
    ${DATAFAKE}=      FakerLibrary.DayOfMonth
    ${MESFAKE}=       Set Variable   10
    ${ANOFAKE}=       Set Variable   1998
    O Usuario informa no campo Data de Fundação/Constituição valor igual a ${DATAFAKE}${MESFAKE}${ANOFAKE}
    O usuario informa no campo Filtro Atividade Principal Desenvolvida valor igual a ATIVIDADES IMOBILIÁRIAS
    O Usuario clica na seta 1
    O usuario seleciona na combo CNAE - Atividade Principal Desenvolvida valor igual a ATIVIDADES IMOBILIÁRIAS
    Capture Page Screenshot    img/${TAG_NUMBER}_5DadosPessoaJuridica.png
    sleep   3s
O usuario preenche - Dados de Pessoa Jurídica Não Residente

    O Usuario seleciona na combo Titularidade da Conta valor igual a Conta Propria
    O Usuario seleciona na combo Indicador NIF valor igual a Sim
    ${NUMBERFAKE}=                 FakerLibrary.RandomNumber
    O Usuario informa no campo Número de Identificação Fiscal (NIF) valor igual a ${NUMBERFAKE}
    ${DATAFAKE}=      FakerLibrary.DayOfMonth
    ${MESFAKE}=       FakerLibrary.Month
    ${ANOFAKE}=       Set Variable   1975
    O Usuario informa no campo Data Inicio do Periodo da Situação de Residente Exterior valor igual a ${DATAFAKE}${MESFAKE}${ANOFAKE}
    O Usuario seleciona na combo Qualificação conforme ICVM 560 valor igual a I
    O Usuario seleciona na combo Jurisdição valor igual a ANGUILLA
    ${NUMBERFAKE}=                 FakerLibrary.RandomNumber
    O Usuario informa no campo Código CVM valor igual a ${NUMBERFAKE}
    O Usuario seleciona na combo Cadastro Simplificado? valor igual a Não
    ${CPF}=                 FakerLibrary.Cpf
    O Usuario informa no campo CPF/CNPJ do Representante Legal valor igual a ${CPF}
    ${CNPJ}=                 FakerLibrary.Cnpj
    O Usuario informa no campo CNPJ do Co-Representante Legal valor igual a ${CNPJ}
    ${NOME}=      FakerLibrary.name
    O Usuario informa no campo Nome do Representante Legal valor igual a ${NOME}
    O Usuario seleciona na combo Tipo de Pessoa do Representante Legal valor igual a Pessoa Física
    Capture Page Screenshot     img/${TAG_NUMBER}_6DadosPessoaFisicaNaoResidente.png

O usuario preenche - Endereço Estrangeiro
    #${ADDRESS}=            FakerLibrary.Address
    ${NUMBERFAKE}=         FakerLibrary.RandomNumber
    ${CEP}=                FakerLibrary.postcode
    ${EMAIL}=              FakerLibrary.email

    O Usuario seleciona na combo Tipo de Endereço valor igual a ${TIPO_ENDERECO}
    O Usuario informa no campo Endereço/Logradouro valor igual a TESTE LOGRADOURO
    O Usuario informa no campo Número valor igual a ${NUMBERFAKE}
    O Usuario informa no campo Complemento valor igual a COMPLEMENTO
    O Usuario informa no campo Bairro valor igual a ${BAIRRO}
    O Usuario seleciona na combo UF valor igual a ${UF}
    O Usuario informa no campo Filtro Munícipio valor igual a ${MUNICIPIO}
    O Usuario clica na seta 2
    Scroll campo CEP
    O Usuario seleciona na combo Tipo Município valor igual a ${MUNICIPIO}
    O Usuario informa no campo CEP valor igual a ${CEP}
    Capture Page Screenshot     img/${TAG_NUMBER}_6DadosEndereco.png
    O Usuario seleciona na combo País valor igual a ${PAIS}
    O Usuario seleciona na combo Tipo E-mail valor igual a ${TIPO_EMAIL}
    O Usuario informa no campo E-mail valor igual a ${EMAIL}
O usuario preenche - Confirmar dados Pessoa Jurídica
    O Usuario seleciona na combo Instituição Financeira confirma as informações cadastrais do cliente? valor igual a Sim
    Capture Page Screenshot    img/${TAG_NUMBER}_7ConfirmaDados.png
    O Usuario clica no botao Enviar
    Capture Page Screenshot    img/${TAG_NUMBER}_8ConfirmaDadosEnviar.png
    O Usuario clica no botao Confirmar
    Sleep  2s
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
    Click Element   //*[@id="/SIC21/ctp/FormularioPessoaJuridicaNaoResidenteCVMNovoFluxo:br.com.cetip.infra.atributo.tipo.web.FiltroDeDominio:${number}:2:java.lang.String"]
*** Variable ***
${TIPO_ENDERECO}=     RESIDENCIAL
${TIPO_EMAIL}=        PARTICULAR
${BAIRRO}=            CENTRO
${PAIS}=              BRASIL

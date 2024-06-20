*** Settings ***
Variables      ${CURDIR}\\Variables\\test_data.yaml

*** Keywords ***
Define URL de inclusão
    IF   "${var_amb}" == "dev"
        IF   "${tipo_ficha}" == "DEMAIS"
            ${URL}=  Set Variable  ${url_ficha_demais_inc.dev}
        END
        IF   "${tipo_ficha}" == "INSTITUICAO"
            ${URL}=  Set Variable  ${url_ficha_instituicao_inc.dev}
        END
        IF   "${tipo_ficha}" == "EMISSOR"
            ${URL}=  Set Variable  ${url_ficha_emissor_inc.dev}
        END
        IF   "${tipo_ficha}" == "INR"
            ${URL}=  Set Variable  ${url_ficha_inr_inc.dev}
        END
    ELSE IF  "${var_amb}" == "qaa"
        IF   "${tipo_ficha}" == "DEMAIS"
            ${URL}=  Set Variable  ${url_ficha_demais_inc.qaa}
        END
        IF   "${tipo_ficha}" == "INSTITUICAO"
            ${URL}=  Set Variable  ${url_ficha_instituicao_inc.qaa}
        END
        IF   "${tipo_ficha}" == "EMISSOR"
            ${URL}=  Set Variable  ${url_ficha_emissor_inc.qaa}
        END
        IF   "${tipo_ficha}" == "INR"
            ${URL}=  Set Variable  ${url_ficha_inr_inc.qaa}
        END
    ELSE IF  "${var_amb}" == "cert"
        IF   "${tipo_ficha}" == "DEMAIS"
            ${URL}=  Set Variable  ${url_ficha_demais_inc.cert}
        END
        IF   "${tipo_ficha}" == "INSTITUICAO"
            ${URL}=  Set Variable  ${url_ficha_instituicao_inc.cert}
        END
        IF   "${tipo_ficha}" == "EMISSOR"
            ${URL}=  Set Variable  ${url_ficha_emissor_inc.cert}
        END
        IF   "${tipo_ficha}" == "INR"
            ${URL}=  Set Variable  ${url_ficha_inr_inc.cert}
        END
    ELSE IF  "${var_amb}" == "qar"
        IF   "${tipo_ficha}" == "DEMAIS"
            ${URL}=  Set Variable  ${url_ficha_demais_inc.qar}
        END
        IF   "${tipo_ficha}" == "INSTITUICAO"
            ${URL}=  Set Variable  ${url_ficha_instituicao_inc.qar}
        END
        IF   "${tipo_ficha}" == "EMISSOR"
            ${URL}=  Set Variable  ${url_ficha_emissor_inc.qar}
        END
        IF   "${tipo_ficha}" == "INR"
            ${URL}=  Set Variable  ${url_ficha_inr_inc.qar}
        END
    ELSE
        ${URL}=  Set Variable  ${EMPTY}
    END

    ${BROWSER}=  Set Variable   chrome
    Set Global Variable  ${BROWSER}
    Set Global Variable  ${URL}

que eu realize o cadastro previo de um participante ${tipo_ficha} com natureza economica ${NATUREZA_ECONOMICA}
    Set Global Variable         ${tipo_ficha}
    Set Global Variable         ${NATUREZA_ECONOMICA}

    ${PARTICIPANTE}=            Generate companyName with size   100
    Set Global Variable         ${PARTICIPANTE}

    ${CNPJ}=                    Generate CNPJ with size   18
    Set Global Variable         ${CNPJ}

    Dado O usuario acessa a url para cadastro de um novo participante

    IF   "${tipo_ficha}" == "EMISSOR"
        E o usuario preenche a tela de Dados do Emissor
        ${numberProtocol}=   Pega valor do campo Protocolo
        Set Global Variable  ${numberProtocol}

        E o usuario preenche a tela de Dados do Endereço de Sede
        E o usuario preenche a tela de Dados do Endereço de Cobrança
        E o usuario preenche a tela de Dados Complementares Emissor
        E o usuario preenche a tela de Dados do Diretor Responsavel junto a B3
    ELSE IF   "${tipo_ficha}" == "INSTITUICAO"
        E o usuario preenche a tela de Dados do Participante
        ${numberProtocol}=   Pega valor do campo Protocolo
        Set Global Variable  ${numberProtocol}

        E o usuario preenche a tela de Dados do Endereço de Sede
        E o usuario preenche a tela de Dados do Endereço de Cobrança
        E o usuario preenche a tela de Dados do Diretor Responsavel junto a B3
        E o usuario preenche a tela de Dados do Diretor ICVM 505 Estatutario
        E o usuario preenche a tela de Dados do Diretor de procedimentos e controles internos (Estatutário)
        E o usuario preenche a tela de Dados do Diretor Guarda Fisica
    ELSE IF   "${tipo_ficha}" == "DEMAIS"
        E o usuario preenche a tela de Dados do Participante
        ${numberProtocol}=   Pega valor do campo Protocolo
        Set Global Variable  ${numberProtocol}

        E o usuario preenche a tela de Dados do Endereço de Sede
        E o usuario preenche a tela de Dados do Endereço de Cobrança
        E o usuario preenche a tela de Dados do Diretor Responsavel junto a B3
    ELSE IF   "${tipo_ficha}" == "INR"
        E o usuario preenche a tela de Dados do Participante Investidor não residente
        ${numberProtocol}=   Pega valor do campo Protocolo
        Set Global Variable  ${numberProtocol}
        E o usuario preenche a tela de Representante Legal
        capturar e salvar imagem com o nome TelaDeclaracaoClienteINR
        O Usuario clica no botao Confirmar
        E o usuario preenche a tela de Dados da Conta
        E o usuario preenche a tela de Dados do Contato Principal (Custodiante)
    END

Dado O usuario acessa a url para cadastro de um novo participante
    Define URL de inclusão
    Abrir navegador chrome e acessar ${URL}
E o usuario preenche a tela de Dados do Participante
    IF  "${TOGGLE}" == "SIM"
        O Usuario informa no campo E-mail para envio do token valor igual a ${EMAIL_TOKEN_CADASTRO_PREVIO}
        O Usuario clica no botao Confirmar
        Pause Execution
        capturar e salvar imagem com o nome TelaDadosParticipantes_TokenCadastroWeb
        O Usuario clica no botao Confirmar
    END
    O Usuario informa no campo Participante (Razão Social) valor igual a ROBOTWEB${tipo_ficha}-${PARTICIPANTE}
    O Usuario informa no campo Participante (CNPJ) valor igual a ${CNPJ}
    O Usuario seleciona na combo Habilitado para Operação Compromissada? valor igual a ${HABILITA_COMPROMISSADA}
    O Usuario seleciona na combo Tipo Participação valor igual a ${TIPO_PARTICIPACAO}
    O Usuario seleciona na combo Natureza Econômica valor igual a ${NATUREZA_ECONOMICA}
    O Usuario seleciona na combo Natureza Jurídica valor igual a ${NATUREZA_JURIDICA}
    O Usuario informa no campo Grupo Econômico valor igual a ${GRUPOECON}
    O Usuario seleciona na combo Isento de Inscrição Estadual? valor igual a Sim
    O Usuario seleciona na combo Isento de Inscrição Municipal? valor igual a Sim
    capturar e salvar imagem com o nome TelaDadosParticipantes_Enviar
    O Usuario clica no botao Enviar
	IF  "${CAPTCHA_HABILITADO}" == "SIM"
        capturar e salvar imagem com o nome TelaDadosParticipantes_CaptchaCadastroWeb
        Pause Execution
    END
    capturar e salvar imagem com o nome TelaDadosParticipantes_Confirmar
    O Usuario clica no botao Confirmar
E o usuario preenche a tela de Dados do Emissor
    IF  "${TOGGLE}" == "SIM"
        O Usuario informa no campo E-mail para envio do token valor igual a ${EMAIL_TOKEN_CADASTRO_PREVIO}
        O Usuario clica no botao Confirmar
        Pause Execution
        capturar e salvar imagem com o nome TelaDadosParticipanteEmissor_TokenCadastroWeb
        O Usuario clica no botao Confirmar
    END
    O Usuario informa no campo Participante (Razão Social) valor igual a ROBOTWEB${tipo_ficha}-${PARTICIPANTE}
    O Usuario informa no campo Participante (CNPJ) valor igual a ${CNPJ}
    O Usuario seleciona na combo Natureza Econômica valor igual a ${NATUREZA_ECONOMICA}
    O Usuario seleciona na combo Natureza Jurídica valor igual a ${NATUREZA_JURIDICA}
    O Usuario informa no campo Grupo Econômico valor igual a ${GRUPOECON}
    O Usuario seleciona na combo Isento de Inscrição Estadual? valor igual a Sim
    O Usuario seleciona na combo Isento de Inscrição Municipal? valor igual a Sim
    O Usuario seleciona na combo Emissor registrado CVM valor igual a Sim
    O Usuario seleciona na combo Tipo Emissor valor igual a Emissor frequente de renda fixa
    O Usuario seleciona na combo Fase valor igual a Operacional
    capturar e salvar imagem com o nome TelaDadosParticipanteEmissor_Enviar
    O Usuario clica no botao Enviar
    IF  "${CAPTCHA_HABILITADO}" == "SIM"
        capturar e salvar imagem com o nome TelaDadosParticipanteEmissor_CaptchaCadastroWeb
        Pause Execution
    END
    capturar e salvar imagem com o nome TelaDadosParticipanteEmissor_Confirmar
    O Usuario clica no botao Confirmar
E o usuario preenche a tela de Dados Complementares Emissor
    ${NOME}=       FakerLibrary.name
    O Usuario informa no campo Nome/DRI valor igual a ${NOME}
    O Usuario informa no campo Telefone valor igual a 01198776543
    ${EMAIL}=       FakerLibrary.email
    O Usuario informa no campo E-mail para correspondência valor igual a ${EMAIL}
    capturar e salvar imagem com o nome TelaDadosComplementares_Enviar
    O Usuario clica no botao Enviar
    capturar e salvar imagem com o nome TelaDadosComplementares_Confirmar
    O Usuario clica no botao Confirmar
E o usuario preenche a tela de Dados do Endereço de Sede
    ${ENDERECO}=      FakerLibrary.StreetName
    O Usuario informa no campo Logradouro valor igual a ${ENDERECO}
    ${NUMERO}=      FakerLibrary.RandomNumber
    O Usuario informa no campo Número valor igual a ${NUMERO}
    O Usuario informa no campo Complemento valor igual a teste
    ${BAIRRO}       FakerLibrary.StreetName
    O Usuario informa no campo Bairro valor igual a ${BAIRRO}
    O Usuario seleciona na combo UF valor igual a RJ
    O Usuario informa no campo Cidade valor igual a Rio de Janeiro
    ${CEP}=       FakerLibrary.postcode
    O Usuario informa no campo CEP valor igual a ${CEP}
    capturar e salvar imagem com o nome TelaDadosEnderecoSede_Enviar
    O Usuario clica no botao Enviar
    capturar e salvar imagem com o nome TelaDadosEnderecoSede_Confirmar
    O Usuario clica no botao Confirmar
E o usuario preenche a tela de Dados do Endereço de Cobrança
    ${ENDERECO}=      FakerLibrary.StreetName
    O Usuario informa no campo Logradouro valor igual a ${ENDERECO}
    ${NUMERO}=      FakerLibrary.RandomNumber
    O Usuario informa no campo Número valor igual a ${NUMERO}
    O Usuario informa no campo Complemento valor igual a teste
    ${BAIRRO}       FakerLibrary.StreetName
    O Usuario informa no campo Bairro valor igual a ${BAIRRO}
    O Usuario seleciona na combo UF valor igual a RJ
    O Usuario informa no campo Cidade valor igual a Rio de Janeiro
    ${CEP}=       FakerLibrary.postcode
    O Usuario informa no campo CEP valor igual a ${CEP}
    O Usuario informa no campo Telefone valor igual a 01198998786
    ${EMAIL}=       FakerLibrary.email
    O Usuario informa no campo E-mail para Documentos Fiscais valor igual a ${EMAIL}
    ${EMAIL}=       FakerLibrary.email
    O Usuario informa no campo 2º E-mail para Documentos Fiscais valor igual a ${EMAIL}
    ${EMAIL}=       FakerLibrary.email
    O Usuario informa no campo 3º E-mail para Documentos Fiscais valor igual a ${EMAIL}
    ${EMAIL}=       FakerLibrary.email
    O Usuario informa no campo 4º E-mail para Documentos Fiscais valor igual a ${EMAIL}
    ${EMAIL}=       FakerLibrary.email
    O Usuario informa no campo 5º E-mail para Documentos Fiscais valor igual a ${EMAIL}
    capturar e salvar imagem com o nome TelaDadosEnderecoCobranca_Enviar
    O Usuario clica no botao Enviar
    capturar e salvar imagem com o nome TelaDadosEnderecoCobranca_Confirmar
    O Usuario clica no botao Confirmar
E o usuario preenche a tela de Dados do Diretor Responsavel junto a B3
    ${NOME}=       FakerLibrary.name
    O Usuario informa no campo Nome Completo valor igual a ${NOME}
    ${CPF}=       FakerLibrary.cpf
    O Usuario informa no campo CPF valor igual a ${CPF}
    O Usuario informa no campo Telefone valor igual a 01198653476
    ${EMAIL}=       FakerLibrary.email
    O Usuario informa no campo E-mail para correspondência valor igual a ${EMAIL}
    capturar e salvar imagem com o nome TelaDadosDiretorResponsavel_Enviar
    O Usuario clica no botao Enviar
    capturar e salvar imagem com o nome TelaDadosDiretorResponsavel_Confirmar
    O Usuario clica no botao Confirmar
E o usuario preenche a tela de Dados do Diretor ICVM 505 Estatutario
    ${NOME}=       FakerLibrary.name
    O Usuario informa no campo Nome Completo valor igual a ${NOME}
    ${CPF}=       FakerLibrary.cpf
    O Usuario informa no campo CPF valor igual a ${CPF}
    O Usuario informa no campo Telefone valor igual a 01198653476
    ${EMAIL}=       FakerLibrary.email
    O Usuario informa no campo E-mail para correspondência valor igual a ${EMAIL}
    capturar e salvar imagem com o nome TelaDadosDiretorICVM505_Enviar
    O Usuario clica no botao Enviar
    capturar e salvar imagem com o nome TelaDadosDiretorICVM505_Confirmar
    O Usuario clica no botao Confirmar
E o usuario preenche a tela de Dados do Diretor de procedimentos e controles internos (Estatutário)
    ${NOME}=       FakerLibrary.name
    O Usuario informa no campo Nome Completo valor igual a ${NOME}
    ${CPF}=       FakerLibrary.cpf
    O Usuario informa no campo CPF valor igual a ${CPF}
    O Usuario informa no campo Telefone valor igual a 01198653476
    ${EMAIL}=       FakerLibrary.email
    O Usuario informa no campo E-mail para correspondência valor igual a ${EMAIL}
    capturar e salvar imagem com o nome TelaDadosDiretorControlesInternos_Enviar
    O Usuario clica no botao Enviar
    capturar e salvar imagem com o nome TelaDadosDiretorControlesInternos_Confirmar
    O Usuario clica no botao Confirmar
E o usuario preenche a tela de Dados do Diretor Guarda Fisica
    ${NOME}=       FakerLibrary.name
    O Usuario informa no campo Nome Completo valor igual a ${NOME}
    ${CPF}=       FakerLibrary.cpf
    O Usuario informa no campo CPF valor igual a ${CPF}
    O Usuario informa no campo Telefone valor igual a 01198653476
    ${EMAIL}=       FakerLibrary.email
    O Usuario informa no campo E-mail para correspondência valor igual a ${EMAIL}
    capturar e salvar imagem com o nome TelaDadosDiretorGuardaFisica_Enviar
    O Usuario clica no botao Enviar
    capturar e salvar imagem com o nome TelaDadosDiretorGuardaFisica_Confirmar
    O Usuario clica no botao Confirmar
E o usuario preenche a tela de Dados do Diretor
    ${NOME}=       FakerLibrary.name
    O Usuario informa no campo Nome Completo valor igual a ${NOME}
    ${CPF}=       FakerLibrary.cpf
    O Usuario informa no campo CPF valor igual a ${CPF}
    O Usuario informa no campo Telefone valor igual a 01198653476
    ${EMAIL}=       FakerLibrary.email
    O Usuario informa no campo E-mail para correspondência valor igual a ${EMAIL}
    capturar e salvar imagem com o nome TelaDadosDiretorResponsavel_Enviar
    O Usuario clica no botao Enviar
    capturar e salvar imagem com o nome TelaDadosDiretorResponsavel_Confirmar
    O Usuario clica no botao Confirmar

que eu valide se o cadastro web foi realizado com sucesso
    capturar e salvar imagem com o nome TelaImpressao
    O Usuario clica no link Versão para Impressão

que eu valide se o cadastro web INR foi realizado com sucesso
    capturar e salvar imagem com o nome CadastroWebFinalizado
    Então deve retornar a mensagem  Inclusão do Cadastro Prévio do Investidor Nao Residente
    Então deve retornar a mensagem  realizada com Sucesso. O seu protocolo é ${numberProtocol} .

o usuario preenche a tela de Dados do Participante Investidor não residente
    IF  "${TOGGLE}" == "SIM"
        O Usuario informa no campo E-mail para envio do token valor igual a ${EMAIL_TOKEN_CADASTRO_PREVIO}
        O Usuario clica no botao Confirmar
        Pause Execution
        capturar e salvar imagem com o nome TelaDadosParticipanteINR_TokenCadastroWeb
        O Usuario clica no botao Confirmar
    END
    O Usuario informa no campo Razão Social valor igual a ROBOTWEB${tipo_ficha}-${PARTICIPANTE}
    O Usuario informa no campo CNPJ valor igual a ${CNPJ}
    O Usuario seleciona na combo Natureza Jurídica valor igual a ${NATUREZA_JURIDICA}
    ${endereco}=            FakerLibrary.StreetName
    O Usuario informa no campo Logradouro valor igual a ${endereco}
    ${numero}=              FakerLibrary.RandomNumber
    O Usuario informa no campo Número valor igual a ${numero}
    O Usuario informa no campo Complemento valor igual a Complemento INR
    ${bairro}=              FakerLibrary.StreetName
    O Usuario informa no campo Bairro valor igual a ${bairro}
    ${cep}=                 FakerLibrary.postcode
    O Usuario informa no campo Código Postal valor igual a ${cep}
    O Usuario seleciona na combo País valor igual a ESTADOS UNIDOS
    O Usuario informa no campo Estado/Província valor igual a Texas
    O Usuario informa no campo Cidade valor igual a Houston
    O Usuario seleciona na combo Origem de Capital valor igual a ESTRANGEIRA
    O Usuario seleciona na combo Controle Acionário valor igual a PUBLICO
    ${codigo_randomico}=    Generate Random String    9    [UPPER]
    O Usuario informa no campo Código CVM valor igual a ${codigo_randomico}
    O Usuario seleciona na combo Qualificação CVM valor igual a X
    ${codigo_randomico}=    Generate Random String    9    [UPPER]
    O Usuario informa no campo Registro Declaratório valor igual a ${codigo_randomico}
    O Usuario informa no campo Grupo Econômico valor igual a ${GRUPOECON}
    capturar e salvar imagem com o nome TelaDadosParticipanteINR_Enviar
    O Usuario clica no botao Enviar
    	IF  "${CAPTCHA_HABILITADO}" == "SIM"
        capturar e salvar imagem com o nome TelaDadosParticipanteINR_CaptchaCadastroWeb
        Pause Execution
    END
    capturar e salvar imagem com o nome TelaDadosParticipanteINR_Confirmar
    O Usuario clica no botao Confirmar

o usuario preenche a tela de Representante Legal
    ${nome}=            FakerLibrary.name
    O Usuario informa no campo Denominação / Razão Social valor igual a ${nome}
    ${cpf}=             FakerLibrary.cpf
    O Usuario informa no campo CNPJ/CPF valor igual a ${cpf}
    ${numero}=          Generate Random String  8   [NUMBERS]
    O Usuario informa no campo Doc. de Identidade / NIRE valor igual a ${numero}
    ${email}=           FakerLibrary.email
    O Usuario informa no campo E-mail valor igual a ${email}
    ${endereco}=        FakerLibrary.StreetName
    O Usuario informa no campo Logradouro valor igual a ${endereco}
    ${numero}=          FakerLibrary.RandomNumber
    O Usuario informa no campo Número valor igual a ${numero}
    O Usuario informa no campo Complemento valor igual a Complemento
    ${bairro}=          FakerLibrary.StreetName
    O Usuario informa no campo Bairro valor igual a ${bairro}
    O Usuario seleciona na combo UF valor igual a SP
    O Usuario informa no campo Filtro Município valor igual a a
    O Usuario clica na seta para filtrar o municipio do endereço INR
    O Usuario seleciona na combo Município valor igual a ANHEMBI
    ${cep}=             FakerLibrary.postcode
    O Usuario informa no campo CEP valor igual a ${cep}
    O Usuario informa no campo Telefone valor igual a 01198653476
    ${email}=           FakerLibrary.email
    O Usuario informa no campo E-mail para Documentos Fiscais valor igual a ${email}
    ${email}=           FakerLibrary.email
    O Usuario informa no campo 2º E-mail para Documentos Fiscais valor igual a ${email}
    ${email}=           FakerLibrary.email
    O Usuario informa no campo 3º E-mail para Documentos Fiscais valor igual a ${email}
    ${email}=           FakerLibrary.email
    O Usuario informa no campo 4º E-mail para Documentos Fiscais valor igual a ${email}
    ${email}=           FakerLibrary.email
    O Usuario informa no campo 5º E-mail para Documentos Fiscais valor igual a ${email}
    capturar e salvar imagem com o nome TelaDadosRepresentanteLegal_Enviar
    O Usuario clica no botao Enviar
    capturar e salvar imagem com o nome TelaDadosRepresentanteLegal_Confirmar
    O Usuario clica no botao Confirmar

o usuario preenche a tela de Dados da Conta
    ${codigo_randomico}=    Generate Random String    9    [UPPER]
    O Usuario informa no campo Conta (Nome) valor igual a ROBOT CONTA ${codigo_randomico}
    O Usuario informa no campo Liquidante (Razão Social) valor igual a BCO ITAU S/A
    O Usuario seleciona na combo Endereço do Custodiante para remessa de documentos fiscais? valor igual a Não
    O Usuario seleciona na combo Cartão de Autógrafos (É Titular?) valor igual a Sim
    O Usuario seleciona na combo Malote (É Titular?) valor igual a Não
    O Usuario informa no campo Malote (Nome da Conta) valor igual a 05000
    O Usuario seleciona na combo Família (Só Consulta?) valor igual a Não
    capturar e salvar imagem com o nome TelaDadosConta_Enviar
    O Usuario clica no botao Enviar
    capturar e salvar imagem com o nome TelaDadosConta_Confirmar
    O Usuario clica no botao Confirmar

o usuario preenche a tela de Dados do Contato Principal (Custodiante)
    ${nome}=       FakerLibrary.name
    O Usuario informa no campo Nome/DRI valor igual a ${nome}
    O Usuario informa no campo Telefone valor igual a 01198776543
    capturar e salvar imagem com o nome TelaDadosContatoPrincipalCustodiante_Enviar
    O Usuario clica no botao Enviar
    capturar e salvar imagem com o nome TelaDadosContatoPrincipalCustodiante_Confirmar
    O Usuario clica no botao Confirmar

O Usuario clica na seta para filtrar o municipio do endereço INR
    Click Element   //input[@id="/Sap/ctp/EntradaRepresentanteLegalInternet:br.com.cetip.infra.atributo.tipo.web.FiltroDeDominio:1:2:java.lang.String"]
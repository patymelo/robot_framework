*** Keywords ***
O usuario acessa menu de manutencao CPIN para incluir uma nova solicitação de impedimento
    O Usuário possui autorização no NoMe para acessar Identificação de Comitentes
    Capture Page Screenshot     img/${TAG_NUMBER}_1Login.png
    E o Usuário acessa o menu Identificação de Comitentes > Administração > Manutenção de Clientes Impedidos > Inclusão de Solicitações
    Capture Page Screenshot     img/${TAG_NUMBER}_2MenuManutencaoCPIN.png
O usuario faz a inclusão da nova solicitação ${TIPO_PESSOA} ${DOC_COMITENTE}
    ${dateFaker}=         FakerLibrary.Date
    ${date}=              Convert To String   ${dateFaker}
    ${date}=              Replace String       ${date}    -   ${EMPTY}
    ${day}=               Get Substring   ${date}   6   8
    ${month}=             Get Substring   ${date}   4   6
    ${year}=              Get Substring   ${date}   0   4
    ${NOMECOMITENTE}=     FakerLibrary.name
    ${NOMEREQUERENTE}=    FakerLibrary.name
    ${VARA}=              FakerLibrary.RandomNumber
    ${BAIRRO}=            FakerLibrary.Street Suffix

    O Usuario seleciona na combo Tipo de Pessoa: valor igual a ${TIPO_PESSOA}
    O Usuario informa no campo CPF/CNPJ: valor igual a ${DOC_COMITENTE}
    O Usuario informa no campo Nome/Razão Social: valor igual a ROBOT ${NOMECOMITENTE}
    O Usuario informa no campo Requerente / Autor: valor igual a ${NOMEREQUERENTE}
    O Usuario informa no campo Vara: valor igual a ${VARA}
    O Usuario informa no campo Data do Ofício valor igual a ${day}${month}${year}
    O Usuario informa no campo Data de Recebimento do Ofício valor igual a ${day}${month}${year}
    O Usuario informa no campo Endereço do Juízo: valor igual a TESTE ENDEREÇO JUIZO
    O Usuario informa no campo Complemento do Endereço: valor igual a ${BAIRRO}
    O Usuario justifica no campo Motivo: valor igual a Teste Bloqueio CPIN ROBOT

    ${DT_FIM_BLOQUEIO}  Run Keyword And Return Status  Variable Should Exist  ${DT_FIM_BLOQUEIO}
    IF  '${DT_FIM_BLOQUEIO}' != 'False'
        ${date}=       Replace String  ${DT_FIM_BLOQUEIO}    -   ${EMPTY}
        ${day}=        Get Substring   ${date}   6   8
        ${month}=      Get Substring   ${date}   4   6
        ${year}=       Get Substring   ${date}   0   4
        O Usuario informa no campo Data Fim do Bloqueio valor igual a ${day}${month}${year}
    END
    ${TIPO_BLOQUEIO}  Run Keyword And Return Status  Variable Should Exist  ${TIPO_BLOQUEIO}
    IF  '${TIPO_BLOQUEIO}' != 'False'
        O Usuario seleciona na combo Tipo do Bloqueio valor igual a ${TIPO_BLOQUEIO}
    END
    O Usuario clica no botao Enviar
    Capture Page Screenshot    img/${TAG_NUMBER}_3BloqueioCPINEnviar.png
    O Usuario clica no botao Confirmar
    Capture Page Screenshot    img/${TAG_NUMBER}_4BloqueioCPINConfirmar.png
O usuario acessa menu de manutencao CPIN para realizar o desempedimento
    O Usuário possui autorização no NoMe para acessar Identificação de Comitentes
    Capture Page Screenshot     img/${TAG_NUMBER}_1Login.png
    E o Usuário acessa o menu Identificação de Comitentes > Administração > Manutenção de Clientes Impedidos > Relação de Solicitações
    Capture Page Screenshot     img/${TAG_NUMBER}_2MenuManutencaoCPIN.png
O usuario faz a busca da solicitação ${TIPO_PESSOA} ${DOC_COMITENTE}
    O Usuario seleciona na combo Tipo de Pessoa: valor igual a ${TIPO_PESSOA}
    O Usuario informa no campo CPF/CNPJ: valor igual a ${DOC_COMITENTE}
    Capture Page Screenshot    img/${TAG_NUMBER}_3FiltroBuscaSolicitacao.png
    O Usuario clica no botao Pesquisar
    Capture Page Screenshot    img/${TAG_NUMBER}_4ResultadoConsulta.png
O usuario executa a ação de desempedimento
    O Usuario seleciona na label Ação: valor igual a DESIMPEDIR
    O Usuario clica na seta da ação
    Capture Page Screenshot    img/${TAG_NUMBER}_5TelaSolicitacaoDesimpedimento.png
    O Usuario clica no botao Enviar
    Capture Page Screenshot    img/${TAG_NUMBER}_6DesimpedimentoCPINEnviar.png
    O Usuario clica no botao Confirmar
    Capture Page Screenshot    img/${TAG_NUMBER}_7DesimpedimentoCPINConfirmar.png
O Usuario clica na seta da ação
    Click Element   //input[@name="command"]
O Usuario clica na seta ${number}
    Click Element   //*[@id="/SIC21/ctp/FormularioPessoaJuridicaNaoResidenteCVMNovoFluxo:br.com.cetip.infra.atributo.tipo.web.FiltroDeDominio:${number}:2:java.lang.String"]
*** Variable ***
${TIPO_ENDERECO}=     RESIDENCIAL
${TIPO_EMAIL}=        PARTICULAR
${BAIRRO}=            CENTRO
${PAIS}=              BRASIL

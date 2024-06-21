*** Settings ***
Resource       ${CURDIR}/Variables/main.resource
Variables      ${CURDIR}/Variables/test_data.yaml
*** Variables ***
${currentDate}         currentDate
${randonDate}          randonDate
${randonDateOfBirth}   randonDateOfBirth
${randonCompanyName}   randonCompanyName
${randonName}          randonName
${randonNameFemale}    randonNameFemale
${randonNameMale}      randonNameMale
${randonCPF}           randonCPF
${randonCNPJ}          randonCNPJ
${randonEmail}         randonEmail
${randonAddress}       randonAddress
${randonBairro}        randonBairro
${randonPostCode}      randonPostCode
${randonPhoneNumber}   randonPhoneNumber
${randonString}        randonString
${randonNumber}        randonNumber
${randonQualificacaoCVM}   randonQualificacaoCVM
${randonJurisdicao}    randonJurisdicao
${randonCNAE}          randonCNAE

${varContaComitente}   varContaComitente
${varParticipante}     varParticipante
${varNomeComitente}    varNomeComitente
${randonCPFComitente}  randonCPFComitente
${randonCNPJComitente}   randonCNPJComitente
${varCpfAlterar}       varCpfAlterar
${varCnpjAlterar}       varCnpjAlterar
${currentDateArq}      currentDateArq
${varGenero}           varGenero
${varNaturalidadeMun}  varNaturalidadeMun
${varEstadoCivil}      varEstadoCivil
${varTipoDoc}          varTipoDoc
${varOrgaoExp}         varOrgaoExp
${varOcupacao}         varOcupacao
${varPPE}              varPPE
*** Keywords ***
Scroll campo ${value}
     Scroll Element Into View   //td[text()='${value}']//following::input[1]
O usuario loga no NoMe como ${PARTICIPANTE}
    IF   "${PARTICIPANTE}" == "ITAUBM"
        O usuario possui acesso ao NoMe como ITAUBM
    ELSE IF   "${PARTICIPANTE}" == "RIOBM"
        O usuario possui acesso ao NoMe como RIOBM
    ELSE
        O usuario possui acesso ao NoMe como CETIP
    END
    Set Global Variable  ${PARTICIPANTE}
Pega valor do campo ${arg_label}
   Wait Until Page Contains        ${arg_label}
   ${textArq}          Get Text          xpath://td[text()='${arg_label}']
   ${inputTextValue}   SeleniumLibrary.Get Element Attribute       xpath://td[text()='${arg_label}']//following::input    value
   [Return]   ${inputTextValue}
Pega valor da combobox ${arg_label}
   Wait Until Page Contains        ${arg_label}
   ${inputText}=       Set Variable   //td[text()='${arg_label}']//following::select[1]
   ${inputTextValue}   Get Selected List Label       xpath://td[text()='${arg_label}']//following::select[1]
   [Return]   ${inputTextValue}
O Usuario informa no campo ${arg_label} a conta ${conta}.${radical}-${digito}
    Wait Until Page Contains        ${arg_label}
    ${inputTextConta}=    Set Variable   //td[text()='${arg_label}']//following::input[1]
    Input Text      ${inputTextConta}    ${conta}
    ${inputTextRadical}=  Set Variable   //td[text()='${arg_label}']//following::input[2]
    Input Text      ${inputTextRadical}    ${radical}
    ${inputTextDigito}=   Set Variable   //td[text()='${arg_label}']//following::input[3]
    Input Text      ${inputTextDigito}    ${digito}
O Usuario informa no campo ${arg_label} valor igual a ${arg_input}
    #Wait Until Page Contains             ${arg_label}
    ${inputText}=   Set Variable   //td[text()='${arg_label}']//following::input[1]
    Input Text      ${inputText}    ${arg_input}
O Usuario seleciona na combo ${arg_label} valor igual a ${arg_input}
    #Wait Until Page Contains             ${arg_label}
    ${arg_input}=              Replace String      ${arg_input}       *?   	            ${SPACE}
    ${inputText}=   Set Variable   //td[text()='${arg_label}']//following::select[1]
    Select From List By label     ${inputText}    ${arg_input}
    #Select From List    ${inputText}    ${arg_input}
O Usuario seleciona na label ${arg_label} valor igual a ${arg_input}
    Wait Until Page Contains             ${arg_label}
    ${inputText}=   Set Variable   //th[text()='${arg_label}']//following::select[1]
    Select From List By label      ${inputText}    ${arg_input}
O Usuario seleciona na label id ${id_label} valor igual a ${arg_input}
    #Wait Until Page Contains         ${arg_label}
    ${inputText}=   Set Variable     //select[@id='e${id_label}']
    Select From List By label        ${inputText}    ${arg_input}
O Usuario justifica no campo ${arg_label} valor igual a ${arg_input}
    #Select Frame       id:main
    Wait Until Page Contains             ${arg_label}
    ${inputText}=   Set Variable   //td[text()='${arg_label}']//following::textarea
    Input Text      ${inputText}    ${arg_input}
O Usuario clica no botao ${acao}
    Click Element   xpath://input[@value="${acao}"]
    #Sleep    1s
O Usuario clica no link ${name}
    Click Element   xpath://a[text()="${name}"]
Então deve retornar a mensagem
    [Arguments]         ${mensagem_esperada}
    Page Should Contain  ${mensagem_esperada}
que eu verifique o campo ${nome_campo} com o valor ${valor}
    Page Should Contain         ${nome_campo}
    Page Should Contain         ${valor}
    ${codigoUnico}=             generate unique code based on current date and time
    ${nomeImagem}=              Catenate            SEPARATOR=_         ${nome_campo}           ${valor}
    ${nomeImagem}=              Replace String      ${nomeImagem}       ${SPACE}   	            ${EMPTY}
    Capture Page Screenshot     img/${TAG_NUMBER}_${codigoUnico}_${nomeImagem}.png
que eu defina a variavel ${VARIAVEL_GLOBAL} com o valor ${VALOR_VARIAVEL_GLOBAL} como uma variavel global
    Set Global Variable         ${${VARIAVEL_GLOBAL}}  ${VALOR_VARIAVEL_GLOBAL}
delete Directory If Exists
    [Arguments]    ${dir_path}
    ${dir_exists}=    Run Keyword And Return Status    Directory Should Exist    ${dir_path}
    Run Keyword If    ${dir_exists}    Remove Directory    ${dir_path}    recursive=True
Abrir navegador chrome e acessar ${url}
    Set Selenium Timeout    10s
    ${chrome options}=    Evaluate    selenium.webdriver.ChromeOptions()
    ...    modules=selenium, selenium.webdriver
    IF  "${OCULTO}" == "SIM"  
        Call Method    ${chrome_options}    add_argument    headless
    END
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    disable-gpu
    Call Method    ${chrome_options}    add_argument    --ignore-certificate-errors
    ${var}=    Call Method    ${chrome_options}    to_capabilities
    Create Webdriver    Chrome    options=${chrome_options}
    Set Browser Implicit Wait    2s
    Go To    ${url}
    Maximize Browser Window 
Verifique se o item ${item} contém ao menos um valor da lista ${lista}
    FOR    ${value}    IN    @{lista}
        ${contains}=    Run Keyword And Return Status    Should Contain    ${item}    ${value}
        IF    ${contains}
            Log    Item '${item}' contains allowed value '${value}'.
            Return From Keyword    ${contains}
        END
    END
    Should Be True    ${contains}    msg=Item ${item} não contém nenhum valor permitido na lista.
O Usuario clica na seta
    Click Element   //input[@name="command"]
capturar e salvar imagem com o nome ${nome_imagem}
    ${codigo_unico}=                        generate unique code based on current date and time
    Capture Page Screenshot    img/${TAG_NUMBER}_${codigo_unico}_${nome_imagem}.png
ordenar e comparar duas listas
    [Documentation]  Recebe duas listas e realiza a comparação
    [Arguments]  ${lista1}  ${lista2}
    Sort List                   ${lista1}
    Sort List                   ${lista2}
    Log                         ${lista1}
    Log                         ${lista2}
    Lists Should Be Equal       ${lista1}    ${lista2}
Busca na tabela ${id} o index da linha que possui os campos ${list_nome_campos}
    ${rownstable}=       SeleniumLibrary.Get Element Count  xpath://table[@id='${id}']/tbody/tr
    ${columnsheader}=    SeleniumLibrary.Get Element Count  xpath://table[@id='${id}']/tbody/tr[2]/td

    Set Global Variable  ${id}
    Set Global Variable  ${columnsheader}

    FOR    ${rowIndexRow}  IN RANGE    2   ${rownstable+1}
        ${valores_row}=    Create List
        FOR  ${rowIndexColumn}  IN RANGE    2   ${columnsheader+1}
            LOG   ${rowIndexRow}
            LOG   ${rowIndexColumn}
            ${curText}     get text     //table[@id='${id}']/tbody/tr[${rowIndexRow}]/td[${rowIndexColumn}]
            LOG   ${curText}
            Append To List    ${valores_row}    ${curText}
        END
        ${contains}=    Run Keyword And Return Status    List Should Contain Sub List    ${valores_row}    ${list_nome_campos}       ignore_case=True
        IF    ${contains}
            ${id_value}=    Set Variable  ${rowIndexRow}
            ${id_value}=    Convert To Integer  ${id_value}
            ${id_value}=    Set Variable   ${id_value-1}
            Set Global Variable  ${id_value}

            ${id_label}=    Set Variable   ${id_value}
            Set Global Variable  ${id_label}
            Exit FOR Loop
        END
    END
Incluir o valor ${valor} na lista ${lista}
	IF      "${valor}" != "${EMPTY}"
        Append To List    ${lista}    ${valor}
    END
    [Return]        ${lista}

#####################################INICIO Geracao arquivo a partir da planilha################
Get row from sheet
    [Documentation]  Gerar linha no arquivo apartir da aba da planilha
    [Arguments]  ${DIR_EXCEL}  ${namePlanilha}
    Open Excel             ${DIR_EXCEL}
    ${rowFile}=            Get data column Excel    ${namePlanilha}
    Generate TXT File      ${rowFile}
Generate TXT File
    [Documentation]  Salvar linha no arquivo TXT
    [Arguments]  ${rowFile}
    Append To File  ${PATH}  ${rowFile}
Get data column Excel
    [Documentation]  Gerar linha pegando a coluna de valor(a1 Exemplo) e tamanho(a2 Tamanho) planilha
    [Arguments]   ${namePlanilha}
    ${strRowCount}=        Get Row Count           ${namePlanilha}

    ${linha}=        Set variable        ${EMPTY}
    FOR     ${colRowIndex}   IN RANGE   1  ${strRowCount}
            #Busca na Coluna 1 o valor do campo
            ${dataValue}     Read Cell Data      ${namePlanilha}  0     ${colRowIndex}
            ${dataValue}=    Convert To String   ${dataValue}
            ${dataValue}=    Replace String      ${dataValue}    .00   ${EMPTY}
            ${dataValue}=    Replace String      ${dataValue}    ,   ${EMPTY}

            #Busca na Coluna 2 o tamanho do campo
            ${dataSize}      Read Cell Data      ${namePlanilha}  1     ${colRowIndex}
            ${dataSize}=     Convert To String   ${dataSize}
            ${dataSize}=     Replace String      ${dataSize}    .00   ${EMPTY}
            ${dataSize}=     Convert To Integer  ${dataSize}

            ${varText}=      Set variable row   ${dataValue}      ${dataSize}
            ${linha}=        Catenate  ${linha}${varText}
            Log  ${linha}
    END
    [Return]   ${linha}\n
Set variable row
    [Documentation]  Gerando valor com dados definidos
    [Arguments]  ${variavel}  ${tamanho}
    LOG  ${variavel}

    IF   "${PARTICIPANTE}" == "ITAUBM" and "${variavel}" == "${varNomeComitente}"
              ${value}=   Set variable size  ARQ ITAUBM${TIPO_COMITENTE}  ${tamanho}
    ELSE IF   "${PARTICIPANTE}" == "ITAUBM" and "${variavel}" == "${varParticipante}"
              ${value}=   Set variable size  ITAUBM  ${tamanho}
    ELSE IF   "${PARTICIPANTE}" == "ITAUBM" and "${variavel}" == "${varContaComitente}"
              ${value}=   Set variable size  73410005  ${tamanho}
    ELSE IF   "${PARTICIPANTE}" == "ITAUBM" and "${variavel}" == "${varGenero}"
              ${value}=   Set variable size  M  ${tamanho}
    ELSE IF   "${PARTICIPANTE}" == "ITAUBM" and "${variavel}" == "${varNaturalidadeMun}"
              ${value}=   Set variable size  355040  ${tamanho}
    ELSE IF   "${PARTICIPANTE}" == "ITAUBM" and "${variavel}" == "${varEstadoCivil}"
              ${value}=   Set variable size  01  ${tamanho}
    ELSE IF   "${PARTICIPANTE}" == "ITAUBM" and "${variavel}" == "${varTipoDoc}"
              ${value}=   Set variable size  01  ${tamanho}
    ELSE IF   "${PARTICIPANTE}" == "ITAUBM" and "${variavel}" == "${varOrgaoExp}"
              ${value}=   Set variable size  SSP  ${tamanho}
    ELSE IF   "${PARTICIPANTE}" == "ITAUBM" and "${variavel}" == "${varOcupacao}"
              ${value}=   Set variable size  107  ${tamanho}
    ELSE IF   "${PARTICIPANTE}" == "ITAUBM" and "${variavel}" == "${varPPE}"
              ${value}=   Set variable size  S  ${tamanho}
    ELSE IF   "${PARTICIPANTE}" == "RIOBM" and "${variavel}" == "${varNomeComitente}"
              ${value}=   Set variable size  ARQ RIOBM${TIPO_COMITENTE}  ${tamanho}
    ELSE IF   "${PARTICIPANTE}" == "RIOBM" and "${variavel}" == "${varParticipante}"
              ${value}=   Set variable size  RIOBM  ${tamanho}
    ELSE IF   "${PARTICIPANTE}" == "RIOBM" and "${variavel}" == "${varContaComitente}"
              ${value}=   Set variable size  05000005  ${tamanho}
    ELSE IF   "${PARTICIPANTE}" == "RIOBM" and "${variavel}" == "${varGenero}"
              ${value}=   Set variable size  F  ${tamanho}
    ELSE IF   "${PARTICIPANTE}" == "RIOBM" and "${variavel}" == "${varNaturalidadeMun}"
              ${value}=   Set variable size  351400  ${tamanho}
    ELSE IF   "${PARTICIPANTE}" == "RIOBM" and "${variavel}" == "${varEstadoCivil}"
              ${value}=   Set variable size  02  ${tamanho}
    ELSE IF   "${PARTICIPANTE}" == "RIOBM" and "${variavel}" == "${varTipoDoc}"
              ${value}=   Set variable size  02  ${tamanho}
    ELSE IF   "${PARTICIPANTE}" == "RIOBM" and "${variavel}" == "${varOrgaoExp}"
              ${value}=   Set variable size  SSR  ${tamanho}
    ELSE IF   "${PARTICIPANTE}" == "RIOBM" and "${variavel}" == "${varOcupacao}"
              ${value}=   Set variable size  225  ${tamanho}
    ELSE IF   "${PARTICIPANTE}" == "RIOBM" and "${variavel}" == "${varPPE}"
              ${value}=   Set variable size  N  ${tamanho}
    ELSE IF  "${PARTICIPANTE}" == "CETIP" and "${variavel}" == "${varNomeComitente}"
              ${value}=   Set variable size  ARQ CETIP${TIPO_COMITENTE}  ${tamanho}
    ELSE IF   "${PARTICIPANTE}" == "CETIP" and "${variavel}" == "${varParticipante}"
              ${value}=   Set variable size  CETIP  ${tamanho}
    ELSE IF   "${PARTICIPANTE}" == "CETIP" and "${variavel}" == "${varContaComitente}"
              ${value}=   Set variable size  10020001  ${tamanho}
    ELSE IF   "${PARTICIPANTE}" == "CETIP" and "${variavel}" == "${varGenero}"
              ${value}=   Set variable size  N  ${tamanho}
    ELSE IF   "${PARTICIPANTE}" == "CETIP" and "${variavel}" == "${varNaturalidadeMun}"
              ${value}=   Set variable size  350530  ${tamanho}
    ELSE IF   "${PARTICIPANTE}" == "CETIP" and "${variavel}" == "${varEstadoCivil}"
              ${value}=   Set variable size  03  ${tamanho}
    ELSE IF   "${PARTICIPANTE}" == "CETIP" and "${variavel}" == "${varTipoDoc}"
              ${value}=   Set variable size  03  ${tamanho}
    ELSE IF   "${PARTICIPANTE}" == "CETIP" and "${variavel}" == "${varOrgaoExp}"
              ${value}=   Set variable size  SSS  ${tamanho}
    ELSE IF   "${PARTICIPANTE}" == "CETIP" and "${variavel}" == "${varOcupacao}"
              ${value}=   Set variable size  241  ${tamanho}
    ELSE IF   "${PARTICIPANTE}" == "CETIP" and "${variavel}" == "${varPPE}"
              ${value}=   Set variable size  F  ${tamanho}
    ELSE IF   "${PARTICIPANTE}" == "ITAUBM" and "${variavel}" == "${randonCPFComitente}"
              ${value}=   Generate CPF with size   ${tamanho}
              ${CPF_COMITENTE}=   Set variable  ${value}
              Set Global Variable  ${CPF_COMITENTE}
    ELSE IF   "${PARTICIPANTE}" != "ITAUBM" and "${variavel}" == "${randonCPFComitente}"
          ${value}=   Set variable  ${CPF_COMITENTE}
    ELSE IF   "${PARTICIPANTE}" == "ITAUBM" and "${variavel}" == "${randonCNPJComitente}"
              ${value}=   Generate CNPJ with size   ${tamanho}
              ${CNPJ_COMITENTE}=   Set variable  ${value}
              ${CNPJ_COMITENTE}=   Convert To Integer  ${CNPJ_COMITENTE}
              Set Global Variable  ${CNPJ_COMITENTE}
    ELSE IF   "${PARTICIPANTE}" != "ITAUBM" and "${variavel}" == "${randonCNPJComitente}"
          ${value}=   Set variable  ${CNPJ_COMITENTE}
    ELSE IF  "${variavel}" == "${varCpfAlterar}"
          ${value}=   Set variable  ${CPF_COMITENTE}
    ELSE IF  "${variavel}" == "${varCnpjAlterar}"
          ${value}=   Set variable  ${CNPJ_COMITENTE}
    ELSE IF   "${var_amb}" == "dev" and "${variavel}" == "${currentDateArq}"
          ${value}=   Set variable size   20221011   8
    ELSE IF   "${variavel}" == "${currentDateArq}"
          ${value}=   Generate current date format yyyymmdd
          #${value}=   Set variable  20240226
    ELSE IF   "${variavel}" == "${currentDate}"
          ${value}=   Generate current date format yyyymmdd
    ELSE IF   "${variavel}" == "${randonDate}"
          ${value}=   Generate date format yyyymmdd
    ELSE IF   "${variavel}" == "${randonDateOfBirth}"
          ${value}=   Generate dateOfBirth format yyyymmdd
    ELSE IF   "${variavel}" == "${randonCompanyName}"
          ${value}=   Generate companyName with size   ${tamanho}
    ELSE IF   "${variavel}" == "${randonName}"
          ${value}=   Generate name with size   ${tamanho}
    ELSE IF   "${variavel}" == "${randonNameFemale}"
          ${value}=   Generate name female with size   ${tamanho}
    ELSE IF   "${variavel}" == "${randonNameMale}"
          ${value}=   Generate name male with size   ${tamanho}
    ELSE IF   "${variavel}" == "${randonCPF}"
          ${value}=   Generate CPF with size   ${tamanho}
    ELSE IF   "${variavel}" == "${randonCNPJ}"
          ${value}=   Generate CNPJ with size   ${tamanho}
    ELSE IF   "${variavel}" == "${randonEmail}"
          ${value}=   Generate email with size   ${tamanho}
    ELSE IF   "${variavel}" == "${randonAddress}"
          ${value}=   Generate address with size   ${tamanho}
    ELSE IF   "${variavel}" == "${randonBairro}"
          ${value}=   Generate bairro with size   ${tamanho}
    ELSE IF   "${variavel}" == "${randonPostCode}"
          ${value}=   Generate post code with size   ${tamanho}
    ELSE IF   "${variavel}" == "${randonPhoneNumber}"
          ${value}=   Generate phone number with size   ${tamanho}
    ELSE IF   "${variavel}" == "${randonJurisdicao}"
          ${value_list}=      Generate jurisdicao list
          ${value}=           Generate random list with size  ${value_list}  ${tamanho}
    ELSE IF   "${variavel}" == "${randonQualificacaoCVM}"
          ${value_list}=      Generate qualificacaoCVM list
          ${value}=           Generate random list with size  ${value_list}  ${tamanho}
    ELSE IF   "${variavel}" == "${randonCNAE}"
          ${value_list}=      Generate CNAE Arq list
          ${value}=           Generate random list with size  ${value_list}  ${tamanho}
    ELSE IF   "${variavel}" == "${randonString}"
          ${value}=   Generate random string with size   ${tamanho}
    ELSE IF   "${variavel}" == "${randonNumber}"
          ${value}=   Generate random number with size   ${tamanho}
    ELSE
          ${value}=   Set variable size   ${variavel}  ${tamanho}
    END

    LOG   ${value}
    [Return]  ${value}
#####################################FIM Geracao arquivo a partir da planilha################
Get CPF without points ${CPF}
    ${DOC_CPF}    Convert To String   ${CPF}
    ${DOC_CPF}    Replace String      ${DOC_CPF}    .   ${EMPTY}
    ${DOC_CPF}    Replace String      ${DOC_CPF}    -  ${EMPTY}
    [Return]  ${DOC_CPF}
Get CNPJ without points ${CNPJ}
    ${DOC_CNPJ}    Convert To String   ${CNPJ}
    ${DOC_CNPJ}    Replace String      ${DOC_CNPJ}    .   ${EMPTY}
    ${DOC_CNPJ}    Replace String      ${DOC_CNPJ}    -  ${EMPTY}
    ${DOC_CNPJ}    Replace String      ${DOC_CNPJ}    /  ${EMPTY}
    [Return]  ${DOC_CNPJ}
Convert Unicode Word
	[Arguments]		${originalword}
    ${newword} =  Encode String To Bytes  ${originalword}   UTF-8
    ${newword} =  Encode String To Bytes  ${originalword}   ASCII   errors=ignore
	Log	${newword}
	[Return]  ${newword}
Set variable size left zero
    [Documentation]  Gerando zero a esquerda
    [Arguments]  ${variavel}  ${tamanho}
    ${tamanho}=     Convert To Integer    ${tamanho}
    ${lengthVar}=   Get Length     ${variavel}
    ${variavel}=    Evaluate  '{:>0${tamanho}}'.format($variavel, width=${tamanho})
    LOG       ${variavel}
    [Return]  ${variavel}

Set variable size
    [Documentation]  Gerando valor com base no tamanho defenido
    [Arguments]  ${variavel}  ${tamanho}
    #${variavel}     Convert Unicode Word    ${variavel}
    ${lengthVar}=   Get Length     ${variavel}
    IF   ${lengthVar} < ${tamanho}
         ${adiciona} =    Evaluate    ${tamanho}-${lengthVar}
         LOG  ${adiciona}
         ${variavel}=      Set Variable    ${variavel}${SPACE * ${adiciona}}
    ELSE IF   ${lengthVar} > ${tamanho}
         ${variavel} =    Get Substring   ${variavel}   0   ${tamanho}
    END
    #-------------VALIDA TAMANHO---------------------------------
    ${length}=            Get Length     ${variavel}
    #Should Be Equal As Integers          ${length}    ${tamanho}

    LOG       ${variavel}
    [Return]  ${variavel}
Generate name with size
    [Documentation]  Gerando nome com tamanho defenido
    [Arguments]       ${size}
    ${nome} =         FakerLibrary.name
    ${nomeSize}=      Set variable size   ${nome}   ${size}
    ${nomeSize}=      Convert To Upper Case  ${nomeSize}
    LOG       ${nomeSize}
    [Return]  ${nomeSize}
Generate name
    [Documentation]  Gerando nome com tamanho defenido
    ${nome} =         FakerLibrary.name
    ${nomeSize}=      Set variable   ${nome}
    ${nomeSize}=      Convert To Upper Case  ${nomeSize}
    LOG       ${nomeSize}
    [Return]  ${nomeSize}
Generate name female with size
    [Documentation]  Gerando nome femenino com tamanho defenido
    [Arguments]       ${size}
    ${nome} =         FakerLibrary.Name Female
    ${nomeSize}=      Set variable size       ${nome}   ${size}
    ${nomeSize}=      Convert To Upper Case   ${nomeSize}
    LOG       ${nomeSize}
    [Return]  ${nomeSize}
Generate name female
    [Documentation]  Gerando nome femenino com tamanho defenido
    ${nome} =         FakerLibrary.Name Female
    ${nomeSize}=      Set variable   ${nome}
    ${nomeSize}=      Convert To Upper Case   ${nomeSize}
    LOG       ${nomeSize}
    [Return]  ${nomeSize}
Generate name male with size
    [Documentation]  Gerando nome masculino com tamanho defenido
    [Arguments]       ${size}
    ${nome} =         FakerLibrary.Name Male
    ${nomeSize}=      Set variable size      ${nome}   ${size}
    ${nomeSize}=      Convert To Upper Case  ${nomeSize}
    LOG       ${nomeSize}
    [Return]  ${nomeSize}
Generate name male
    [Documentation]  Gerando nome masculino com tamanho defenido
    ${nome} =         FakerLibrary.Name Male
    ${nomeSize}=      Set variable   ${nome}
    ${nomeSize}=      Convert To Upper Case  ${nomeSize}
    LOG       ${nomeSize}
    [Return]  ${nomeSize}
Generate companyName with size
    [Documentation]  Gerando nome empresa com tamanho defenido
    [Arguments]       ${size}
    ${nome} =         FakerLibrary.company
    ${nomeSize}=      Set variable size   ${nome}   ${size}
    ${nomeSize}=      Convert To Upper Case  ${nomeSize}
    LOG       ${nomeSize}
    [Return]  ${nomeSize}
Generate CPF with size
    [Documentation]  Gerando CPF sem ponto com tamanho defenido
    [Arguments]       ${size}
    ${cpfFaker}=      FakerLibrary.cpf
    ${cpfNumber}=     Replace String   	  ${cpfFaker}     .   	${EMPTY}
    ${cpfNumber}=     Replace String   	  ${cpfNumber}    -   	${EMPTY}
    ${cpf}=           Set variable size   ${cpfNumber}   ${size}
    LOG       ${cpf}
    [Return]  ${cpf}
Generate CPF
    [Documentation]  Gerando CPF sem ponto com tamanho defenido
    ${cpfFaker}=      FakerLibrary.cpf
    ${cpfNumber}=     Replace String   	  ${cpfFaker}     .   	${EMPTY}
    ${cpfNumber}=     Replace String   	  ${cpfNumber}    -   	${EMPTY}
    ${cpf}=           Set variable        ${cpfNumber}
    LOG       ${cpf}
    [Return]  ${cpf}
Generate CNPJ with size
    [Documentation]  Gerando CNPJ sem ponto com tamanho defenido
    [Arguments]       ${size}
    ${cnpjFaker}=      FakerLibrary.cnpj
    ${cnpjNumber}=     Replace String   	  ${cnpjFaker}     .   	${EMPTY}
    ${cnpjNumber}=     Replace String   	  ${cnpjNumber}    /   	${EMPTY}
    ${cnpjNumber}=     Replace String   	  ${cnpjNumber}    -   	${EMPTY}
    ${cnpj}=           Set variable size      ${cnpjNumber}   ${size}
    LOG       ${cnpj}
    [Return]  ${cnpj}
Generate email with size
    [Documentation]  Gerando email com tamanho defenido
    [Arguments]       ${size}
    ${emailFaker}=    FakerLibrary.email
    ${email}=         Set variable size      ${emailFaker}   ${size}
    LOG       ${email}
    [Return]  ${email}
Generate address with size
    [Documentation]  Gerando endereco com tamanho defenido
    [Arguments]         ${size}
    ${addressFaker}=    FakerLibrary.Street Name
    ${address}=         Set variable size      ${addressFaker}   ${size}
    LOG       ${address}
    [Return]  ${address}
Generate bairro with size
    [Documentation]  Gerando bairro com tamanho defenido
    [Arguments]         ${size}
    ${bairroFaker}=     FakerLibrary.Street Suffix
    ${bairro}=          Set variable size      ${bairroFaker}   ${size}
    LOG       ${bairro}
    [Return]  ${bairro}
Generate post code with size
    [Documentation]  Gerando CEP com tamanho defenido
    [Arguments]         ${size}
    ${postCodeFaker}=   FakerLibrary.PostCode
    ${postCode}=        Replace String   	   ${postCodeFaker}    -   	${EMPTY}
    ${postCode}=        Set variable size      ${postCode}   ${size}
    LOG       ${postCode}
    [Return]  ${postCode}
Generate phone number with size
    [Documentation]  Gerando telefone com tamanho defenido
    [Arguments]         ${size}
    ${phoneFaker}=      FakerLibrary.phone number
    ${phoneNumber}=     Replace String   	  ${phoneFaker}     .   	${EMPTY}
    ${phoneNumber}=     Replace String   	  ${phoneNumber}    -   	${EMPTY}
    ${phoneNumber}=     Replace String   	  ${phoneNumber}    +55   	${EMPTY}
    ${phoneNumber}=     Replace String   	  ${phoneNumber}    (   	${EMPTY}
    ${phoneNumber}=     Replace String   	  ${phoneNumber}    )   	${EMPTY}
    ${phoneNumber}=     Replace String   	  ${phoneNumber}    ${SPACE}   	${EMPTY}
    ${phoneNumber}=     Get Substring         ${phoneNumber}    2       10
    ${phoneNumber}=     Set variable size     ${phoneNumber}   ${size}
    LOG       ${phoneNumber}
    [Return]  ${phoneNumber}
Generate random string with size
    [Arguments]        ${size}
    ${var}=            Generate Random String  ${size}  [UPPER]
    ${var}=            Set variable size        ${var}   ${size}
     LOG       ${var}
     [Return]  ${var}
Generate random number with size
    [Arguments]        ${size}
    ${var}=            Generate Random String  ${size}  [NUMBERS]
    ${var}=            Set variable size        ${var}   ${size}
    LOG       ${var}
    [Return]  ${var}
Generate current date format ddmmyyyy
    ${date}=           Get Current Date    result_format=%d/%m/%Y
    LOG       ${date}
    [Return]  ${date}
Generate dateOfBirth format ddmmyyyy
    ${dateFaker}=      FakerLibrary.Date Of Birth
    ${date}=           Convert To String   ${dateFaker}
    ${year}=           Get Substring   ${date}   0   4
    ${date}=           Replace String       ${date}    ${year}   1990
    ${date}=           Replace String       ${date}    -   ${EMPTY}
    ${date}=           Set variable size    ${date}    8
    ${day}=            Get Substring   ${date}   6   8
    ${month}=          Get Substring   ${date}   4   6
    LOG       ${date}
    [Return]  ${day}/${month}/1990
Generate current date format yyyymmdd
    ${date}=           Get Current Date    result_format=%Y%m%d
    LOG       ${date}
    [Return]  ${date}
Generate date format yyyymmdd
    ${dateFaker}=      FakerLibrary.Date
    ${date}=           Convert Date  ${dateFaker}  result_format=%Y%m%d
    ${date}=           Convert To String   ${dateFaker}
    ${date}=           Replace String       ${date}    -   ${EMPTY}
    ${date}=           Set variable size    ${date}    8
    LOG       ${date}
    [Return]  ${date}
Generate dateOfBirth format yyyymmdd
    ${dateFaker}=      FakerLibrary.Date Of Birth
    ${date}=           Convert To String   ${dateFaker}
    ${year}=           Get Substring   ${date}   0   4
    ${date}=           Replace String       ${date}    ${year}   1990
    ${date}=           Replace String       ${date}    -   ${EMPTY}
    ${date}=           Set variable size    ${date}    8
    LOG       ${date}
    [Return]  ${date}
Generate Current Date and Time
    ${date_time}=    Get Current Date    result_format=%Y-%m-%d %H:%M:%S
    Log    ${date_time}
    [Return]    ${date_time}
Generate matiral enum
    #@{matiralEnum}=  Create List    SOLTEIRO (A)   CASADO(A) COMUNHAO UNIVERSAL DE BENS   CASADO(A) COMUNHAO PARCIAL DE BENS   CASADO(A) SEPARACAO DE BENS   SEPARADO   DIVORCIADO   VIUVO   UNIÃO ESTÁVEL   DESQUITADO   CASADO(A)
    @{matiralEnum}=  Create List    CASADO(A) COMUNHAO UNIVERSAL DE BENS   CASADO(A) COMUNHAO PARCIAL DE BENS   CASADO(A) SEPARACAO DE BENS   SEPARADO   DIVORCIADO   VIUVO   DESQUITADO   CASADO(A)
    [Return]         ${matiralEnum}
Generate issueAgencyName enum
    @{issueAgencyNameEnum}=  Create List    SSP   SRJ  SJP  SSS   SDF  SPR
    [Return]         ${issueAgencyNameEnum}
Generate typeDoc enum
     @{typeDocEnum}=  Create List    CARTEIRA IDENTIDADE   CARTEIRA TRABALHO   CARTEIRA PROFISSIONAL   PASSAPORTE   CARTEIRA FUNCIONAL   REGISTRO ESTRANGEIRO   CNH   CPF
     [Return]         ${typeDocEnum}
Generate marital status list
    #01 = Solteiro (a);
    #02 = Casado(a) Comunhão Universal de Bens;
    #03 = Casado(a) Comunhão Parcial de Bens;
    #04 = Casado(a) Separação de Bens;
    #05 = Separado(a) Judicialmente;
    #06 = Divorciado(a);
    #07 = Viúvo(a);
    #08 = União Estável;
    #09 = Desquitado(a);
    #10 = Outros
    #11 = Casado
    #99 = A Informar
    @{matiralStatus}=  Create List    01   02   03   04   05   06   07   08   09   10   11
    [Return]           ${matiralStatus}
Generate politicallyExposed list
    @{politicallyExposedCode}=  Create List    VERDADEIRO   FALSO   NAO_INFORMADO
    [Return]           ${politicallyExposedCode}
Generate qualificacaoCVM list
    @{qualificacaoCVM}=  Create List    I   II   III   IV   V
    [Return]           ${qualificacaoCVM}
Generate CNAE list
#    243	BOLSA DE VALORES
#    244	BOLSAS DE MERCADORIAS E FUTUROS
#    245	CAIXA ECONOMICA
#    246	CAIXAS DE LIQUIDACAO E CUSTODIA
#    247	CAPITALIZACAO
#    248	CARTEIRA COMERCIAL
#    249	CARTEIRA DE ARRENDAMENTO MERCANTIL

    @{CNAEList}=  Create List    243   244   245   246   247   248   249
    [Return]           ${CNAEList}
Generate CNAE Arq list
#B06	Extração de petróleo e gás natural
#B07	Extração de minerais metálicos
#B08	Extração de minerais não-metálicos
#B09	Atividades de apoio à extração de minerais
#C10	Fabricação de produtos alimentícios
#C11	Fabricação de bebidas
#C12	Fabricação de produtos do fumo

    @{CNAEList}=  Create List    B06   B07   B08   B09   C10   C11   C12
    [Return]           ${CNAEList}
Generate jurisdicao list
    #001	Andorra
    #002	Anguilla
    #003	Antígua e Barbuda
    #004	Antilhas Holandesas
    #005	Aruba

    @{jurisdicao}=  Create List    001   002   003   004   005
    [Return]           ${jurisdicao}
Generate gender status list
    @{genderStatus}=  Create List    MASCULINO   FEMININO   NAO_BINARIO   PREFIRO_NAO_INFORMAR
    [Return]           ${genderStatus}
Generate ocupacao list
    #107	Servidor das carreiras do Poder Legislativo
    #117	Titular de Cartório
    #106	Diplomata e afins
    #212	Analista de sistemas, desenvolvedor de software, admin. de redes e bancos de dados e outros especialistas em informática (exceto técnicos)
    #225	Médico
    #241	Advogado
    #252	Economista, administrador, contador, auditor e afins
    #253	Profissional de marketing, publicidade e da comercialização
    #410	Bancário, economiário, escriturário, agente, assitente e auxiliar administrativo
    #519	Outros trabalhadores de serviços diversos
    #610	Produtor na exploração agropecuária
    #40	    Policial Militar
    @{matiralStatus}=  Create List    107   117   106   212   225   241   252   253   410   519   610   40
    [Return]           ${matiralStatus}
Generate country list
    #2	AFEGANISTAO
    #3	AFRICA DO SUL
    #4	ALBANIA
    #5	ALEMANHA
    #6	ANDORRA
    #7	ANGOLA
    #8	ANTIGUA E BARBUBA
    #9	ANTILHAS HOLANDESAS
    #10	ARABIA SAUDITA
    #11	ARGELIA
    #12	ARGENTINA
    #13	ARMENIA
    #14	ARUBA
    #15	AUSTRALIA
    #16	AUSTRIA
    #17	AZERBAIJAO
    #18	BAHAMAS
    #19	BAHREIN
    #20	BANGLADESH
    @{country}=  Create List   2   3   4   5   6   7   8   9   10   11  12  13  14  15  16  17  18  19  20
    [Return]           ${country}
Generate city SP list
    @{listCity}=  Create List   638  677  679  681  688  694  695  726  729  731  733  735
    #@{matiralCity}=  Create List   350010  350020  350030  350040  350050  350490  350500  350510  350520  350530  350860  350870  350880  350890  350900  351370  351380  351385  351390  351400  351470  351480  351490  351492  351495  351540  351560  351550  351565  351570  351650  351660  351670  351680  351685  351900  351905  351907  351910  351920  351925  351930  354515  355030  355040  355050
    [Return]           ${listCity}
Generate random list with size
    [Arguments]   ${list}   ${size}
    ${valueRandon}=  Evaluate  random.choice($list)  random
    ${var}=          Set variable size   ${valueRandon}   ${size}
    LOG       ${var}
    [Return]  ${var}
Generate random list
    [Arguments]   ${list}
    ${valueRandon}=  Evaluate  random.choice($list)  random
    ${var}=          Set variable   ${valueRandon}
    LOG       ${var}
    [Return]  ${var}
Generate arq
    [Arguments]     ${NOME_ARQ}   ${DIR}
    ${DATA}=             Generate current date format yyyymmdd
    ${NOME_ARQUIVO}=     Set variable   ${NOME_ARQ}${DATA}.txt
    Set Global Variable  ${NOME_ARQUIVO}
    ${FILE}=             Set variable   ${DIR}${NOME_ARQUIVO}
    LOG       ${FILE}
    [Return]  ${FILE}
generate unique code based on current date and time
    [Documentation]  Gerando um codigo unico de acordo com a data hora atual
    ${date} =	    Get Current Date	UTC	- 3 hours
    ${codigo}       Convert To String   ${date}
    ${codigo}       Replace String      ${codigo}    .              ${EMPTY}
    ${codigo}       Replace String      ${codigo}    :              ${EMPTY}
    ${codigo}       Replace String      ${codigo}    -              ${EMPTY}
    ${codigo}       Replace String      ${codigo}    ${SPACE}   	${EMPTY}
    [Return]  ${codigo}
Setar tagNumber
    ${NUMBER}=      Convert To Integer  ${NUMBER}
    ${NUMBER}=      Set variable  ${NUMBER+1}
    Set Global Variable  ${NUMBER}
    ${NUMBER}=      Convert To String  ${NUMBER}

    ${TAG_NUMBER}=   Set variable size left zero   ${NUMBER}   4
    ${TAG_NUMBER}=   Catenate   SEPARATOR=   TST   ${TAG_NUMBER}
    [Return]   ${TAG_NUMBER}
Setar numero da TAG
    ${TAG_NUMBER}=        Setar tagNumber
    Set Global Variable   ${TAG_NUMBER}
Total de testes realizados
    ${Resultado}=         Set Variable         ${TAG_NUMBER}
    ${Resultado}=         Replace String       ${TAG_NUMBER}   TST   ${EMPTY}
    ${Resultado}=         Convert To Integer   ${Resultado}
    ${TextoResultado}=    Set Variable         Total de Teste Realizados foi igual a ${Resultado-1}
    Log To Console        ${TextoResultado}
    Log                   ${TextoResultado}
Iniciar Gravacao
    Start Video Recording   alias=${VideoAlias}   name=${VideoName}   size_percentage=1   monitor=1
Parar Gravacao
    Stop Video Recording   alias=${VideoAlias}
Pausar Gravacao
   ScreenCapLibrary.Pause Video Recording   alias=${VideoAlias}
Retomar Gravacao
   ScreenCapLibrary.Resume Video Recording   alias=${VideoAlias}
Atualizacao status Jira ${TEST_EXEC_KEY} ${TEST_KEY} ${TEST_STATUS}
    Atualizar Status    QBEF-${TEST_EXEC_KEY}    QBEF-${TEST_KEY}    ${TEST_STATUS}
Remover log de execução no JIRA ${DIR_LOG} ${NAME_LOG}
    Run Keyword And Ignore Error    Deletar Attachment    QBEF-${TEST_EXEC_KEY}     ${NAME_LOG}
Anexar log de execução no JIRA ${DIR_LOG} ${NAME_LOG}
    Anexar Log Regressivo    QBEF-${TEST_EXEC_KEY}   ${DIR_LOG}   ${NAME_LOG}
Zipar log das imagens ${PATH_IMG} ${NAME_ZIP}
    Create Zip From Files In Directory    ${PATH_IMG}   ${NAME_ZIP}
Remover acento ${string}
    ${string}=   remove_accent  ${string}
    [Return]     ${string}
Remover espacos ${string}
    ${string}=   remove_space   ${string}
    [Return]     ${string}
Deixar minusculo ${string}
    ${string}=   string_lower   ${string}
    [Return]     ${string}
Deixar string sem acento espacos e minusculo ${string}
    ${string}=   Remover acento ${string}
    ${string}=   Remover espacos ${string}
    ${string}=   Deixar minusculo ${string}
    [Return]     ${string}

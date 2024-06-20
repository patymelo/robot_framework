*** Keywords ***
Setar variaveis comitente PJ residente API
    ${DATE}=                  Generate current date format ddmmyyyy
    ${NOME_COMITENTE}=        Generate name male
    ${NOME_COMITENTE}=        Replace String     ${NOME_COMITENTE}     .   	${EMPTY}
    ${NOME_COMITENTE}=        Set Variable       API${PARTICIPANTE}ROBOT ${NOME_COMITENTE}
    ${COD_DEPOSITO}=          Generate random number with size   9
    ${COD_DEPOSITO}=          Convert To Integer  ${COD_DEPOSITO}

    ${DATAFAKE}=              FakerLibrary.DayOfMonth
    ${MESFAKE}=               FakerLibrary.Month
    ${ANOFAKE}=               Set Variable   1998
    ${DATA_CONSTITUICAO}=     Set Variable   02/${MESFAKE}/${ANOFAKE}

    ${ENDERECO}=              Generate address with size         100
    ${ENDERECO}=              Encode String To Bytes  ${ENDERECO}   UTF-8
    ${ENDERECO}=              Decode Bytes To String  ${ENDERECO}   ASCII   errors=ignore
    ${BAIRRO}=                Generate bairro with size          100
    ${NUMERO}=                Generate random number with size   4
    ${NUMERO}=                Convert To Integer  ${NUMERO}
    ${COMPLEMENTO}=           Generate bairro with size          20
    ${CEP}=                   Generate post code with size       9
    ${CITY_SP_LIST}=          Generate city SP list
    ${CITY_SP}=               Generate random list   ${CITY_SP_LIST}
    ${CNAE_LIST}=             Generate CNAE list
    ${CNAE}=                  Generate random list   ${CNAE_LIST}
    ${EMAIL}=                 Generate email with size          50

    Set Global Variable  ${DATE}
    Set Global Variable  ${NOME_COMITENTE}
    Set Global Variable  ${COD_DEPOSITO}
    Set Global Variable  ${DATA_CONSTITUICAO}
    Set Global Variable  ${ENDERECO}
    Set Global Variable  ${BAIRRO}
    Set Global Variable  ${NUMERO}
    Set Global Variable  ${COMPLEMENTO}
    Set Global Variable  ${CEP}
    Set Global Variable  ${CITY_SP}
    Set Global Variable  ${EMAIL}
    Set Global Variable  ${CNAE}

Setar dados no body da API PJ residente
    ${body_alterado}=   Que eu altere o ${body} alterando o valor do campo customerAccountHolderCode no objeto investor para ${CONTA_PARTICIPANTE}
    ${body_alterado}=   Que eu altere o ${body_alterado} alterando o valor do campo updateDate para ${DATE}
    ${body_alterado}=   Que eu altere o ${body_alterado} alterando o valor do campo documentNumber no objeto investor para ${CNPJ_COMITENTE}
    ${body_alterado}=   Que eu altere o ${body_alterado} alterando o valor do campo individualDepositAccountCode no objeto investor para ${COD_DEPOSITO}
    ${body_alterado}=   Que eu altere o ${body_alterado} alterando o valor do campo investorName no objeto investor para ${NOME_COMITENTE}

    ${body_alterado}=   Que eu altere o ${body_alterado} alterando o valor do campo companyStartDate no objeto legalInvestor para ${DATA_CONSTITUICAO}
    ${body_alterado}=   Que eu altere o ${body_alterado} alterando o valor do campo economicActivityCode no objeto legalInvestor para ${CNAE}

    ${body_alterado}=   Que eu altere o ${body_alterado} alterando o valor do campo addressTypeName no objeto legalInvestor.addressLegalInvestor para ${ENDERECO}
    ${body_alterado}=   Que eu altere o ${body_alterado} alterando o valor do campo addressNumber no objeto legalInvestor.addressLegalInvestor para ${NUMERO}
    ${body_alterado}=   Que eu altere o ${body_alterado} alterando o valor do campo addressComplementName no objeto legalInvestor.addressLegalInvestor para ${COMPLEMENTO}
    ${body_alterado}=   Que eu altere o ${body_alterado} alterando o valor do campo neighborhoodName no objeto legalInvestor.addressLegalInvestor para ${BAIRRO}
    #${body_alterado}=   Que eu altere o ${body_alterado} alterando o valor do campo cityCode no objeto legalInvestor.addressLegalInvestor para ${CITY_SP}
    ${body_alterado}=   Que eu altere o ${body_alterado} alterando o valor do campo zipCode no objeto legalInvestor.addressLegalInvestor para ${CEP}
    ${body_alterado}=   Que eu altere o ${body_alterado} alterando o valor do campo emailName no objeto legalInvestor.addressLegalInvestor.emailLegalInvestor para ${EMAIL}
    [Return]    ${body_alterado}
Setar variaveis comitente PF residente API
    ${COD_DEPOSITO}=          Generate random number with size   9
    ${COD_DEPOSITO}=          Convert To Integer  ${COD_DEPOSITO}
    ${COD_GENDER_LIST}=       Generate gender status list
    ${COD_GENDER}=            Generate random list  ${COD_GENDER_LIST}
    ${COD_CITY_SP_LIST}=      Generate city SP list
    ${COD_CITY_SP}=           Generate random list   ${COD_CITY_SP_LIST}
    ${COD_PROFESSION_LIST}=   Generate ocupacao list
    ${COD_PROFESSION}=        Generate random list   ${COD_PROFESSION_LIST}
    ${COD_PPE_LIST}=          Generate politicallyExposed list
    ${COD_PPE}=               Generate random list   ${COD_PPE_LIST}

    ${MOTHER}=                Generate name female
    ${FATHER}=                Generate name male
    ${NOME_COMITENTE}=        Generate name male
    ${NOME_COMITENTE}=        Replace String     ${NOME_COMITENTE}     .   	${EMPTY}
    ${NOME_COMITENTE}=        Set Variable       API${PARTICIPANTE}ROBOT ${NOME_COMITENTE}
    ${DATE_OF_BIRTH}=         Generate dateOfBirth format ddmmyyyy
    ${ESTADO_CIVIL_LIST}=     Generate matiral enum
    ${ESTADO_CIVIL}=          Generate random list   ${ESTADO_CIVIL_LIST}
    ${TIPO_DOCUMENTO_LIST}=   Generate typeDoc enum
    ${TIPO_DOCUMENTO}=        Generate random list   ${TIPO_DOCUMENTO_LIST}
    ${CPF_DOC}=               Generate CPF
    ${ORGAO_EXPEDIDOR_LIST}=  Generate issueAgencyName enum
    ${ORGAO_EXPEDIDOR}=       Generate random list   ${ORGAO_EXPEDIDOR_LIST}
    ${DATE}=                  Generate current date format ddmmyyyy
    ${NOME_SOCIAL}=           Generate name

    Set Global Variable  ${COD_DEPOSITO}
    Set Global Variable  ${COD_GENDER}
    Set Global Variable  ${COD_CITY_SP}
    Set Global Variable  ${COD_PROFESSION}
    Set Global Variable  ${COD_PPE}
    Set Global Variable  ${MOTHER}
    Set Global Variable  ${FATHER}
    Set Global Variable  ${NOME_COMITENTE}
    Set Global Variable  ${DATE_OF_BIRTH}
    Set Global Variable  ${ESTADO_CIVIL}
    Set Global Variable  ${TIPO_DOCUMENTO}
    Set Global Variable  ${CPF_DOC}
    Set Global Variable  ${ORGAO_EXPEDIDOR}
    Set Global Variable  ${DATE}
    Set Global Variable  ${NOME_SOCIAL}
Setar dados iniciais API alteracao PF
    Define URL Comitente PF residente
    Define conta participante
    Define header alteracao PF
    Crio uma sessao
Setar dados iniciais API inclusao PF
    Define URL Comitente PF residente
    Define conta participante
    Define header inclusao
    Crio uma sessao
Setar dados iniciais API alteracao PJ
    Define URL Comitente PJ residente
    Define conta participante
    Define header alteracao PJ
    Crio uma sessao
Setar dados iniciais API inclusao PJ
    Define URL Comitente PJ residente
    Define conta participante
    Define header inclusao
    Crio uma sessao
Setar dados no body da API PF residente com dados basicos
    ${body_alterado}=   Que eu altere o ${body} alterando o valor do campo customerAccountHolderCode no objeto investor para ${CONTA_PARTICIPANTE}
    ${body_alterado}=   Que eu altere o ${body_alterado} alterando o valor do campo updateDate para ${DATE}
    ${body_alterado}=   Que eu altere o ${body_alterado} alterando o valor do campo documentNumber no objeto investor para ${CPF_COMITENTE}
    ${body_alterado}=   Que eu altere o ${body_alterado} alterando o valor do campo individualDepositAccountCode no objeto investor para ${COD_DEPOSITO}
    [Return]    ${body_alterado}    
Setar dados no body da API PF residente
    ${body_alterado}=   Que eu altere o ${body} alterando o valor do campo customerAccountHolderCode no objeto investor para ${CONTA_PARTICIPANTE}
    ${body_alterado}=   Que eu altere o ${body_alterado} alterando o valor do campo updateDate para ${DATE}
    ${body_alterado}=   Que eu altere o ${body_alterado} alterando o valor do campo documentNumber no objeto investor para ${CPF_COMITENTE}
    ${body_alterado}=   Que eu altere o ${body_alterado} alterando o valor do campo individualDepositAccountCode no objeto investor para ${COD_DEPOSITO}
    #Dados Básicos:
    ${body_alterado}=   Que eu altere o ${body_alterado} alterando o valor do campo motherName no objeto individualInvestor para ${MOTHER}
    ${body_alterado}=   Que eu altere o ${body_alterado} alterando o valor do campo birthDate no objeto individualInvestor para ${DATE_OF_BIRTH}
    ${body_alterado}=   Que eu altere o ${body_alterado} alterando o valor do campo investorName no objeto investor para ${NOME_COMITENTE}
    #Dado do Titular: Dados que os participantes podem modificar,
    ${body_alterado}=   Que eu altere o ${body_alterado} alterando o valor do campo genderCode no objeto individualInvestor para ${COD_GENDER}
    ${body_alterado}=   Que eu altere o ${body_alterado} alterando o valor do campo fatherName no objeto individualInvestor para ${FATHER}
    ${body_alterado}=   Que eu altere o ${body_alterado} alterando o valor do campo birthCityCode no objeto individualInvestor para ${COD_CITY_SP}
    ${body_alterado}=   Que eu altere o ${body_alterado} alterando o valor do campo birthStateCode no objeto individualInvestor para 26
    ${body_alterado}=   Que eu altere o ${body_alterado} alterando o valor do campo maritalStatusCode no objeto individualInvestor para ${ESTADO_CIVIL}
    ${body_alterado}=   Que eu altere o ${body_alterado} alterando o valor do campo documentTypeCode no objeto individualInvestor para ${TIPO_DOCUMENTO}
    ${body_alterado}=   Que eu altere o ${body_alterado} alterando o valor do campo documentNumber no objeto individualInvestor para ${CPF_DOC}
    ${body_alterado}=   Que eu altere o ${body_alterado} alterando o valor do campo documentIssueAgencyName no objeto individualInvestor para ${ORGAO_EXPEDIDOR}
    ${body_alterado}=   Que eu altere o ${body_alterado} alterando o valor do campo documentIssueDate no objeto individualInvestor para ${DATE}
    ${body_alterado}=   Que eu altere o ${body_alterado} alterando o valor do campo professionName no objeto individualInvestor para ${COD_PROFESSION}
    ${body_alterado}=   Que eu altere o ${body_alterado} alterando o valor do campo politicallyExposedPersonCode no objeto individualInvestor para ${COD_PPE}
    ${body_alterado}=   Que eu altere o ${body_alterado} alterando o valor do campo chosenName no objeto individualInvestor para ${NOME_SOCIAL}
    [Return]    ${body_alterado}
Define URL Comitente PF residente

    IF   "${var_amb_api}" == "dev_interno"
        ${URL_API_COMITENTE}=  Set Variable  ${api_comitente.dev}/individuals/residents
        ${NAME_SESSION}=       Set Variable  novaSessaoDevInterno
    ELSE IF  "${var_amb_api}" == "qaa_interno"
        ${URL_API_COMITENTE}=  Set Variable  ${api_comitente.qaa}/individuals/residents
        ${NAME_SESSION}=       Set Variable  novaSessaoQaaInterno
    ELSE IF  "${var_amb_api}" == "qaa_interno_migracao"
        ${URL_API_COMITENTE}=  Set Variable  ${api_comitente_migracao.qaa}/individuals/residents
        ${NAME_SESSION}=       Set Variable  novaSessaoQaaInternoMigracao
    ELSE IF  "${var_amb_api}" == "cert_interno_migracao"
        ${URL_API_COMITENTE}=  Set Variable  ${api_comitente_migracao.cert}/individuals/residents
        ${NAME_SESSION}=       Set Variable  novaSessaoCertInternoMigracao    
    ELSE IF  "${var_amb_api}" == "cert_interno"
        ${URL_API_COMITENTE}=  Set Variable  ${api_comitente.cert}/individuals/residents
        ${NAME_SESSION}=       Set Variable  novaSessaoCertInterno
    ELSE IF  "${var_amb_api}" == "qar_interno"
        ${URL_API_COMITENTE}=  Set Variable  ${api_comitente.qar}/individuals/residents
        ${NAME_SESSION}=       Set Variable  novaSessaoQarInterno
    ELSE IF  "${var_amb_api}" == "qaa_digibee"
        ${URL_API_COMITENTE}=  Set Variable  ${api_digibee.qaa}/individuals/residents
        ${NAME_SESSION}=       Set Variable  novaSessaoQaaDigibee
    ELSE IF  "${var_amb_api}" == "cert_digibee"
        ${URL_API_COMITENTE}=  Set Variable  ${api_digibee.cert}/individuals/residents
        ${NAME_SESSION}=       Set Variable  novaSessaoCertDigibee
    ELSE IF  "${var_amb_api}" == "qar_digibee"
        ${URL_API_COMITENTE}=  Set Variable  ${api_digibee.qar}/individuals/residents
        ${NAME_SESSION}=       Set Variable  novaSessaoQarDigibee
    ELSE
        ${URL_API_COMITENTE}=  Set Variable  ${EMPTY}
        ${NAME_SESSION}=  Set Variable  ${EMPTY}
    END
    Set Global Variable  ${URL_API_COMITENTE}
    Set Global Variable  ${NAME_SESSION}
Define URL Comitente PJ residente

    IF   "${var_amb_api}" == "dev_interno"
        ${URL_API_COMITENTE}=  Set Variable  ${api_comitente.dev}/legal-investors/residents
        ${NAME_SESSION}=       Set Variable  novaSessaoDevInterno
    ELSE IF  "${var_amb_api}" == "qaa_interno"
        ${URL_API_COMITENTE}=  Set Variable  ${api_comitente.qaa}/legal-investors/residents
        ${NAME_SESSION}=       Set Variable  novaSessaoQaaInterno
    ELSE IF  "${var_amb_api}" == "qaa_interno_migracao"
        ${URL_API_COMITENTE}=  Set Variable  ${api_comitente_migracao.qaa}/legal-investors/residents
        ${NAME_SESSION}=       Set Variable  novaSessaoQaaInternoMigracao
    ELSE IF  "${var_amb_api}" == "cert_interno"
        ${URL_API_COMITENTE}=  Set Variable  ${api_comitente.cert}/legal-investors/residents
        ${NAME_SESSION}=       Set Variable  novaSessaoCertInterno
    ELSE IF  "${var_amb_api}" == "qar_interno"
        ${URL_API_COMITENTE}=  Set Variable  ${api_comitente.qar}/legal-investors/residents
        ${NAME_SESSION}=       Set Variable  novaSessaoQarInterno
    ELSE IF  "${var_amb_api}" == "qaa_digibee"
        ${URL_API_COMITENTE}=  Set Variable  ${api_digibee.qaa}/legal-investors/residents
        ${NAME_SESSION}=       Set Variable  novaSessaoQaaDigibee
    ELSE IF  "${var_amb_api}" == "cert_digibee"
        ${URL_API_COMITENTE}=  Set Variable  ${api_digibee.cert}/legal-investors/residents
        ${NAME_SESSION}=       Set Variable  novaSessaoCertDigibee
    ELSE IF  "${var_amb_api}" == "qar_digibee"
        ${URL_API_COMITENTE}=  Set Variable  ${api_digibee.qar}/legal-investors/residents
        ${NAME_SESSION}=       Set Variable  novaSessaoQarDigibee
    ELSE
        ${URL_API_COMITENTE}=  Set Variable  ${EMPTY}
        ${NAME_SESSION}=  Set Variable  ${EMPTY}
    END
    Set Global Variable  ${URL_API_COMITENTE}
    Set Global Variable  ${NAME_SESSION}
Define URL Imercado
    IF   "${var_amb_api}" == "dev_interno"
        ${URL_API_IMERCADOV1}=   Set Variable  ${api_imercadov1.dev}
        ${URL_API_IMERCADOV2}=   Set Variable  ${api_imercadov2.dev}
        ${NAME_SESSION}=       Set Variable  novaSessaoDevInterno
    ELSE IF  "${var_amb_api}" == "qaa_interno"
        ${URL_API_IMERCADOV1}=   Set Variable  ${api_imercadov1.qaa}
        ${URL_API_IMERCADOV2}=   Set Variable  ${api_imercadov2.qaa}
        ${NAME_SESSION}=       Set Variable  novaSessaoQaaInterno
    ELSE IF  "${var_amb_api}" == "cert_interno"
        ${URL_API_IMERCADOV1}=   Set Variable  ${api_imercadov1.cert}
        ${URL_API_IMERCADOV2}=   Set Variable  ${api_imercadov2.cert}
        ${NAME_SESSION}=       Set Variable  novaSessaoCertInterno
    ELSE IF  "${var_amb_api}" == "qar_interno"
        ${URL_API_IMERCADOV1}=   Set Variable  ${api_imercadov1.qar}
        ${URL_API_IMERCADOV2}=   Set Variable  ${api_imercadov2.qar}
        ${NAME_SESSION}=       Set Variable  novaSessaoQarInterno
    ELSE
        ${URL_API_IMERCADOV1}=  Set Variable  ${EMPTY}
        ${URL_API_IMERCADOV2}=  Set Variable  ${EMPTY}
        ${NAME_SESSION}=  Set Variable  ${EMPTY}
    END
    Set Global Variable  ${URL_API_IMERCADOV1}
    Set Global Variable  ${URL_API_IMERCADOV2}
    Set Global Variable  ${NAME_SESSION}
Define conta participante
    IF   "${PARTICIPANTE}" == "ITAUBM"
         ${CONTA_PARTICIPANTE}=     Set Variable   73410.00-5
         ${token_api}=              Set Variable   ${token_api_itaubm}
         Set Global Variable  ${token_api}
     ELSE IF   "${PARTICIPANTE}" == "RIOBM"
         ${CONTA_PARTICIPANTE}=     Set Variable   05000.00-5
         ${token_api}=              Set Variable   ${token_api_riobm}
         Set Global Variable  ${token_api}
    ELSE
         ${CONTA_PARTICIPANTE}=     Set Variable   10020.00-1
    END
    Set Global Variable  ${CONTA_PARTICIPANTE}
Define header inclusao
    IF   "${var_amb_api}" == "dev_interno"
        ${headers}=  Create Dictionary    Content-Type=application/json;charset=UTF8   x-b3-apikey=CETIPAPIDEV
    ELSE IF   "${var_amb_api}" == "qaa_interno"
        ${headers}=  Create Dictionary    Content-Type=application/json;charset=UTF8   x-b3-apikey=${apikey}
    ELSE IF   "${var_amb_api}" == "qaa_interno_migracao"
    Log   ${token_api}
        ${headers}=  Create Dictionary    Content-Type=application/json;charset=UTF8   Authorization=Bearer ${token_api}
    ELSE IF   "${var_amb_api}" == "qaa_cert"
        ${headers}=  Create Dictionary    Content-Type=application/json;charset=UTF8   x-b3-apikey=${apikey}
    ELSE
        ${headers}=  Create Dictionary    Content-Type=application/json;charset=UTF8   Authorization=Bearer ${token_api}
    END
    Log          ${headers}
    Set Global Variable  ${headers}
Define header alteracao
    IF   "${var_amb_api}" == "dev_interno"
        ${headers}=  Create Dictionary    Content-Type=application/json;charset=UTF8   x-b3-apikey=CETIPAPIDEV   investorCustomerAccountHolderCode=${CONTA_PARTICIPANTE}   investorDocumentNumber=${CNPJ_COMITENTE}
    ELSE IF   "${var_amb_api}" == "qaa_interno"
        ${headers}=    Create Dictionary    Content-Type=application/json;charset=UTF8   x-b3-apikey=${apikey}   investorCustomerAccountHolderCode=${CONTA_PARTICIPANTE}   investorDocumentNumber=${CNPJ_COMITENTE}
    ELSE IF   "${var_amb_api}" == "qaa_interno_migracao"
        ${headers}=  Create Dictionary    Content-Type=application/json;charset=UTF8    Authorization=Bearer ${token_api}    investorCustomerAccountHolderCode=${CONTA_PARTICIPANTE}   investorDocumentNumber=${CNPJ_COMITENTE}
    ELSE IF   "${var_amb_api}" == "qaa_cert"
        ${headers}=    Create Dictionary    Content-Type=application/json;charset=UTF8   x-b3-apikey=${apikey}   investorCustomerAccountHolderCode=${CONTA_PARTICIPANTE}   investorDocumentNumber=${CNPJ_COMITENTE}
    ELSE
        ${headers}=  Create Dictionary    Content-Type=application/json;charset=UTF8    Authorization=Bearer ${token_api}    investorCustomerAccountHolderCode=${CONTA_PARTICIPANTE}   investorDocumentNumber=${CNPJ_COMITENTE}
    END
    Log          ${headers}
    Set Global Variable  ${headers}
Define header alteracao PF
    IF   "${var_amb_api}" == "dev_interno"
        ${headers}=  Create Dictionary    Content-Type=application/json;charset=UTF8   x-b3-apikey=${apikey}   investorCustomerAccountHolderCode=${CONTA_PARTICIPANTE}   investorDocumentNumber=${CPF_COMITENTE}
    ELSE IF   "${var_amb_api}" == "qaa_interno"
        ${headers}=    Create Dictionary    Content-Type=application/json;charset=UTF8   x-b3-apikey=${apikey}   investorCustomerAccountHolderCode=${CONTA_PARTICIPANTE}   investorDocumentNumber=${CPF_COMITENTE}
    ELSE IF   "${var_amb_api}" == "qaa_interno_migracao"
        ${headers}=  Create Dictionary    Content-Type=application/json;charset=UTF8    Authorization=Bearer ${token_api}    investorCustomerAccountHolderCode=${CONTA_PARTICIPANTE}   investorDocumentNumber=${CPF_COMITENTE}
    ELSE IF   "${var_amb_api}" == "qaa_cert"
        ${headers}=    Create Dictionary    Content-Type=application/json;charset=UTF8   x-b3-apikey=${apikey}   investorCustomerAccountHolderCode=${CONTA_PARTICIPANTE}   investorDocumentNumber=${CPF_COMITENTE}
    ELSE
        ${headers}=  Create Dictionary    Content-Type=application/json;charset=UTF8    Authorization=Bearer ${token_api}    investorCustomerAccountHolderCode=${CONTA_PARTICIPANTE}   investorDocumentNumber=${CPF_COMITENTE}
    END
    Log          ${headers}
    Set Global Variable  ${headers}
Define header alteracao PJ
    IF   "${var_amb_api}" == "dev_interno"
        ${headers}=  Create Dictionary    Content-Type=application/json;charset=UTF8   x-b3-apikey=${apikey}   investorCustomerAccountHolderCode=${CONTA_PARTICIPANTE}   investorDocumentNumber=${CNPJ_COMITENTE}
    ELSE IF   "${var_amb_api}" == "qaa_interno"
        ${headers}=    Create Dictionary    Content-Type=application/json;charset=UTF8   x-b3-apikey=${apikey}   investorCustomerAccountHolderCode=${CONTA_PARTICIPANTE}   investorDocumentNumber=${CNPJ_COMITENTE}
    ELSE IF   "${var_amb_api}" == "qaa_interno_migracao"
        ${headers}=  Create Dictionary    Content-Type=application/json;charset=UTF8    Authorization=Bearer ${token_api}    investorCustomerAccountHolderCode=${CONTA_PARTICIPANTE}   investorDocumentNumber=${CNPJ_COMITENTE}
    ELSE IF   "${var_amb_api}" == "qaa_cert"
        ${headers}=    Create Dictionary    Content-Type=application/json;charset=UTF8   x-b3-apikey=${apikey}   investorCustomerAccountHolderCode=${CONTA_PARTICIPANTE}   investorDocumentNumber=${CNPJ_COMITENTE}
    ELSE
        ${headers}=  Create Dictionary    Content-Type=application/json;charset=UTF8    Authorization=Bearer ${token_api}    investorCustomerAccountHolderCode=${CONTA_PARTICIPANTE}   investorDocumentNumber=${CNPJ_COMITENTE}
    END
    Log          ${headers}
    Set Global Variable  ${headers}
Get the API Token
  ${url}=   Set Variable  https://apspos89101u.internalenv.corp:4443/api/oauth/token
  ${headers}      Create Dictionary     X-SSL-Client-Cert-Subject=CN=6760-20876,OU=CAAP-CPR,O=B3 SA,L=Sao Paulo,ST=SP,C=BR   Cache-Control=no-cache   Content-Type=application/x-www-form-urlencoded   User-Agent=PostmanRuntime/7.36.0
  ${cert_path}=  Set Variable   C:\\work\\cert\\certBTG.pem
  ${key_path}=   Set Variable   C:\\work\\cert\\certBTGkey.pem
  @{client certs}=  create list  ${cert_path}  ${key_path}
  #Create Client Cert Session   alias=gerarToken   url=${url}   headers=${headers}  disable_warnings=1  client_certs=${client certs}  verify=False
  Create Session  alias=gerarToken   url=${url}   headers=${headers}  disable_warnings=1  verify=${CURDIR}${/}cert${/}apspos89101u.pem
  ${resp}         POST On Session   alias=gerarToken   url=${url}
  ...                          data={"grant_type": "client_credentials","client_id": "1702ef27-c9e7-4d6f-82b4-a02d5b036824","client_secret": "8b568469-6f69-4339-b6a8-ff26d41620eb"}
  ...                          headers=${headers}
  ${token}        Get From Dictionary    ${resp.json()["data"]}    token
  Set Suite Variable    ${TOKEN}
Que eu crie um novo body a partir de um ${file}
    ${body}                 Load Json From File         ${file}
    [Return]    ${body}  
Crio uma sessao
    ${cert_path}=     Set Variable   ${CURDIR}\\certificado\\6536-101125512.pem
    ${key_path}=      Set Variable   ${CURDIR}\\certificado\\6536-101125512.key
    @{client certs}=  create list    ${cert_path}  ${key_path}
    Create Client Cert Session
    ...    alias=${NAME_SESSION}
    ...    url=${URL_API_COMITENTE}
    ...    headers=${headers}
    ...    disable_warnings=True
    ...    verify=${True}
    ...    client_certs=${client certs}
Dado Que eu chame a api de alteração de comitente PF residente
    Setar dados iniciais API alteracao PF
Dado Que eu chame a api de alteração de comitente PF residente passando a apiKey ${apikey}
    Set Global Variable   ${apikey}
    Setar dados iniciais API alteracao PF
Dado Que eu chame a api de inclusão de comitente PF residente
    Setar dados iniciais API inclusao PF
Dado Que eu chame a api de inclusão de comitente PF residente passando a apiKey ${apikey}
    Set Global Variable   ${apikey}
    Setar dados iniciais API inclusao PF
Dado Que eu chame a api de inclusão de comitente PJ residente
    Setar dados iniciais API inclusao PJ
Dado Que eu chame a api de inclusão de comitente PJ residente passando a apiKey ${apikey}
    Set Global Variable   ${apikey}
    Setar dados iniciais API inclusao PJ
Dado Que eu chame a api de alteração de comitente PJ residente
    Setar dados iniciais API alteracao PJ
Dado Que eu chame a api de alteração de comitente PJ residente passando a apiKey ${apikey}
    Set Global Variable   ${apikey}
    Setar dados iniciais API alteracao PJ
Que eu gere um novo CPF e altere o ${json}
    ${novo_cpf}                     FakerLibrary.cpf
    ${body_alterado}=               Update Value To Json                                    ${json}                             $.data.investor.documentNumber      ${novo_cpf}
    [Return]    ${body_alterado}

Que eu faça uma chamada PUT enviando o ${body}
    ${resposta}=    PUT On Session         alias=${NAME_SESSION}     url=${URL_API_COMITENTE}                              json=${body}
    Log          ${resposta}
    [Return]    ${resposta}

Que eu faça uma chamada POST enviando o ${body}
    ${resposta}=    POST On Session         alias=${NAME_SESSION}     url=${URL_API_COMITENTE}                              json=${body}
    Log         ${resposta}
    [Return]    ${resposta}

Que eu faça uma chamada GET para o Imercado passando cpf na url
    Define URL Imercado
    ${headers}=  Create Dictionary    Content-Type=application/json;charset=UTF8

    Log          ${headers}
    Create Session   alias=${NAME_SESSION}   url=${URL_API_IMERCADOV1}   headers=${headers}

    ${resposta}=    GET On Session         alias=${NAME_SESSION}     url=${URL_API_IMERCADOV1}${CPF}
    Log         ${resposta}
    [Return]    ${resposta}

Que eu faça uma chamada GET para o Imercado passando cpf no header
    Define URL Imercado
    ${headers}=  Create Dictionary    Content-Type=application/json;charset=UTF8   documentNumber=${CPF}
    Log          ${headers}
    Create Session   alias=${NAME_SESSION}   url=${URL_API_IMERCADOV2}   headers=${headers}

    ${resposta}=    GET On Session          alias=${NAME_SESSION}     url=${URL_API_IMERCADOV2}
    Log         ${resposta}
    [Return]    ${resposta}

Que eu faça uma chamada GET para o Imercado passando cpf no header com erro de negocio
    Define URL Imercado
    ${headers}=  Create Dictionary    Content-Type=application/json;charset=UTF8   documentNumber=${CPF}
    Log          ${headers}
    Create Session   alias=${NAME_SESSION}   url=${URL_API_IMERCADOV2}   headers=${headers}

    ${resposta}=    GET On Session         alias=${NAME_SESSION}     url=${URL_API_IMERCADOV2}        expected_status=422
    Log         ${resposta.json()}
    [Return]    ${resposta}

Que eu altere o ${json} alterando o valor do campo ${nomeCampo} no objeto ${nomeObjeto} para ${novoValor}
    ${body_alterado}=                       Update Value To Json                                    ${json}                             $.data.${nomeObjeto}.${nomeCampo}      ${novoValor}
    Log         ${body_alterado}
    [Return]    ${body_alterado}
Que eu altere o ${json} alterando o valor do campo ${nomeCampo} para ${novoValor}
    ${body_alterado}=                       Update Value To Json                                    ${json}                             $.data.${nomeCampo}      ${novoValor}
    Log         ${body_alterado}
    [Return]    ${body_alterado}
Que eu faça uma chamada PUT enviando o ${body} com erro de negocio
    ${resposta}=    PUT On Session          alias=${NAME_SESSION}     url=${URL_API_COMITENTE}       json=${body}        expected_status=422
    Log         ${resposta.json()}
    [Return]    ${resposta}
Que eu faça uma chamada POST enviando o ${body} com erro de negocio
    ${resposta}=    POST On Session          alias=${NAME_SESSION}     url=${URL_API_COMITENTE}       json=${body}        expected_status=422
    Log         ${resposta.json()}
    [Return]    ${resposta}
Que eu remova do ${json} o campo ${nomeCampo} no objeto ${nomeObjeto}
    ${body_alterado}=       Delete Object From Json     ${json}     $.data.${nomeObjeto}.${nomeCampo}
    Log         ${body_alterado}
    [Return]    ${body_alterado}
Que eu remova do ${json} o campo ${nomeCampo}
    ${body_alterado}=       Delete Object From Json     ${json}     $.data.${nomeCampo}
    Log         ${body_alterado}
    [Return]    ${body_alterado}
Que eu busque do ${json} o valor do campo ${nomeCampo}
    ${value}=       Get Value From Json     ${json}     $.data.${nomeCampo}
    Log         ${value}
    [Return]    ${value}
Que eu busque do ${json} o valor do campo ${nomeCampo} no objeto ${nomeObjeto}
    ${value}=       Get Value From Json     ${json}     $.data.${nomeObjeto}.${nomeCampo}
    Log         ${value}
    [Return]    ${value}
Que a ${resposta} tenha no erro o valor "${campoValor}"
    Log                     ${resposta.text}
    Log                     ${campoValor}
    Should Contain          ${resposta.text}        ${campoValor}

Que eu altere a key ${key} no dicionario ${dicionario} para o valor ${value}
    Log                                 ${dicionario}
    #Remove a key antiga
    Dictionary Should Contain Key       ${dicionario}               ${key}
    Remove From Dictionary              ${dicionario}               ${key}
    #Incluir a key nova
    Set To Dictionary                   ${dicionario}               ${key}=${value}
    Dictionary Should Contain Key       ${dicionario}               ${key}
    Dictionary Should Contain Value     ${dicionario}               ${value}

    [Return]    ${dicionario}

Então a chamada deve ter status ${status}
    Status Should Be   ${status}     ${resposta}

*** Settings ***
Documentation       Teste para testar a API Comitente PF Residente /individuals/residents 
Suite Setup         Run KeyWords
Resource            ${CURDIR}\\..\\..\\..\\..\\GENERIC_VAR\\Keywords.robot
Resource            ${CURDIR}\\..\\..\\..\\..\\GENERIC_VAR\\KeywordsAPI.robot
Resource            ${CURDIR}\\..\\..\\..\\..\\GENERIC_VAR\\shared\\API\\suit_setup_post_api_individual.robot
Resource            ${CURDIR}\\..\\..\\..\\..\\GENERIC_VAR\\template\\API\\template_post_api_individual.robot
Resource            ${CURDIR}\\..\\..\\..\\..\\GENERIC_VAR\\shared\\API\\suit_setup_post_api_individual.robot
Resource            ${CURDIR}\\..\\..\\..\\..\\GENERIC_VAR\\template\\API\\template_validar_dominio.robot
Resource            ${CURDIR}\\..\\..\\..\\..\\GENERIC_VAR\\template\\API\\template_validar_campo_obrigatorio.robot
Resource            ${CURDIR}\\..\\..\\..\\..\\GENERIC_VAR\\template\\API\\template_validar_regras.robot
Resource            ${CURDIR}\\..\\..\\..\\..\\GENERIC_VAR\\template\\API\\template_validar_tamanho.robot
Test Teardown       Total de testes realizados
Suite Teardown      Run KeyWords
 

*** Test Cases ***
TST0001: PF RESIDENTE (API) - Inclusão Dados Minimos Preenchidos
    [Setup]       Dado que eu faça a chamada da API de Comitente PF com json minimo
    [Template]    Template cadastro api comitente PF Residente minimo com campos aleatorios
    #PARTICIPANTE      #DONO      #CPF_COMITENTE      #API_KEY      #RETORNO
    ITAUBM             SIM        Aleatorio           ITAUAPIINT    200
    RIOBM              NAO        ${EMPTY}            RIOAPIINT     200
TST0002: PF RESIDENTE (API) - Inclusão Dados Minimos Preenchidos com campos NULL
    [Setup]       Dado que eu monte o payload de um novo Comitente PF Residente com json completo NULL e preenchendo somente o mínimo de dados obrigatórios
    [Template]    Template cadastro api comitente PF Residente minimo com campos aleatorios
    #PARTICIPANTE      #DONO      #CPF_COMITENTE      #API_KEY      #RETORNO
    ITAUBM             SIM        Aleatorio           ITAUAPIINT    200
    RIOBM              NAO        ${EMPTY}            RIOAPIINT     200    

T0003: PF RESIDENTE (API) - Inclusão Dados Maximos Preenchidos
    [Setup]       Dado que eu faça a chamada da API de Comitente PF com json completo
    [Template]    Template cadastro api comitente PF Residente completo sem campos aleatorios
    #PARTICIPANTE      #DONO      #CPF_COMITENTE      #API_KEY      #RETORNO
    ITAUBM             SIM        Aleatorio           ITAUAPIINT    200
    RIOBM              NAO        ${EMPTY}            RIOAPIINT     200
    ITAUBM             SIM        Aleatorio           ITAUAPIINT    200

T0003: PF RESIDENTE (API) - Inclusão Dados Maximos Preenchidos com campos NULL
    [Setup]       Dado que eu monte o payload de um novo Comitente PF Residente com json completo NULL e preenchendo somente o mínimo de dados obrigatórios
    [Template]    Template cadastro api comitente PF Residente completo sem campos aleatorios
    #PARTICIPANTE      #DONO      #CPF_COMITENTE      #API_KEY      #RETORNO
    ITAUBM             SIM        Aleatorio           ITAUAPIINT    200
    RIOBM              NAO        ${EMPTY}            RIOAPIINT     200
    ITAUBM             SIM        Aleatorio           ITAUAPIINT    200    
T0004: PF RESIDENTE (API) - Valida Dominio Invalido
    [Setup]       Dado que eu faça a chamada da API de Comitente PF com json completo
    [Template]   Template Domínio Campos - Validar que response retornou com erro 422
    customerAccountHolderCode                 ${investor}                            000000.01-0	        POST			#Titular da Conta Cliente (Conta Própria)
    residenceCountryCode                      ${investor}                            2	                    POST			#País de Residência Valores Aceitos: 1
    taxNatureCode                             ${investor}                            Isentoo	            POST			#Natureza Fiscal Valores Aceitos: "Isento" e "Tributável"
    currencyCode                              ${equitySituation}                     10	                    POST			#Moeda Valores aceitos: Consultar Planilha "DominioMoeda.xlsx"
    annualIncomeValue                         ${equitySituation}                     1122334455661.123      POST			#Valor da Renda Anual Valores aceitos:  Mascara (12.2)
    equityValue                               ${equitySituation}                     1122334455661.123      POST			#Valor da Situação Patrimonial Valores aceitos:  Mascara (12.2)
    lastYearBillingValue                      ${equitySituation}                     1122334455661.123      POST			#Capacidade Financeira Valores aceitos:  Mascara (12.2)
    relatedCountryCode                        ${fatca}                               266                    POST			#País envolvido/relacionado Valores aceitos: Consultar Planilha "DominioPais.xlsx"
    originCountryCode                         ${fatca}                               266                    POST			#País de Origem do Investidor Valores aceitos: Consultar Planilha "DominioPais.xlsx"
    genderCode                                ${individualInvestor}                  NENHUM	                POST			#Gênero Valores aceitos:  "MASCULINO","FEMININO","NAO_BINARIO","PREFIRO_NAO_INFORMAR"
    maritalStatusCode                         ${individualInvestor}                  OUTROS	                POST			#Estado Civil Valores aceitos: Consultar Planilha "Enuns.xlsx"
    maritalStatusCode                         ${individualInvestor}                  A REGULARIZAR          POST			#Estado Civil Valores aceitos: Consultar Planilha "Enuns.xlsx"
    birthStateCode                            ${individualInvestor}                  99                     POST			#Naturalidade (UF) Valores aceitos: Consultar Planilha "DominioMunicipioUF.xlsx"
    birthStateCode                            ${individualInvestor}                  0                      POST			#Naturalidade (UF) Valores aceitos: Consultar Planilha "DominioMunicipioUF.xlsx"
    birthStateCode                            ${individualInvestor}                  28                     POST			#Naturalidade (UF) Valores aceitos: Consultar Planilha "DominioMunicipioUF.xlsx"
    birthCityCode                             ${individualInvestor}                  0                      POST			#Naturalidade (Município) Valores aceitos: Consultar Planilha "DominioMunicipioUF.xlsx"
    birthCityCode                             ${individualInvestor}                  99999                  POST			#Naturalidade (Município) Valores aceitos: Consultar Planilha "DominioMunicipioUF.xlsx"
    birthCityCode                             ${individualInvestor}                  4118                   POST			#Naturalidade (Município) Valores aceitos: Consultar Planilha "DominioMunicipioUF.xlsx"
    birthCountryCode                          ${individualInvestor}                  266                    POST			#Nacionalidade Valores aceitos: Consultar Planilha "DominioPais.xlsx"
    birthCountryCode                          ${individualInvestor}                  215                    POST			#Nacionalidade Valores aceitos: Consultar Planilha "DominioPais.xlsx"
    birthCountryCode                          ${individualInvestor}                  0                      POST			#Nacionalidade Valores aceitos: Consultar Planilha "DominioPais.xlsx"
    relatedPersonIndicator                    ${individualInvestor}                  VERDADEIRO             POST			#Pessoa Vinculada Valores aceitos: true or false
    riskClassificationCode                    ${individualInvestor}                  C                      POST			#Classificação de Risco do Comitente Valores aceitos: Consultar Planilha "Enuns.xlsx"
    professionName                            ${individualInvestor}                  999                    POST			#Ocupação Profissional (Principal) Valores aceitos: Consultar Planilha "DominioOcupacaoProfissional.xlsx"
    professionName                            ${individualInvestor}                  333                    POST			#Ocupação Profissional (Principal) Valores aceitos: Consultar Planilha "DominioOcupacaoProfissional.xlsx"
    documentTypeCode                          ${individualInvestor}                  RG                     POST			#Tipo de Documento de Identificação Valores aceitos: Consultar Planilha "Enuns.xlsx"
    politicallyExposedPersonCode              ${individualInvestor}                  TRUE                   POST			#Pessoa Exposta Politicamente? Valores aceitos: Consultar Planilha "Enuns.xlsx"
    investmentFundAdministratorIndicator      ${individualInvestor}                  VERDADEIRO             POST			#Administrador de Fundos de Investimento?  Valores aceitos: true or false
    usPersonIndicator                         ${individualInvestor}                  VERDADEIRO             POST			#US Person? Valores aceitos: true or false
    administrativePortfolioManagerIndicator   ${individualInvestor}                  VERDADEIRO             POST			#Administrador de Carteiras Administradas? Valores aceitos: true or false
    privateBankIndicator                      ${individualInvestor}                  VERDADEIRO             POST			#Private Bank? Valores aceitos: true or false
    authorizeOrderTransmissionByThird         ${individualInvestor}                  B	                    POST			#Autoriza Transmissão de Ordem por Terceiros? Valores aceitos: ("A","P","N")
    addressTypeCode                           ${addressIndividualInvestor}           PRIVADO                POST			#Tipo de Endereço Valores aceitos: "COMERCIAL", "RESIDENCIAL", "SEM TIPO DE ENDERECO"
    stateCode                                 ${addressIndividualInvestor}           99                     POST			#UF Valores aceitos: Consultar Planilha "DominioMunicipioUF.xlsx"
    stateCode                                 ${addressIndividualInvestor}           0                      POST			#UF Valores aceitos: Consultar Planilha "DominioMunicipioUF.xlsx"
    stateCode                                 ${addressIndividualInvestor}           28                     POST			#UF Valores aceitos: Consultar Planilha "DominioMunicipioUF.xlsx"
    cityCode                                  ${addressIndividualInvestor}           0                      POST			#Tipo Município Valores aceitos: Consultar Planilha "DominioMunicipioUF.xlsx"
    cityCode                                  ${addressIndividualInvestor}           99999                  POST			#Tipo Município Valores aceitos: Consultar Planilha "DominioMunicipioUF.xlsx"
    cityCode                                  ${addressIndividualInvestor}           4118                   POST			#Tipo Município Valores aceitos: Consultar Planilha "DominioMunicipioUF.xlsx"
    countryCode                               ${addressIndividualInvestor}           266                    POST			#País Valores aceitos: Consultar Planilha "DominioPais.xlsx"
    countryCode                               ${addressIndividualInvestor}           215                    POST			#País Valores aceitos: Consultar Planilha "DominioPais.xlsx"
    countryCode                               ${addressIndividualInvestor}           0                      POST			#País Valores aceitos: Consultar Planilha "DominioPais.xlsx"
    emailTypeCode                             ${emailIndividualInvestor}             PRIVADO                POST			#Tipo E-mail Valores aceitos: "COMERCIAL", "PARTICULAR"
    phoneTypeCode                             ${addressPhoneIndividualInvestor}      PRIVADO                POST			#Tipo E-mail Valores aceitos: "COMERCIAL", "PARTICULAR"
    workCompanyIndicator                      ${professionalRelationship}            VERDADEIRO             POST			#Trabalha para alguma empresa?  Valores aceitos: true or false
    investorDeceasedIndicator                 ${inventory}                           VERDADEIRO             POST			#Falecido?  Valores aceitos: true or false
    confirmationDataIndicator                 ${EMPTY}                               VERDADEIRO             POST			#Instituição Financeira confirma as informações cadastrais do cliente?  Valores aceitos: true or false
    emancipatedIndicator                      ${minorResponsible}                    VERDADEIRO             POST			#Emancipado?  Valores aceitos: true or false
    emailTypeCode                             ${emailMinorResponsible}               PRIVADO                POST			#Tipo E-mail - Responsável Menor Valores aceitos: "COMERCIAL", "PARTICULAR"
    phoneTypeCode                             ${privatePhoneMinorResponsible}        PRIVADO                POST			#Tipo Telefone - Responsável Menor Valores aceitos: "COMERCIAL", "PARTICULAR"
    politicallyExposedPersonCode              ${representativeInvestor}              TRUE                   POST			#Pessoa Exposta Politicamente - Representante Valores aceitos: "VERDADEIRO", "FALSO", "NAO_INFORMADO"
    addressTypeCode                           ${addressRepresentativeInvestor}       PRIVADO                POST			#Tipo de Endereço - Representante Valores aceitos: "COMERCIAL", "RESIDENCIAL", "SEM TIPO DE ENDERECO"
    stateCode                                 ${addressRepresentativeInvestor}       99                     POST			#UF - Representante Valores aceitos: Consultar Planilha "DominioMunicipioUF.xlsx"
    stateCode                                 ${addressRepresentativeInvestor}       0                      POST			#UF - Representante Valores aceitos: Consultar Planilha "DominioMunicipioUF.xlsx"
    stateCode                                 ${addressRepresentativeInvestor}       28                     POST			#UF - Representante Valores aceitos: Consultar Planilha "DominioMunicipioUF.xlsx"
    cityCode                                  ${addressRepresentativeInvestor}       0                      POST			#Tipo Município - Representante Valores aceitos: Consultar Planilha "DominioMunicipioUF.xlsx"
    cityCode                                  ${addressRepresentativeInvestor}       99999                  POST			#Tipo Município - Representante Valores aceitos: Consultar Planilha "DominioMunicipioUF.xlsx"
    cityCode                                  ${addressRepresentativeInvestor}       4118                   POST			#Tipo Município - Representante Valores aceitos: Consultar Planilha "DominioMunicipioUF.xlsx"
    countryCode                               ${addressRepresentativeInvestor}       266                    POST			#País - Representante Valores aceitos: Consultar Planilha "DominioPais.xlsx"
    countryCode                               ${addressRepresentativeInvestor}       215                    POST			#País - Representante Valores aceitos: Consultar Planilha "DominioPais.xlsx"
    countryCode                               ${addressRepresentativeInvestor}       0                      POST			#País - Representante Valores aceitos: Consultar Planilha "DominioPais.xlsx"
    emailTypeCode                             ${emailRepresentativeInvestor}         PRIVADO                POST			#Tipo E-mail - Representante Valores aceitos: "COMERCIAL", "PARTICULAR"
    phoneTypeCode                             ${adressPhoneRepresentativeInvestor}   PRIVADO                POST			#Tipo E-mail - Representante Valores aceitos: "COMERCIAL", "PARTICULAR"
T0005: PF RESIDENTE (API) - Valida Dominio Invalido com json campos NULL
    [Setup]       Dado que eu monte o payload de um novo Comitente PF Residente com json completo NULL e preenchendo somente o mínimo de dados obrigatórios
    [Template]    Template Domínio Campos - Validar que response retornou com erro 422
    customerAccountHolderCode                 ${investor}                            000000.01-0	        POST			#Titular da Conta Cliente (Conta Própria)
    residenceCountryCode                      ${investor}                            2	                    POST			#País de Residência Valores Aceitos: 1
    taxNatureCode                             ${investor}                            Isentoo	            POST			#Natureza Fiscal Valores Aceitos: "Isento" e "Tributável"
    currencyCode                              ${equitySituation}                     10	                    POST			#Moeda Valores aceitos: Consultar Planilha "DominioMoeda.xlsx"
    annualIncomeValue                         ${equitySituation}                     1122334455661.123      POST			#Valor da Renda Anual Valores aceitos:  Mascara (12.2)
    equityValue                               ${equitySituation}                     1122334455661.123      POST			#Valor da Situação Patrimonial Valores aceitos:  Mascara (12.2)
    lastYearBillingValue                      ${equitySituation}                     1122334455661.123      POST			#Capacidade Financeira Valores aceitos:  Mascara (12.2)
    relatedCountryCode                        ${fatca}                               266                    POST			#País envolvido/relacionado Valores aceitos: Consultar Planilha "DominioPais.xlsx"
    originCountryCode                         ${fatca}                               266                    POST			#País de Origem do Investidor Valores aceitos: Consultar Planilha "DominioPais.xlsx"
    genderCode                                ${individualInvestor}                  NENHUM	                POST			#Gênero Valores aceitos:  "MASCULINO","FEMININO","NAO_BINARIO","PREFIRO_NAO_INFORMAR"
    maritalStatusCode                         ${individualInvestor}                  OUTROS	                POST			#Estado Civil Valores aceitos: Consultar Planilha "Enuns.xlsx"
    maritalStatusCode                         ${individualInvestor}                  A REGULARIZAR          POST			#Estado Civil Valores aceitos: Consultar Planilha "Enuns.xlsx"
    birthStateCode                            ${individualInvestor}                  99                     POST			#Naturalidade (UF) Valores aceitos: Consultar Planilha "DominioMunicipioUF.xlsx"
    birthStateCode                            ${individualInvestor}                  0                      POST			#Naturalidade (UF) Valores aceitos: Consultar Planilha "DominioMunicipioUF.xlsx"
    birthStateCode                            ${individualInvestor}                  28                     POST			#Naturalidade (UF) Valores aceitos: Consultar Planilha "DominioMunicipioUF.xlsx"
    birthCityCode                             ${individualInvestor}                  0                      POST			#Naturalidade (Município) Valores aceitos: Consultar Planilha "DominioMunicipioUF.xlsx"
    birthCityCode                             ${individualInvestor}                  99999                  POST			#Naturalidade (Município) Valores aceitos: Consultar Planilha "DominioMunicipioUF.xlsx"
    birthCityCode                             ${individualInvestor}                  4118                   POST			#Naturalidade (Município) Valores aceitos: Consultar Planilha "DominioMunicipioUF.xlsx"
    birthCountryCode                          ${individualInvestor}                  266                    POST			#Nacionalidade Valores aceitos: Consultar Planilha "DominioPais.xlsx"
    birthCountryCode                          ${individualInvestor}                  215                    POST			#Nacionalidade Valores aceitos: Consultar Planilha "DominioPais.xlsx"
    birthCountryCode                          ${individualInvestor}                  0                      POST			#Nacionalidade Valores aceitos: Consultar Planilha "DominioPais.xlsx"
    relatedPersonIndicator                    ${individualInvestor}                  VERDADEIRO             POST			#Pessoa Vinculada Valores aceitos: true or false
    riskClassificationCode                    ${individualInvestor}                  C                      POST			#Classificação de Risco do Comitente Valores aceitos: Consultar Planilha "Enuns.xlsx"
    professionName                            ${individualInvestor}                  999                    POST			#Ocupação Profissional (Principal) Valores aceitos: Consultar Planilha "DominioOcupacaoProfissional.xlsx"
    professionName                            ${individualInvestor}                  333                    POST			#Ocupação Profissional (Principal) Valores aceitos: Consultar Planilha "DominioOcupacaoProfissional.xlsx"
    documentTypeCode                          ${individualInvestor}                  RG                     POST			#Tipo de Documento de Identificação Valores aceitos: Consultar Planilha "Enuns.xlsx"
    politicallyExposedPersonCode              ${individualInvestor}                  TRUE                   POST			#Pessoa Exposta Politicamente? Valores aceitos: Consultar Planilha "Enuns.xlsx"
    investmentFundAdministratorIndicator      ${individualInvestor}                  VERDADEIRO             POST			#Administrador de Fundos de Investimento?  Valores aceitos: true or false
    usPersonIndicator                         ${individualInvestor}                  VERDADEIRO             POST			#US Person? Valores aceitos: true or false
    administrativePortfolioManagerIndicator   ${individualInvestor}                  VERDADEIRO             POST			#Administrador de Carteiras Administradas? Valores aceitos: true or false
    privateBankIndicator                      ${individualInvestor}                  VERDADEIRO             POST			#Private Bank? Valores aceitos: true or false
    authorizeOrderTransmissionByThird         ${individualInvestor}                  B	                    POST			#Autoriza Transmissão de Ordem por Terceiros? Valores aceitos: ("A","P","N")
    addressTypeCode                           ${addressIndividualInvestor}           PRIVADO                POST			#Tipo de Endereço Valores aceitos: "COMERCIAL", "RESIDENCIAL", "SEM TIPO DE ENDERECO"
    stateCode                                 ${addressIndividualInvestor}           99                     POST			#UF Valores aceitos: Consultar Planilha "DominioMunicipioUF.xlsx"
    stateCode                                 ${addressIndividualInvestor}           0                      POST			#UF Valores aceitos: Consultar Planilha "DominioMunicipioUF.xlsx"
    stateCode                                 ${addressIndividualInvestor}           28                     POST			#UF Valores aceitos: Consultar Planilha "DominioMunicipioUF.xlsx"
    cityCode                                  ${addressIndividualInvestor}           0                      POST			#Tipo Município Valores aceitos: Consultar Planilha "DominioMunicipioUF.xlsx"
    cityCode                                  ${addressIndividualInvestor}           99999                  POST			#Tipo Município Valores aceitos: Consultar Planilha "DominioMunicipioUF.xlsx"
    cityCode                                  ${addressIndividualInvestor}           4118                   POST			#Tipo Município Valores aceitos: Consultar Planilha "DominioMunicipioUF.xlsx"
    countryCode                               ${addressIndividualInvestor}           266                    POST			#País Valores aceitos: Consultar Planilha "DominioPais.xlsx"
    countryCode                               ${addressIndividualInvestor}           215                    POST			#País Valores aceitos: Consultar Planilha "DominioPais.xlsx"
    countryCode                               ${addressIndividualInvestor}           0                      POST			#País Valores aceitos: Consultar Planilha "DominioPais.xlsx"
    emailTypeCode                             ${emailIndividualInvestor}             PRIVADO                POST			#Tipo E-mail Valores aceitos: "COMERCIAL", "PARTICULAR"
    phoneTypeCode                             ${addressPhoneIndividualInvestor}      PRIVADO                POST			#Tipo E-mail Valores aceitos: "COMERCIAL", "PARTICULAR"
    workCompanyIndicator                      ${professionalRelationship}            VERDADEIRO             POST			#Trabalha para alguma empresa?  Valores aceitos: true or false
    investorDeceasedIndicator                 ${inventory}                           VERDADEIRO             POST			#Falecido?  Valores aceitos: true or false
    confirmationDataIndicator                 ${EMPTY}                               VERDADEIRO             POST			#Instituição Financeira confirma as informações cadastrais do cliente?  Valores aceitos: true or false
    emancipatedIndicator                      ${minorResponsible}                    VERDADEIRO             POST			#Emancipado?  Valores aceitos: true or false
    emailTypeCode                             ${emailMinorResponsible}               PRIVADO                POST			#Tipo E-mail - Responsável Menor Valores aceitos: "COMERCIAL", "PARTICULAR"
    phoneTypeCode                             ${privatePhoneMinorResponsible}        PRIVADO                POST			#Tipo Telefone - Responsável Menor Valores aceitos: "COMERCIAL", "PARTICULAR"
T0006: PF RESIDENTE (API) - Valida Dominio Invalido Representante com json campos NULL
    [Setup]    Dado que eu monte o payload de um novo Comitente PF Residente preenchendo representante com json completo NULL e preenchendo somente o mínimo de dados obrigatórios
    [Template]    Template Domínio Campos - Validar que response retornou com erro 422
    politicallyExposedPersonCode              ${representativeInvestor}              TRUE                   POST			#Pessoa Exposta Politicamente - Representante Valores aceitos: "VERDADEIRO", "FALSO", "NAO_INFORMADO"
    addressTypeCode                           ${addressRepresentativeInvestor}       PRIVADO                POST			#Tipo de Endereço - Representante Valores aceitos: "COMERCIAL", "RESIDENCIAL", "SEM TIPO DE ENDERECO"
    stateCode                                 ${addressRepresentativeInvestor}       99                     POST			#UF - Representante Valores aceitos: Consultar Planilha "DominioMunicipioUF.xlsx"
    stateCode                                 ${addressRepresentativeInvestor}       0                      POST			#UF - Representante Valores aceitos: Consultar Planilha "DominioMunicipioUF.xlsx"
    stateCode                                 ${addressRepresentativeInvestor}       28                     POST			#UF - Representante Valores aceitos: Consultar Planilha "DominioMunicipioUF.xlsx"
    cityCode                                  ${addressRepresentativeInvestor}       0                      POST			#Tipo Município - Representante Valores aceitos: Consultar Planilha "DominioMunicipioUF.xlsx"
    cityCode                                  ${addressRepresentativeInvestor}       99999                  POST			#Tipo Município - Representante Valores aceitos: Consultar Planilha "DominioMunicipioUF.xlsx"
    cityCode                                  ${addressRepresentativeInvestor}       4118                   POST			#Tipo Município - Representante Valores aceitos: Consultar Planilha "DominioMunicipioUF.xlsx"
    countryCode                               ${addressRepresentativeInvestor}       266                    POST			#País - Representante Valores aceitos: Consultar Planilha "DominioPais.xlsx"
    countryCode                               ${addressRepresentativeInvestor}       215                    POST			#País - Representante Valores aceitos: Consultar Planilha "DominioPais.xlsx"
    countryCode                               ${addressRepresentativeInvestor}       0                      POST			#País - Representante Valores aceitos: Consultar Planilha "DominioPais.xlsx"
    emailTypeCode                             ${emailRepresentativeInvestor}         PRIVADO                POST			#Tipo E-mail - Representante Valores aceitos: "COMERCIAL", "PARTICULAR"
    phoneTypeCode                             ${adressPhoneRepresentativeInvestor}   PRIVADO                POST			#Tipo E-mail - Representante Valores aceitos: "COMERCIAL", "PARTICULAR"

T0007: PF RESIDENTE (API) - Campos Obrigatórios
    [Setup]       Dado que eu faça a chamada da API de Comitente PF com json completo
    [Template]   Template Campos Obrigatórios - Validar response com mensagem de erro
    customerAccountHolderCode       ${investor}                             POST 		#"Titular da Conta Cliente (Conta Própria)"
    documentNumber                  ${investor}                             POST 		#"CPF/CPF do Comitente"
    residenceCountryCode            ${investor}                             POST 		#"País de Residência"
    taxNatureCode                   ${investor}                             POST 		#"Natureza Fisca"
    investorName                    ${investor}                             POST 		#"Comitente(Nome/Razão Social)"
    birthDate                       ${individualInvestor}                   POST 		#"Data de Nascimento"
    genderCode                      ${individualInvestor}                   POST 		#"Gênero"
    maritalStatusCode               ${individualInvestor}                   POST 		#"Estado Civil"
    professionName                  ${individualInvestor}                   POST 		#"Ocupação Profissional (Principal)"
    documentTypeCode                ${individualInvestor}                   POST 		#"Tipo de Documento de Identificação"
    documentNumber                  ${individualInvestor}                   POST 		#"Número do Documento de Identificação"
    documentIssueAgencyName         ${individualInvestor}                   POST 		#"Orgão Expedidor"
    politicallyExposedPersonCode    ${individualInvestor}                   POST 		#"Pessoa Exposta Politicamente?"
    addressTypeCode                 ${addressIndividualInvestor}            POST 		#"Tipo de Endereço"
    addressTypeName                 ${addressIndividualInvestor}            POST 		#"Logradouro"
    addressNumber                   ${addressIndividualInvestor}            POST 		#"Número Logradouro"
    neighborhoodName                ${addressIndividualInvestor}            POST 		#"Bairro"
    stateCode                       ${addressIndividualInvestor}            POST 		#"UF"
    cityCode                        ${addressIndividualInvestor}            POST 		#"Tipo Município"
    zipCode                         ${addressIndividualInvestor}            POST 		#"CEP"
    countryCode                     ${addressIndividualInvestor}            POST 		#"País"
    confirmationDataIndicator       ${EMPTY}                                POST 		#"Instituição Financeira confirma as informações cadastrais do cliente?"
    ########################   Campo obrigatório se for informado o telefone do comitente   ########################
    phoneAreaCodeNumber             ${addressPhoneIndividualInvestor}       POST 		#"Telefone DDD" - Comitente
    phoneNumber                     ${addressPhoneIndividualInvestor}       POST 		#"Telefone" - Comitente
    phoneTypeCode                   ${addressPhoneIndividualInvestor}       POST 		#"Tipo Telefone" - Comitente
    ########################   Campo obrigatório se for informado algum dado do representante   ########################                        POST
    representativeTypeCode          ${representativeInvestor}               POST 		#"Tipo de Representante"
    documentNumber                  ${representativeInvestor}               POST 		#"Documento do Representante"
    ########################   Campo obrigatório se for informado o endereço do representante   ########################
    addressTypeCode                 ${addressRepresentativeInvestor}        POST 		#"Tipo de Endereço" - Representante
    addressTypeName                 ${addressRepresentativeInvestor}        POST 		#"Logradouro" - Representante
    addressNumber                   ${addressRepresentativeInvestor}        POST 		#"Número Logradouro" - Representante
    neighborhoodName                ${addressRepresentativeInvestor}        POST 		#"Bairro" - Representante
    stateCode                       ${addressRepresentativeInvestor}        POST 		#"UF" - Representante
    cityCode                        ${addressRepresentativeInvestor}        POST 		#"Tipo Município" - Representante
    #zipCode                         ${addressRepresentativeInvestor}        POST 		#"CEP" - Representante
    countryCode                     ${addressRepresentativeInvestor}        POST 		#"País" - Representante
    ########################   Campo obrigatório se for informado o email do representante   ########################
    emailName                       ${emailRepresentativeInvestor}          POST 		#"E-mail" - Representante
    emailTypeCode                   ${emailRepresentativeInvestor}          POST 		#"Tipo E-mail" - Representante
    ########################   Campo obrigatório se for informado o telefone do representante   ########################
    phoneAreaCodeNumber             ${adressPhoneRepresentativeInvestor}    POST 		#"Telefone DDD" - Representante
    phoneNumber                     ${adressPhoneRepresentativeInvestor}    POST 		#"Telefone" - Representante
    phoneTypeCode                   ${adressPhoneRepresentativeInvestor}    POST 		#"Tipo Telefone" - Representante
    ########################   Campo obrigatório se for informado o FATCA   ########################
    giinNumber                      ${fatca}                                POST 		#"GIIN"
    relatedCountryCode              ${fatca}                                POST 		#"País envolvido/relacionado"
    originCountryCode               ${fatca}                                POST 		#"País Origem Investidor"
T0008: PF RESIDENTE (API) - Campos Obrigatórios passando NULL
    [Setup]      Dado que eu faça a chamada da API de Comitente PF com json completo
    [Template]   Template Campos Obrigatórios NULL - Validar response com mensagem de erro
    customerAccountHolderCode       ${investor}                             POST 		#"Titular da Conta Cliente (Conta Própria)"
    documentNumber                  ${investor}                             POST 		#"CPF/CPF do Comitente"
    residenceCountryCode            ${investor}                             POST 		#"País de Residência"
    taxNatureCode                   ${investor}                             POST 		#"Natureza Fisca"
    investorName                    ${investor}                             POST 		#"Comitente(Nome/Razão Social)"
    birthDate                       ${individualInvestor}                   POST 		#"Data de Nascimento"
    genderCode                      ${individualInvestor}                   POST 		#"Gênero"
    maritalStatusCode               ${individualInvestor}                   POST 		#"Estado Civil"
    professionName                  ${individualInvestor}                   POST 		#"Ocupação Profissional (Principal)"
    documentTypeCode                ${individualInvestor}                   POST 		#"Tipo de Documento de Identificação"
    documentNumber                  ${individualInvestor}                   POST 		#"Número do Documento de Identificação"
    documentIssueAgencyName         ${individualInvestor}                   POST 		#"Orgão Expedidor"
    politicallyExposedPersonCode    ${individualInvestor}                   POST 		#"Pessoa Exposta Politicamente?"
    addressTypeCode                 ${addressIndividualInvestor}            POST 		#"Tipo de Endereço"
    addressTypeName                 ${addressIndividualInvestor}            POST 		#"Logradouro"
    addressNumber                   ${addressIndividualInvestor}            POST 		#"Número Logradouro"
    neighborhoodName                ${addressIndividualInvestor}            POST 		#"Bairro"
    stateCode                       ${addressIndividualInvestor}            POST 		#"UF"
    cityCode                        ${addressIndividualInvestor}            POST 		#"Tipo Município"
    zipCode                         ${addressIndividualInvestor}            POST 		#"CEP"
    countryCode                     ${addressIndividualInvestor}            POST 		#"País"
    confirmationDataIndicator       ${EMPTY}                                POST 		#"Instituição Financeira confirma as informações cadastrais do cliente?"
    ########################   Campo obrigatório se for informado o telefone do comitente   ########################
    phoneAreaCodeNumber             ${addressPhoneIndividualInvestor}       POST 		#"Telefone DDD" - Comitente
    phoneNumber                     ${addressPhoneIndividualInvestor}       POST 		#"Telefone" - Comitente
    phoneTypeCode                   ${addressPhoneIndividualInvestor}       POST 		#"Tipo Telefone" - Comitente
    ########################   Campo obrigatório se for informado algum dado do representante   ########################                        POST
    representativeTypeCode          ${representativeInvestor}               POST 		#"Tipo de Representante"
    documentNumber                  ${representativeInvestor}               POST 		#"Documento do Representante"
    ########################   Campo obrigatório se for informado o endereço do representante   ########################
    addressTypeCode                 ${addressRepresentativeInvestor}        POST 		#"Tipo de Endereço" - Representante
    addressTypeName                 ${addressRepresentativeInvestor}        POST 		#"Logradouro" - Representante
    addressNumber                   ${addressRepresentativeInvestor}        POST 		#"Número Logradouro" - Representante
    neighborhoodName                ${addressRepresentativeInvestor}        POST 		#"Bairro" - Representante
    stateCode                       ${addressRepresentativeInvestor}        POST 		#"UF" - Representante
    cityCode                        ${addressRepresentativeInvestor}        POST 		#"Tipo Município" - Representante
    #zipCode                         ${addressRepresentativeInvestor}        POST 		#"CEP" - Representante
    countryCode                     ${addressRepresentativeInvestor}        POST 		#"País" - Representante
    ########################   Campo obrigatório se for informado o email do representante   ########################
    emailName                       ${emailRepresentativeInvestor}          POST 		#"E-mail" - Representante
    emailTypeCode                   ${emailRepresentativeInvestor}          POST 		#"Tipo E-mail" - Representante
    ########################   Campo obrigatório se for informado o telefone do representante   ########################
    phoneAreaCodeNumber             ${adressPhoneRepresentativeInvestor}    POST 		#"Telefone DDD" - Representante
    phoneNumber                     ${adressPhoneRepresentativeInvestor}    POST 		#"Telefone" - Representante
    phoneTypeCode                   ${adressPhoneRepresentativeInvestor}    POST 		#"Tipo Telefone" - Representante
    ########################   Campo obrigatório se for informado o FATCA   ########################
    giinNumber                      ${fatca}                                POST 		#"GIIN"
    relatedCountryCode              ${fatca}                                POST 		#"País envolvido/relacionado"
    originCountryCode               ${fatca}                                POST 		#"País Origem Investidor"    
T0009: PF RESIDENTE (API) - Regras Preenchimento Campos
    [Template]   Template Regras Preenchimento Campos - Validar que response retornou com erro 422
    customerAccountHolderCode                 ${investor}                        73410.61-0	       		POST  		#Titular da Conta Cliente (Conta Própria)
    customerAccountHolderCode                 ${investor}                        73410.90-0	       		POST  		#Titular da Conta Cliente (Conta Própria)
    customerAccountHolderCode                 ${investor}                        05000.00-5	       		POST  		#Titular da Conta Cliente (Conta Própria)
    individualDepositAccountCode              ${investor}                        878523598	       		POST  		#Conta de Depósito
    documentNumber                            ${investor}                        72818919000106    		POST  		#CPF/CNPJ do Comitente
    documentNumber                            ${investor}                        05130754895       		POST  		#CPF/CNPJ do Comitente
    currencyCode                              ${equitySituation}                 ${EMPTY}	       		POST  		#Valor da Renda Anual
    annualIncomeDate                          ${equitySituation}                 20/05/2050	       		POST  		#Data da Renda Anual
    annualIncomeDate                          ${equitySituation}                 00/00/1900	       		POST  		#Data da Renda Anual
    annualIncomeDate                          ${equitySituation}                 ${EMPTY}	       		POST  		#Data da Renda Anual
    equityDate                                ${equitySituation}                 20/05/2050	       		POST  		#Data da Situação Patrimonial
    equityDate                                ${equitySituation}                 00/00/1900	       		POST  		#Data da Situação Patrimonial
    equityValue                               ${equitySituation}                 ${EMPTY}	       		POST  		#Data da Situação Patrimonial
    equityDate                                ${equitySituation}                 ${EMPTY}	       		POST  		#Data da Situação Patrimonial
    billingDate                               ${equitySituation}                 20/05/2050	       		POST  		#Data da informação da Capacidade Financeira
    billingDate                               ${equitySituation}                 00/00/1900	       		POST  		#Data da informação da Capacidade Financeira
    lastYearBillingValue                      ${equitySituation}                 ${EMPTY}	       		POST  		#Data da informação da Capacidade Financeira
    birthDate                                 ${individualInvestor}              20/05/2050	       		POST  		#Data de Nascimento
    birthDate                                 ${individualInvestor}              00/00/1900	       		POST  		#Data de Nascimento
    riskClassificationName                    ${individualInvestor}              ${EMPTY}	       		POST  		#Descrição da Classificação de Risco
    documentNumber                            ${individualInvestor}              ACBFDFSD      	        POST  		#Número de Documento de Identificação
    documentIssueDate                         ${individualInvestor}              20/05/2050	       		POST  		#Data de Expedição
    documentIssueDate                         ${individualInvestor}              00/00/1900	       		POST  		#Data de Expedição
    authorizeOrderTransmissionByThird         ${individualInvestor}              A	               		POST  		#Autoriza Transmissão de Ordem por Terceiros?
    partnerName                               ${individualInvestor}              NOME	           		POST  		#Nome do Cônjuge
    maritalStatusCode                         ${individualInvestor}              SOLTEIRO (A)      		POST  		#Estado Civil
    partnerCpfNumber                          ${individualInvestor}              72818919000106    		POST  		#CPF/CNPJ do Comitente
    partnerCpfNumber                          ${individualInvestor}              05130754895       		POST  		#CPF do Cônjuge
    zipCode                                   ${addressIndividualInvestor}       123456789         		POST  		#CEP
    emailName                                 ${emailIndividualInvestor}         teste@teste       		POST  		#E-mail
    workCompanyIndicator                      ${professionalRelationship}        false             		POST  		#Trabalha para alguma empresa?
    inventoryCpfNumber                        ${inventory}                       ${EMPTY}          		POST  		#CPF Inventariante
    inventoryName                             ${inventory}                       ${EMPTY}          		POST  		#Nome Completo - Inventariante
    emailName                                 ${emailInventory}                  ${EMPTY}          		POST  		#E-mail - Inventariante
    phoneNumber                               ${privatePhoneInventory}           ${EMPTY}          		POST  		#Telefone - Inventariante
    investorDeceasedIndicator                 ${inventory}                       false             		POST  		#Falecido?
    confirmationDataIndicator                 ${EMPTY}                           ${EMPTY}          		POST  		#Instituição Financeira confirma as informações cadastrais do cliente?
    updateDate                                ${EMPTY}                           20/05/2050	       		POST  		#Data de Atualização do Cadastro
    updateDate                                ${EMPTY}                           00/00/1900	       		POST  		#Data de Atualização do Cadastro
    emancipatedIndicator                      ${minorResponsible}                true              		POST  		#Emancipado?
    minorResponsibleCpfNumber                 ${minorResponsible}                ${EMPTY}          		POST  		#CPF - Responsável Menor
    minorResponsibleName                      ${minorResponsible}                ${EMPTY}          		POST  		#Nome Completo - Responsável Menor
    birthDate                                 ${individualInvestor}              20/05/1990	       		POST  		#Data de Nascimento
    minorResponsibleCpfNumber                 ${minorResponsible}                72818919000106    		POST  		#CPF - Responsável Menor
    minorResponsibleCpfNumber                 ${minorResponsible}                05130754895       		POST  		#CPF - Responsável Menor
    minorResponsibleName                      ${minorResponsible}                NOME              		POST  		#Nome Completo - Responsável Menor
    emailName                                 ${emailMinorResponsible}           teste@teste       		POST  		#E-mail - Responsável Menor
    zipCode                                   ${addressRepresentativeInvestor}   123456789         		POST  		#CEP - Representante
    emailName                                 ${emailRepresentativeInvestor}     teste@teste       		POST  		#E-mail - Representante
T0010: PF RESIDENTE (API) - Validar Tamanho Campos
    [Template]   Template Tamanho Campos - Validar que response retornou com erro 422
    investorName                 ${investor}                                100             STRING          POST				#"Comitente(Nome/Razão Social)
    giinNumber                   ${fatca}                                   19              STRING          POST				#Número de identificação de intermediário global (GIIN)
    leiCode                      ${investor}                                20              STRING          POST				#Código de LEI
    fatherName                   ${individualInvestor}                      100             STRING          POST				#Filiação - Nome do Pai
    motherName                   ${individualInvestor}                      100             STRING          POST				#Filiação - Nome do Mãe
    riskClassificationName       ${individualInvestor}                      20              STRING          POST				#Descrição da Classificação de Risco
    documentIssueAgencyName      ${individualInvestor}                      10              STRING          POST				#Orgão Expedidor
    chosenName                   ${individualInvestor}                      100             STRING          POST				#Nome Social
    partnerName                  ${individualInvestor}                      100             STRING          POST				#Nome do Cônjuge
    addressTypeName              ${addressIndividualInvestor}               40              STRING          POST				#Logradouro
    addressNumber                ${addressIndividualInvestor}               20              STRING          POST				#Número Logradouro
    addressComplementName        ${addressIndividualInvestor}               40              STRING          POST				#Complemento
    neighborhoodName             ${addressIndividualInvestor}               40              STRING          POST				#Bairro
    emailName                    ${emailIndividualInvestor}                 100             STRING          POST				#E-mail
    phoneAreaCodeNumber          ${addressPhoneIndividualInvestor}          3               NUMBER          POST				#Telefone DDD
    phoneNumber                  ${addressPhoneIndividualInvestor}          10              NUMBER          POST				#Telefone
    phoneExtension               ${addressPhoneIndividualInvestor}          5               NUMBER          POST				#Ramal
    inventoryCpfNumber           ${inventory}                               11              NUMBER          POST				#CPF - Inventariante
    emailName                    ${emailIndividualInvestor}                 100             STRING          POST				#E-mail - Inventariante
    phoneAreaCodeNumber          ${privatePhoneInventory}                   3               NUMBER          POST				#Telefone DDD - Inventariante
    phoneNumber                  ${privatePhoneInventory}                   10              NUMBER          POST				#Telefone - Inventariante
    minorResponsibleCpfNumber    ${minorResponsible}                        11              NUMBER          POST				#CPF - Resp Menor
    minorResponsibleName         ${minorResponsible}                        100             STRING          POST				#Nome Completo - Resp Menor
    emailName                    ${emailMinorResponsible}                   100             STRING          POST				#E-mail - Resp Menor
    phoneAreaCodeNumber          ${privatePhoneMinorResponsible}            3               NUMBER          POST				#Telefone DDD - Resp Menor
    phoneNumber                  ${privatePhoneMinorResponsible}            10              NUMBER          POST				#Telefone - Resp Menor
    representativeName           ${representativeInvestor}                  100             STRING          POST				#Nome Completo - Respresentante
    addressTypeName              ${addressRepresentativeInvestor}           40              STRING          POST				#Logradouro - Respresentante
    addressNumber                ${addressRepresentativeInvestor}           20              STRING          POST				#Número Logradouro - Respresentante
    addressComplementName        ${addressRepresentativeInvestor}           40              STRING          POST				#Complemento - Respresentante
    neighborhoodName             ${addressRepresentativeInvestor}           40              STRING          POST				#Bairro - Respresentante
    emailName                    ${emailRepresentativeInvestor}             100             STRING          POST				#E-mail - Respresentante
    phoneAreaCodeNumber          ${adressPhoneRepresentativeInvestor}       3               NUMBER          POST				#Telefone DDD - Respresentante
    phoneNumber                  ${adressPhoneRepresentativeInvestor}       10              NUMBER          POST				#Telefone - Respresentante
    phoneExtension               ${adressPhoneRepresentativeInvestor}       5               NUMBER          POST				#Ramal - Respresentante
T0011: PF RESIDENTE (API) - Validar Dados Inventariante com valores NULL
    [Setup]      Dado que eu monte o payload de um novo Comitente PF Residente preenchendo inventariante com json completo NULL e preenchendo somente o mínimo de dados obrigatórios
    [Template]   Template Valida Grupo de Campos Obrigatórios - Validar response com status code 422
    investorDeceasedIndicator       ${inventory}                    POST        true 		                Quando Falecido \\u003d \\u0027SIM\\u0027 os campos do Inventariante: CPF, Nome, E-mail e dados do Telefone devem ser informados   #"Falecido?"
    ########################   Campo obrigatório se for informado o email do Inventariante   ########################
    emailName                       ${emailInventory}               POST        teste-invent@robot.com 		Quando Falecido \\u003d \\u0027SIM\\u0027 os campos do Inventariante: CPF, Nome, E-mail e dados do Telefone devem ser informados    #"E-mail" - Responsável Menor
    emailTypeCode                   ${emailInventory}               POST        PARTICULAR 		            Quando Falecido \\u003d \\u0027SIM\\u0027 os campos do Inventariante: CPF, Nome, E-mail e dados do Telefone devem ser informados    #"Tipo E-mail" - Responsável Menor
    ########################   Campo obrigatório se for informado o telefone do Inventariante   ########################
    phoneAreaCodeNumber             ${privatePhoneInventory}        POST        44 		                    Quando Falecido \\u003d \\u0027SIM\\u0027 os campos do Inventariante: CPF, Nome, E-mail e dados do Telefone devem ser informados   #"Telefone DDD" - Inventariante
    phoneNumber                     ${privatePhoneInventory}        POST        355664488 		            Quando Falecido \\u003d \\u0027SIM\\u0027 os campos do Inventariante: CPF, Nome, E-mail e dados do Telefone devem ser informados   #"Telefone" - Inventariante
    phoneTypeCode                   ${privatePhoneInventory}        POST        PARTICULAR 		            Quando Falecido \\u003d \\u0027SIM\\u0027 os campos do Inventariante: CPF, Nome, E-mail e dados do Telefone devem ser informados   #"Tipo Telefone" - Inventariante
T0012: PF RESIDENTE (API) - Validar Dados responsavel Menor com valores NULL
    [Setup]      Dado que eu monte o payload de um novo Comitente PF Residente menor de idade com json completo NULL e preenchendo somente o mínimo de dados obrigatórios
    [Template]   Template Valida Grupo de Campos Obrigatórios - Validar response com status code 422
    ########################   Campo obrigatório se for informado o Responsável pelo Menor   ########################
    emancipatedIndicator            ${MinorResponsible}                     POST        false 		                    (Dados do Responsável pelo menor de idade)Os campos do Responsável pelo menor devem ser informados.         #"Emancipado?"
    ########################   Campo obrigatório se for informado o email do Responsável Menor   ########################
    emailName                       ${emailMinorResponsible}                POST        teste-resp-menor@robot.com 		Se informado Email o campo Tipo Email é de preenchimento obrigatório.                                       #"E-mail" - Responsável Menor
    emailTypeCode                   ${emailMinorResponsible}                POST        PARTICULAR 		                Se informado Tipo Email o campo Email é de preenchimento obrigatório.                                       #"Tipo E-mail" - Responsável Menor
    ########################   Campo obrigatório se for informado o telefone do Responsável pelo Menor   ########################
    phoneAreaCodeNumber             ${privatePhoneMinorResponsible}         POST        43 		                        (Dados do Responsável pelo menor de idade)Os campos do Responsável pelo menor devem ser informados.         #"Telefone DDD" - Responsável pelo Menor
    phoneNumber                     ${privatePhoneMinorResponsible}         POST        911223344 		                (Dados do Responsável pelo menor de idade)Os campos do Responsável pelo menor devem ser informados.         #"Telefone" - Responsável pelo Menor
    phoneTypeCode                   ${privatePhoneMinorResponsible}         POST        PARTICULAR 		                (Dados do Responsável pelo menor de idade)Os campos do Responsável pelo menor devem ser informados.         #"Tipo Telefone" - Responsável pelo Menor
    


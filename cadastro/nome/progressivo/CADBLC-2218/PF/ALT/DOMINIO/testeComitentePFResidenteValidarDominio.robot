*** Settings ***
Documentation       Teste API Comitente /individual-investors
Suite Setup         Dado que eu faça a chamada da API de alteração de Comitente PF com json completo
Resource            ${CURDIR}\\..\\..\\..\\..\\GENERIC_VAR\\Keywords.robot
Resource            ${CURDIR}\\..\\..\\..\\..\\GENERIC_VAR\\KeywordsAPI.robot
Resource            ${CURDIR}\\..\\..\\..\\..\\GENERIC_VAR\\shared\\API\\suit_setup_put_api_individual.robot
Resource            ${CURDIR}\\..\\..\\..\\..\\GENERIC_VAR\\template\\API\\template_validar_dominio.robot
Test Template       Template Domínio Campos - Validar que response retornou com erro 422

*** Test Cases ***                                                      CAMPO_JSON                            	  OBJETO_JSON            				 VALOR                  METHOD 		#CAMPO TELA
Invalid Size domain customerAccountHolderCode                           customerAccountHolderCode                 ${investor}                            000000.01-0	        PUT			#Titular da Conta Cliente (Conta Própria)
Invalid Size domain residenceCountryCode                                residenceCountryCode                      ${investor}                            2	                    PUT			#País de Residência Valores Aceitos: 1
Invalid Size domain taxNatureCode                                       taxNatureCode                             ${investor}                            Isentoo	            PUT			#Natureza Fiscal Valores Aceitos: "Isento" e "Tributável"
Invalid Size domain currencyCode                                        currencyCode                              ${equitySituation}                     10	                    PUT			#Moeda Valores aceitos: Consultar Planilha "DominioMoeda.xlsx"
Invalid Size domain annualIncomeValue                                   annualIncomeValue                         ${equitySituation}                     1122334455661.123      PUT			#Valor da Renda Anual Valores aceitos:  Mascara (12.2)
Invalid Size domain equityValue                                         equityValue                               ${equitySituation}                     1122334455661.123      PUT			#Valor da Situação Patrimonial Valores aceitos:  Mascara (12.2)
Invalid Size domain lastYearBillingValue                                lastYearBillingValue                      ${equitySituation}                     1122334455661.123      PUT			#Capacidade Financeira Valores aceitos:  Mascara (12.2)
Invalid Size domain 266 relatedCountryCode                              relatedCountryCode                        ${fatca}                               266                    PUT			#País envolvido/relacionado Valores aceitos: Consultar Planilha "DominioPais.xlsx"
Invalid Size domain 266 originCountryCode                               originCountryCode                         ${fatca}                               266                    PUT			#País de Origem do Investidor Valores aceitos: Consultar Planilha "DominioPais.xlsx"
Invalid Size domain genderCode                                          genderCode                                ${individualInvestor}                  NENHUM	                PUT			#Gênero Valores aceitos:  "MASCULINO","FEMININO","NAO_BINARIO","PREFIRO_NAO_INFORMAR"
Invalid Size domain OUTROS maritalStatusCode                            maritalStatusCode                         ${individualInvestor}                  OUTROS	                PUT			#Estado Civil Valores aceitos: Consultar Planilha "Enuns.xlsx"
Invalid Size domain A REGULARIZAR maritalStatusCode                     maritalStatusCode                         ${individualInvestor}                  A REGULARIZAR          PUT			#Estado Civil Valores aceitos: Consultar Planilha "Enuns.xlsx"
Invalid Size domain 99 birthStateCode                                   birthStateCode                            ${individualInvestor}                  99                     PUT			#Naturalidade (UF) Valores aceitos: Consultar Planilha "DominioMunicipioUF.xlsx"
Invalid Size domain 0 birthStateCode                                    birthStateCode                            ${individualInvestor}                  0                      PUT			#Naturalidade (UF) Valores aceitos: Consultar Planilha "DominioMunicipioUF.xlsx"
Invalid Size domain 28 birthStateCode                                   birthStateCode                            ${individualInvestor}                  28                     PUT			#Naturalidade (UF) Valores aceitos: Consultar Planilha "DominioMunicipioUF.xlsx"
Invalid Size domain 0 birthCityCode                                     birthCityCode                             ${individualInvestor}                  0                      PUT			#Naturalidade (Município) Valores aceitos: Consultar Planilha "DominioMunicipioUF.xlsx"
Invalid Size domain 99999 birthCityCode                                 birthCityCode                             ${individualInvestor}                  99999                  PUT			#Naturalidade (Município) Valores aceitos: Consultar Planilha "DominioMunicipioUF.xlsx"
Invalid Size domain 4118 birthCityCode                                  birthCityCode                             ${individualInvestor}                  4118                   PUT			#Naturalidade (Município) Valores aceitos: Consultar Planilha "DominioMunicipioUF.xlsx"
Invalid Size domain 266 birthCountryCode                                birthCountryCode                          ${individualInvestor}                  266                    PUT			#Nacionalidade Valores aceitos: Consultar Planilha "DominioPais.xlsx"
Invalid Size domain 215 birthCountryCode                                birthCountryCode                          ${individualInvestor}                  215                    PUT			#Nacionalidade Valores aceitos: Consultar Planilha "DominioPais.xlsx"
Invalid Size domain 0 birthCountryCode                                  birthCountryCode                          ${individualInvestor}                  0                      PUT			#Nacionalidade Valores aceitos: Consultar Planilha "DominioPais.xlsx"
Invalid Size domain relatedPersonIndicator                              relatedPersonIndicator                    ${individualInvestor}                  VERDADEIRO             PUT			#Pessoa Vinculada Valores aceitos: true or false
Invalid Size domain riskClassificationCode                              riskClassificationCode                    ${individualInvestor}                  C                      PUT			#Classificação de Risco do Comitente Valores aceitos: Consultar Planilha "Enuns.xlsx"
Invalid Size domain 999 professionName individualInvestor               professionName                            ${individualInvestor}                  999                    PUT			#Ocupação Profissional (Principal) Valores aceitos: Consultar Planilha "DominioOcupacaoProfissional.xlsx"
Invalid Size domain 333 professionName individualInvestor               professionName                            ${individualInvestor}                  333                    PUT			#Ocupação Profissional (Principal) Valores aceitos: Consultar Planilha "DominioOcupacaoProfissional.xlsx"
Invalid Size domain documentTypeCode individualInvestor                 documentTypeCode                          ${individualInvestor}                  RG                     PUT			#Tipo de Documento de Identificação Valores aceitos: Consultar Planilha "Enuns.xlsx"
Invalid Size domain politicallyExposedPersonCode                        politicallyExposedPersonCode              ${individualInvestor}                  TRUE                   PUT			#Pessoa Exposta Politicamente? Valores aceitos: Consultar Planilha "Enuns.xlsx"
Invalid Size domain investmentFundAdministratorIndicator                investmentFundAdministratorIndicator      ${individualInvestor}                  VERDADEIRO             PUT			#Administrador de Fundos de Investimento?  Valores aceitos: true or false
Invalid Size domain usPersonIndicator                                   usPersonIndicator                         ${individualInvestor}                  VERDADEIRO             PUT			#US Person? Valores aceitos: true or false
Invalid Size domain administrativePortfolioManagerIndicator             administrativePortfolioManagerIndicator   ${individualInvestor}                  VERDADEIRO             PUT			#Administrador de Carteiras Administradas? Valores aceitos: true or false
Invalid Size domain privateBankIndicator                                privateBankIndicator                      ${individualInvestor}                  VERDADEIRO             PUT			#Private Bank? Valores aceitos: true or false
Invalid Size domain authorizeOrderTransmissionByThird                   authorizeOrderTransmissionByThird         ${individualInvestor}                  B	                    PUT			#Autoriza Transmissão de Ordem por Terceiros? Valores aceitos: ("A","P","N")
Invalid Size domain addressTypeCode IndividualInvestor                  addressTypeCode                           ${addressIndividualInvestor}           PRIVADO                PUT			#Tipo de Endereço Valores aceitos: "COMERCIAL", "RESIDENCIAL", "SEM TIPO DE ENDERECO"
Invalid Size domain 99 stateCode IndividualInvestor                     stateCode                                 ${addressIndividualInvestor}           99                     PUT			#UF Valores aceitos: Consultar Planilha "DominioMunicipioUF.xlsx"
Invalid Size domain 0 stateCode IndividualInvestor                      stateCode                                 ${addressIndividualInvestor}           0                      PUT			#UF Valores aceitos: Consultar Planilha "DominioMunicipioUF.xlsx"
Invalid Size domain 28 stateCode IndividualInvestor                     stateCode                                 ${addressIndividualInvestor}           28                     PUT			#UF Valores aceitos: Consultar Planilha "DominioMunicipioUF.xlsx"
Invalid Size domain 0 cityCode IndividualInvestor                       cityCode                                  ${addressIndividualInvestor}           0                      PUT			#Tipo Município Valores aceitos: Consultar Planilha "DominioMunicipioUF.xlsx"
Invalid Size domain 9999 cityCode IndividualInvestor                    cityCode                                  ${addressIndividualInvestor}           99999                  PUT			#Tipo Município Valores aceitos: Consultar Planilha "DominioMunicipioUF.xlsx"
Invalid Size domain 4118 cityCode IndividualInvestor                    cityCode                                  ${addressIndividualInvestor}           4118                   PUT			#Tipo Município Valores aceitos: Consultar Planilha "DominioMunicipioUF.xlsx"
Invalid Size domain 266 countryCode IndividualInvestor                  countryCode                               ${addressIndividualInvestor}           266                    PUT			#País Valores aceitos: Consultar Planilha "DominioPais.xlsx"
Invalid Size domain 215 countryCode IndividualInvestor                  countryCode                               ${addressIndividualInvestor}           215                    PUT			#País Valores aceitos: Consultar Planilha "DominioPais.xlsx"
Invalid Size domain 0 countryCode IndividualInvestor                    countryCode                               ${addressIndividualInvestor}           0                      PUT			#País Valores aceitos: Consultar Planilha "DominioPais.xlsx"
Invalid Size domain emailTypeCode IndividualInvestor                    emailTypeCode                             ${emailIndividualInvestor}             PRIVADO                PUT			#Tipo E-mail Valores aceitos: "COMERCIAL", "PARTICULAR"
Invalid Size domain phoneTypeCode IndividualInvestor                    phoneTypeCode                             ${addressPhoneIndividualInvestor}      PRIVADO                PUT			#Tipo E-mail Valores aceitos: "COMERCIAL", "PARTICULAR"
Invalid Size domain workCompanyIndicator                                workCompanyIndicator                      ${professionalRelationship}            VERDADEIRO             PUT			#Trabalha para alguma empresa?  Valores aceitos: true or false
Invalid Size domain investorDeceasedIndicator                           investorDeceasedIndicator                 ${inventory}                           VERDADEIRO             PUT			#Falecido?  Valores aceitos: true or false
Invalid Size domain confirmationDataIndicator                           confirmationDataIndicator                 ${EMPTY}                               VERDADEIRO             PUT			#Instituição Financeira confirma as informações cadastrais do cliente?  Valores aceitos: true or false
Invalid Size domain emancipatedIndicator                                emancipatedIndicator                      ${minorResponsible}                    VERDADEIRO             PUT			#Emancipado?  Valores aceitos: true or false
Invalid Size domain emailTypeMinorResponsible                           emailTypeCode                             ${emailMinorResponsible}               PRIVADO                PUT			#Tipo E-mail - Responsável Menor Valores aceitos: "COMERCIAL", "PARTICULAR"
Invalid Size domain privatePhoneMinorResponsibleRepresentative          phoneTypeCode                             ${privatePhoneMinorResponsible}        PRIVADO                PUT			#Tipo Telefone - Responsável Menor Valores aceitos: "COMERCIAL", "PARTICULAR"
Invalid Size domain politicallyExposedPersonCodeRepresentative          politicallyExposedPersonCode              ${representativeInvestor}              TRUE                   PUT			#Pessoa Exposta Politicamente - Representante Valores aceitos: "VERDADEIRO", "FALSO", "NAO_INFORMADO"
Invalid Size domain addressTypeCode RepresentativeInvestor              addressTypeCode                           ${addressRepresentativeInvestor}       PRIVADO                PUT			#Tipo de Endereço - Representante Valores aceitos: "COMERCIAL", "RESIDENCIAL", "SEM TIPO DE ENDERECO"
Invalid Size domain 99 stateCode RepresentativeInvestor                 stateCode                                 ${addressRepresentativeInvestor}       99                     PUT			#UF - Representante Valores aceitos: Consultar Planilha "DominioMunicipioUF.xlsx"
Invalid Size domain 0 stateCode RepresentativeInvestor                  stateCode                                 ${addressRepresentativeInvestor}       0                      PUT			#UF - Representante Valores aceitos: Consultar Planilha "DominioMunicipioUF.xlsx"
Invalid Size domain 28 stateCode RepresentativeInvestor                 stateCode                                 ${addressRepresentativeInvestor}       28                     PUT			#UF - Representante Valores aceitos: Consultar Planilha "DominioMunicipioUF.xlsx"
Invalid Size domain 0 cityCode RepresentativeInvestor                   cityCode                                  ${addressRepresentativeInvestor}       0                      PUT			#Tipo Município - Representante Valores aceitos: Consultar Planilha "DominioMunicipioUF.xlsx"
Invalid Size domain 99999 cityCode RepresentativeInvestor               cityCode                                  ${addressRepresentativeInvestor}       99999                  PUT			#Tipo Município - Representante Valores aceitos: Consultar Planilha "DominioMunicipioUF.xlsx"
Invalid Size domain 4118 cityCode RepresentativeInvestor                cityCode                                  ${addressRepresentativeInvestor}       4118                   PUT			#Tipo Município - Representante Valores aceitos: Consultar Planilha "DominioMunicipioUF.xlsx"
Invalid Size domain 266 countryCode RepresentativeInvestor              countryCode                               ${addressRepresentativeInvestor}       266                    PUT			#País - Representante Valores aceitos: Consultar Planilha "DominioPais.xlsx"
Invalid Size domain 215 countryCode RepresentativeInvestor              countryCode                               ${addressRepresentativeInvestor}       215                    PUT			#País - Representante Valores aceitos: Consultar Planilha "DominioPais.xlsx"
Invalid Size domain 0 countryCode RepresentativeInvestor                countryCode                               ${addressRepresentativeInvestor}       0                      PUT			#País - Representante Valores aceitos: Consultar Planilha "DominioPais.xlsx"
Invalid Size domain emailTypeCode RepresentativeInvestor                emailTypeCode                             ${emailRepresentativeInvestor}         PRIVADO                PUT			#Tipo E-mail - Representante Valores aceitos: "COMERCIAL", "PARTICULAR"
Invalid Size domain phoneTypeCode RepresentativeInvestor                phoneTypeCode                             ${adressPhoneRepresentativeInvestor}   PRIVADO                PUT			#Tipo E-mail - Representante Valores aceitos: "COMERCIAL", "PARTICULAR"

    [Tags]         DOMINIO INVALIDO API
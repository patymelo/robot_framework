*** Settings ***
Documentation       Teste API Comitente /individual-investors
Suite Setup         Dado que eu faça a chamada da API de alteração de Comitente PF com json completo
Resource            ${CURDIR}\\..\\..\\..\\..\\GENERIC_VAR\\Keywords.robot
Resource            ${CURDIR}\\..\\..\\..\\..\\GENERIC_VAR\\KeywordsAPI.robot
Resource            ${CURDIR}\\..\\..\\..\\..\\GENERIC_VAR\\shared\\API\\suit_setup_put_api_individual.robot
Resource            ${CURDIR}\\..\\..\\..\\..\\GENERIC_VAR\\template\\API\\template_validar_campo_obrigatorio.robot
Test Template       Template Campos Obrigatórios - Validar response com mensagem de erro

*** Test Cases ***                                                  CAMPO_JSON                      OBJETO_JSON                             METHOD		#CAMPO TELA
Validate Mandatory customerAccountHolderCode                        customerAccountHolderCode       ${investor}                             PUT 		#"Titular da Conta Cliente (Conta Própria)"
Validate Mandatory documentNumber investor       	    	        documentNumber                  ${investor}                             PUT 		#"CPF/CPF do Comitente"
Validate Mandatory residenceCountryCode        		                residenceCountryCode            ${investor}                             PUT 		#"País de Residência"
Validate Mandatory taxNatureCode               		                taxNatureCode                   ${investor}                             PUT 		#"Natureza Fisca"
Validate Mandatory investorName                		                investorName                    ${investor}                             PUT 		#"Comitente(Nome/Razão Social)"
Validate Mandatory birthDate                   		                birthDate                       ${individualInvestor}                   PUT 		#"Data de Nascimento"
Validate Mandatory genderCode                  		                genderCode                      ${individualInvestor}                   PUT 		#"Gênero"
Validate Mandatory maritalStatusCode           		                maritalStatusCode               ${individualInvestor}                   PUT 		#"Estado Civil"
Validate Mandatory professionName              		                professionName                  ${individualInvestor}                   PUT 		#"Ocupação Profissional (Principal)"
Validate Mandatory documentTypeCode            		                documentTypeCode                ${individualInvestor}                   PUT 		#"Tipo de Documento de Identificação"
Validate Mandatory documentNumber              		                documentNumber                  ${individualInvestor}                   PUT 		#"Número do Documento de Identificação"
Validate Mandatory documentIssueAgencyName individualInvestor       documentIssueAgencyName         ${individualInvestor}                   PUT 		#"Orgão Expedidor"
Validate Mandatory politicallyExposedPersonCode		                politicallyExposedPersonCode    ${individualInvestor}                   PUT 		#"Pessoa Exposta Politicamente?"
Validate Mandatory addressTypeCode IndividualInvestor             	addressTypeCode                 ${addressIndividualInvestor}            PUT 		#"Tipo de Endereço"
Validate Mandatory addressTypeName IndividualInvestor             	addressTypeName                 ${addressIndividualInvestor}            PUT 		#"Logradouro"
Validate Mandatory addressNumber IndividualInvestor               	addressNumber                   ${addressIndividualInvestor}            PUT 		#"Número Logradouro"
Validate Mandatory neighborhoodName IndividualInvestor            	neighborhoodName                ${addressIndividualInvestor}            PUT 		#"Bairro"
Validate Mandatory stateCode IndividualInvestor                   	stateCode                       ${addressIndividualInvestor}            PUT 		#"UF"
Validate Mandatory cityCode IndividualInvestor                    	cityCode                        ${addressIndividualInvestor}            PUT 		#"Tipo Município"
Validate Mandatory zipCode IndividualInvestor                     	zipCode                         ${addressIndividualInvestor}            PUT 		#"CEP"
Validate Mandatory countryCode IndividualInvestor                 	countryCode                     ${addressIndividualInvestor}            PUT 		#"País"
Validate Mandatory confirmationDataIndicator   		                confirmationDataIndicator       ${EMPTY}                                PUT 		#"Instituição Financeira confirma as informações cadastrais do cliente?"
########################   Campo obrigatório se for informado o telefone do comitente   ########################
Validate Mandatory phoneAreaCodeNumber IndividualInvestor         	phoneAreaCodeNumber             ${addressPhoneIndividualInvestor}       PUT 		#"Telefone DDD" - Comitente
Validate Mandatory phoneNumber IndividualInvestor                 	phoneNumber                     ${addressPhoneIndividualInvestor}       PUT 		#"Telefone" - Comitente
Validate Mandatory phoneTypeCode IndividualInvestor               	phoneTypeCode                   ${addressPhoneIndividualInvestor}       PUT 		#"Tipo Telefone" - Comitente
########################   Campo obrigatório se for informado algum dado do representante   ########################                        PUT
Validate Mandatory representativeTypeCode Representative      		representativeTypeCode          ${representativeInvestor}               PUT 		#"Tipo de Representante"
Validate Mandatory documentNumber Representative              		documentNumber                  ${representativeInvestor}               PUT 		#"Documento do Representante"
########################   Campo obrigatório se for informado o endereço do representante   ########################
Validate Mandatory addressTypeCode Representative             		addressTypeCode                 ${addressRepresentativeInvestor}        PUT 		#"Tipo de Endereço" - Representante
Validate Mandatory addressTypeName Representative             		addressTypeName                 ${addressRepresentativeInvestor}        PUT 		#"Logradouro" - Representante
Validate Mandatory addressNumber Representative               		addressNumber                   ${addressRepresentativeInvestor}        PUT 		#"Número Logradouro" - Representante
Validate Mandatory neighborhoodName Representative            		neighborhoodName                ${addressRepresentativeInvestor}        PUT 		#"Bairro" - Representante
Validate Mandatory stateCode Representative                   		stateCode                       ${addressRepresentativeInvestor}        PUT 		#"UF" - Representante
Validate Mandatory cityCode Representative                    		cityCode                        ${addressRepresentativeInvestor}        PUT 		#"Tipo Município" - Representante
Validate Mandatory zipCode Representative                     		zipCode                         ${addressRepresentativeInvestor}        PUT 		#"CEP" - Representante
Validate Mandatory countryCode Representative                 		countryCode                     ${addressRepresentativeInvestor}        PUT 		#"País" - Representante
########################   Campo obrigatório se for informado o email do representante   ########################
Validate Mandatory emailName Representative                   		emailName                       ${emailRepresentativeInvestor}          PUT 		#"E-mail" - Representante
Validate Mandatory emailTypeCode Representative               		emailTypeCode                   ${emailRepresentativeInvestor}          PUT 		#"Tipo E-mail" - Representante
########################   Campo obrigatório se for informado o telefone do representante   ########################
Validate Mandatory phoneAreaCodeNumber Representative         		phoneAreaCodeNumber             ${adressPhoneRepresentativeInvestor}    PUT 		#"Telefone DDD" - Representante
Validate Mandatory phoneNumber Representative                 		phoneNumber                     ${adressPhoneRepresentativeInvestor}    PUT 		#"Telefone" - Representante
Validate Mandatory phoneTypeCode Representative               		phoneTypeCode                   ${adressPhoneRepresentativeInvestor}    PUT 		#"Tipo Telefone" - Representante
########################   Campo obrigatório se for informado o FATCA   ########################
Validate Mandatory giinNumber                  					    giinNumber                      ${fatca}                                PUT 		#"GIIN"
Validate Mandatory relatedCountryCode          						relatedCountryCode              ${fatca}                                PUT 		#"País envolvido/relacionado"
Validate Mandatory originCountryCode           						originCountryCode               ${fatca}                                PUT 		#"País Origem Investidor"
    [Tags]         CAMPOS OBRIGATORIOS API

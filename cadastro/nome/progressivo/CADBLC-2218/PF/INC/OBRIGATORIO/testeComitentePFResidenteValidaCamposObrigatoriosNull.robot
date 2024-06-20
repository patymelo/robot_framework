*** Settings ***
Documentation       Teste API Comitente /individual-investors
Suite Setup         Dado que eu faça a chamada da API de Comitente PF com json completo
Resource            ${CURDIR}\\..\\..\\..\\..\\GENERIC_VAR\\Keywords.robot
Resource            ${CURDIR}\\..\\..\\..\\..\\GENERIC_VAR\\KeywordsAPI.robot
Resource            ${CURDIR}\\..\\..\\..\\..\\GENERIC_VAR\\shared\\API\\suit_setup_post_api_individual.robot
Resource            ${CURDIR}\\..\\..\\..\\..\\GENERIC_VAR\\template\\API\\template_validar_campo_obrigatorio.robot
Test Template       Template Campos Obrigatórios NULL - Validar response com mensagem de erro

*** Test Cases ***                                                  CAMPO_JSON                      OBJETO_JSON                             METHOD		#CAMPO TELA
Validate Mandatory customerAccountHolderCode                        customerAccountHolderCode       ${investor}                             POST 		#"Titular da Conta Cliente (Conta Própria)"
Validate Mandatory documentNumber investor       	    	        documentNumber                  ${investor}                             POST 		#"CPF/CPF do Comitente"
Validate Mandatory residenceCountryCode        		                residenceCountryCode            ${investor}                             POST 		#"País de Residência"
Validate Mandatory taxNatureCode               		                taxNatureCode                   ${investor}                             POST 		#"Natureza Fiscal"
Validate Mandatory investorName                		                investorName                    ${investor}                             POST 		#"Comitente(Nome/Razão Social)"
Validate Mandatory birthDate                   		                birthDate                       ${individualInvestor}                   POST 		#"Data de Nascimento"
Validate Mandatory genderCode                  		                genderCode                      ${individualInvestor}                   POST 		#"Gênero"
Validate Mandatory maritalStatusCode           		                maritalStatusCode               ${individualInvestor}                   POST 		#"Estado Civil"
Validate Mandatory professionName              		                professionName                  ${individualInvestor}                   POST 		#"Ocupação Profissional (Principal)"
Validate Mandatory documentTypeCode            		                documentTypeCode                ${individualInvestor}                   POST 		#"Tipo de Documento de Identificação"
Validate Mandatory documentNumber              		                documentNumber                  ${individualInvestor}                   POST 		#"Número do Documento de Identificação"
Validate Mandatory documentIssueAgencyName individualInvestor       documentIssueAgencyName         ${individualInvestor}                   POST 		#"Orgão Expedidor"
Validate Mandatory politicallyExposedPersonCode		                politicallyExposedPersonCode    ${individualInvestor}                   POST 		#"Pessoa Exposta Politicamente?"
Validate Mandatory addressTypeCode IndividualInvestor             	addressTypeCode                 ${addressIndividualInvestor}            POST 		#"Tipo de Endereço"
Validate Mandatory addressTypeName IndividualInvestor             	addressTypeName                 ${addressIndividualInvestor}            POST 		#"Logradouro"
Validate Mandatory addressNumber IndividualInvestor               	addressNumber                   ${addressIndividualInvestor}            POST 		#"Número Logradouro"
Validate Mandatory neighborhoodName IndividualInvestor            	neighborhoodName                ${addressIndividualInvestor}            POST 		#"Bairro"
Validate Mandatory stateCode IndividualInvestor                   	stateCode                       ${addressIndividualInvestor}            POST 		#"UF"
Validate Mandatory cityCode IndividualInvestor                    	cityCode                        ${addressIndividualInvestor}            POST 		#"Tipo Município"
Validate Mandatory zipCode IndividualInvestor                     	zipCode                         ${addressIndividualInvestor}            POST 		#"CEP"
Validate Mandatory countryCode IndividualInvestor                 	countryCode                     ${addressIndividualInvestor}            POST 		#"País"
Validate Mandatory confirmationDataIndicator   		                confirmationDataIndicator       ${EMPTY}                                POST 		#"Instituição Financeira confirma as informações cadastrais do cliente?"
########################   Campo obrigatório se for informado o telefone do comitente   ########################
Validate Mandatory phoneAreaCodeNumber IndividualInvestor         	phoneAreaCodeNumber             ${addressPhoneIndividualInvestor}       POST 		#"Telefone DDD" - Comitente
Validate Mandatory phoneNumber IndividualInvestor                 	phoneNumber                     ${addressPhoneIndividualInvestor}       POST 		#"Telefone" - Comitente
Validate Mandatory phoneTypeCode IndividualInvestor               	phoneTypeCode                   ${addressPhoneIndividualInvestor}       POST 		#"Tipo Telefone" - Comitente
########################   Campo obrigatório se for informado algum dado do representante   ########################                        POST
Validate Mandatory representativeTypeCode Representative      		representativeTypeCode          ${representativeInvestor}               POST 		#"Tipo de Representante"
Validate Mandatory documentNumber Representative              		documentNumber                  ${representativeInvestor}               POST 		#"Documento do Representante"
########################   Campo obrigatório se for informado o endereço do representante   ########################
Validate Mandatory addressTypeCode Representative             		addressTypeCode                 ${addressRepresentativeInvestor}        POST 		#"Tipo de Endereço" - Representante
Validate Mandatory addressTypeName Representative             		addressTypeName                 ${addressRepresentativeInvestor}        POST 		#"Logradouro" - Representante
Validate Mandatory addressNumber Representative               		addressNumber                   ${addressRepresentativeInvestor}        POST 		#"Número Logradouro" - Representante
Validate Mandatory neighborhoodName Representative            		neighborhoodName                ${addressRepresentativeInvestor}        POST 		#"Bairro" - Representante
Validate Mandatory stateCode Representative                   		stateCode                       ${addressRepresentativeInvestor}        POST 		#"UF" - Representante
Validate Mandatory cityCode Representative                    		cityCode                        ${addressRepresentativeInvestor}        POST 		#"Tipo Município" - Representante
Validate Mandatory zipCode Representative                     		zipCode                         ${addressRepresentativeInvestor}        POST 		#"CEP" - Representante
Validate Mandatory countryCode Representative                 		countryCode                     ${addressRepresentativeInvestor}        POST 		#"País" - Representante
########################   Campo obrigatório se for informado o email do representante   ########################
Validate Mandatory emailName Representative                   		emailName                       ${emailRepresentativeInvestor}          POST 		#"E-mail" - Representante
Validate Mandatory emailTypeCode Representative               		emailTypeCode                   ${emailRepresentativeInvestor}          POST 		#"Tipo E-mail" - Representante
########################   Campo obrigatório se for informado o telefone do representante   ########################
Validate Mandatory phoneAreaCodeNumber Representative         		phoneAreaCodeNumber             ${adressPhoneRepresentativeInvestor}    POST 		#"Telefone DDD" - Representante
Validate Mandatory phoneNumber Representative                 		phoneNumber                     ${adressPhoneRepresentativeInvestor}    POST 		#"Telefone" - Representante
Validate Mandatory phoneTypeCode Representative               		phoneTypeCode                   ${adressPhoneRepresentativeInvestor}    POST 		#"Tipo Telefone" - Representante
########################   Campo obrigatório se for informado o FATCA   ########################
Validate Mandatory giinNumber                  					    giinNumber                      ${fatca}                                POST 		#"GIIN"
Validate Mandatory relatedCountryCode          						relatedCountryCode              ${fatca}                                POST 		#"País envolvido/relacionado"
Validate Mandatory originCountryCode           						originCountryCode               ${fatca}                                POST 		#"País Origem Investidor"
    [Tags]         CAMPOS OBRIGATORIOS API

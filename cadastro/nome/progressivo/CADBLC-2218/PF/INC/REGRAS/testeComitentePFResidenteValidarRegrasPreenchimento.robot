*** Settings ***
Documentation       Teste API Comitente /individual-investors
Suite Setup         Dado que eu faça a chamada da API de Comitente PF com json completo
Resource            ${CURDIR}\\..\\..\\..\\..\\GENERIC_VAR\\Keywords.robot
Resource            ${CURDIR}\\..\\..\\..\\..\\GENERIC_VAR\\KeywordsAPI.robot
Resource            ${CURDIR}\\..\\..\\..\\..\\GENERIC_VAR\\shared\\API\\suit_setup_post_api_individual.robot
Resource            ${CURDIR}\\..\\..\\..\\..\\GENERIC_VAR\\template\\API\\template_validar_regras.robot
Test Template       Template Regras Preenchimento Campos - Validar que response retornou com erro 422

*** Test Cases ***                                                  CAMPO_JSON                                OBJETO_JSON                        VALOR                  METHOD		#CAMPO TELA
Rule Of The Field customerAccountHolderCode - invalid miolo         customerAccountHolderCode                 ${investor}                        73410.61-0	       		POST  		#Titular da Conta Cliente (Conta Própria)
Rule Of The Field customerAccountHolderCode - invalid account       customerAccountHolderCode                 ${investor}                        73410.90-0	       		POST  		#Titular da Conta Cliente (Conta Própria)
Rule Of The Field customerAccountHolderCode - another participant   customerAccountHolderCode                 ${investor}                        10020.00-1	       		POST  		#Titular da Conta Cliente (Conta Própria)
Rule Of The Field individualDepositAccountCode                      individualDepositAccountCode              ${investor}                        878523598	       		POST  		#Conta de Depósito
Rule Of The Field documentNumber - cnpj                             documentNumber                            ${investor}                        72818919000106    		POST  		#CPF/CNPJ do Comitente
Rule Of The Field documentNumber - invalid                          documentNumber                            ${investor}                        05130754895       		POST  		#CPF/CNPJ do Comitente
Rule Of The Field currencyCode equitySituation - Empty              currencyCode                              ${equitySituation}                 ${EMPTY}	       		POST  		#Valor da Renda Anual
Rule Of The Field annualIncomeDate - future                         annualIncomeDate                          ${equitySituation}                 20/05/2050	       		POST  		#Data da Renda Anual
Rule Of The Field annualIncomeDate - invalid                        annualIncomeDate                          ${equitySituation}                 00/00/1900	       		POST  		#Data da Renda Anual
Rule Of The Field annualIncomeDate                                  annualIncomeDate                          ${equitySituation}                 ${EMPTY}	       		POST  		#Data da Renda Anual
Rule Of The Field equityDate - future                               equityDate                                ${equitySituation}                 20/05/2050	       		POST  		#Data da Situação Patrimonial
Rule Of The Field equityDate - invalid                              equityDate                                ${equitySituation}                 00/00/1900	       		POST  		#Data da Situação Patrimonial
Rule Of The Field equityValue                                       equityValue                               ${equitySituation}                 ${EMPTY}	       		POST  		#Data da Situação Patrimonial
Rule Of The Field equityDate                                        equityDate                                ${equitySituation}                 ${EMPTY}	       		POST  		#Data da Situação Patrimonial
Rule Of The Field billingDate - future                              billingDate                               ${equitySituation}                 20/05/2050	       		POST  		#Data da informação da Capacidade Financeira
Rule Of The Field billingDate - invalid                             billingDate                               ${equitySituation}                 00/00/1900	       		POST  		#Data da informação da Capacidade Financeira
Rule Of The Field lastYearBillingValue                              lastYearBillingValue                      ${equitySituation}                 ${EMPTY}	       		POST  		#Data da informação da Capacidade Financeira
Rule Of The Field birthDate - future                                birthDate                                 ${individualInvestor}              20/05/2050	       		POST  		#Data de Nascimento
Rule Of The Field birthDate - invalid                               birthDate                                 ${individualInvestor}              00/00/1900	       		POST  		#Data de Nascimento
Rule Of The Field riskClassificationName                            riskClassificationName                    ${individualInvestor}              ${EMPTY}	       		POST  		#Descrição da Classificação de Risco
Rule Of The Field documentNumber individualInvestor - invalid       documentNumber                            ${individualInvestor}              ACBFDFSD      	        POST  		#Número de Documento de Identificação
Rule Of The Field documentIssueDate - future                        documentIssueDate                         ${individualInvestor}              20/05/2050	       		POST  		#Data de Expedição
Rule Of The Field documentIssueDate - invalid                       documentIssueDate                         ${individualInvestor}              00/00/1900	       		POST  		#Data de Expedição
Rule Of The Field authorizeOrderTransmissionByThird                 authorizeOrderTransmissionByThird         ${individualInvestor}              A	               		POST  		#Autoriza Transmissão de Ordem por Terceiros?
Rule Of The Field partnerName                                       partnerName                               ${individualInvestor}              NOME	           		POST  		#Nome do Cônjuge
Rule Of The Field maritalStatusCode                                 maritalStatusCode                         ${individualInvestor}              SOLTEIRO (A)      		POST  		#Estado Civil
Rule Of The Field partnerCpfNumber - cnpj                           partnerCpfNumber                          ${individualInvestor}              72818919000106    		POST  		#CPF/CNPJ do Comitente
Rule Of The Field partnerCpfNumber - invalid                        partnerCpfNumber                          ${individualInvestor}              05130754895       		POST  		#CPF do Cônjuge
Rule Of The Field zipCode IndividualInvestor                        zipCode                                   ${addressIndividualInvestor}       123456789         		POST  		#CEP
Rule Of The Field emailName IndividualInvestor                      emailName                                 ${emailIndividualInvestor}         teste@teste       		POST  		#E-mail
Rule Of The Field workCompanyIndicator                              workCompanyIndicator                      ${professionalRelationship}        false             		POST  		#Trabalha para alguma empresa?
Rule Of The Field inventoryCpfNumber                                inventoryCpfNumber                        ${inventory}                       ${EMPTY}          		POST  		#CPF Inventariante
Rule Of The Field inventoryName                                     inventoryName                             ${inventory}                       ${EMPTY}          		POST  		#Nome Completo - Inventariante
Rule Of The Field emailName Inventory                               emailName                                 ${emailInventory}                  ${EMPTY}          		POST  		#E-mail - Inventariante
Rule Of The Field phoneNumber Inventory                             phoneNumber                               ${privatePhoneInventory}           ${EMPTY}          		POST  		#Telefone - Inventariante
Rule Of The Field investorDeceasedIndicator                         investorDeceasedIndicator                 ${inventory}                       false             		POST  		#Falecido?
Rule Of The Field confirmationDataIndicator                         confirmationDataIndicator                 ${EMPTY}                           ${EMPTY}          		POST  		#Instituição Financeira confirma as informações cadastrais do cliente?
Rule Of The Field updateDate - future                               updateDate                                ${EMPTY}                           20/05/2050	       		POST  		#Data de Atualização do Cadastro
Rule Of The Field updateDate - invalid                              updateDate                                ${EMPTY}                           00/00/1900	       		POST  		#Data de Atualização do Cadastro
Rule Of The Field emancipatedIndicator                              emancipatedIndicator                      ${minorResponsible}                true              		POST  		#Emancipado?
Rule Of The Field minorResponsibleCpfNumber                         minorResponsibleCpfNumber                 ${minorResponsible}                ${EMPTY}          		POST  		#CPF - Responsável Menor
Rule Of The Field minorResponsibleName - empty                      minorResponsibleName                      ${minorResponsible}                ${EMPTY}          		POST  		#Nome Completo - Responsável Menor
Rule Of The Field birthDate individualInvestor                      birthDate                                 ${individualInvestor}              20/05/1990	       		POST  		#Data de Nascimento
Rule Of The Field minorResponsibleCpfNumber - cnpj                  minorResponsibleCpfNumber                 ${minorResponsible}                72818919000106    		POST  		#CPF - Responsável Menor
Rule Of The Field minorResponsibleCpfNumber - invalid               minorResponsibleCpfNumber                 ${minorResponsible}                05130754895       		POST  		#CPF - Responsável Menor
Rule Of The Field minorResponsibleName - one name                   minorResponsibleName                      ${minorResponsible}                NOME              		POST  		#Nome Completo - Responsável Menor
Rule Of The Field emailName MinorResponsible                        emailName                                 ${emailMinorResponsible}           teste@teste       		POST  		#E-mail - Responsável Menor
Rule Of The Field zipCode Representative                            zipCode                                   ${addressRepresentativeInvestor}   123456789         		POST  		#CEP - Representante
Rule Of The Field emailName Representative                          emailName                                 ${emailRepresentativeInvestor}     teste@teste       		POST  		#E-mail - Representante
    [Tags]         REGRAS API

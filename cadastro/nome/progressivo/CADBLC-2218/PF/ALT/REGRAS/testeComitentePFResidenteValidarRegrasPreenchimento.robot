*** Settings ***
Documentation       Teste API Comitente /individual-investors
Suite Setup         Dado que eu faça a chamada da API de alteração de Comitente PF com json completo
Resource            ${CURDIR}\\..\\..\\..\\..\\GENERIC_VAR\\Keywords.robot
Resource            ${CURDIR}\\..\\..\\..\\..\\GENERIC_VAR\\KeywordsAPI.robot
Resource            ${CURDIR}\\..\\..\\..\\..\\GENERIC_VAR\\shared\\API\\suit_setup_put_api_individual.robot
Resource            ${CURDIR}\\..\\..\\..\\..\\GENERIC_VAR\\template\\API\\template_validar_regras.robot
Test Template       Template Regras Preenchimento Campos - Validar que response retornou com erro 422

*** Test Cases ***                                                  CAMPO_JSON                                OBJETO_JSON                        VALOR                  METHOD		#CAMPO TELA
Rule Of The Field customerAccountHolderCode - invalid miolo         customerAccountHolderCode                 ${investor}                        73410.61-0	       		PUT  		#Titular da Conta Cliente (Conta Própria)
Rule Of The Field customerAccountHolderCode - invalid account       customerAccountHolderCode                 ${investor}                        73410.90-0	       		PUT  		#Titular da Conta Cliente (Conta Própria)
Rule Of The Field customerAccountHolderCode - another participant   customerAccountHolderCode                 ${investor}                        05000.00-5	       		PUT  		#Titular da Conta Cliente (Conta Própria)
Rule Of The Field individualDepositAccountCode                      individualDepositAccountCode              ${investor}                        878523598	       		PUT  		#Conta de Depósito
Rule Of The Field documentNumber - cnpj                             documentNumber                            ${investor}                        72818919000106    		PUT  		#CPF/CNPJ do Comitente
Rule Of The Field documentNumber - invalid                          documentNumber                            ${investor}                        05130754895       		PUT  		#CPF/CNPJ do Comitente
Rule Of The Field currencyCode equitySituation - Empty              currencyCode                              ${equitySituation}                 ${EMPTY}	       		PUT  		#Valor da Renda Anual
Rule Of The Field annualIncomeDate - future                         annualIncomeDate                          ${equitySituation}                 20/05/2050	       		PUT  		#Data da Renda Anual
Rule Of The Field annualIncomeDate - invalid                        annualIncomeDate                          ${equitySituation}                 00/00/1900	       		PUT  		#Data da Renda Anual
Rule Of The Field annualIncomeDate                                  annualIncomeDate                          ${equitySituation}                 ${EMPTY}	       		PUT  		#Data da Renda Anual
Rule Of The Field equityDate - future                               equityDate                                ${equitySituation}                 20/05/2050	       		PUT  		#Data da Situação Patrimonial
Rule Of The Field equityDate - invalid                              equityDate                                ${equitySituation}                 00/00/1900	       		PUT  		#Data da Situação Patrimonial
Rule Of The Field equityValue                                       equityValue                               ${equitySituation}                 ${EMPTY}	       		PUT  		#Data da Situação Patrimonial
Rule Of The Field equityDate                                        equityDate                                ${equitySituation}                 ${EMPTY}	       		PUT  		#Data da Situação Patrimonial
Rule Of The Field billingDate - future                              billingDate                               ${equitySituation}                 20/05/2050	       		PUT  		#Data da informação da Capacidade Financeira
Rule Of The Field billingDate - invalid                             billingDate                               ${equitySituation}                 00/00/1900	       		PUT  		#Data da informação da Capacidade Financeira
Rule Of The Field lastYearBillingValue                              lastYearBillingValue                      ${equitySituation}                 ${EMPTY}	       		PUT  		#Data da informação da Capacidade Financeira
Rule Of The Field birthDate - future                                birthDate                                 ${individualInvestor}              20/05/2050	       		PUT  		#Data de Nascimento
Rule Of The Field birthDate - invalid                               birthDate                                 ${individualInvestor}              00/00/1900	       		PUT  		#Data de Nascimento
Rule Of The Field riskClassificationName                            riskClassificationName                    ${individualInvestor}              ${EMPTY}	       		PUT  		#Descrição da Classificação de Risco
Rule Of The Field documentNumber individualInvestor - invalid       documentNumber                            ${individualInvestor}              ACBFDFSD      	        PUT  		#Número de Documento de Identificação
Rule Of The Field documentIssueDate - future                        documentIssueDate                         ${individualInvestor}              20/05/2050	       		PUT  		#Data de Expedição
Rule Of The Field documentIssueDate - invalid                       documentIssueDate                         ${individualInvestor}              00/00/1900	       		PUT  		#Data de Expedição
Rule Of The Field authorizeOrderTransmissionByThird                 authorizeOrderTransmissionByThird         ${individualInvestor}              A	               		PUT  		#Autoriza Transmissão de Ordem por Terceiros?
Rule Of The Field partnerName                                       partnerName                               ${individualInvestor}              NOME	           		PUT  		#Nome do Cônjuge
Rule Of The Field maritalStatusCode                                 maritalStatusCode                         ${individualInvestor}              SOLTEIRO (A)      		PUT  		#Estado Civil
Rule Of The Field partnerCpfNumber - cnpj                           partnerCpfNumber                          ${individualInvestor}              72818919000106    		PUT  		#CPF/CNPJ do Comitente
Rule Of The Field partnerCpfNumber - invalid                        partnerCpfNumber                          ${individualInvestor}              05130754895       		PUT  		#CPF do Cônjuge
Rule Of The Field zipCode IndividualInvestor                        zipCode                                   ${addressIndividualInvestor}       123456789         		PUT  		#CEP
Rule Of The Field emailName IndividualInvestor                      emailName                                 ${emailIndividualInvestor}         teste@teste       		PUT  		#E-mail
Rule Of The Field workCompanyIndicator                              workCompanyIndicator                      ${professionalRelationship}        false             		PUT  		#Trabalha para alguma empresa?
Rule Of The Field inventoryCpfNumber                                inventoryCpfNumber                        ${inventory}                       ${EMPTY}          		PUT  		#CPF Inventariante
Rule Of The Field inventoryName                                     inventoryName                             ${inventory}                       ${EMPTY}          		PUT  		#Nome Completo - Inventariante
Rule Of The Field emailName Inventory                               emailName                                 ${emailInventory}                  ${EMPTY}          		PUT  		#E-mail - Inventariante
Rule Of The Field phoneNumber Inventory                             phoneNumber                               ${privatePhoneInventory}           ${EMPTY}          		PUT  		#Telefone - Inventariante
Rule Of The Field investorDeceasedIndicator                         investorDeceasedIndicator                 ${inventory}                       false             		PUT  		#Falecido?
Rule Of The Field confirmationDataIndicator                         confirmationDataIndicator                 ${EMPTY}                           ${EMPTY}          		PUT  		#Instituição Financeira confirma as informações cadastrais do cliente?
Rule Of The Field updateDate - future                               updateDate                                ${EMPTY}                           20/05/2050	       		PUT  		#Data de Atualização do Cadastro
Rule Of The Field updateDate - invalid                              updateDate                                ${EMPTY}                           00/00/1900	       		PUT  		#Data de Atualização do Cadastro
Rule Of The Field emancipatedIndicator                              emancipatedIndicator                      ${minorResponsible}                true              		PUT  		#Emancipado?
Rule Of The Field minorResponsibleCpfNumber                         minorResponsibleCpfNumber                 ${minorResponsible}                ${EMPTY}          		PUT  		#CPF - Responsável Menor
Rule Of The Field minorResponsibleName - empty                      minorResponsibleName                      ${minorResponsible}                ${EMPTY}          		PUT  		#Nome Completo - Responsável Menor
Rule Of The Field birthDate individualInvestor                      birthDate                                 ${individualInvestor}              20/05/1990	       		PUT  		#Data de Nascimento
Rule Of The Field minorResponsibleCpfNumber - cnpj                  minorResponsibleCpfNumber                 ${minorResponsible}                72818919000106    		PUT  		#CPF - Responsável Menor
Rule Of The Field minorResponsibleCpfNumber - invalid               minorResponsibleCpfNumber                 ${minorResponsible}                05130754895       		PUT  		#CPF - Responsável Menor
Rule Of The Field minorResponsibleName - one name                   minorResponsibleName                      ${minorResponsible}                NOME              		PUT  		#Nome Completo - Responsável Menor
Rule Of The Field emailName MinorResponsible                        emailName                                 ${emailMinorResponsible}           teste@teste       		PUT  		#E-mail - Responsável Menor
Rule Of The Field zipCode Representative                            zipCode                                   ${addressRepresentativeInvestor}   123456789         		PUT  		#CEP - Representante
Rule Of The Field emailName Representative                          emailName                                 ${emailRepresentativeInvestor}     teste@teste       		PUT  		#E-mail - Representante
    [Tags]         REGRAS API

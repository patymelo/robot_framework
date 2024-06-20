*** Settings ***
Documentation       Teste API Comitente /individual-investors
Suite Setup         Dado que eu faça a chamada da API de alteração de Comitente PF com json completo
Resource            ${CURDIR}\\..\\..\\..\\..\\GENERIC_VAR\\Keywords.robot
Resource            ${CURDIR}\\..\\..\\..\\..\\GENERIC_VAR\\KeywordsAPI.robot
Resource            ${CURDIR}\\..\\..\\..\\..\\GENERIC_VAR\\shared\\API\\suit_setup_put_api_individual.robot
Resource            ${CURDIR}\\..\\..\\..\\..\\GENERIC_VAR\\template\\API\\template_validar_tamanho.robot
Test Template       Template Tamanho Campos - Validar que response retornou com erro 422

*** Test Cases ***                                          CAMPO_JSON                   OBJETO_JSON                                SIZE_MAX        TYPE            METHOD          #CAMPO TELA
Invalid Size investorName                                   investorName                 ${investor}                                100             STRING          PUT				#"Comitente(Nome/Razão Social)
Invalid Size giinNumber                                     giinNumber                   ${fatca}                                   19              STRING          PUT				#Número de identificação de intermediário global (GIIN)
Invalid Size leiCode                                        leiCode                      ${investor}                                20              STRING          PUT				#Código de LEI
Invalid Size fatherName                                     fatherName                   ${individualInvestor}                      100             STRING          PUT				#Filiação - Nome do Pai
Invalid Size motherName                                     motherName                   ${individualInvestor}                      100             STRING          PUT				#Filiação - Nome do Mãe
Invalid Size riskClassificationName                         riskClassificationName       ${individualInvestor}                      20              STRING          PUT				#Descrição da Classificação de Risco
Invalid Size documentIssueAgencyName                        documentIssueAgencyName      ${individualInvestor}                      10              STRING          PUT				#Orgão Expedidor
Invalid Size chosenName                                     chosenName                   ${individualInvestor}                      100             STRING          PUT				#Nome Social
Invalid Size partnerName                                    partnerName                  ${individualInvestor}                      100             STRING          PUT				#Nome do Cônjuge
Invalid Size addressTypeName Investor                       addressTypeName              ${addressIndividualInvestor}               40              STRING          PUT				#Logradouro
Invalid Size addressNumber Investor                         addressNumber                ${addressIndividualInvestor}               20              STRING          PUT				#Número Logradouro
Invalid Size addressComplementName Investor                 addressComplementName        ${addressIndividualInvestor}               40              STRING          PUT				#Complemento
Invalid Size neighborhoodName Investor                      neighborhoodName             ${addressIndividualInvestor}               40              STRING          PUT				#Bairro
Invalid Size emailName Investor                             emailName                    ${emailIndividualInvestor}                 100             STRING          PUT				#E-mail
Invalid Size phoneAreaCodeNumber Investor                   phoneAreaCodeNumber          ${addressPhoneIndividualInvestor}          3               NUMBER          PUT				#Telefone DDD
Invalid Size phoneNumber IndividualInvestor                 phoneNumber                  ${addressPhoneIndividualInvestor}          10              NUMBER          PUT				#Telefone
Invalid Size phoneExtension IndividualInvestor              phoneExtension               ${addressPhoneIndividualInvestor}          5               NUMBER          PUT				#Ramal
Invalid Size inventoryCpfNumber IndividualInvestor          inventoryCpfNumber           ${inventory}                               11              NUMBER          PUT				#CPF - Inventariante
Invalid Size emailName IndividualInvestor                   emailName                    ${emailIndividualInvestor}                 100             STRING          PUT				#E-mail - Inventariante
Invalid Size phoneAreaCodeNumber Inventory                  phoneAreaCodeNumber          ${privatePhoneInventory}                   3               NUMBER          PUT				#Telefone DDD - Inventariante
Invalid Size phoneNumber Inventory                          phoneNumber                  ${privatePhoneInventory}                   10              NUMBER          PUT				#Telefone - Inventariante
Invalid Size minorResponsibleCpfNumber                      minorResponsibleCpfNumber    ${minorResponsible}                        11              NUMBER          PUT				#CPF - Resp Menor
Invalid Size minorResponsibleName                           minorResponsibleName         ${minorResponsible}                        100             STRING          PUT				#Nome Completo - Resp Menor
Invalid Size emailName MinorResponsibl                      emailName                    ${emailMinorResponsible}                   100             STRING          PUT				#E-mail - Resp Menor
Invalid Size phoneAreaCodeNumber MinorResponsibl            phoneAreaCodeNumber          ${privatePhoneMinorResponsible}            3               NUMBER          PUT				#Telefone DDD - Resp Menor
Invalid Size phoneNumber MinorResponsibl                    phoneNumber                  ${privatePhoneMinorResponsible}            10              NUMBER          PUT				#Telefone - Resp Menor
Invalid Size representativeName                             representativeName           ${representativeInvestor}                  100             STRING          PUT				#Nome Completo - Respresentante
Invalid Size addressTypeName Representative                 addressTypeName              ${addressRepresentativeInvestor}           40              STRING          PUT				#Logradouro - Respresentante
Invalid Size addressNumber Representative                   addressNumber                ${addressRepresentativeInvestor}           20              STRING          PUT				#Número Logradouro - Respresentante
Invalid Size addressComplementName Representative           addressComplementName        ${addressRepresentativeInvestor}           40              STRING          PUT				#Complemento - Respresentante
Invalid Size neighborhoodName Representative                neighborhoodName             ${addressRepresentativeInvestor}           40              STRING          PUT				#Bairro - Respresentante
Invalid Size emailName Representative                       emailName                    ${emailRepresentativeInvestor}             100             STRING          PUT				#E-mail - Respresentante
Invalid Size phoneAreaCodeNumber Representative             phoneAreaCodeNumber          ${adressPhoneRepresentativeInvestor}       3               NUMBER          PUT				#Telefone DDD - Respresentante
Invalid Size phoneNumber Representative                     phoneNumber                  ${adressPhoneRepresentativeInvestor}       10              NUMBER          PUT				#Telefone - Respresentante
Invalid Size phoneExtension Representative                  phoneExtension               ${adressPhoneRepresentativeInvestor}       5               NUMBER          PUT				#Ramal - Respresentante

    [Tags]        TAMANHO MAXIMO API

*** Settings ***
Documentation       Teste API Comitente /individual-investors
Suite Setup         Dado que eu monte o payload para alteração de Comitente PF Residente 125.857.880-83 preenchendo inventariante com json completo NULL e preenchendo somente o mínimo de dados obrigatórios

Resource            ${CURDIR}\\..\\..\\GENERIC_VAR\\Keywords.robot
Resource            ${CURDIR}\\..\\..\\GENERIC_VAR\\KeywordsAPI.robot
Resource            ${CURDIR}\\..\\..\\GENERIC_VAR\\shared\\API\\suit_setup_put_api_individual.robot
Resource            ${CURDIR}\\..\\..\\GENERIC_VAR\\template\\API\\template_validar_campo_obrigatorio.robot
Test Template       Template Valida Grupo de Campos Obrigatórios - Validar response com status code 422

*** Test Cases ***                                                  CAMPO_JSON                      OBJETO_JSON                     METHOD      NOVO_VALOR		#CAMPO TELA
########################   Campo obrigatório se for informado o Inventariante   ########################
Validate Mandatory investorDeceasedIndicator   					    investorDeceasedIndicator       ${inventory}                    PUT        true 		                Quando Falecido \\u003d \\u0027SIM\\u0027 os campos do Inventariante: CPF, Nome, E-mail e dados do Telefone devem ser informados   #"Falecido?"
########################   Campo obrigatório se for informado o email do Inventariante   ########################
Validate Mandatory emailName EmailInventory                  		emailName                       ${emailInventory}               PUT        teste-invent@robot.com 		Quando Falecido \\u003d \\u0027SIM\\u0027 os campos do Inventariante: CPF, Nome, E-mail e dados do Telefone devem ser informados    #"E-mail" - Responsável Menor
Validate Mandatory emailTypeCode EmailInventory            	    	emailTypeCode                   ${emailInventory}               PUT        PARTICULAR 		            Quando Falecido \\u003d \\u0027SIM\\u0027 os campos do Inventariante: CPF, Nome, E-mail e dados do Telefone devem ser informados    #"Tipo E-mail" - Responsável Menor
########################   Campo obrigatório se for informado o telefone do Inventariante   ########################
Validate Mandatory phoneAreaCodeNumber PrivatePhoneInventory        phoneAreaCodeNumber             ${privatePhoneInventory}        PUT        44 		                    Quando Falecido \\u003d \\u0027SIM\\u0027 os campos do Inventariante: CPF, Nome, E-mail e dados do Telefone devem ser informados   #"Telefone DDD" - Inventariante
Validate Mandatory phoneNumber PrivatePhoneInventory                phoneNumber                     ${privatePhoneInventory}        PUT        355664488 		            Quando Falecido \\u003d \\u0027SIM\\u0027 os campos do Inventariante: CPF, Nome, E-mail e dados do Telefone devem ser informados   #"Telefone" - Inventariante
Validate Mandatory phoneTypeCode PrivatePhoneInventory              phoneTypeCode                   ${privatePhoneInventory}        PUT        PARTICULAR 		            Quando Falecido \\u003d \\u0027SIM\\u0027 os campos do Inventariante: CPF, Nome, E-mail e dados do Telefone devem ser informados   #"Tipo Telefone" - Inventariante
    [Tags]         PROGRESSIVO_CADBLC_2370

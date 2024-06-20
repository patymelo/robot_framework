*** Settings ***
Documentation       Teste API Comitente /individual-investors
Suite Setup         Dado que eu monte o payload de um novo Comitente PF Residente menor de idade com json completo NULL e preenchendo somente o mínimo de dados obrigatórios
Resource            ${CURDIR}\\..\\..\\GENERIC_VAR\\Keywords.robot
Resource            ${CURDIR}\\..\\..\\GENERIC_VAR\\KeywordsAPI.robot
Resource            ${CURDIR}\\..\\..\\GENERIC_VAR\\shared\\API\\suit_setup_post_api_individual.robot
Resource            ${CURDIR}\\..\\..\\GENERIC_VAR\\template\\API\\template_validar_campo_obrigatorio.robot
Test Template       Template Valida Grupo de Campos Obrigatórios - Validar response com status code 422

*** Test Cases ***                                                  CAMPO_JSON                      OBJETO_JSON                             METHOD      NOVO_VALOR		#CAMPO TELA
########################   Campo obrigatório se for informado o Responsável pelo Menor   ########################
Validate Mandatory emancipatedIndicator   					            emancipatedIndicator            ${MinorResponsible}                     POST        false 		                    (Dados do Responsável pelo menor de idade)Os campos do Responsável pelo menor devem ser informados.         #"Emancipado?"
########################   Campo obrigatório se for informado o email do Responsável Menor   ########################
Validate Mandatory emailName MinorResponsible                  		    emailName                       ${emailMinorResponsible}                POST        teste-resp-menor@robot.com 		Se informado Email o campo Tipo Email é de preenchimento obrigatório.                                       #"E-mail" - Responsável Menor
Validate Mandatory emailTypeCode MinorResponsible            	    	emailTypeCode                   ${emailMinorResponsible}                POST        PARTICULAR 		                Se informado Tipo Email o campo Email é de preenchimento obrigatório.                                       #"Tipo E-mail" - Responsável Menor
########################   Campo obrigatório se for informado o telefone do Responsável pelo Menor   ########################
Validate Mandatory phoneAreaCodeNumber PrivatePhoneMinorResponsible     phoneAreaCodeNumber             ${privatePhoneMinorResponsible}         POST        43 		                        (Dados do Responsável pelo menor de idade)Os campos do Responsável pelo menor devem ser informados.         #"Telefone DDD" - Responsável pelo Menor
Validate Mandatory phoneNumber PrivatePhoneMinorResponsible             phoneNumber                     ${privatePhoneMinorResponsible}         POST        911223344 		                (Dados do Responsável pelo menor de idade)Os campos do Responsável pelo menor devem ser informados.         #"Telefone" - Responsável pelo Menor
Validate Mandatory phoneTypeCode PrivatePhoneMinorResponsible           phoneTypeCode                   ${privatePhoneMinorResponsible}         POST        PARTICULAR 		                (Dados do Responsável pelo menor de idade)Os campos do Responsável pelo menor devem ser informados.         #"Tipo Telefone" - Responsável pelo Menor
    [Tags]         PROGRESSIVO_CADBLC_2370

*** Settings ***
Documentation       Teste API Comitente /individual
Suite Setup         Log    Suite Setup!
Suite Teardown      Log    Suite Teardown!
Resource            ${CURDIR}\\..\\..\\..\\..\\GENERIC_VAR\\Keywords.robot
Resource            ${CURDIR}\\..\\..\\..\\..\\GENERIC_VAR\\KeywordsAPI.robot
Resource            ${CURDIR}\\..\\..\\..\\..\\GENERIC_VAR\\Login.robot
Resource            ${CURDIR}\\..\\..\\..\\..\\GENERIC_VAR\\keywordConsultaComitente.robot
Resource            ${CURDIR}\\..\\..\\..\\..\\GENERIC_VAR\\keywordConsultaRepresentanteComitente.robot


*** Test Cases ***
TST0001: PF RESIDENTE (API) - Inclusão ITAUBM Dados Maximos - DONO
    [Documentation]   Teste de API Comitente PF como Dono do cadastro: Validar sucesso no cadastro com dados máximos preenchidos
    [Tags]    DEPARA API_
    ${TAG_NUMBER}=       Setar tagNumber
    ${CPF_COMITENTE}=    Generate CPF with size   11
    Set Global Variable  ${CPF_COMITENTE}
    Set Global Variable  ${TAGNUMBER}

    ${currentDate}=           Generate current date format yyyymmdd
    ${NOME_COMITENTE_API}=    Set Variable   ROBOT API COMI PF RES
    ${DATA_NASCIMENTO_API}=   Set Variable   02/02/2010
    ${NOME_REPRESENT_API}=    Set Variable   ROBOT API REPRESENTANTE COMT
    ${ESTADO_CIVIL_API}=      Set Variable   VIUVO
    ${TIPO_DOCUMENTO_API}=    Set Variable   CPF
    Set Global Variable  ${NOME_COMITENTE_API}
    Set Global Variable  ${DATA_NASCIMENTO_API}
    Set Global Variable  ${NOME_REPRESENT_API}
    Set Global Variable  ${ESTADO_CIVIL_API}
    Set Global Variable  ${TIPO_DOCUMENTO_API}

    Setar variaveis comitente PF residente API
    Dado Que eu chame a api de inclusão de comitente PF residente passando a apiKey ITAUAPIINT
    ${body}=        Que eu crie um novo body a partir de um ${JSON_INC_MAX}
    Set Global Variable  ${body}
    ${body}=        Setar dados no body da API PF residente
    ${body}=        Que eu altere o ${body} alterando o valor do campo birthDate no objeto individualInvestor para ${DATA_NASCIMENTO_API}
    ${body}=        Que eu altere o ${body} alterando o valor do campo investorName no objeto investor para ${NOME_COMITENTE_API}
    ${body}=        Que eu altere o ${body} alterando o valor do campo documentTypeCode no objeto individualInvestor para ${TIPO_DOCUMENTO_API}
    ${body}=        Que eu altere o ${body} alterando o valor do campo representativeName no objeto representativeInvestor para ${NOME_REPRESENT_API}
    ${body}=        Que eu altere o ${body} alterando o valor do campo professionName no objeto individualInvestor para 241
    ${body}=        Que eu altere o ${body} alterando o valor do campo maritalStatusCode no objeto individualInvestor para ${ESTADO_CIVIL_API}
    ${resposta}=    Que eu faça uma chamada POST enviando o ${body}
    Set Global Variable  ${resposta}
    Set Global Variable  ${NOME_COMITENTE_API}
    Então a chamada deve ter status 200

TST0002: PF RESIDENTE (API) - Depara Dados do Comitente - DONO
    [Documentation]   Teste de API Comitente PF como Dono do cadastro: Validar sucesso no cadastro com dados máximos preenchidos
    [Tags]    DEPARA API
    ${TAG_NUMBER}=       Setar tagNumber
    Set Global Variable  ${TAG_NUMBER}
    ${DOC_COMITENTE_API}=    Set Variable  ${CPF_COMITENTE}
    Set Global Variable  ${DOC_COMITENTE_API}

    Pega valores das colunas da api para dados basicos do comitente
    Pega valores das colunas da api para dados relacionamento profissional do comitente
    Pega valores das colunas da api para dados faturamento do comitente
    Pega valores das colunas da api para fatca do comitente
    Pega valores das colunas da api para dados investidor do comitente
    Pega valores das colunas da api para endereço do comitente
    Pega valores das colunas da api para email do comitente

    Pega valores das colunas da api para dados investidor do responsavel menor
    Pega valores das colunas da api para email do responsavel menor
    Pega valores das colunas da api para telefone do responsavel menor


    Pega valores das colunas da api para dados investidor do inventariante
    Pega valores das colunas da api para email do inventariante
    Pega valores das colunas da api para telefone do inventariante

    O usuario loga no NoMe como CETIP
    O usuario acessa o menu de consulta comitente
    keywordConsultaComitente.O usuario faz a busca do comitente ${TIPO_PESSOA} ${DOC_COMITENTE_API}
    Pega valores das colunas da tela de consulta comitente
    Entao faz o depara dos campos entre tela e api para email do comitente
    Entao faz o depara dos campos entre tela e api para representante menor
    Entao faz o depara dos campos entre tela e api para inventariante
    close browser

    Entao faz o depara dos campos entre tela e api para dados basicos do comitente
    Entao faz o depara dos campos entre tela e api para dados faturamento do comitente
    Entao faz o depara dos campos entre tela e api para fatca do comitente
    Entao faz o depara dos campos entre tela e api para dados investidor do comitente
    Entao faz o depara dos campos entre tela e api para endereço do comitente
    #Entao faz o depara dos campos entre tela e api para email do comitente
TST0003: PF RESIDENTE (API) - Depara Dados do Representante Comitente - DONO
    [Documentation]   Teste de API Comitente PJ como Dono do cadastro: Validar sucesso no cadastro com dados máximos preenchidos
    [Tags]    DEPARA API
    ${TAG_NUMBER}=       Setar tagNumber
    Set Global Variable  ${TAG_NUMBER}
    Pega valores das colunas da api para dados basicos do representante
    Pega valores das colunas da api para endereço do representante
    Pega valores das colunas da api para email do representante
    Pega valores das colunas da api para telefone do representante

    O usuario loga no NoMe como CETIP
    O usuario acessa o menu de consulta representante comitente
    keywordConsultaRepresentanteComitente.O usuario faz a busca do comitente ${TIPO_PESSOA} ${DOC_COMITENTE_API}
    Pega valores das colunas da tela de consulta representante comitente
    close browser

    Entao faz o depara dos campos entre tela e api para dados basicos do representante
    Entao faz o depara dos campos entre tela e api para endereço do representante
    Entao faz o depara dos campos entre tela e api para email do representante
    Entao faz o depara dos campos entre tela e api para telefone do representante
*** Keywords ***
Limpa string API ${value}
    LOG  ${value}
    ${value}=    Convert To String   ${value}
    ${value}=    Replace String      ${value}    [   ${EMPTY}
    ${value}=    Replace String      ${value}    ]   ${EMPTY}
    ${value}=    Replace String      ${value}    '   ${EMPTY}
    [Return]  ${value}
Pega valores das colunas da api para dados basicos do comitente
#   ###################Pega Dados da API#########################################################
#   ######################     **** data ***
    ${DATE}=                  Generate current date format ddmmyyyy
    ${DATA_ATU_COMITENTE_API}=          Set Variable  ${DATE}
    Set Global Variable  ${DATA_ATU_COMITENTE_API}
#   ######################     **** investor
    ${TITULAR_CONTA_COMITENTE_API}=     Que eu busque do ${body} o valor do campo customerAccountHolderCode no objeto investor
    ${TITULAR_CONTA_COMITENTE_API}=     Limpa string API ${TITULAR_CONTA_COMITENTE_API}
    Set Global Variable  ${TITULAR_CONTA_COMITENTE_API}
    ${NATUREZA_FISC_API}=               Que eu busque do ${body} o valor do campo taxNatureCode no objeto investor
    ${NATUREZA_FISC_API}=               Limpa string API ${NATUREZA_FISC_API}
    Set Global Variable  ${NATUREZA_FISC_API}
    ${PAIS_RESIDENCIA_API}=             Que eu busque do ${body} o valor do campo residenceCountryCode no objeto investor
    ${PAIS_RESIDENCIA_API}=             Limpa string API ${PAIS_RESIDENCIA_API}
    Set Global Variable  ${PAIS_RESIDENCIA_API}
    ${CODIGO_LEI_API}=                  Que eu busque do ${body} o valor do campo leiCode no objeto investor
    ${CODIGO_LEI_API}=                  Limpa string API ${CODIGO_LEI_API}
    Set Global Variable  ${CODIGO_LEI_API}
Pega valores das colunas da api para dados faturamento do comitente
#   ######################     **** equitySituation
    ${FATURAMENTO_ANUAL_API}=           Que eu busque do ${body} o valor do campo annualIncomeValue no objeto investor.equitySituation
    ${FATURAMENTO_ANUAL_API}=           Limpa string API ${FATURAMENTO_ANUAL_API}
    Set Global Variable  ${FATURAMENTO_ANUAL_API}
    ${DATA_FAT_ANUAL_API}=             Que eu busque do ${body} o valor do campo annualIncomeDate no objeto investor.equitySituation
    ${DATA_FAT_ANUAL_API}=             Limpa string API ${DATA_FAT_ANUAL_API}
    Set Global Variable  ${DATA_FAT_ANUAL_API}
    ${FATURAMENTO_PATRIMONIAL_API}=    Que eu busque do ${body} o valor do campo equityValue no objeto investor.equitySituation
    ${FATURAMENTO_PATRIMONIAL_API}=    Limpa string API ${FATURAMENTO_PATRIMONIAL_API}
    Set Global Variable  ${FATURAMENTO_PATRIMONIAL_API}
    ${DATA_SIT_PATRIM_API}=            Que eu busque do ${body} o valor do campo equityDate no objeto investor.equitySituation
    ${DATA_SIT_PATRIM_API}=            Limpa string API ${DATA_SIT_PATRIM_API}
    Set Global Variable  ${DATA_SIT_PATRIM_API}
    ${CAPACIDADE_FINC_API}=             Que eu busque do ${body} o valor do campo lastYearBillingValue no objeto investor.equitySituation
    ${CAPACIDADE_FINC_API}=             Limpa string API ${CAPACIDADE_FINC_API}
    Set Global Variable  ${CAPACIDADE_FINC_API}
    ${DATA_CAPACIDADE_FINC_API}=        Que eu busque do ${body} o valor do campo billingDate no objeto investor.equitySituation
    ${DATA_CAPACIDADE_FINC_API}=        Limpa string API ${DATA_CAPACIDADE_FINC_API}
    Set Global Variable  ${DATA_CAPACIDADE_FINC_API}
Pega valores das colunas da api para fatca do comitente
#   ######################     **** fatca
    ${PAIS_ENVOLVIDO_API}=              Set Variable   DINAMARCA
    ${PAIS_ENVOLVIDO_API}=              Limpa string API ${PAIS_ENVOLVIDO_API}
    Set Global Variable  ${PAIS_ENVOLVIDO_API}
    ${PAIS_ORIGEM_INVEST_API}=          Set Variable   PALESTINA
    ${PAIS_ORIGEM_INVEST_API}=          Limpa string API ${PAIS_ORIGEM_INVEST_API}
    Set Global Variable  ${PAIS_ORIGEM_INVEST_API}
    ${GIIN_API}=                        Que eu busque do ${body} o valor do campo giinNumber no objeto investor.fatca
    ${GIIN_API}=                        Limpa string API ${GIIN_API}
    Set Global Variable  ${GIIN_API}
Pega valores das colunas da api para dados investidor do comitente
#   ######################     **** individualInvestor
    ${MUNICIPIO_NASC_API}=             Set Variable   SALTO
    ${MUNICIPIO_NASC_API}=             Limpa string API ${MUNICIPIO_NASC_API}
    Set Global Variable  ${MUNICIPIO_NASC_API}
    ${UF_NAS_API}=                     Set Variable   SP
    ${UF_NAS_API}=                     Limpa string API ${UF_NAS_API}
    Set Global Variable  ${UF_NAS_API}
    ${PESSOA_VINCULADA_API}=           Que eu busque do ${body} o valor do campo relatedPersonIndicator no objeto individualInvestor
    ${PESSOA_VINCULADA_API}=           Limpa string API ${PESSOA_VINCULADA_API}
    Set Global Variable  ${PESSOA_VINCULADA_API}
    ${CLASSIFICACAO_RISCO_API}=        Que eu busque do ${body} o valor do campo riskClassificationCode no objeto individualInvestor
    ${CLASSIFICACAO_RISCO_API}=        Limpa string API ${CLASSIFICACAO_RISCO_API}
    Set Global Variable  ${CLASSIFICACAO_RISCO_API}
    ${DESC_CLASSIFICACAO_RISCO_API}=   Que eu busque do ${body} o valor do campo riskClassificationName no objeto individualInvestor
    ${DESC_CLASSIFICACAO_RISCO_API}=   Limpa string API ${DESC_CLASSIFICACAO_RISCO_API}
    Set Global Variable  ${DESC_CLASSIFICACAO_RISCO_API}
    ${PROFISSAO_API}=                  Set Variable   ADVOGADO
    ${PROFISSAO_API}=                  Limpa string API ${PROFISSAO_API}
    Set Global Variable  ${PROFISSAO_API}
    ${ADM_FUNDO_API}=                 Que eu busque do ${body} o valor do campo administrativePortfolioManagerIndicator no objeto individualInvestor
    ${ADM_FUNDO_API}=                 Limpa string API ${ADM_FUNDO_API}
    Set Global Variable  ${ADM_FUNDO_API}
    ${AUTORIZA_TRANS_TERCEIRO_API}=   Que eu busque do ${body} o valor do campo authorizeOrderTransmissionByThird no objeto individualInvestor
    ${AUTORIZA_TRANS_TERCEIRO_API}=   Limpa string API ${AUTORIZA_TRANS_TERCEIRO_API}
    Set Global Variable  ${AUTORIZA_TRANS_TERCEIRO_API}
    ${US_PERSON_API}=                 Que eu busque do ${body} o valor do campo usPersonIndicator no objeto individualInvestor
    ${US_PERSON_API}=                 Limpa string API ${US_PERSON_API}
    Set Global Variable  ${US_PERSON_API}
    ${ADM_CARTEIRA_API}=              Que eu busque do ${body} o valor do campo administrativePortfolioManagerIndicator no objeto individualInvestor
    ${ADM_CARTEIRA_API}=              Limpa string API ${ADM_CARTEIRA_API}
    Set Global Variable  ${ADM_CARTEIRA_API}
    ${PRIVATE_BANK_API}=              Que eu busque do ${body} o valor do campo usPersonIndicator no objeto individualInvestor
    ${PRIVATE_BANK_API}=              Limpa string API ${PRIVATE_BANK_API}
    Set Global Variable  ${PRIVATE_BANK_API}
    ${NOME_CONJUGE_API}=              Que eu busque do ${body} o valor do campo partnerName no objeto individualInvestor
    ${NOME_CONJUGE_API}=              Limpa string API ${NOME_CONJUGE_API}
    Set Global Variable  ${NOME_CONJUGE_API}
    ${CPF_CONJUGE_API}=               Que eu busque do ${body} o valor do campo partnerCpfNumber no objeto individualInvestor
    ${CPF_CONJUGE_API}=               Limpa string API ${CPF_CONJUGE_API}
    Set Global Variable  ${CPF_CONJUGE_API}
Pega valores das colunas da api para dados relacionamento profissional do comitente
#   ######################     **** professionalRelationship
    ${TRABALHA_EMP_API}=              Que eu busque do ${body} o valor do campo workCompanyIndicator no objeto individualInvestor.professionalRelationship
    ${TRABALHA_EMP_API}=              Limpa string API ${TRABALHA_EMP_API}
    Set Global Variable  ${TRABALHA_EMP_API}
    ${CNPJ_EMP_API}=                  Que eu busque do ${body} o valor do campo workCompanyDocumentNumber no objeto individualInvestor.professionalRelationship
    ${CNPJ_EMP_API}=                  Limpa string API ${CNPJ_EMP_API}
    Set Global Variable  ${CNPJ_EMP_API}
    ${NOME_EMP_API}=                  Que eu busque do ${body} o valor do campo workCompanyName no objeto individualInvestor.professionalRelationship
    ${NOME_EMP_API}=                  Limpa string API ${NOME_EMP_API}
    Set Global Variable  ${NOME_EMP_API}
Pega valores das colunas da api para endereço do comitente
#   ######################     **** addressIndividualInvestor
    ${TIPO_ENDERECO_END_API}=           Que eu busque do ${body} o valor do campo addressTypeCode no objeto individualInvestor.addressIndividualInvestor
    ${TIPO_ENDERECO_END_API}=           Limpa string API ${TIPO_ENDERECO_END_API}
    Set Global Variable  ${TIPO_ENDERECO_END_API}
    ${LOGRADOURO_END_API}=              Que eu busque do ${body} o valor do campo addressTypeName no objeto individualInvestor.addressIndividualInvestor
    ${LOGRADOURO_END_API}=              Limpa string API ${LOGRADOURO_END_API}
    Set Global Variable  ${LOGRADOURO_END_API}
    ${NUM_LOGRADOURO_END_API}=          Que eu busque do ${body} o valor do campo addressNumber no objeto individualInvestor.addressIndividualInvestor
    ${NUM_LOGRADOURO_END_API}=          Limpa string API ${NUM_LOGRADOURO_END_API}
    Set Global Variable  ${NUM_LOGRADOURO_END_API}
    ${COMPLEMENTO_END_API}=             Que eu busque do ${body} o valor do campo addressComplementName no objeto individualInvestor.addressIndividualInvestor
    ${COMPLEMENTO_END_API}=             Limpa string API ${COMPLEMENTO_END_API}
    Set Global Variable  ${COMPLEMENTO_END_API}
    ${BAIRRO_END_API}=                  Que eu busque do ${body} o valor do campo neighborhoodName no objeto individualInvestor.addressIndividualInvestor
    ${BAIRRO_END_API}=                   Limpa string API ${BAIRRO_END_API}
    Set Global Variable  ${BAIRRO_END_API}
    ${CEP_END_API}=                     Que eu busque do ${body} o valor do campo zipCode no objeto individualInvestor.addressIndividualInvestor
    ${CEP_END_API}=                     Limpa string API ${CEP_END_API}
    ${CEP_END_API}=                     Convert To String   ${CEP_END_API}
    ${CEP_END_API}=                     Replace String      ${CEP_END_API}    -   ${EMPTY}
    Set Global Variable  ${CEP_END_API}
    ${MUNICIPIO_END_API}=               Set Variable   TERRA ROXA
    ${MUNICIPIO_END_API}=               Limpa string API ${MUNICIPIO_END_API}
    Set Global Variable  ${MUNICIPIO_END_API}
    ${UF_END_API}=                      Set Variable   PR
    ${UF_END_API}=                      Limpa string API ${UF_END_API}
    Set Global Variable  ${UF_END_API}
Pega valores das colunas da api para email do comitente
#   ######################     **** emailIndividualInvestor
    ${TIPO_EMAIL_API}=                 Que eu busque do ${body} o valor do campo emailTypeCode no objeto individualInvestor.addressIndividualInvestor.emailIndividualInvestor
    ${TIPO_EMAIL_API}=                 Limpa string API ${TIPO_EMAIL_API}
    Set Global Variable  ${TIPO_EMAIL_API}
    ${EMAIL_API}=                      Que eu busque do ${body} o valor do campo emailName no objeto individualInvestor.addressIndividualInvestor.emailIndividualInvestor
    ${EMAIL_API}=                      Limpa string API ${EMAIL_API}
    Set Global Variable  ${EMAIL_API}
Pega valores das colunas da api para telefone do comitente
#   ######################     **** adressPhoneRepresentativeInvestor
    ${DDD_API}=                         Que eu busque do ${body} o valor do campo phoneAreaCodeNumber no objeto individualInvestor.addressIndividualInvestor.addressPhoneIndividualInvestor
    ${DDD_API}=                         Limpa string API ${DDD_API}
    Set Global Variable  ${DDD_API}
    ${TELEFONE_API}=                    Que eu busque do ${body} o valor do campo phoneNumber no objeto individualInvestor.addressIndividualInvestor.addressPhoneIndividualInvestor
    ${TELEFONE_API}=                    Limpa string API ${TELEFONE_API}
    Set Global Variable  ${TELEFONE_API}
    ${RAMAL_API}=                       Que eu busque do ${body} o valor do campo phoneExtension no objeto individualInvestor.addressIndividualInvestor.addressPhoneIndividualInvestor
    ${RAMAL_API}=                       Limpa string API ${RAMAL_API}
    Set Global Variable  ${RAMAL_API}
    ${TIPO_TELEFONE_API}=               Que eu busque do ${body} o valor do campo phoneTypeCode no objeto individualInvestor.addressIndividualInvestor.addressPhoneIndividualInvestor
    ${TIPO_TELEFONE_API}=               Limpa string API ${TIPO_TELEFONE_API}
    Set Global Variable  ${TIPO_TELEFONE_API}

#   ######################     **** minorResponsible
Pega valores das colunas da api para dados investidor do responsavel menor
    ${MENOR_EMANCIPADO_API}=           Que eu busque do ${body} o valor do campo emancipatedIndicator no objeto individualInvestor.minorResponsible
    ${MENOR_EMANCIPADO_API}=           Limpa string API ${MENOR_EMANCIPADO_API}
    Set Global Variable  ${TIPO_EMAIL_API}
    ${NOME_MENOR_API}=                 Que eu busque do ${body} o valor do campo minorResponsibleName no objeto individualInvestor.minorResponsible
    ${NOME_MENOR_API}=                 Limpa string API ${NOME_MENOR_API}
    Set Global Variable  ${NOME_MENOR_API}
    ${CPF_MENOR_API}=                 Que eu busque do ${body} o valor do campo minorResponsibleCpfNumber no objeto individualInvestor.minorResponsible
    ${CPF_MENOR_API}=                 Limpa string API ${CPF_MENOR_API}
    Set Global Variable  ${CPF_MENOR_API}
Pega valores das colunas da api para email do responsavel menor
#   ######################     **** emailMinorResponsible
    ${TIPO_EMAIL_MENOR_API}=           Que eu busque do ${body} o valor do campo emailTypeCode no objeto individualInvestor.minorResponsible.emailMinorResponsible
    ${TIPO_EMAIL_MENOR_API}=           Limpa string API ${TIPO_EMAIL_MENOR_API}
    Set Global Variable  ${TIPO_EMAIL_MENOR_API}
    ${EMAIL_MENOR_API}=               Que eu busque do ${body} o valor do campo emailName no objeto individualInvestor.minorResponsible.emailMinorResponsible
    ${EMAIL_MENOR_API}=               Limpa string API ${EMAIL_MENOR_API}
    Set Global Variable  ${EMAIL_MENOR_API}
Pega valores das colunas da api para telefone do responsavel menor
#   ######################     **** privatePhoneMinorResponsible
    ${DDD_MENOR_API}=                  Que eu busque do ${body} o valor do campo phoneAreaCodeNumber no objeto individualInvestor.minorResponsible.privatePhoneMinorResponsible
    ${DDD_MENOR_API}=                  Limpa string API ${DDD_MENOR_API}
    Set Global Variable  ${DDD_MENOR_API}
    ${TELEFONE_MENOR_API}=             Que eu busque do ${body} o valor do campo phoneNumber no objeto individualInvestor.minorResponsible.privatePhoneMinorResponsible
    ${TELEFONE_MENOR_API}=             Limpa string API ${TELEFONE_MENOR_API}
    Set Global Variable  ${TELEFONE_MENOR_API}
    ${TIPO_TELEFONE_MENOR_API}=        Que eu busque do ${body} o valor do campo phoneTypeCode no objeto individualInvestor.minorResponsible.privatePhoneMinorResponsible
    ${TIPO_TELEFONE_MENOR_API}=        Limpa string API ${TIPO_TELEFONE_MENOR_API}
    Set Global Variable  ${TIPO_TELEFONE_MENOR_API}

#   ######################     **** inventory
Pega valores das colunas da api para dados investidor do inventariante
    ${FALECIDO_API}=                    Que eu busque do ${body} o valor do campo investorDeceasedIndicator no objeto individualInvestor.inventory
    ${FALECIDO_API}=                    Limpa string API ${FALECIDO_API}
    Set Global Variable  ${FALECIDO_API}
    ${INVENTARIANTE_NOME_API}=          Que eu busque do ${body} o valor do campo inventoryName no objeto individualInvestor.inventory
    ${INVENTARIANTE_NOME_API}=          Limpa string API ${INVENTARIANTE_NOME_API}
    Set Global Variable  ${INVENTARIANTE_NOME_API}
    ${CPF_INVENTARIANTE_API}=           Que eu busque do ${body} o valor do campo inventoryCpfNumber no objeto individualInvestor.inventory
    ${CPF_INVENTARIANTE_API}=           Limpa string API ${CPF_INVENTARIANTE_API}
    Set Global Variable  ${CPF_INVENTARIANTE_API}
Pega valores das colunas da api para email do inventariante
#   ######################     **** emailInventory
    ${TIPO_EMAIL_INVENTARIANTE_API}=    Que eu busque do ${body} o valor do campo emailTypeCode no objeto individualInvestor.inventory.emailInventory
    ${TIPO_EMAIL_INVENTARIANTE_API}=    Limpa string API ${TIPO_EMAIL_INVENTARIANTE_API}
    Set Global Variable  ${TIPO_EMAIL_INVENTARIANTE_API}
    ${EMAIL_INVENTARIANTE_API}=         Que eu busque do ${body} o valor do campo emailName no objeto individualInvestor.inventory.emailInventory
    ${EMAIL_INVENTARIANTE_API}=         Limpa string API ${EMAIL_INVENTARIANTE_API}
    Set Global Variable  ${EMAIL_INVENTARIANTE_API}
Pega valores das colunas da api para telefone do inventariante
#   ######################     **** privatePhoneInventory
    ${DDD_INVENTARIANTE_API}=           Que eu busque do ${body} o valor do campo phoneAreaCodeNumber no objeto individualInvestor.inventory.privatePhoneInventory
    ${DDD_INVENTARIANTE_API}=           Limpa string API ${DDD_INVENTARIANTE_API}
    Set Global Variable  ${DDD_INVENTARIANTE_API}
    ${TELEFONE_INVENTARIANTE_API}=      Que eu busque do ${body} o valor do campo phoneNumber no objeto individualInvestor.inventory.privatePhoneInventory
    ${TELEFONE_INVENTARIANTE_API}=      Limpa string API ${TELEFONE_INVENTARIANTE_API}
    Set Global Variable  ${TELEFONE_INVENTARIANTE_API}
    ${TIPO_TELEFONE_INVENTARIANTE_API}=  Que eu busque do ${body} o valor do campo phoneTypeCode no objeto individualInvestor.inventory.privatePhoneInventory
    ${TIPO_TELEFONE_INVENTARIANTE_API}=  Limpa string API ${TIPO_TELEFONE_INVENTARIANTE_API}
    Set Global Variable  ${TIPO_TELEFONE_INVENTARIANTE_API}

Pega valores das colunas da api para dados basicos do representante
#   ######################     **** representativeInvestor
    ${DOC_REPRESENT_API}=              Que eu busque do ${body} o valor do campo documentNumber no objeto representativeInvestor
    ${DOC_REPRESENT_API}=              Limpa string API ${DOC_REPRESENT_API}
    Set Global Variable  ${DOC_REPRESENT_API}
    ${PEP_REPRESENT_API}=              Que eu busque do ${body} o valor do campo politicallyExposedPersonCode no objeto representativeInvestor
    ${PEP_REPRESENT_API}=              Limpa string API ${PEP_REPRESENT_API}
    IF  "${PEP_REPRESENT_API}" == "FALSO"
        ${PEP_REPRESENT_API}=  Set Variable  Não
    ELSE IF  "${PEP_REPRESENT_API}" == "VERDADEIRO"
        ${PEP_REPRESENT_API}=  Set Variable  Sim
    END
    Set Global Variable  ${PEP_REPRESENT_API}
Pega valores das colunas da api para endereço do representante
#   ######################     **** addressRepresentativeInvestor
    ${TIPO_ENDERECO_REPRESENT_API}=    Que eu busque do ${body} o valor do campo addressTypeCode no objeto representativeInvestor.addressRepresentativeInvestor
    ${TIPO_ENDERECO_REPRESENT_API}=    Limpa string API ${TIPO_ENDERECO_REPRESENT_API}
    Set Global Variable  ${TIPO_ENDERECO_REPRESENT_API}
    ${LOGRADOURO_REPRESENT_API}=       Que eu busque do ${body} o valor do campo addressTypeName no objeto representativeInvestor.addressRepresentativeInvestor
    ${LOGRADOURO_REPRESENT_API}=       Limpa string API ${LOGRADOURO_REPRESENT_API}
    Set Global Variable  ${LOGRADOURO_REPRESENT_API}
    ${NUM_LOGRADOURO_REPRESENT_API}=   Que eu busque do ${body} o valor do campo addressNumber no objeto representativeInvestor.addressRepresentativeInvestor
    ${NUM_LOGRADOURO_REPRESENT_API}=   Limpa string API ${NUM_LOGRADOURO_REPRESENT_API}
    Set Global Variable  ${NUM_LOGRADOURO_REPRESENT_API}
    ${COMPLEMENTO_REPRESENT_API}=      Que eu busque do ${body} o valor do campo addressComplementName no objeto representativeInvestor.addressRepresentativeInvestor
    ${COMPLEMENTO_REPRESENT_API}=      Limpa string API ${COMPLEMENTO_REPRESENT_API}
    Set Global Variable  ${COMPLEMENTO_REPRESENT_API}
    ${BAIRRO_REPRESENT_API}=           Que eu busque do ${body} o valor do campo neighborhoodName no objeto representativeInvestor.addressRepresentativeInvestor
    ${BAIRRO_REPRESENT_API}=           Limpa string API ${BAIRRO_REPRESENT_API}
    Set Global Variable  ${BAIRRO_REPRESENT_API}
    ${CEP_REPRESENT_API}=              Que eu busque do ${body} o valor do campo zipCode no objeto representativeInvestor.addressRepresentativeInvestor
    ${CEP_REPRESENT_API}=              Limpa string API ${CEP_REPRESENT_API}
    Set Global Variable  ${CEP_REPRESENT_API}
    ${MUNICIPIO_REPRESENT_API}=        Set Variable   INDAIATUBA
    ${MUNICIPIO_REPRESENT_API}=        Limpa string API ${MUNICIPIO_REPRESENT_API}
    Set Global Variable  ${MUNICIPIO_REPRESENT_API}
    ${UF_REPRESENT_API}=               Set Variable   SP
    ${UF_REPRESENT_API}=               Limpa string API ${UF_REPRESENT_API}
    Set Global Variable  ${UF_REPRESENT_API}
Pega valores das colunas da api para telefone do representante
#   ######################     **** adressPhoneRepresentativeInvestor
    ${DDD_REPRESENT_API}=              Que eu busque do ${body} o valor do campo phoneAreaCodeNumber no objeto representativeInvestor.addressRepresentativeInvestor.adressPhoneRepresentativeInvestor
    ${DDD_REPRESENT_API}=              Limpa string API ${DDD_REPRESENT_API}
    Set Global Variable  ${DDD_REPRESENT_API}
    ${TELEFONE_REPRESENT_API}=         Que eu busque do ${body} o valor do campo phoneNumber no objeto representativeInvestor.addressRepresentativeInvestor.adressPhoneRepresentativeInvestor
    ${TELEFONE_REPRESENT_API}=         Limpa string API ${TELEFONE_REPRESENT_API}
    Set Global Variable  ${TELEFONE_REPRESENT_API}
    ${RAMAL_REPRESENT_API}=            Que eu busque do ${body} o valor do campo phoneExtension no objeto representativeInvestor.addressRepresentativeInvestor.adressPhoneRepresentativeInvestor
    ${RAMAL_REPRESENT_API}=            Limpa string API ${RAMAL_REPRESENT_API}
    Set Global Variable  ${RAMAL_REPRESENT_API}
    ${TIPO_TELEFONE_REPRESENT_API}=    Que eu busque do ${body} o valor do campo phoneTypeCode no objeto representativeInvestor.addressRepresentativeInvestor.adressPhoneRepresentativeInvestor
    ${TIPO_TELEFONE_REPRESENT_API}=    Limpa string API ${TIPO_TELEFONE_REPRESENT_API}
    Set Global Variable  ${TIPO_TELEFONE_REPRESENT_API}
Pega valores das colunas da api para email do representante
    #   ######################     **** emailRepresentativeInvestor
    ${TIPO_EMAIL_REPRESENT_API}=       Que eu busque do ${body} o valor do campo emailTypeCode no objeto representativeInvestor.addressRepresentativeInvestor.emailRepresentativeInvestor
    ${TIPO_EMAIL_REPRESENT_API}=       Limpa string API ${TIPO_EMAIL_REPRESENT_API}
    Set Global Variable  ${TIPO_EMAIL_REPRESENT_API}
    ${EMAIL_REPRESENT_API}=            Que eu busque do ${body} o valor do campo emailName no objeto representativeInvestor.addressRepresentativeInvestor.emailRepresentativeInvestor
    ${EMAIL_REPRESENT_API}=            Limpa string API ${EMAIL_REPRESENT_API}
    Set Global Variable  ${EMAIL_REPRESENT_API}

Entao faz o depara dos campos entre tela e api para dados basicos do comitente
    Should Be True     "${DATA_ATU_COMITENTE_API}" == "${DATA_ATU_COMITENTE_TELA}"
    LOG   ${DATA_ATU_COMITENTE_API}
    LOG   ${DATA_ATU_COMITENTE_TELA}
    Should Be True     "${TITULAR_CONTA_COMITENTE_API}" == "${TITULAR_CONTA_COMITENTE_TELA}"
    LOG   ${TITULAR_CONTA_COMITENTE_API}
    LOG   ${TITULAR_CONTA_COMITENTE_TELA}
    Should Be True     "${DOC_COMITENTE_API}" == "${DOC_COMITENTE_TELA}"
    LOG   ${DOC_COMITENTE_API}
    LOG   ${DOC_COMITENTE_TELA}
    Should Be True     "${NOME_COMITENTE_API}" == "${NOME_COMITENTE_TELA}"
    LOG   ${NOME_COMITENTE_API}
    LOG   ${NOME_COMITENTE_TELA}
    Should Be True     "${CODIGO_LEI_API}" == "${CODIGO_LEI_TELA}"
    LOG   ${CODIGO_LEI_API}
    LOG   ${CODIGO_LEI_TELA}
Entao faz o depara dos campos entre tela e api para dados faturamento do comitente
    Should Be True     "${FATURAMENTO_ANUAL_API}" == "${FATURAMENTO_ANUAL_TELA}"
    LOG   ${FATURAMENTO_ANUAL_API}
    LOG   ${FATURAMENTO_ANUAL_TELA}
    Should Be True     "${DATA_FAT_ANUAL_API}" == "${DATA_FAT_ANUAL_TELA}"
    LOG   ${DATA_FAT_ANUAL_API}
    LOG   ${DATA_FAT_ANUAL_TELA}
    Should Be True     "${FATURAMENTO_PATRIMONIAL_API}" == "${FATURAMENTO_PATRIMONIAL_TELA}"
    LOG   ${FATURAMENTO_PATRIMONIAL_API}
    LOG   ${FATURAMENTO_PATRIMONIAL_TELA}
    Should Be True     "${DATA_SIT_PATRIM_API}" == "${DATA_SIT_PATRIM_TELA}"
    LOG   ${DATA_SIT_PATRIM_API}
    LOG   ${DATA_SIT_PATRIM_TELA}
    Should Be True     "${CAPACIDADE_FINC_API}" == "${CAPACIDADE_FINC_TELA}"
    LOG   ${CAPACIDADE_FINC_API}
    LOG   ${CAPACIDADE_FINC_TELA}
    Should Be True     "${DATA_CAPACIDADE_FINC_API}" == "${DATA_CAPACIDADE_FINC_TELA}"
    LOG   ${DATA_CAPACIDADE_FINC_API}
    LOG   ${DATA_CAPACIDADE_FINC_TELA}
Entao faz o depara dos campos entre tela e api para fatca do comitente
    Should Be True     "${PAIS_ENVOLVIDO_API}" == "${PAIS_ENVOLVIDO_TELA}"
    LOG   ${PAIS_ENVOLVIDO_API}
    LOG   ${PAIS_ENVOLVIDO_TELA}
    #Should Be True     "${PAIS_ORIGEM_INVEST_API}" == "${PAIS_ORIGEM_INVEST_TELA}"
    Should Be True     "${GIIN_API}" == "${GIIN_TELA}"
    LOG   ${GIIN_API}
    LOG   ${GIIN_TELA}
Entao faz o depara dos campos entre tela e api para dados investidor do comitente
    IF  "${AUTORIZA_TRANS_TERCEIRO_API}" == "N"
        ${AUTORIZA_TRANS_TERCEIRO_API}=  Set Variable  Não
    ELSE IF  "${AUTORIZA_TRANS_TERCEIRO_API}" == "P"
        ${AUTORIZA_TRANS_TERCEIRO_API}=  Set Variable  Procurador
    ELSE IF  "${AUTORIZA_TRANS_TERCEIRO_API}" == "A"
        ${AUTORIZA_TRANS_TERCEIRO_API}=  Set Variable  Administrador de Carteiras
    END
    Should Be True     "${AUTORIZA_TRANS_TERCEIRO_API}" == "${AUTORIZA_TRANS_TERCEIRO_TELA}"
    Should Be True     "${DATA_NASCIMENTO_API}" == "${DATA_NASCIMENTO_TELA}".lower()
    LOG   ${DATA_NASCIMENTO_API}
    LOG   ${DATA_NASCIMENTO_TELA}
    IF  "${COD_GENDER}" == "MASCULINO"
        ${COD_GENDER}=  Set Variable  Masculino
    ELSE IF  "${COD_GENDER}" == "FEMININO"
        ${COD_GENDER}=  Set Variable  Feminino
    ELSE IF  "${COD_GENDER}" == "NAO_BINARIO"
        ${COD_GENDER}=  Set Variable  Não binário
    ELSE IF  "${COD_GENDER}" == "PREFIRO_NAO_INFORMAR"
        ${COD_GENDER}=  Set Variable  Prefiro não informar
    END
    Should Be True     "${COD_GENDER.strip()}".lower() == "${GENERO_TELA}".lower()
    LOG   ${COD_GENDER}
    LOG   ${GENERO_TELA}
    ${FATHER}=   Deixar string sem acento espacos e minusculo ${FATHER}
    Should Be True     "${FATHER}".lower() == "${NOME_PAI_TELA}".lower()
    LOG   ${FATHER}
    LOG   ${NOME_PAI_TELA}
    ${MOTHER}=   Deixar string sem acento espacos e minusculo ${MOTHER}
    Should Be True     "${MOTHER.strip()}".lower() == "${NOME_MAE_TELA}".lower()
    LOG   ${MOTHER}
    LOG   ${NOME_MAE_TELA}
    IF   "${ESTADO_CIVIL_API}" == "VIUVO"
          ${ESTADO_CIVIL_API}=  Set Variable  VIÚVO (A)
    END
    Should Be True     "${ESTADO_CIVIL_API}".lower() == "${ESTADO_CIVIL_TELA}".lower()
    LOG   ${ESTADO_CIVIL_API}
    LOG   ${ESTADO_CIVIL_TELA}
    Should Be True     "${UF_NAS_API}" == "${UF_NAS_TELA}"
    LOG   ${UF_NAS_API}
    LOG   ${UF_NAS_TELA}
    Should Be True     "${MUNICIPIO_NASC_API.strip()}".lower() == "${MUNICIPIO_NASC_TELA}".lower()
    LOG   ${MUNICIPIO_NASC_API}
    LOG   ${MUNICIPIO_NASC_TELA}
    IF  "${PESSOA_VINCULADA_API}" == "False"
        ${PESSOA_VINCULADA_API}=  Set Variable  Não
    ELSE
        ${PESSOA_VINCULADA_API}=  Set Variable  Sim
    END
    Should Be True     "${PESSOA_VINCULADA_API}" == "${PESSOA_VINCULADA_TELA}"
    LOG   ${PESSOA_VINCULADA_API}
    LOG   ${PESSOA_VINCULADA_TELA}
    IF  "${COD_PPE}" == "FALSO"
        ${COD_PPE}=  Set Variable  Não
    ELSE IF  "${COD_PPE}" == "VERDADEIRO"
        ${COD_PPE}=  Set Variable  Sim
    ELSE IF  "${COD_PPE}" == "NAO_INFORMADO"
        ${COD_PPE}=  Set Variable  Não informado
    END
    Should Be True     "${COD_PPE}" == "${TIPO_PPE_TELA}"
    LOG   ${COD_PPE}
    LOG   ${TIPO_PPE_TELA}
    Should Be True     "${PROFISSAO_API.strip()}".lower() == "${PROFISSAO_TELA}".lower()
    LOG   ${PROFISSAO_API}
    LOG   ${PROFISSAO_TELA}
    Should Be True     "${TIPO_DOCUMENTO_API}" == "${TIPO_DOCUMENTO_TELA}"
    LOG   ${TIPO_DOCUMENTO_API}
    LOG   ${TIPO_DOCUMENTO_TELA}
    Should Be True     "${CPF_DOC}" == "${NUMERO_DOCUMENTO_TELA}"
    LOG   ${CPF_DOC}
    LOG   ${NUMERO_DOCUMENTO_TELA}
    #Should Be True     "${ORGAO_EXPEDIDOR}" == "${ORGAO_EXP_TELA}"
    #LOG   ${ORGAO_EXPEDIDOR}
    #LOG   ${ORGAO_EXP_TELA}
    Should Be True     "${DATE}" == "${DATA_EXP_TELA}"
    LOG   ${DATE}
    LOG   ${DATA_EXP_TELA}
    Should Be True     "${NOME_SOCIAL.strip()}".lower() == "${NOME_SOCIAL_TELA}".lower()
    LOG   ${NOME_SOCIAL}
    LOG   ${NOME_SOCIAL_TELA}
    IF  "${US_PERSON_API}" == "False"
        ${US_PERSON_API}=  Set Variable  Não
    ELSE
        ${US_PERSON_API}=  Set Variable  Sim
    END
    Should Be True     "${US_PERSON_API}" == "${US_PERSON_TELA}"
    LOG   ${US_PERSON_API}
    LOG   ${US_PERSON_TELA}
    IF  "${PRIVATE_BANK_API}" == "False"
        ${PRIVATE_BANK_API}=  Set Variable  Não
    ELSE
        ${PRIVATE_BANK_API}=  Set Variable  Sim
    END
    Should Be True     "${PRIVATE_BANK_API}" == "${PRIVATE_BANK_TELA}"
    LOG   ${PRIVATE_BANK_API}
    LOG   ${PRIVATE_BANK_TELA}
    Should Be True     "${CPF_CONJUGE_API}" == "${CPF_CONJUGE_TELA}"
    LOG   ${CPF_CONJUGE_API}
    LOG   ${CPF_CONJUGE_TELA}
    Should Be True     "${NOME_CONJUGE_API.strip()}".lower() == "${NOME_CONJUGE_TELA}".lower()
    LOG   ${NOME_CONJUGE_API}
    LOG   ${NOME_CONJUGE_TELA}
    IF  "${TRABALHA_EMP_API}" == "False"
        ${TRABALHA_EMP_API}=  Set Variable  Não
    ELSE
        ${TRABALHA_EMP_API}=  Set Variable  Sim
    END
    Should Be True     "${TRABALHA_EMP_API}" == "${TRABALHA_EMP_TELA}"
    LOG   ${TRABALHA_EMP_API}
    LOG   ${TRABALHA_EMP_TELA}
    Should Be True     "${CNPJ_EMP_API}" == "${CNPJ_EMP_TELA}"
    LOG   ${CNPJ_EMP_API}
    LOG   ${CNPJ_EMP_TELA}
    Should Be True     "${NOME_EMP_API.strip()}".lower() == "${NOME_EMP_TELA}".lower()
    LOG   ${NOME_EMP_API}
    LOG   ${NOME_EMP_TELA}
    IF  "${ADM_CARTEIRA_API}" == "False"
        ${ADM_CARTEIRA_API}=  Set Variable  Não
    ELSE
        ${ADM_CARTEIRA_API}=  Set Variable  Sim
    END
    Should Be True     "${ADM_CARTEIRA_API}" == "${ADM_CARTEIRA_TELA}"
    LOG   ${ADM_CARTEIRA_API}
    LOG   ${ADM_CARTEIRA_TELA}
    IF  "${ADM_FUNDO_API}" == "False"
        ${ADM_FUNDO_API}=  Set Variable  Não
    ELSE
        ${ADM_FUNDO_API}=  Set Variable  Sim
    END
    Should Be True     "${ADM_FUNDO_API}" == "${ADM_FUNDO_TELA}"
    LOG   ${ADM_FUNDO_API}
    LOG   ${ADM_FUNDO_TELA}
Entao faz o depara dos campos entre tela e api para endereço do comitente
    Should Be True     "${TIPO_ENDERECO_END_API}" == "${TIPO_ENDERECO_END_TELA}"
    LOG   ${TIPO_ENDERECO_END_API}
    LOG   ${TIPO_ENDERECO_END_TELA}
    Should Be True     "${LOGRADOURO_END_API.strip()}".lower() == "${LOGRADOURO_END_TELA}".lower()
    LOG   ${LOGRADOURO_END_API}
    LOG   ${LOGRADOURO_END_TELA}
    Should Be True     "${NUM_LOGRADOURO_END_API.strip()}" == "${NUM_LOGRADOURO_END_TELA}"
    LOG   ${NUM_LOGRADOURO_END_API}
    LOG   ${NUM_LOGRADOURO_END_TELA}
    Should Be True     "${COMPLEMENTO_END_API.strip()}".lower() == "${COMPLEMENTO_END_TELA}".lower()
    LOG   ${COMPLEMENTO_END_API}
    LOG   ${COMPLEMENTO_END_TELA}
    Should Be True     "${BAIRRO_END_API.strip()}".lower() == "${BAIRRO_END_TELA}".lower()
    LOG   ${BAIRRO_END_API}
    LOG   ${BAIRRO_END_TELA}
    Should Be True     "${CEP_END_API.strip()}" == "${CEP_END_TELA}"
    LOG   ${CEP_END_API}
    LOG   ${CEP_END_TELA}
    Should Be True     "${MUNICIPIO_END_API}".lower() == "${MUNICIPIO_END_TELA}".lower()
    LOG   ${MUNICIPIO_END_API}
    LOG   ${MUNICIPIO_END_TELA}
    Should Be True     "${UF_END_API}" == "${UF_END_TELA}"
    lOG   ${UF_END_API}
    LOG   ${UF_END_TELA}
Entao faz o depara dos campos entre tela e api para email do comitente
      Page Should Contain   ${TIPO_EMAIL_API}
      Page Should Contain   ${EMAIL_API}
#     Should Be True     "${TIPO_EMAIL_API}" == "${TIPO_EMAIL_TELA}"
#     LOG   ${TIPO_EMAIL_API}
#     LOG   ${TIPO_EMAIL_TELA}
#     Should Be True     "${EMAIL_API}".lower() == "${EMAIL_TELA}".lower()
#     LOG   ${EMAIL_API}
#     LOG   ${EMAIL_TELA}
Entao faz o depara dos campos entre tela e api para representante menor
      Page Should Contain   ${NOME_MENOR_API}
      Page Should Contain   ${CPF_MENOR_API}
      Page Should Contain   ${TIPO_EMAIL_MENOR_API}
      Page Should Contain   ${EMAIL_MENOR_API}
      Page Should Contain   ${DDD_MENOR_API}
      Page Should Contain   ${TELEFONE_MENOR_API}
      Page Should Contain   ${TIPO_TELEFONE_MENOR_API}
Entao faz o depara dos campos entre tela e api para inventariante
      Page Should Contain   ${INVENTARIANTE_NOME_API}
      Page Should Contain   ${CPF_INVENTARIANTE_API}
      Page Should Contain   ${TIPO_EMAIL_INVENTARIANTE_API}
      Page Should Contain   ${EMAIL_INVENTARIANTE_API}
      Page Should Contain   ${DDD_INVENTARIANTE_API}
      Page Should Contain   ${TELEFONE_INVENTARIANTE_API}
      Page Should Contain   ${TIPO_TELEFONE_INVENTARIANTE_API}
Entao faz o depara dos campos entre tela e api para dados basicos do representante
    Should Be True     "${DOC_REPRESENT_API.strip()}" == "${DOC_REPRESENT_TELA}"
    LOG   ${DOC_REPRESENT_API}
    LOG   ${DOC_REPRESENT_TELA}
    Should Be True     "${NOME_REPRESENT_API.strip()}" == "${NOME_REPRESENT_TELA}"
    LOG   ${NOME_REPRESENT_API}
    LOG   ${NOME_REPRESENT_TELA}
    Should Be True     "${PEP_REPRESENT_API.strip()}" == "${PEP_REPRESENT_TELA}"
    LOG   ${PEP_REPRESENT_API}
    LOG   ${PEP_REPRESENT_TELA}
Entao faz o depara dos campos entre tela e api para endereço do representante
    Should Be True     "${TIPO_ENDERECO_REPRESENT_API}" == "${TIPO_ENDERECO_REPRESENT_TELA}"
    LOG   ${TIPO_ENDERECO_REPRESENT_API}
    LOG   ${TIPO_ENDERECO_REPRESENT_TELA}
    Should Be True     "${LOGRADOURO_REPRESENT_API.strip()}".lower() == "${LOGRADOURO_REPRESENT_TELA}".lower()
    LOG   ${LOGRADOURO_REPRESENT_API}
    LOG   ${LOGRADOURO_REPRESENT_TELA}
    Should Be True     "${NUM_LOGRADOURO_REPRESENT_API.strip()}" == "${NUM_LOGRADOURO_REPRESENT_TELA}"
    LOG   ${NUM_LOGRADOURO_REPRESENT_API}
    LOG   ${NUM_LOGRADOURO_REPRESENT_TELA}
    Should Be True     "${COMPLEMENTO_REPRESENT_API.strip()}".lower() == "${COMPLEMENTO_REPRESENT_TELA}".lower()
    LOG   ${COMPLEMENTO_REPRESENT_API}
    LOG   ${COMPLEMENTO_REPRESENT_TELA}
    Should Be True     "${BAIRRO_REPRESENT_API.strip()}".lower() == "${BAIRRO_REPRESENT_TELA}".lower()
    LOG   ${BAIRRO_REPRESENT_API}
    LOG   ${BAIRRO_REPRESENT_TELA}
    Should Be True     "${CEP_REPRESENT_API.strip()}" == "${CEP_REPRESENT_TELA}"
    LOG   ${CEP_REPRESENT_API}
    LOG   ${CEP_REPRESENT_TELA}
    Should Be True     "${MUNICIPIO_REPRESENT_API}".lower() == "${MUNICIPIO_REPRESENT_TELA}".lower()
    LOG   ${MUNICIPIO_REPRESENT_API}
    LOG   ${MUNICIPIO_REPRESENT_TELA}
    Should Be True     "${UF_REPRESENT_API}" == "${UF_REPRESENT_TELA}"
    LOG   ${UF_REPRESENT_API}
    LOG   ${UF_REPRESENT_TELA}
Entao faz o depara dos campos entre tela e api para telefone do representante
    Should Be True     "${DDD_REPRESENT_API.strip()}" == "${DDD_REPRESENT_TELA}"
    LOG   ${DDD_REPRESENT_API}
    LOG   ${DDD_REPRESENT_TELA}
    Should Be True     "${TELEFONE_REPRESENT_API.strip()}" == "${TELEFONE_REPRESENT_TELA}"
    LOG   ${TELEFONE_REPRESENT_API}
    LOG   ${TELEFONE_REPRESENT_TELA}
    Should Be True     "${RAMAL_REPRESENT_API.strip()}" == "${RAMAL_REPRESENT_TELA}"
    LOG   ${RAMAL_REPRESENT_API}
    LOG   ${RAMAL_REPRESENT_TELA}
    Should Be True     "${TIPO_TELEFONE_REPRESENT_API.strip()}" == "${TIPO_TELEFONE_REPRESENT_TELA}"
    LOG   ${TIPO_TELEFONE_REPRESENT_API}
    LOG   ${TIPO_TELEFONE_REPRESENT_TELA}
Entao faz o depara dos campos entre tela e api para email do representante
    Should Be True     "${TIPO_EMAIL_REPRESENT_API}" == "${TIPO_EMAIL_REPRESENT_TELA}"
    LOG   ${TIPO_EMAIL_REPRESENT_API}
    LOG   ${TIPO_EMAIL_REPRESENT_TELA}
    Should Be True     "${EMAIL_REPRESENT_API}".lower() == "${EMAIL_REPRESENT_TELA}".lower()
    LOG   ${EMAIL_REPRESENT_API}
    LOG   ${EMAIL_REPRESENT_TELA}

*** Variable ***
${TIPO_PESSOA}=       Pessoa Física
${TIPO_ENDERECO}=     RESIDENCIAL
${TIPO_EMAIL}=        PARTICULAR
${BAIRRO}=            CENTRO
${PAIS}=              BRASIL
${NOME_SOCIAL}=       TESTE NOME SOCIAL
${PARTICIPANTE}=      ITAUBM
${DONO}=              SIM
${TOGGLE}=            S
${JSON_INC_MAX}=      ${CURDIR}\\..\\..\\..\\..\\GENERIC_VAR\\Comitente\\JsonApi\\JSON_COMITENTE_PF_MAXIMO.json
${JSON_INC_MIN}=      ${CURDIR}\\..\\..\\..\\..\\GENERIC_VAR\\Comitente\\JsonApi\\JSON_COMITENTE_PF_MINIMO.json
${NUMBER}=            0
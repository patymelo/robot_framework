*** Keywords ***
Dado que eu faça a chamada da API de Comitente PF com json completo
    Setar numero da TAG
    ${CPF_COMITENTE}=    Generate CPF with size   11
    Set Global Variable  ${CPF_COMITENTE}

    Setar variaveis comitente PF residente API
    Dado Que eu chame a api de inclusão de comitente PF residente passando a apiKey ITAUAPIINT
    ${body}=        Que eu crie um novo body a partir de um ${JSON_INC_MAX}
    Set Global Variable  ${body}
    ${body}=        Setar dados no body da API PF residente
    ${body}=        Que eu altere o ${body} alterando o valor do campo birthDate no objeto individualInvestor para 02/02/2010
    ${body}=        Que eu altere o ${body} alterando o valor do campo documentTypeCode no objeto individualInvestor para CPF
    Set Global Variable  ${body}
Dado que eu faça a chamada da API de Comitente PF com json minimo
    Setar numero da TAG
    ${CPF_COMITENTE}=    Generate CPF with size   11
    Set Global Variable  ${CPF_COMITENTE}

    Setar variaveis comitente PF residente API
    Dado Que eu chame a api de inclusão de comitente PF residente passando a apiKey ITAUAPIINT
    ${body}=        Que eu crie um novo body a partir de um ${JSON_INC_MIN}
    Set Global Variable  ${body}
    ${body}=        Setar dados no body da API PF residente
    ${body}=        Que eu altere o ${body} alterando o valor do campo birthDate no objeto individualInvestor para 02/02/2010
    ${body}=        Que eu altere o ${body} alterando o valor do campo documentTypeCode no objeto individualInvestor para CPF
    Set Global Variable  ${body}
Dado que eu monte o payload de um novo Comitente PF Residente com json completo NULL e preenchendo somente o mínimo de dados obrigatórios
    [Documentation]     Carrega um arquivo json com o mínimo de campo necessário para incluir comitente... Os demais campos serão preenchidos com valor null... Altera o comitente como menor de idade e emancipado.
    Setar numero da TAG
    ${CPF_COMITENTE}=    Generate CPF with size   11
    Set Global Variable  ${CPF_COMITENTE}

    Setar variaveis comitente PF residente API
    Dado Que eu chame a api de inclusão de comitente PF residente passando a apiKey ITAUAPIINT
    ${body}=        Que eu crie um novo body a partir de um ${JSON_INC_MAX_NULL}
    Set Global Variable  ${body}
    ${body}=        Setar dados no body da API PF residente
    ${body}=        Que eu altere o ${body} alterando o valor do campo birthDate no objeto individualInvestor para 02/02/2015
    ${body}=        Que eu altere o ${body} alterando o valor do campo emancipatedIndicator no objeto individualInvestor.minorResponsible para true
    ${body}=        Que eu altere o ${body} alterando o valor do campo documentTypeCode no objeto individualInvestor para CPF
    Set Global Variable  ${body}

Dado que eu monte o payload de um novo Comitente PF Residente menor de idade com json completo NULL e preenchendo somente o mínimo de dados obrigatórios
    [Documentation]     Carrega um arquivo json com o mínimo de campo necessário para incluir comitente... Os demais campos serão preenchidos com valor null... Altera o comitente como menor de idade e não emancipado.
    Setar numero da TAG
    ${CPF_COMITENTE}=    Generate CPF with size   11
    Set Global Variable  ${CPF_COMITENTE}

    Setar variaveis comitente PF residente API
    Dado Que eu chame a api de inclusão de comitente PF residente passando a apiKey ITAUAPIINT
    ${body}=        Que eu crie um novo body a partir de um ${JSON_INC_MAX_NULL}
    Set Global Variable  ${body}
    ${body}=        Setar dados no body da API PF residente
    ${body}=        Que eu altere o ${body} alterando o valor do campo birthDate no objeto individualInvestor para 02/02/2015
    ${body}=        Que eu altere o ${body} alterando o valor do campo emancipatedIndicator no objeto individualInvestor.minorResponsible para false
    ${body}=        Que eu altere o ${body} alterando o valor do campo documentTypeCode no objeto individualInvestor para CPF
    Set Global Variable  ${body}

Dado que eu monte o payload de um novo Comitente PF Residente preenchendo inventariante com json completo NULL e preenchendo somente o mínimo de dados obrigatórios
    [Documentation]     Carrega um arquivo json com o mínimo de campo necessário para incluir comitente... Os demais campos serão preenchidos com valor null... Altera o comitente como falecido.
    Setar numero da TAG
    ${CPF_COMITENTE}=    Generate CPF with size   11
    Set Global Variable  ${CPF_COMITENTE}

    Setar variaveis comitente PF residente API
    Dado Que eu chame a api de inclusão de comitente PF residente passando a apiKey ITAUAPIINT
    ${body}=        Que eu crie um novo body a partir de um ${JSON_INC_MAX_NULL}
    Set Global Variable  ${body}
    ${body}=        Setar dados no body da API PF residente
#    ${body}=        Que eu altere o ${body} alterando o valor do campo birthDate no objeto individualInvestor para 02/02/2015
#    ${body}=        Que eu altere o ${body} alterando o valor do campo emancipatedIndicator no objeto individualInvestor.minorResponsible para true
    ${body}=        Que eu altere o ${body} alterando o valor do campo investorDeceasedIndicator no objeto individualInvestor.inventory para true
    ${body}=        Que eu altere o ${body} alterando o valor do campo documentTypeCode no objeto individualInvestor para CPF
    Set Global Variable  ${body}

Dado que eu monte o payload de um novo Comitente PF Residente preenchendo representante procurador com json completo NULL e preenchendo somente o mínimo de dados obrigatórios
    [Documentation]     Carrega um arquivo json com o mínimo de campo necessário para incluir comitente... Os demais campos serão preenchidos com valor null... Altera o comitente para aceitar representante Procurador
    Setar numero da TAG
    ${CPF_COMITENTE}=    Generate CPF with size   11
    Set Global Variable  ${CPF_COMITENTE}

    Setar variaveis comitente PF residente API
    Dado Que eu chame a api de inclusão de comitente PF residente passando a apiKey ITAUAPIINT
    ${body}=        Que eu crie um novo body a partir de um ${JSON_INC_MAX_NULL}
    Set Global Variable  ${body}
    ${body}=        Setar dados no body da API PF residente
#    ${body}=        Que eu altere o ${body} alterando o valor do campo birthDate no objeto individualInvestor para 02/02/2015
#    ${body}=        Que eu altere o ${body} alterando o valor do campo emancipatedIndicator no objeto individualInvestor.minorResponsible para true
    ${body}=        Que eu altere o ${body} alterando o valor do campo authorizeOrderTransmissionByThird no objeto individualInvestor para P
#    ${body}=        Que eu altere o ${body} alterando o valor do campo investorDeceasedIndicator no objeto individualInvestor.inventory para true
    ${body}=        Que eu altere o ${body} alterando o valor do campo documentTypeCode no objeto individualInvestor para CPF
    ${body}=        Que eu altere o ${body} alterando o valor do campo documentNumber no objeto ${representativeInvestor} para 571.298.480-65
    ${body}=        Que eu altere o ${body} alterando o valor do campo representativeTypeCode no objeto ${representativeInvestor} para Procurador
    Set Global Variable  ${body}
Dado que eu monte o payload de um novo Comitente PF Residente preenchendo representante com json completo NULL e preenchendo somente o mínimo de dados obrigatórios
    [Documentation]     Carrega um arquivo json com o mínimo de campo necessário para incluir comitente... Os demais campos serão preenchidos com valor null... Altera o comitente como falecido.
    Setar numero da TAG
    ${CPF_COMITENTE}=    Generate CPF with size   11
    Set Global Variable  ${CPF_COMITENTE}

    ${CPF_REPRESENTANTE}=    Generate CPF with size   11
    Set Global Variable  ${CPF_REPRESENTANTE}

    Setar variaveis comitente PF residente API
    Dado Que eu chame a api de inclusão de comitente PF residente passando a apiKey ITAUAPIINT
    ${body}=        Que eu crie um novo body a partir de um ${JSON_INC_MAX_NULL}
    Set Global Variable  ${body}
    ${body}=        Setar dados no body da API PF residente

    ${body}=        Que eu altere o ${body} alterando o valor do campo authorizeOrderTransmissionByThird no objeto individualInvestor para P
    ${body}=        Que eu altere o ${body} alterando o valor do campo representativeTypeCode no objeto representativeInvestor para Procurador
    ${body}=        Que eu altere o ${body} alterando o valor do campo cityCode no objeto ${adressPhoneRepresentativeInvestor} para 3367
    ${body}=        Que eu altere o ${body} alterando o valor do campo emailName no objeto ${emailRepresentativeInvestor} para teste-representativeInvestor@representante.com.br
    ${body}=        Que eu altere o ${body} alterando o valor do campo documentNumber no objeto representativeInvestor para ${CPF_REPRESENTANTE}
    Set Global Variable  ${body}
*** Variables ***
${VideoAlias}=                          VideoTesteCadastroApiComitentePFResidente
${VideoName}=                           video/${VideoAlias}
${TIPO_ENDERECO}=                       RESIDENCIAL
${TIPO_EMAIL}=                          PARTICULAR
${BAIRRO}=                              CENTRO
${PAIS}=                                BRASIL
${NOME_SOCIAL}=                         TESTE NOME SOCIAL
${PARTICIPANTE}=                        ITAUBM
${DONO}=                                SIM
${TOGGLE}=                              S
${NUMBER}=                              0
${JSON_INC_MAX_NULL_SEM_REPRE}=         ${CURDIR}\\..\\..\\Comitente\\JsonApi\\JSON_COMITENTE_PF_MAXIMO_NULL_SEM_REPRESENTANTE.json
${JSON_INC_MAX_NULL}=                   ${CURDIR}\\..\\..\\Comitente\\JsonApi\\JSON_COMITENTE_PF_MAXIMO_NULL.json
${JSON_INC_MAX}=                        ${CURDIR}\\..\\..\\Comitente\\JsonApi\\JSON_COMITENTE_PF_MAXIMO.json
${JSON_INC_MIN}=                        ${CURDIR}\\..\\..\\Comitente\\JsonApi\\JSON_COMITENTE_PF_MINIMO.json
${investor}=                            investor
${equitySituation}=                     investor.equitySituation
${individualInvestor}=                  individualInvestor
${professionalRelationship}=            individualInvestor.professionalRelationship
${addressIndividualInvestor}=           individualInvestor.addressIndividualInvestor
${emailIndividualInvestor}=             individualInvestor.addressIndividualInvestor.emailIndividualInvestor
${addressPhoneIndividualInvestor}=      individualInvestor.addressIndividualInvestor.addressPhoneIndividualInvestor
${representativeInvestor}=              representativeInvestor
${addressRepresentativeInvestor}=       representativeInvestor.addressRepresentativeInvestor
${emailRepresentativeInvestor}=         representativeInvestor.addressRepresentativeInvestor.emailRepresentativeInvestor
${adressPhoneRepresentativeInvestor}=   representativeInvestor.addressRepresentativeInvestor.adressPhoneRepresentativeInvestor
${inventory}=                           individualInvestor.inventory
${emailInventory}=                      individualInvestor.inventory.emailInventory
${privatePhoneInventory}=               individualInvestor.inventory.privatePhoneInventory
${minorResponsible}=                    individualInvestor.minorResponsible
${emailMinorResponsible}=               individualInvestor.minorResponsible.emailMinorResponsible
${privatePhoneMinorResponsible}=        individualInvestor.minorResponsible.privatePhoneMinorResponsible
${fatca}=                               investor.fatca
${MSG_riskClassificationName}=          O campo COMITENTE_TXT_CLASS_RISCO.TextoAlfaNumerico deve ter no máximo 20 caracter(es).
${NAME_LOG_EXEC}=                       log.html

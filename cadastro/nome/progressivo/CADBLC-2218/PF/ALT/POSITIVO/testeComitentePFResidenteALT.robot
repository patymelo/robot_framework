*** Settings ***
Documentation       Teste API Comitente /individual-investors
Suite Setup         Dado que eu faça a chamada da API de alteração de Comitente PF com json completo
Resource            ${CURDIR}\\..\\..\\..\\..\\GENERIC_VAR\\Keywords.robot
Resource            ${CURDIR}\\..\\..\\..\\..\\GENERIC_VAR\\KeywordsAPI.robot
Resource            ${CURDIR}\\..\\..\\..\\..\\GENERIC_VAR\\shared\\API\\suit_setup_put_api_individual.robot
Resource            ${CURDIR}\\..\\..\\..\\..\\GENERIC_VAR\\template\\API\\template_put_api_individual.robot
Resource            ${CURDIR}\\..\\..\\..\\..\\GENERIC_VAR\\template\\API\\template_post_api_individual.robot

*** Test Cases ***
TST0000: PF RESIDENTE (API) - Criação de Massa
    [Template]    Template cadastro api comitente PF Residente completo sem campos aleatorios
    #PARTICIPANTE      #DONO      #CPF_COMITENTE      #API_KEY      #RETORNO
    ITAUBM             SIM        Aleatorio           ITAUAPIINT    200
    RIOBM              NAO        ${EMPTY}            RIOAPIINT     200
TST0001: PF RESIDENTE (API) - Alteração Dados Minimos Preenchidos
    [Template]    Template alteração api comitente PF Residente minimo com campos aleatorios
    #PARTICIPANTE      #DONO      #CPF_COMITENTE      #API_KEY      #RETORNO
    ITAUBM             SIM        ${EMPTY}            ITAUAPIINT    200
    RIOBM              NAO        ${EMPTY}            RIOAPIINT     200
T0002: PF RESIDENTE (API) - Alteração Dados Maximos Preenchidos
    [Template]    Template alteração api comitente PF Residente completo com campos aleatorios
    #PARTICIPANTE      #DONO      #CPF_COMITENTE      #API_KEY      #RETORNO
    ITAUBM             SIM        ${EMPTY}            ITAUAPIINT    200
    RIOBM              NAO        ${EMPTY}            RIOAPIINT     200

*** Keywords ***
O usuario acessa o menu de consulta comitente
    Capture Page Screenshot     img/${TAG_NUMBER}_1LoginNome.png
    O Usuário possui autorização no NoMe para acessar Identificação de Comitentes
    Capture Page Screenshot     img/${TAG_NUMBER}_1Login.png
    E o Usuário acessa o menu Identificação de Comitentes > Consulta > Comitente
    Capture Page Screenshot     img/${TAG_NUMBER}_2ConsultaComitente.png
O usuario faz a busca do comitente ${TIPO_PESSOA} ${DOC_COMITENTE}
    O Usuario seleciona na combo Tipo Pessoa valor igual a ${TIPO_PESSOA}
    O Usuario informa no campo CPF/ CNPJ valor igual a ${DOC_COMITENTE}
    Capture Page Screenshot     img/${TAG_NUMBER}_3FiltroConsultaComitente.png
    O Usuario clica no botao Pesquisar
    Capture Page Screenshot     img/${TAG_NUMBER}_4ResutadoConsultaComitente.png
    #Anda na tela de consulta ${TAG_NUMBER}
Busca na tabela valor da coluna ${column_find_text}
    ${TableXpath}=       Set Variable   xpath://table[@id='workspaceTable']/tbody/tr[2]
    ${ColumnsHeader}=    SeleniumLibrary.Get Element Count  ${TableXpath}/th

    FOR  ${rowIndexHeader}  IN RANGE    1   ${ColumnsHeader+1}
        ${curText}     Get text     ${TableXpath}/th[${rowIndexHeader}]
        IF  "${curText}" == "${column_find_text}"
            ${idColumn}=    Set Variable  ${rowIndexHeader}
            ${idColumn}=    Convert To Integer  ${idColumn}
            Set Global Variable  ${idColumn}
            Exit FOR Loop
        END
    END

    ${ValuesColumn}=   Get Text   ${TableXpath}//following::td[${idColumn}]
    [Return]   ${ValuesColumn}
Pega valores das colunas da tela de consulta comitente
#   ###################Pega Dados da TELA########################################################
    ${STATUS_COMITENTE_TELA}=           Busca na tabela valor da coluna Status do Comitente
    ${DATA_ATU_COMITENTE_TELA}=         Busca na tabela valor da coluna Data de Atualização do Cadastro
    ${DATA_ATU_COMITENTE_TELA}=         Convert To String   ${DATA_ATU_COMITENTE_TELA}
    Set Global Variable  ${DATA_ATU_COMITENTE_TELA}
#   ######################     **** investor
    ${TITULAR_CONTA_COMITENTE_TELA}=    Busca na tabela valor da coluna Titular da Conta Cliente (Conta Própria)
    ${TITULAR_CONTA_COMITENTE_TELA}=    Convert To String   ${TITULAR_CONTA_COMITENTE_TELA}
    Set Global Variable  ${TITULAR_CONTA_COMITENTE_TELA}
    ${NATUREZA_FISC_TELA}=              Busca na tabela valor da coluna Natureza Fiscal
    ${NATUREZA_FISC_TELA}=              Convert To String   ${NATUREZA_FISC_TELA}
    Set Global Variable  ${NATUREZA_FISC_TELA}
    ${CNPJ_COMITENTE_TELA}=             Busca na tabela valor da coluna CPF/CNPJ do Comitente
    ${CNPJ_COMITENTE_TELA}=             Convert To String   ${CNPJ_COMITENTE_TELA}
    ${CNPJ_COMITENTE_TELA}=             Replace String      ${CNPJ_COMITENTE_TELA}    .   ${EMPTY}
    ${CNPJ_COMITENTE_TELA}=             Replace String      ${CNPJ_COMITENTE_TELA}    /   ${EMPTY}
    ${CNPJ_COMITENTE_TELA}=             Replace String      ${CNPJ_COMITENTE_TELA}    -   ${EMPTY}
    Set Global Variable  ${CNPJ_COMITENTE_TELA}
    ${NOME_COMITENTE_TELA}=             Busca na tabela valor da coluna Nome Comitente
    ${NOME_COMITENTE_TELA}=             Convert To String   ${NOME_COMITENTE_TELA}
    Set Global Variable  ${NOME_COMITENTE_TELA}
    ${CODIGO_LEI_TELA}=                 Busca na tabela valor da coluna Código de LEI
    ${CODIGO_LEI_TELA}=                 Convert To String   ${CODIGO_LEI_TELA}
    Set Global Variable  ${CODIGO_LEI_TELA}
#   ######################     **** equitySituation
    ${FATURAMENTO_12_TELA}=             Busca na tabela valor da coluna Faturamento dos últimos 12 meses
    ${FATURAMENTO_12_TELA}=             Replace String      ${FATURAMENTO_12_TELA}    .   ${EMPTY}
    ${FATURAMENTO_12_TELA}=             Replace String      ${FATURAMENTO_12_TELA}    ,   .
    Set Global Variable  ${FATURAMENTO_12_TELA}
    ${DATA_FAT_COMITENTE_TELA}=         Busca na tabela valor da coluna Data do Faturamento
    Set Global Variable  ${DATA_FAT_COMITENTE_TELA}
    ${VALOR_LIQUIDO_TELA}=              Busca na tabela valor da coluna Valor Patrimônio Líquido
    ${VALOR_LIQUIDO_TELA}=              Replace String      ${VALOR_LIQUIDO_TELA}    .   ${EMPTY}
    ${VALOR_LIQUIDO_TELA}=              Replace String      ${VALOR_LIQUIDO_TELA}    ,   .
    Set Global Variable  ${VALOR_LIQUIDO_TELA}
    ${DATA_VALOR_VL_LIQUIDO_TELA}=      Busca na tabela valor da coluna Data do Valor do Patrimônio Líquido
    Set Global Variable  ${DATA_VALOR_VL_LIQUIDO_TELA}
    ${CAPACIDADE_FINC_TELA}=            Busca na tabela valor da coluna Capacidade Financeira
    ${CAPACIDADE_FINC_TELA}=            Replace String      ${CAPACIDADE_FINC_TELA}    .   ${EMPTY}
    ${CAPACIDADE_FINC_TELA}=            Replace String      ${CAPACIDADE_FINC_TELA}    ,   .
    Set Global Variable  ${CAPACIDADE_FINC_TELA}
    ${DATA_CAPACIDADE_FINC_TELA}=       Busca na tabela valor da coluna Data da informação da Capacidade Financeira
    Set Global Variable  ${DATA_CAPACIDADE_FINC_TELA}
#   ######################     **** fatca
    ${PAIS_ENVOLVIDO_TELA}=             Busca na tabela valor da coluna País envolvido/relacionado
    Set Global Variable  ${PAIS_ENVOLVIDO_TELA}
    ${PAIS_ORIGEM_INVEST_TELA}=         Busca na tabela valor da coluna País de Origem do Investidor
    Set Global Variable  ${PAIS_ORIGEM_INVEST_TELA}
    ${GIIN_TELA}=                       Busca na tabela valor da coluna Número de indentificação de intermediário global(GIIN)
    Set Global Variable  ${GIIN_TELA}
#   ######################     **** legalInvestor
    ${AUTORIZA_TRANS_TERCEIRP_TELA}=    Busca na tabela valor da coluna Autoriza Transmissão de Ordem por Terceiros?
    Set Global Variable  ${AUTORIZA_TRANS_TERCEIRP_TELA}
    ${DATA_FUNDACAO_TELA}=              Busca na tabela valor da coluna Data de Fundação/Constituição
    Set Global Variable  ${DATA_FUNDACAO_TELA}
    ${EMPR_SEM_FIM_LUCRATIVO_TELA}=     Busca na tabela valor da coluna Empresa sem fins lucrativos?
    Set Global Variable  ${EMPR_SEM_FIM_LUCRATIVO_TELA}
    ${GESTOR_CARTEIRA_TELA}=            Busca na tabela valor da coluna Gestor de Carteiras Administradas
    Set Global Variable  ${GESTOR_CARTEIRA_TELA}
    ${GESTOR_FUNDO_TELA}=               Busca na tabela valor da coluna Gestor de Fundos de Investimento
    Set Global Variable  ${GESTOR_FUNDO_TELA}
    ${GRUPO_ECONOMICO_TELA}=            Busca na tabela valor da coluna Grupo Econômico
    Set Global Variable  ${GRUPO_ECONOMICO_TELA}
    ${CLASSIFICACAO_RISCO_TELA}=        Busca na tabela valor da coluna Classificação de Risco do Comitente
    Set Global Variable  ${CLASSIFICACAO_RISCO_TELA}
    ${DESC_CLASSIFICACAO_RISCO_TELA}=   Busca na tabela valor da coluna Descrição da Classificação de Risco
    Set Global Variable  ${DESC_CLASSIFICACAO_RISCO_TELA}
    ${ATIVIDADE_DESENVOLVIDA_TELA}=     Busca na tabela valor da coluna CNAE - Atividade Principal Desenvolvida
    Set Global Variable  ${ATIVIDADE_DESENVOLVIDA_TELA}
#   ######################     **** addressLegalInvestor
    ${TIPO_ENDERECO_END_TELA}=          Busca na tabela valor da coluna Tipo Endereço
    Set Global Variable  ${TIPO_ENDERECO_END_TELA}
    ${LOGRADOURO_END_TELA}=             Busca na tabela valor da coluna Logradouro
    Set Global Variable  ${LOGRADOURO_END_TELA}
    ${NUM_LOGRADOURO_END_TELA}=         Busca na tabela valor da coluna Número Logradouro
    Set Global Variable  ${NUM_LOGRADOURO_END_TELA}
    ${COMPLEMENTO_END_TELA}=            Busca na tabela valor da coluna Complemento
    Set Global Variable  ${COMPLEMENTO_END_TELA}
    ${BAIRRO_END_TELA}=                 Busca na tabela valor da coluna Bairro
    Set Global Variable  ${BAIRRO_END_TELA}
    ${CEP_END_TELA}=                    Busca na tabela valor da coluna CEP
    ${CEP_END_TELA}=                    Replace String      ${CEP_END_TELA}    -   ${EMPTY}
    Set Global Variable  ${CEP_END_TELA}
    ${MUNICIPIO_END_TELA}=              Busca na tabela valor da coluna Município
    Set Global Variable  ${MUNICIPIO_END_TELA}
    ${UF_END_TELA}=                     Busca na tabela valor da coluna UF
    Set Global Variable  ${UF_END_TELA}
#   ######################     **** emailRepresentativeLegalInvestor
    ${TIPO_EMAIL_TELA}=                Busca na tabela valor da coluna Tipo Email
    Set Global Variable  ${TIPO_EMAIL_TELA}
    ${EMAIL_TELA}=                     Busca na tabela valor da coluna E-mail
    Set Global Variable  ${EMAIL_TELA}
#   ######################     **** addressPhoneRepresentativeLegalInvestor
    #${DDD_TELA}=                Busca na tabela valor da coluna DDD
    #Set Global Variable  ${DDD_TELA}
    ${TELEFONE_TELA}=                  Busca na tabela valor da coluna Telefone
    Set Global Variable  ${TELEFONE_TELA}
    ${RAMAL_TELA}=                     Busca na tabela valor da coluna Ramal
    Set Global Variable  ${RAMAL_TELA}
    ${TIPO_TELEFONE_TELA}=             Busca na tabela valor da coluna Tipo Telefone
    Set Global Variable  ${TIPO_TELEFONE_TELA}
Anda na tela de consulta ${TAG_NUMBER}
    Scroll horizontal Data de Nascimento
    Sleep  1s
    Scroll horizontal Filiação - Nome da Mãe
    Sleep  1s
    Scroll horizontal Naturalidade (Município)
    Sleep  1s
    Capture Page Screenshot     img/${TAG_NUMBER}_4ResutadoConsultaComitente1.png
    Scroll horizontal Pessoa Exposta Politicamente?
    Sleep  1s
    Scroll horizontal Tipo de Documento de Identificação
    Sleep  2s
    Capture Page Screenshot     img/${TAG_NUMBER}_4ResutadoConsultaComitente2.png
    Scroll horizontal Data de Expedição
    Scroll horizontal Nome Social
    Sleep  2s
    Scroll horizontal CNPJ da empresa em que trabalha
    Capture Page Screenshot     img/${TAG_NUMBER}_4ResutadoConsultaComitente3.png
    Scroll horizontal Falecido?
    Scroll horizontal Data de Fundação/Constituição
    Sleep  1s
    Scroll horizontal País de Origem do Investidor
    Scroll horizontal Logradouro
    Sleep  1s
    Scroll horizontal Município
    Scroll horizontal Capacidade Financeira
    Scroll horizontal Código de LEI
Scroll horizontal ${value}
     Scroll Element Into View    xpath://table[@id='workspaceTable']/tbody/tr/th[text()="${value}"]
*** Variables ***
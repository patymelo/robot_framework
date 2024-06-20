*** Keywords ***
Setar layout arq comitente PJ
    IF  "${TIPO_COMITENTE}" == "INR_COM_CVM"
        IF  "${acao}" == "INC"
            ${DIR_EXCEL}=     Set Variable   ${DIR_EXCEL_INC_CCVM_PJ}
        END
        IF  "${acao}" == "ALT"
            ${DIR_EXCEL}=     Set Variable   ${DIR_EXCEL_ALT_CCVM_PJ}
        END
    END
    IF  "${TIPO_COMITENTE}" == "INR_SEM_CVM"
        IF  "${acao}" == "INC"
            ${DIR_EXCEL}=     Set Variable   ${DIR_EXCEL_INC_SCVM_PJ}
        END
        IF  "${acao}" == "ALT"
            ${DIR_EXCEL}=     Set Variable   ${DIR_EXCEL_ALT_SCVM_PJ}
        END
    END
    IF  "${TIPO_COMITENTE}" == "RESIDENTE"
        IF  "${acao}" == "INC"
            ${DIR_EXCEL}=     Set Variable   ${DIR_EXCEL_INC_PJ}
        END
        IF  "${acao}" == "ALT"
            ${DIR_EXCEL}=     Set Variable   ${DIR_EXCEL_ALT_PJ}
        END
    END
    IF  "${acao}" == "INT"
            ${DIR_EXCEL}=     Set Variable   ${DIR_EXCEL_INT_PJ}
    END
    IF  "${acao}" == "ATIV"
        ${DIR_EXCEL}=     Set Variable   ${DIR_EXCEL_ATIV_PJ}
    END
    IF  "${acao}" == "SIMP"
        ${DIR_EXCEL}=     Set Variable   ${DIR_EXCEL_SIMP_PJ}
    END
    Set Global Variable  ${DIR_EXCEL}
Setar layout arq comitente PF
    IF  "${TIPO_COMITENTE}" == "INR_COM_CVM"
        IF  "${acao}" == "INC"
            ${DIR_EXCEL}=     Set Variable   ${DIR_EXCEL_INC_CCVM}
        END
        IF  "${acao}" == "ALT"
            ${DIR_EXCEL}=     Set Variable   ${DIR_EXCEL_ALT_CCVM}
        END
    END
    IF  "${TIPO_COMITENTE}" == "INR_SEM_CVM"
        IF  "${acao}" == "INC"
            ${DIR_EXCEL}=     Set Variable   ${DIR_EXCEL_INC_SCVM}
        END
        IF  "${acao}" == "ALT"
            ${DIR_EXCEL}=     Set Variable   ${DIR_EXCEL_ALT_SCVM}
        END
    END
    IF  "${TIPO_COMITENTE}" == "RESIDENTE"
        IF  "${acao}" == "INC"
            ${DIR_EXCEL}=     Set Variable   ${DIR_EXCEL_INC}
        END
        IF  "${acao}" == "ALT"
            ${DIR_EXCEL}=     Set Variable   ${DIR_EXCEL_ALT}
        END
    END
    IF  "${acao}" == "INT"
            ${DIR_EXCEL}=     Set Variable   ${DIR_EXCEL_INT}
    END
    IF  "${acao}" == "ATIV"
        ${DIR_EXCEL}=     Set Variable   ${DIR_EXCEL_ATIV}
    END
    IF  "${acao}" == "SIMP"
        ${DIR_EXCEL}=     Set Variable   ${DIR_EXCEL_SIMP}
    END
    Set Global Variable  ${DIR_EXCEL}
Gerar arquivo Comitente PF Residente para o ${PARTICIPANTE}
   Setar layout arq comitente PF
   ${nameArq}=   Set Variable  PF_RESIDENTE_${acao}_${PARTICIPANTE}
   Set Global Variable  ${nameArq}
   Set Global Variable  ${DIR_ARQ}
   Set Global Variable  ${PARTICIPANTE}
   ${PATH}=           Generate arq  ${nameArq}   ${DIR_ARQ}
   Set Global Variable    ${PATH}
   Create File  ${PATH}
   Get row from sheet   ${DIR_EXCEL}   ${NAME_PLANILHA_HEADER}
   Get row from sheet   ${DIR_EXCEL}   ${NAME_PLANILHA_BLOC1}
   IF  "${acao}" == "ALT" or "${acao}" == "INC"
      Get row from sheet   ${DIR_EXCEL}   ${NAME_PLANILHA_BLOC2}
      Get row from sheet   ${DIR_EXCEL}   ${NAME_PLANILHA_BLOC3}
      Get row from sheet   ${DIR_EXCEL}   ${NAME_PLANILHA_BLOC7}
   END
Gerar arquivo Comitente PJ Residente para o ${PARTICIPANTE}
   Setar layout arq comitente PJ
   ${nameArq}=   Set Variable  PJ_RESIDENTE_${acao}_${PARTICIPANTE}
   Set Global Variable  ${nameArq}
   Set Global Variable  ${DIR_ARQ}
   Set Global Variable  ${PARTICIPANTE}
   ${PATH}=           Generate arq  ${nameArq}   ${DIR_ARQ}
   Set Global Variable    ${PATH}
   Create File  ${PATH}
   Get row from sheet   ${DIR_EXCEL}   ${NAME_PLANILHA_HEADER}
   Get row from sheet   ${DIR_EXCEL}   ${NAME_PLANILHA_BLOC1}
   IF  "${acao}" == "ALT" or "${acao}" == "INC"
      Get row from sheet   ${DIR_EXCEL}   ${NAME_PLANILHA_BLOC2}
      Get row from sheet   ${DIR_EXCEL}   ${NAME_PLANILHA_BLOC4}
      Get row from sheet   ${DIR_EXCEL}   ${NAME_PLANILHA_BLOC7}
   END
Gerar arquivo Comitente PF INR com CVM para o ${PARTICIPANTE}
   Setar layout arq comitente PF
   ${nameArq}=   Set Variable  PF_INR_CCVM_${acao}_${PARTICIPANTE}
   Set Global Variable  ${nameArq}
   Set Global Variable  ${DIR_ARQ}
   Set Global Variable  ${PARTICIPANTE}
   ${PATH}=           Generate arq  ${nameArq}   ${DIR_ARQ}
   Set Global Variable    ${PATH}
   Create File  ${PATH}
   Get row from sheet   ${DIR_EXCEL}   ${NAME_PLANILHA_HEADER}
   Get row from sheet   ${DIR_EXCEL}   ${NAME_PLANILHA_BLOC1}
   IF  "${acao}" == "ALT" or "${acao}" == "INC"
      Get row from sheet   ${DIR_EXCEL}   ${NAME_PLANILHA_BLOC2}
      Get row from sheet   ${DIR_EXCEL}   ${NAME_PLANILHA_BLOC3}
      Get row from sheet   ${DIR_EXCEL}   ${NAME_PLANILHA_BLOC5}
      Get row from sheet   ${DIR_EXCEL}   ${NAME_PLANILHA_BLOC7}
   END
Gerar arquivo Comitente PJ INR com CVM para o ${PARTICIPANTE}
   Setar layout arq comitente PJ
   ${nameArq}=   Set Variable  PJ_INR_CCVM_${acao}_${PARTICIPANTE}
   Set Global Variable  ${nameArq}
   Set Global Variable  ${DIR_ARQ}
   Set Global Variable  ${PARTICIPANTE}
   ${PATH}=           Generate arq  ${nameArq}   ${DIR_ARQ}
   Set Global Variable    ${PATH}
   Create File  ${PATH}
   Get row from sheet   ${DIR_EXCEL}   ${NAME_PLANILHA_HEADER}
   Get row from sheet   ${DIR_EXCEL}   ${NAME_PLANILHA_BLOC1}
   IF  "${acao}" == "ALT" or "${acao}" == "INC"
      Get row from sheet   ${DIR_EXCEL}   ${NAME_PLANILHA_BLOC2}
      Get row from sheet   ${DIR_EXCEL}   ${NAME_PLANILHA_BLOC4}
      Get row from sheet   ${DIR_EXCEL}   ${NAME_PLANILHA_BLOC5}
      Get row from sheet   ${DIR_EXCEL}   ${NAME_PLANILHA_BLOC7}
   END
Gerar arquivo Comitente PF INR sem CVM para o ${PARTICIPANTE}
   Setar layout arq comitente PF
   ${nameArq}=   Set Variable  PF_INR_SCVM_${acao}_${PARTICIPANTE}
   Set Global Variable  ${nameArq}
   Set Global Variable  ${DIR_ARQ}
   Set Global Variable  ${PARTICIPANTE}
   ${PATH}=           Generate arq  ${nameArq}   ${DIR_ARQ}
   Set Global Variable    ${PATH}
   Create File  ${PATH}
   Get row from sheet   ${DIR_EXCEL}   ${NAME_PLANILHA_HEADER}
   Get row from sheet   ${DIR_EXCEL}   ${NAME_PLANILHA_BLOC1}
   IF  "${acao}" == "ALT" or "${acao}" == "INC"
      Get row from sheet   ${DIR_EXCEL}   ${NAME_PLANILHA_BLOC2}
      Get row from sheet   ${DIR_EXCEL}   ${NAME_PLANILHA_BLOC3}
      Get row from sheet   ${DIR_EXCEL}   ${NAME_PLANILHA_BLOC5}
      Get row from sheet   ${DIR_EXCEL}   ${NAME_PLANILHA_BLOC7}
   END
Gerar arquivo Comitente PJ INR sem CVM para o ${PARTICIPANTE}
   Setar layout arq comitente PJ
   ${nameArq}=   Set Variable  PJ_INR_SCVM_${acao}_${PARTICIPANTE}
   Set Global Variable  ${nameArq}
   Set Global Variable  ${DIR_ARQ}
   Set Global Variable  ${PARTICIPANTE}
   ${PATH}=           Generate arq  ${nameArq}   ${DIR_ARQ}
   Set Global Variable    ${PATH}
   Create File  ${PATH}
   Get row from sheet   ${DIR_EXCEL}   ${NAME_PLANILHA_HEADER}
   Get row from sheet   ${DIR_EXCEL}   ${NAME_PLANILHA_BLOC1}
   IF  "${acao}" == "ALT" or "${acao}" == "INC"
      Get row from sheet   ${DIR_EXCEL}   ${NAME_PLANILHA_BLOC2}
      Get row from sheet   ${DIR_EXCEL}   ${NAME_PLANILHA_BLOC4}
      Get row from sheet   ${DIR_EXCEL}   ${NAME_PLANILHA_BLOC5}
      Get row from sheet   ${DIR_EXCEL}   ${NAME_PLANILHA_BLOC7}
   END
O Usuario informa no campo ${arg_label} a data igual a ${dia}/${mes}/${ano}-${dia}/${mes}/${ano}
    Wait Until Page Contains        ${arg_label}
    ${inputTextDataIni}=    Set Variable   //td[text()='${arg_label}']//following::input[1]
    Input Text      ${inputTextDataIni}    ${dia}
    ${inputTextMesIni}=  Set Variable   //td[text()='${arg_label}']//following::input[2]
    Input Text      ${inputTextMesIni}    ${mes}
    ${inputTextAnoIni}=   Set Variable   //td[text()='${arg_label}']//following::input[3]
    Input Text      ${inputTextAnoIni}    ${ano}
    ${inputTextDataFim}=    Set Variable   //td[text()='${arg_label}']//following::input[4]
    Input Text      ${inputTextDataFim}    ${dia}
    ${inputTextMesFim}=  Set Variable   //td[text()='${arg_label}']//following::input[5]
    Input Text      ${inputTextMesFim}    ${mes}
    ${inputTextAnoFim}=   Set Variable   //td[text()='${arg_label}']//following::input[6]
    Input Text      ${inputTextAnoFim}    ${ano}
O Usuario informa no campo ${arg_label} a data igual a ${dia}/${mes}/${ano}
    Wait Until Page Contains        ${arg_label}
    ${inputTextDataIni}=    Set Variable   //td[text()='${arg_label}']//following::input[1]
    Input Text      ${inputTextDataIni}    ${dia}
    ${inputTextMesIni}=  Set Variable   //td[text()='${arg_label}']//following::input[2]
    Input Text      ${inputTextMesIni}    ${mes}
    ${inputTextAnoIni}=   Set Variable   //td[text()='${arg_label}']//following::input[3]
    Input Text      ${inputTextAnoIni}    ${ano}
O Usuario faz o upload do arquivo
    Log  ${PATH}
    Choose File      file     ${PATH}
Obter protocolo
    Select Frame        id:main
    ${textArq}          Get Text          xpath://*[@id="fileStatus"]
    ${texto}            Set Variable      ${textArq}
    ${numberProtocolo}  Get Substring     ${textArq}    -7
    Set Global Variable                   ${numberProtocolo}
    Log   ${numberProtocolo}
    [Return]    ${numberProtocolo}
Então deve retornar a mensagem de upload realizado com sucesso
    ${mensagem_esperada}  Set Variable   Acusamos o recebimento do arquivo ${NOME_ARQUIVO} a ser processado pelo Sistema CETIP21 com o protocolo
    Page Should Contain  ${mensagem_esperada}
    Capture Page Screenshot
    #Sleep    1s
    Obter protocolo
Então verifico que ocorreu o processamento dos registros
    ${columnRegLido}         Get Text      xpath=//*[@id="workspaceTable"]/tbody/tr[2]/td[11]
    Log     ${columnRegLido}
    ${columnRegProcessado}   Get Text      xpath=//*[@id="workspaceTable"]/tbody/tr[2]/td[12]
    Log     ${columnRegLido}
    Should Be Equal As Strings  ${columnRegLido}    ${columnRegProcessado}

O participante ${PARTICIPANTE} faz upload do arquivo
    O usuario loga no NoMe como ${PARTICIPANTE}
    O Usuário possui autorização no NoMe para acessar Transf.de Arquivo
    Capture Page Screenshot     img/${TAG_NUMBER}_1Login.png
    E o Usuário acessa o menu Transf.de Arquivo > Arquivo > Enviar Arquivos
    Capture Page Screenshot     img/${TAG_NUMBER}_2EnviarArquivo.png
    O Usuario faz o upload do arquivo
    O Usuario clica no botao Transferir
    Capture Page Screenshot     img/${TAG_NUMBER}_3UploadArq.png
    Então deve retornar a mensagem de upload realizado com sucesso
    Close browser
O participante ${PARTICIPANTE} consulta se não houve erro na solicitação de transferência
    #----Consulta Protocolo arquivo - Solicitações de Transferência - INC - ITAUBM
    O usuario loga no NoMe como ${PARTICIPANTE}
    O Usuário possui autorização no NoMe para acessar Transf.de Arquivo
    Capture Page Screenshot     img/${TAG_NUMBER}_1Login.png
    E o Usuário acessa o menu Transf.de Arquivo > Arquivo > Solicitações de Transferência
    Capture Page Screenshot     img/${TAG_NUMBER}_2SolicitacaoTransferencia.png
    O Usuario informa no campo Data da Solicitação a data igual a ${EMPTY}/${EMPTY}/${EMPTY}-${EMPTY}/${EMPTY}/${EMPTY}
    O Usuario informa no campo ID da Solicitação valor igual a ${numberProtocolo}
    O Usuario clica no botao Pesquisar
    Capture Page Screenshot     img/${TAG_NUMBER}_3ResultadoConsultaTransferencia.png
    Então verifico que ocorreu o processamento dos registros
    Close browser
O participante ${PARTICIPANTE} consulta se não houve erro no arquivo
    #----Consulta Protocolo arquivo - Erros em Arquivos - INC - ITAUBM
    O usuario loga no NoMe como ${PARTICIPANTE}
    O Usuário possui autorização no NoMe para acessar Transf.de Arquivo
    Capture Page Screenshot     img/${TAG_NUMBER}_1Login.png
    E o Usuário acessa o menu Transf.de Arquivo > Arquivo > Erros em Arquivos
    Capture Page Screenshot     img/${TAG_NUMBER}_2ErroEmArquivo.png
    O Usuario informa no campo Data da Solicitação a data igual a ${EMPTY}/${EMPTY}/${EMPTY}
    O Usuario informa no campo ID da Solicitação valor igual a ${numberProtocolo}
    O Usuario clica no botao Pesquisar
    Capture Page Screenshot     img/${TAG_NUMBER}_3ResultadoErroArq.png
    Então deve retornar a mensagem  Não existem valores para o filtro informado
    Close browser
*** Variable ***
${NAME_PLANILHA_HEADER}    Header
${NAME_PLANILHA_BLOC1}     Bloco1
${NAME_PLANILHA_BLOC2}     Bloco2
${NAME_PLANILHA_BLOC3}     Bloco3
${NAME_PLANILHA_BLOC4}     Bloco4
${NAME_PLANILHA_BLOC5}     Bloco5
${NAME_PLANILHA_BLOC7}     Bloco7
${NAME_ARQ}                PF_RESIDENTE_INC_ITAUBM

${DIR_EXCEL_INC_CCVM}      ${path_layout}layoutArqComitePFINRcomCVMINC.xls
${DIR_EXCEL_INC_CCVM_PJ}   ${path_layout}layoutArqComitePJINRcomCVMINC.xls

${DIR_EXCEL_ALT_CCVM}      ${path_layout}layoutArqComitePFINRcomCVMALT.xls
${DIR_EXCEL_ALT_CCVM_PJ}   ${path_layout}layoutArqComitePJINRcomCVMALT.xls

${DIR_EXCEL_INC_SCVM}      ${path_layout}layoutArqComitePFINRsemCVMINC.xls
${DIR_EXCEL_INC_SCVM_PJ}   ${path_layout}layoutArqComitePJINRsemCVMINC.xls

${DIR_EXCEL_ALT_SCVM}      ${path_layout}layoutArqComitePFINRsemCVMALT.xls
${DIR_EXCEL_ALT_SCVM_PJ}   ${path_layout}layoutArqComitePJINRsemCVMALT.xls

${DIR_EXCEL_INC}           ${path_layout}layoutArqComitePFResidenteINC.xls
${DIR_EXCEL_INC_PJ}        ${path_layout}layoutArqComitePJResidenteINC.xls

${DIR_EXCEL_ALT}           ${path_layout}layoutArqComitePFResidenteALT.xls
${DIR_EXCEL_ALT_PJ}        ${path_layout}layoutArqComitePJResidenteALT.xls

${DIR_EXCEL_INT}           ${path_layout}layoutArqComitePFResidenteINT.xls
${DIR_EXCEL_INT_PJ}        ${path_layout}layoutArqComitePJResidenteINT.xls

${DIR_EXCEL_ATIV}          ${path_layout}layoutArqComitePFResidenteATIV.xls
${DIR_EXCEL_ATIV_PJ}       ${path_layout}layoutArqComitePJResidenteATIV.xls

${DIR_EXCEL_SIMP}          ${path_layout}layoutArqComitePFResidenteSIMPL.xls
${DIR_EXCEL_SIMP_PJ}       ${path_layout}layoutArqComitePJResidenteSIMPL.xls

${DIR_ARQ}                 ${path_arq}
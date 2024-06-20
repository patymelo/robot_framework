*** Keywords ***
O usuario acessa menu de Historico de Comitente
    O Usuário possui autorização no NoMe para acessar Identificação de Comitentes
    Capture Page Screenshot     img/${TAG_NUMBER}_1Login.png
    E o Usuário acessa o menu Identificação de Comitentes > Consulta > Histórico de Comitente
O usuario faz o filtro da consulta para PF
    Capture Page Screenshot     img/${TAG_NUMBER}_2CadastroComitente.png
    IF   "${PARTICIPANTE}" == "ITAUBM"
          ${conta}=     Set Variable   73410
          ${radical}=   Set Variable   00
          ${digito}=    Set Variable   5
    ELSE IF   "${PARTICIPANTE}" == "RIOBM"
         ${conta}=     Set Variable   05000
         ${radical}=   Set Variable   00
         ${digito}=    Set Variable   5
    ELSE
        ${conta}=     Set Variable   10020
        ${radical}=   Set Variable   00
        ${digito}=    Set Variable   1
    END
    #O Usuario informa no campo Titular da Conta Cliente (Conta Própria) a conta ${conta}.${radical}-${digito}
    O Usuario seleciona na combo Tipo Pessoa valor igual a Pessoa Física
    O Usuario informa no campo CPF/ CNPJ valor igual a ${CPF_COMITENTE}
    O Usuario clica no botao Pesquisar
O usuario faz o filtro da consulta para PJ
    Capture Page Screenshot     img/${TAG_NUMBER}_2CadastroComitente.png
    IF   "${PARTICIPANTE}" == "ITAUBM"
          ${conta}=     Set Variable   73410
          ${radical}=   Set Variable   00
          ${digito}=    Set Variable   5
    ELSE IF   "${PARTICIPANTE}" == "RIOBM"
         ${conta}=     Set Variable   05000
         ${radical}=   Set Variable   00
         ${digito}=    Set Variable   5
    ELSE
        ${conta}=     Set Variable   10020
        ${radical}=   Set Variable   00
        ${digito}=    Set Variable   1
    END
    #O Usuario informa no campo Titular da Conta Cliente (Conta Própria) a conta ${conta}.${radical}-${digito}
    O Usuario seleciona na combo Tipo Pessoa valor igual a Pessoa Jurídica
    O Usuario informa no campo CPF/ CNPJ valor igual a ${CNPJ_COMITENTE}
    O Usuario clica no botao Pesquisar
*** Settings ***
Variables      ${CURDIR}/Variables/test_data.yaml
Variables      ${CURDIR}/Variables/users.yaml

*** Variables ***
${NOME_URL_LOCAL}           ${url.dev}
${NOME_URL_INT}             ${url.qaa}
${NOME_URL_CERT}            ${url.cert}
${BROWSER}                  chrome
${PARTICIPANTE_CETIP}       ${user_data.participante_cetip}
${PARTICIPANTE_ITAUBM}      ${user_data.participante_itaubm}
${PARTICIPANTE_RIOBM}       ${user_data.participante_riobm}
${PARTICIPANTE_LEMEBM}      ${user_data.participante_lemebm}
${PARTICIPANTE_SAFRABM}     ${user_data.participante_safrabm}
${LOGIN_RIOBM}              ${user_data.riobm.login}
${SENHA_RIOBM}              ${user_data.riobm.password}
${LOGIN_ITAUBM}             ${user_data.itaubm.login}
${SENHA_ITAUBM}             ${user_data.itaubm.password}
${LOGIN_CETIP}              ${user_data.cetip.login}
${SENHA_CETIP}              ${user_data.cetip.password}

*** Keywords ***
Define URL
    IF   "${var_amb}" == "dev"
        ${URL}=  Set Variable  ${NOME_URL_LOCAL}
    ELSE IF  "${var_amb}" == "qaa"
        ${URL}=  Set Variable  ${NOME_URL_INT}
    ELSE IF  "${var_amb}" == "cert"
        ${URL}=  Set Variable  ${NOME_URL_CERT}
    ELSE
        ${URL}=  Set Variable  ${EMPTY}
    END
    Set Global Variable  ${URL}
O usuario possui acesso ao NoMe como ITAUBM
    Define URL
    Open Browser                    ${URL}     ${BROWSER}
    Set Browser Implicit Wait       3s
    #...   options=add_argument("--disable-popup-blocking");add_argument("--disable-web-security");add_argument("--start-maximized");add_experimental_option("excludeSwitches", ["enable-logging"])
    Maximize Browser Window
    Select Frame                    id:main
    Input Text                      id:e1           ${PARTICIPANTE_RIOBM}
    Input Text                      id:e2           ${LOGIN_RIOBM}
    Input Text                      id:e3           ${SENHA_RIOBM}
    Click Element                   id:Entrada
    #Sleep   2s
    Run Keyword And Ignore Error    Handle Alert
O usuario possui acesso ao NoMe como RIOBM
    Define URL
    Open Browser                    ${URL}     ${BROWSER}
    Set Browser Implicit Wait       3s
    #...   options=add_argument("--disable-popup-blocking");add_argument("--disable-web-security");add_argument("--start-maximized");add_experimental_option("excludeSwitches", ["enable-logging"])
    Maximize Browser Window
    Select Frame                    id:main
    Input Text                      id:e1           ${PARTICIPANTE_RIOBM}
    Input Text                      id:e2           ${LOGIN_RIOBM}
    Input Text                      id:e3           ${SENHA_RIOBM}
    Click Element                   id:Entrada
    Run Keyword And Ignore Error    Handle Alert
    Run Keyword And Ignore Error    Handle Alert
O usuario possui acesso ao NoMe como CETIP
    Define URL
    ${chrome_options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --disable-extensions
    Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Create Webdriver    Chrome    options=${chrome_options}
    Go To    ${URL}

    Select Frame                    id:main
    Input Text                      id:e1           ${PARTICIPANTE_CETIP}
    Input Text                      id:e2           ${LOGIN_CETIP}
    Input Text                      id:e3           ${SENHA_CETIP}
    Click Element                   id:Entrada
    Run Keyword And Ignore Error    Handle Alert
O Usuário possui autorização no NoMe para acessar ${menu}
    Unselect Frame
    #Run Keyword And Ignore Error    Handle Alert
    Click Element                   xpath://a[@href="#nivel1"]
    Scroll Element Into View        xpath://*[@id="my_menu"]/li/a/span[text()="${menu}"]
E o Usuário acessa o menu ${arg_navegacao}
    ${elemsNavegacao}=      Split String    ${arg_navegacao}    ${SPACE}>${SPACE}
    Unselect Frame
    FOR   ${elem}    IN    @{elemsNavegacao}
        Wait Until Element Is Visible   link:${elem}   timeout=100
        Click Element                   link:${elem}
        Sleep    0.5s
    END
    Wait Until Element Is Visible   id:main
    Select Frame                    id:main
O usuário acessa novamente o menu 
    [Arguments]     ${menu}   ${arg_navegacao}
    Unselect Frame
    Reload Page
    Click Element                   xpath://a[@href="#nivel1"]
    Scroll Element Into View        xpath://*[@id="my_menu"]/li/a/span[text()="${menu}"]
    ${elemsNavegacao}=      Split String    ${arg_navegacao}    ${SPACE}>${SPACE}
    FOR   ${elem}    IN    @{elemsNavegacao}
        Wait Until Element Is Visible   link:${elem}   timeout=80
        Click Element                   link:${elem}
    END
    Sleep   10s
    Wait Until Element Is Visible   id:main
    Select Frame                    id:main

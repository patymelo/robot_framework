*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Abrir o navegador e acessar o site Organo
    Launch URL
    ${chrome_options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --disable-extensions
    Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Create Webdriver    Chrome    chrome_options=${chrome_options}
    Go To    ${URL}
Preencher os campos do formulário
    Input Text       id:form-nome       Akemi
    Input Text       id:form-cargo      Desenvolvedora 
    Input Text       id:form-imagem     https://picsum.photos/200/300
    Click Element    class:lista-suspensa
    Click Element    //option[contains(.,'Programação')]
    Click Element    id:form-botao
    Element Should Be Visible    class:colaborador

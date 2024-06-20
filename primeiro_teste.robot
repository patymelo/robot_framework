*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Abrir o navegador e acessar o site Organo
    ${URL}=   Set Variable    https://www.google.com/
    ${chrome_options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --disable-extensions
    Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Create Webdriver    Chrome    options=${chrome_options}
    Go To    ${URL}
Preencher os campos do formulário
    Input Text       id:APjFqb       robot framework
    Click Button   	btnK

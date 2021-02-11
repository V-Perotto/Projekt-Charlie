*** Settings ***
Resource    ../../../file.robot

*** Variables ***
${INPUT_USER}        xpath=//input[@id="user_id"]
${INPUT_PASS}        xpath=//input[@id="password"]
${BTN_ENTRAR}        xpath=//div[@title="entrar"]

${BTN_OK}            xpath=//button[@id="agree_button"]

*** Keywords ***
Acessar Blackboard
    Wait Until Element Is Visible    ${INPUT_USER}
    Input Text                       ${INPUT_USER}    ${username}
    Input Text                       ${INPUT_PASS}    ${password}
    Click Element                    ${BTN_ENTRAR}

Cookies
    Wait Until Element Is Visible    ${BTN_OK}
    Click Element                    ${BTN_OK}
    Wait Until Element Is Visible    ${LINK_CLICK}
    Click Element                    ${LINK_CLICK}
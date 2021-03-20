*** Settings ***
Resource    ../../../file.robot

*** Variables ***
${INPUT_USER}        xpath=//input[@id="user_id"]
${INPUT_PASS}        xpath=//input[@id="password"]
${BTN_ENTRAR}        xpath=//div[@title="entrar"]
${BTN_OK}            xpath=//button[@id="agree_button"]
${CURSOS_LINK}       xpath=//*[@id="Courses.label"]/a

*** Keywords ***
Acessar Blackboard
    filelogger.Filelog     RF    [Acessar Blackboard]: ENTROU
    ${ID}       User ID    ${DIR}    ${LOGIN}
    Wait Until Element Is Visible    ${INPUT_USER}
    Input Text                       ${INPUT_USER}    ${ID}[0]
    Input Text                       ${INPUT_PASS}    ${ID}[1]
    Click Element                    ${BTN_ENTRAR}
    filelogger.Filelog     RF    Clicou no botão para entrar

Cookies
    Wait Until Element Is Visible    ${BTN_OK}
    Click Element                    ${BTN_OK}

Cursos
    Wait Until Element Is Visible    ${CURSOS_LINK}
    Click Element                    ${CURSOS_LINK}
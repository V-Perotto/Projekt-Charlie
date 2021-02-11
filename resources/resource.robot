*** Settings ***
Library    SeleniumLibrary
Library    scripts/get_excel_data.py

*** Variables ***
${URL}        https://ava.pucpr.br/blackboardauth/
${BROWSER}    chrome

*** Keywords ***
Open PUC 
    Open Browser    ${URL}    ${BROWSER}
    
###########################################################################################

Get Materia Data
    [Arguments]     ${path}   ${materia}
    ${materias}     get_excel_data.get_materia_data     ${path}   ${user}
    [Return]        ${materias}

Get User Data
    [Arguments]     ${path}   ${user}
    ${login}        get_excel_data.get_user_data        ${path}   ${user}
    [Return]        ${login}

*** Settings ***
Library    SeleniumLibrary
Library    ../scripts/get_excel_data.py

*** Variables ***
${URL}        https://ava.pucpr.br/blackboardauth/
${BROWSER}    chrome

*** Keywords ***
Open PUC 
    Open Browser    ${URL}    ${BROWSER}
    
###########################################################################################
###            > > > > > > > [xls]        GET EXCEL                                     ###
###########################################################################################
Get Materia Data
    [Arguments]     ${path}   ${materia}
    ${materias}     get_excel_data.get_materia_data     ${path}   ${materia}
    [Return]        ${materias}

Get User Data
    [Arguments]     ${path}   ${user}
    ${login}        get_excel_data.get_user_data        ${path}   ${user}
    [Return]        ${login}

###########################################################################################
###            > 0 > 1 > 2 > [3]         GET LENGTH                                     ###
###########################################################################################
Materias Length
    [Arguments]     ${dir}   ${material}
    ${course}       Get Materia Data    ${dir}   ${material}    
    ${courseLEN}    Evaluate     len(${course}[Materias])
    Log             ${courseLEN}
    [Return]        ${courseLEN}

User ID
    [Arguments]     ${dir}   ${user}
    ${login}        Get User Data    ${dir}   ${user}    
    ${user}         Set Variable     ${login}[username]
    ${pass}         Set Variable     ${login}[password]
    ${username}     Evaluate         ${user}.get(0)
    ${password}     Evaluate         ${pass}.get(0)
    ${ID}           Create List      ${username}   ${password}
    [Return]        ${ID}       
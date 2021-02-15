*** Settings ***
Resource    ../../../file.robot

*** Variables ***
${LINK_CLICK}        xpath=//a[contains(text(), "clique aqui")]
${MENU}              xpath=//a[@id="menuPuller"]
${WEBCONF}           xpath=//span[@title="Webconferência"]
${COLLABORATE}       xpath=//span[contains(text(), "Blackboard Collaborate Ultra")]

*** Keywords ***
Acessar matérias
    [Arguments]    ${Curso}
    Wait Until Element Is Visible    ${Curso}
    Click Element        ${Curso}
    Wait Until Element Is Visible    ${MENU}
    Click Element        ${MENU}
    Wait Until Element Is Visible    ${WEBCONF}
    Click Element        ${WEBCONF}
    Wait Until Element Is Visible    ${COLLABORATE}
    Click Element        ${COLLABORATE}

Iniciar Aulas
    [Arguments]       ${weekday}
    Procedimento Padrão
    Wait Until Element Is Visible    ${Materia}
    Percorrer Curso do Dia
    # ${Cursos}    Cursos
    # ${i}         Counter           ${weekday}
    # ${Materia}   Materia do Dia    ${Cursos}  ${i}
    Click Element     ${Materia}
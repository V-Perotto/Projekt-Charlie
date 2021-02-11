*** Settings ***
Resource    ../../../file.robot

*** Variables ***
${LINK_CLICK}        xpath=//a[contains(text(), "clique aqui")]
${Materia1}          xpath=//div[@id="_3_1termCourses_noterm"]/ul[1]/li[1]/a
${MENU}              xpath=//a[@id="menuPuller"]
${WEBCONF}           xpath=//span[@title="Webconferência"]
${COLLABORATE}       xpath=//span[contains(text(), "Blackboard Collaborate Ultra")]

*** Keywords ***
Acessar matérias
    [Arguments]    ${Cursos}    ${i}
    Wait Until Element Is Visible    ${Cursos[${i}]}
    Click Element        ${Cursos[${i}]}
    Wait Until Element Is Visible    ${MENU}
    Click Element        ${MENU}
    Wait Until Element Is Visible    ${WEBCONF}
    Click Element        ${WEBCONF}
    Wait Until Element Is Visible    ${COLLABORATE}
    Click Element        ${COLLABORATE}
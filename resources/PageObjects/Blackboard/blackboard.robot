*** Settings ***
Resource    ../../../file.robot

*** Variables ***
${MENU}              xpath=//a[@id="menuPuller"]
${WEBCONF}           xpath=//span[@title="Webconferência"]
${COLLABORATE}       xpath=//span[contains(text(), "Blackboard Collaborate Ultra")]
${Materia}           xpath=//div[@id="_3_1termCourses_noterm"]/ul[1]//a[contains(text(), "DEFAULT")]

*** Keywords ***
Access BB Course
    [Arguments]       ${course}   ${endhour}
    ${jump_course}    Acessar Matéria   ${course}   ${endhour}
    [Return]          ${jump_course}

#######################################################################################

Acessar Matéria
    [Arguments]       ${course}   ${endhour} 
    ${day_course}=    Replace String                 ${Materia}    DEFAULT    ${course}
    ${result} =       Element Should Not Contain     ${day_course}   ${course}
    ${jump_course}    Run Keyword If                 "${result}"=="None"   Set Variable  ${1}   
    ...       ELSE    Clicar na Matéria              ${day_course}    ${endhour}
    [Return]          ${jump_course}
    
Clicar na Matéria
    [Arguments]       ${day_course}     ${endhour}
    Wait Until Element Is Visible       ${day_course}
    Click Element     ${day_course}
    Iniciar Aula
    Encerrar Aula

Iniciar Aula
    Wait Until Element Is Visible       ${MENU}
    Click Element     ${MENU}
    Wait Until Element Is Visible       ${WEBCONF}
    Click Element     ${WEBCONF}
    Wait Until Element Is Visible       ${COLLABORATE}
    Click Element     ${COLLABORATE}

Encerrar Aula
    [Arguments]       ${endhour}
    Get Keyword       End Class         ${endhour}
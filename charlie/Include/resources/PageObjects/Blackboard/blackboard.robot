*** Settings ***
Resource    ../../../file.robot

*** Variables ***
${MENU}                  xpath=//a[@id="menuPuller"]
${WEBCONF}               xpath=//span[@title="Webconferência"]
${COLLABORATE}           xpath=//h3[@id="anonymous_element_8"]/a/span
${Materia}               xpath=//div[@id="_3_1termCourses_noterm"]/ul[1]//a[contains(text(), "DEFAULT")]
${course_list}           xpath=//ul[@class="portletList-img courseListing coursefakeclass "][1]/li
${FRAME_BB}              xpath=//iframe[@id="collabUltraLtiFrame"]
${AULA_ULTRA}            xpath=/html/body/div[1]/div/div[1]/main/div[2]/div[3]/ul/li/div/button/div[2]/span[2]/div/span
${ARROW}                 xpath=//*[@id="body-content"]/div[3]/ul/li/div/div[2]/ul/li/button
${AULA_ULTRA_LIST}       xpath=/html/body/div[1]/div/div[1]/main/div[2]/div[3]/ul/li/ul/li[1]/div/button/div[2]
${PARTICIPATE_CLASS}     xpath=//*[@id="offcanvas-wrap"]/div[2]/div/div/div/div/div[2]/div/bb-loading-button/button

*** Keywords ***
Access BB Course
    [Arguments]       ${course}   ${nowhour}    ${starthour}    ${endhour}
    filelogger.Filelog       RF  [Access BB Course]: ENTROU
    ${jump_course}    Acessar Matéria   ${course}   ${nowhour}    ${starthour}    ${endhour}
    filelogger.Filelog       RF  Acessou o Curso do Blackboard com retorno: "${jump_course}"
    filelogger.Filelog       RF  [Access BB Course]: SAIU
    [Return]          ${jump_course}

Acessar Matéria
    [Arguments]       ${course}   ${nowhour}    ${starthour}    ${endhour} 
    filelogger.Filelog       RF   [Acessar Matéria]: ENTROU
    Wait Until Element Is Visible         ${course_list}
    ${day_course}=      Replace String                    ${Materia}    DEFAULT    ${course}
    ${containsCourse}   Run Keyword And Return Status     Element Should Contain         ${day_course}    ${course}
    ${hasclass}         Get Text          ${day_course}
    ${jump_course}      Run Keyword If    ${containsCourse} and "${course}" in "${hasclass}"     Clicar na Matéria   ${day_course}    ${endhour} 
    ...       ELSE      Set Variable      ${1} 
    filelogger.Filelog       RF    Acessou a matéria com o retorno: "${jump_course}"
    filelogger.Filelog       RF   [Acessar Matéria]: SAIU
    [Return]           ${jump_course}
    
Clicar na Matéria
    filelogger.Filelog       RF  [Clicar na Matéria]: ENTROU
    [Arguments]       ${day_course}     ${endhour}
    Wait Until Element Is Visible       ${day_course}
    Click Element     ${day_course}
    filelogger.Filelog       RF  Clicou no curso do dia e vai acessar [Iniciar Aula]
    Iniciar Aula
    filelogger.Filelog       RF  [Clicar na Matéria]: SAIU

Iniciar Aula
    filelogger.Filelog       RF  [Iniciar Aula]: ENTROU
    Wait Until Element Is Visible       ${WEBCONF}
    Click Element     ${WEBCONF}
    Wait Until Element Is Visible       ${COLLABORATE}
    Click Element     ${COLLABORATE}
    Select Frame      ${FRAME_BB}
    filelogger.Filelog       RF  [FRAME]: entrou
    Wait Until Element Is Visible       ${AULA_ULTRA}
    Sleep    3
    ${containsArrow}  Run Keyword And Return Status              Element Should Be Enabled    ${ARROW}
    Wait Until Element Is Visible       ${AULA_ULTRA}
    Run Keyword If    ${containsArrow}  Clicar na Flecha
    ...       ELSE    Click Element     ${AULA_ULTRA}
    Sleep    3
    ${containsParticipate}      Run Keyword And Return Status    Element Should Be Enabled    ${PARTICIPATE_CLASS}
    Run Keyword If    ${containsParticipate}    Click Element    ${PARTICIPATE_CLASS}
    ...       ELSE    Log   [PASS]
    Unselect Frame
    filelogger.Filelog       RF  [FRAME]: saiu
    filelogger.Filelog       RF  [Iniciar Aula]: SAIU

Clicar na Flecha
    filelogger.Filelog       RF  [Clicar na Flecha]: ENTROU
    Click Element    ${ARROW}
    Click Element    ${AULA_ULTRA_LIST} 
    filelogger.Filelog       RF  [Clicar na Flecha]: SAIU
    [Return]    ${containsArrow}  
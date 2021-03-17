*** Settings ***
Resource    ../../../file.robot

*** Variables ***
${MENU}                  xpath=//a[@id="menuPuller"]
${WEBCONF}               xpath=//span[@title="Webconferência"]
${COLLABORATE}           xpath=//h3[@id="anonymous_element_8"]/a/span
${Materia}               xpath=//div[@id="_3_1termCourses_noterm"]/ul[1]//a[contains(text(), "DEFAULT")]
${course_list}           xpath=//ul[@class="portletList-img courseListing coursefakeclass "][1]/li
${FRAME_BB}              xpath=//iframe[@id="collabUltraLtiFrame"]

# NO ARROW    
${AULA_ULTRA}            xpath=/html/body/div[1]/div/div[1]/main/div[2]/div[3]/ul/li/div/button/div[2]/span[2]/div/span
${ARROW}                 xpath=//*[@id="body-content"]/div[3]/ul/li/div/div[2]/ul/li/button
${AULA_ULTRA_LIST}       xpath=/html/body/div[1]/div/div[1]/main/div[2]/div[3]/ul/li/ul/li[1]/div/button/div[2]
${PARTICIPATE_CLASS}     xpath=//*[@id="offcanvas-wrap"]/div[2]/div/div/div/div/div[2]/div/bb-loading-button/button

*** Keywords ***
Access BB Course
    [Arguments]       ${course}   ${nowhour}    ${starthour}    ${endhour}
    ${jump_course}    Acessar Matéria   ${course}   ${nowhour}    ${starthour}    ${endhour}
    [Return]          ${jump_course}

#######################################################################################

Acessar Matéria
    [Arguments]       ${course}   ${nowhour}    ${starthour}    ${endhour} 
    Wait Until Element Is Visible         ${course_list}
    # ${count}=         Get Element Count      ${course_list}
    # FOR  ${i}  IN RANGE   1   ${count} + 1
    #     ${hasclass}       Get Text          //ul[@class="portletList-img courseListing coursefakeclass "][1]/li[${i}]
    #     ${classname}      Set Variable      xpath=//ul[@class="portletList-img courseListing coursefakeclass "][1]/li[${i}]    
    #     ${jump_course}    Run Keyword If    "${course}" in "${hasclass}"   Clicar na Matéria   ${classname}    ${endhour}      
    #     ...       ELSE    Set Variable      ${1}
    # END
    ${day_course}=      Replace String                    ${Materia}    DEFAULT    ${course}
    ${containsCourse}   Run Keyword And Return Status     Element Should Contain         ${day_course}    ${course}
    ${hasclass}         Get Text          ${day_course}
    ${jump_course}      Run Keyword If    ${containsCourse} and "${course}" in "${hasclass}"     Clicar na Matéria   ${day_course}    ${endhour} 
    ...       ELSE      Set Variable      ${1}  
    # Log To Console    ${course}
    # Log To Console    ${hasclass}
    [Return]          ${jump_course}
    
Clicar na Matéria
    [Arguments]       ${day_course}     ${endhour}
    Wait Until Element Is Visible       ${day_course}
    Click Element     ${day_course}
    Iniciar Aula
    # Encerrar Aula     ${endhour}

Iniciar Aula
    # Wait Until Element Is Visible       ${MENU}
    # Click Element     ${MENU}
    Wait Until Element Is Visible       ${WEBCONF}
    Click Element     ${WEBCONF}
    Wait Until Element Is Visible       ${COLLABORATE}
    Click Element     ${COLLABORATE}
    Select Frame      ${FRAME_BB}
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


Clicar na Flecha
    Click Element    ${ARROW}
    Click Element    ${AULA_ULTRA_LIST} 
    [Return]    ${containsArrow}
    

Encerrar Aula
    [Arguments]       ${endhour}
    # Adicionar em uma planilha pra poder fazer uma verificação 
    # do horário, pra caso haja outra aula no dia ou somente p/
    # finalização da aula atual
    End Class        
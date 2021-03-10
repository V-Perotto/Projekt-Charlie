*** Settings ***
Resource    ../../../file.robot

*** Variables ***
${MENU}              xpath=//a[@id="menuPuller"]
${WEBCONF}           xpath=//span[@title="Webconferência"]
${COLLABORATE}       xpath=//h3[@id="anonymous_element_8"]/a/span
${Materia}           xpath=//div[@id="_3_1termCourses_noterm"]/ul[1]//a[contains(text(), "DEFAULT")]
${course_list}       xpath=//ul[@class="portletList-img courseListing coursefakeclass "][1]/li

*** Keywords ***
Access BB Course
    [Arguments]       ${course}   ${nowhour}    ${starthour}    ${endhour}
    ${jump_course}    Acessar Matéria   ${course}   ${nowhour}    ${starthour}    ${endhour}
    [Return]          ${jump_course}

#######################################################################################

Acessar Matéria
    [Arguments]       ${course}   ${nowhour}    ${starthour}    ${endhour} 
    Wait Until Element Is Visible            ${course_list}
    ${count}=         Get Element Count      ${course_list}
    FOR  ${i}  IN RANGE   1   ${count} + 1
        ${hasclass}       Get Text          //ul[@class="portletList-img courseListing coursefakeclass "][1]/li[${i}]
        ${classname}      Set Variable      xpath=//ul[@class="portletList-img courseListing coursefakeclass "][1]/li[${i}]    
        ${jump_course}    Run Keyword If    "${course}" in "${hasclass}"   Clicar na Matéria   ${classname}    ${endhour}      
        ...       ELSE    Set Variable      ${1}
    END
    # ${day_course}=    Replace String                ${Materia}    DEFAULT    ${course}
    # Element Should Contain         ${day_course}    ${course}
    # ${hasclass}       Get Text     ${day_course}
    # Log To Console    ${course}
    # Log To Console    ${hasclass}
    [Return]          ${jump_course}
    
Clicar na Matéria
    [Arguments]       ${day_course}     ${endhour}
    Wait Until Element Is Visible       ${day_course}
    Click Element     ${day_course}
    Iniciar Aula
    Encerrar Aula     ${endhour}

Iniciar Aula
    # Wait Until Element Is Visible       ${MENU}
    # Click Element     ${MENU}
    Wait Until Element Is Visible       ${WEBCONF}
    Click Element     ${WEBCONF}
    Wait Until Element Is Visible       ${COLLABORATE}
    Click Element     ${COLLABORATE}

Encerrar Aula
    [Arguments]       ${endhour}
    # Adicionar em uma planilha pra poder fazer uma verificação 
    # do horário, pra caso haja outra aula no dia ou somente p/
    # finalização da aula atual
    End Class        
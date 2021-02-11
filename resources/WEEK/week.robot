*** Settings ***
Resource    ../../file.robot

*** Variables ***
${Materia1}        xpath=//div[@id="_3_1termCourses_noterm"]/ul[1]/li[1]/a
# ${Materia2}        xpath=//div[@id="_3_1termCourses_noterm"]/ul[1]/li[2]/a
# ${Materia3}        xpath=//div[@id="_3_1termCourses_noterm"]/ul[1]/li[3]/a
# ${Materia4}        xpath=//div[@id="_3_1termCourses_noterm"]/ul[1]/li[4]/a
# ${Materia5}        xpath=//div[@id="_3_1termCourses_noterm"]/ul[1]/li[5]/a
# ${Materia6}        xpath=//div[@id="_3_1termCourses_noterm"]/ul[1]/li[6]/a
# ${Materia7}        xpath=//div[@id="_3_1termCourses_noterm"]/ul[1]/li[7]/a
${Materia}        xpath=//div[@id="_3_1termCourses_noterm"]/ul[1]/li/a[contains(text(), "${Curso[${i}]}")]

*** Keywords ***
Acessar aula
    ${theday}     Get Date
    ${thehour}    Get Time
    ${weekday}    Date Convertion  ${theday}
    ${i}          Counter          ${weekday}
    Day is more than other         ${theday}
    Start College    ${weekday}    ${thehour}

############################################################################################################

Start College
    [Arguments]       ${weekday}  ${hourmin}
    Run Keyword If    "${weekday}"=="Monday" and ${hourmin}>=1815      Segunda-Feira     ${weekday}
    Run Keyword If    "${weekday}"=="Tueday" and ${hourmin}>=1945      Terça-Feira       ${weekday}
    Run Keyword If    "${weekday}"=="Wednesday" and ${hourmin}>=1945   Quarta-Feira      ${weekday}
    Run Keyword If    "${weekday}"=="Thursday" and ${hourmin}>=1815    Quinta-Feira      ${weekday}
    Run Keyword If    "${weekday}"=="Friday" and ${hourmin}>=1815      Sexta-Feira       ${weekday}
    ...       ELSE    Fail  Sem aula nesse dia

############################################################################################################

Segunda-Feira
    [Arguments]     ${weekday}
    Procedimento Padrão
    Wait Until Element Is Visible    ${Materia1}   
    ${Cursos}    Cursos
    ${i}         Counter    ${weekday}
    ${Materia}   Materia do Dia    ${Cursos}  ${i}
    Click Element  ${Materia}

Terça-Feira 
    [Arguments]     ${weekday}
    Procedimento Padrão
    Wait Until Element Is Visible    ${Materia1}
    ${Cursos}    Cursos
    ${i}         Counter    ${weekday}
    ${Materia}   Materia do Dia    ${Cursos}  ${i}
    Click Element  ${Materia}

Quarta-Feira
    [Arguments]     ${weekday}
    Procedimento Padrão
    Wait Until Element Is Visible    ${Materia1}
    ${Cursos}    Cursos
    ${i}         Counter    ${weekday}
    ${Materia}   Materia do Dia    ${Cursos}  ${i}
    Click Element  ${Materia}
    
Quinta-Feira
    [Arguments]     ${weekday}
    Procedimento Padrão
    Wait Until Element Is Visible    ${Materia1}
    ${Cursos}    Cursos
    ${i}         Counter    ${weekday}
    ${Materia}   Materia do Dia    ${Cursos}  ${i}
    Click Element  ${Materia}

Sexta-Feira
    [Arguments]     ${weekday}
    Procedimento Padrão
    Wait Until Element Is Visible    ${Materia1}
    ${Cursos}    Cursos
    ${i}         Counter    ${weekday}
    ${Materia}   Materia do Dia    ${Cursos}  ${i}
    Click Element  ${Materia}

############################################################################################################

Procedimento Padrão
    Open PUC
    Acessar Blackboard
    Cookies 

Cursos
    ${Cursos}    Create List    ${Curso_Segunda}    ${Curso_Terca}    ${Curso_Quarta}    ${Curso_Quinta}    ${Curso_Sexta}
    [Return]    ${Cursos}

Counter
    [Arguments]  ${weekday}
    Run Keyword If  "${weekday}"=="Monday"      SEG
    Run Keyword If  "${weekday}"=="Tuesday"     TER
    Run Keyword If  "${weekday}"=="Wednesday"   QUA   
    Run Keyword If  "${weekday}"=="Thursday"    QUI  
    Run Keyword If  "${weekday}"=="Friday"      SEX
    [Return]  ${i}

Materia do Dia
    [Arguments]    ${Cursos}  ${i}
    ${Materia}  Set Variable   xpath=//div[@id="_3_1termCourses_noterm"]/ul[1]/li/a[contains(text(), "${Cursos${i}}")]
    [Return]    ${Materia}

SEG
    ${i}  Set Variable  ${0}

TER
    ${i}  Set Variable  ${1}

QUA
    ${i}  Set Variable  ${2}

QUI
    ${i}  Set Variable  ${3}
    
SEX
    ${i}  Set Variable  ${4}
*** Settings ***
Resource    ../../file.robot

*** Variables ***
${i}    ${1}
# ${Materia1}        xpath=//div[@id="_3_1termCourses_noterm"]/ul[1]/li[1]/a
# ${Materia2}        xpath=//div[@id="_3_1termCourses_noterm"]/ul[1]/li[2]/a
${Materia}        xpath=//div[@id="_3_1termCourses_noterm"]/ul[1]/li/a[text()]

*** Keywords ***
Procedimento Padrão
    Open PUC
    Acessar Blackboard
    Cookies 

############################################################################################################

Acessar aula
    ${theday}     Get Date
    ${thehour}    Get Time
    Day is more than other         ${theday}
    Start College    ${weekday}    ${thehour}

############################################################################################################

Start College
    [Arguments]       ${course}   ${weekday}  ${hour}
    Run Keyword If    Segunda in "${weekday}" and ${hourmin}>=${hour}    Access BB Course   ${course}    
    Run Keyword If    Terça in "${weekday}" and ${hourmin}>=${hour}      Access BB Course   ${course}
    Run Keyword If    Quarta in "${weekday}" and ${hourmin}>=${hour}     Access BB Course   ${course}
    Run Keyword If    Quinta in "${weekday}" and ${hourmin}>=${hour}     Access BB Course   ${course}
    Run Keyword If    Sexta in "${weekday}" and ${hourmin}>=${hour}      Access BB Course   ${course}
    ...       ELSE    Log To Console  Sem aula nesse dia

############################################################################################################

Percorrer Curso do Dia
    ${lenCourses}   Materias Length
    FOR   ${i}   IN RANGE   ${lenCourses}   
        # ${course}       Set Course             ${i}
        # ${hour}         Set Hour               ${i}
        # ${weekday}      Set Weekday            ${i}
        # ${semester}     Set Semester           ${i}
        # ${cursmrt}      Set Current Semester   ${i}
        # ${status}       Set Status             ${i}
        # ${startclass}   Set Start Of Classes   ${i}
        # ${endclass}     Set End Of Classes     ${i}
        ${course}       Set Data    ${MATERIAL}     ${i}
        ${hour}         Set Data    ${HOUR}         ${i}
        ${weekday}      Set Data    ${WEEKDAY}      ${i}
        ${semester}     Set Data    ${SEMESTER}     ${i}
        ${cursmrt}      Set Data    ${CURSMTR}      ${i}
        ${status}       Set Data    ${STATUS}       ${i}
        ${startclass}   Set Data    ${STARTCLASS}   ${i}
        ${endclass}     Set Data    ${ENDCLASS}     ${i}
        
        ${newhour}      Splitter Hour    ${hour}
        ${newstart}     Splitter Day     ${startclass}
        ${newend}       Splitter Day     ${endclass}
        
    END

Weekday
    [Arguments]       ${weekday}
    Procedimento Padrão
    Wait Until Element Is Visible    ${Materia}   
    # ${Cursos}    Cursos
    # ${i}         Counter           ${weekday}
    # ${Materia}   Materia do Dia    ${Cursos}  ${i}
    Click Element     ${Materia}


############################################################################################################
Access BB Course
    [Arguments]       ${course}
    # ...

Convert Date of Day to English
    [Arguments]       ${weekday}
    ${low_weekday}    Lower String   ${weekday}
    ${ENG_DAY}        Run Keyword If    segunda in "${low_weekday}"    Set To    Monday 
    ...    ELSE IF    terça in "${low_weekday}"      Set To    Tuesday
    ...    ELSE IF    quarta in "${low_weekday}"     Set To    Wednesday
    ...    ELSE IF    quinta in "${low_weekday}"     Set To    Thursday
    ...    ELSE IF    sexta in "${low_weekday}"      Set To    Friday
    ...    ELSE IF    sábado in "${low_weekday}"     Set To    Saturday
    ...    ELSE IF    domingo in "${low_weekday}"    Set To    Sunday
    ...       ELSE    Log  [ERRO]: Data inválida.
    [Return]          ${ENG_DAY}
 
Set To
    [Arguments]       ${weekday}
    ${new_weekday}    Set Variable    ${weekday}
    [Return]          ${new_weekday}
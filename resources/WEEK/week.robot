*** Settings ***
Resource    ../../file.robot

*** Variables ***
# ${Materia1}        xpath=//div[@id="_3_1termCourses_noterm"]/ul[1]/li[1]/a
# ${Materia2}        xpath=//div[@id="_3_1termCourses_noterm"]/ul[1]/li[2]/a
${Materia}           xpath=//div[@id="_3_1termCourses_noterm"]/ul[1]/li/a[text()]

${COURSE}            Materias
${HOUR}              Horarios
${WEEKDAY}           DiaDaSemana
${SEMESTER}          Semestre
${CURSMTR}           SemestreAtual
${STATUS}            Status
${STARTCLASS}        InicioAulas
${ENDCLASS}          FimAulas

*** Keywords ***
Procedimento Padrão
    Open PUC
    Acessar Blackboard
    Cookies 

############################################################################################################

Inicio Faculdade
    [Arguments]       ${course}   ${weekday}   ${starthour}   ${nowhour}
    ${rtn_college}    Start College     ${weekday}    ${starthour}   ${nowhour}
    ${whatisthis}     Evaluate          type(${rtn_college})
    Run Keyword If    ${rtn_college}==${1}      Log     a
    Run Keyword If    ${rtn_college}==${2}      Log     aa
    Run Keyword If    ${rtn_college}==${3}      Log     aaa
    Run Keyword If    ${rtn_college}==${4}      Log     aaaa
    Run Keyword If    ${rtn_college}==${5}      Log     aaaaa
    ...    ELSE IF    "${whatisthis}"!="<class 'int'>"   Log teste

############################################################################################################

Percorrer Curso do Dia
    ${lenCourses}   Materias Length
    ${theday}       Get Date
    FOR     ${i}    IN RANGE     ${lenCourses}
        ${nowhour}      Get Time 

        ${course}       Set Data    ${COURSE}       ${i}
        ${hour}         Set Data    ${HOUR}         ${i}
        ${weekday}      Set Data    ${WEEKDAY}      ${i}
        ${semester}     Set Data    ${SEMESTER}     ${i}
        ${cursmrt}      Set Data    ${CURSMTR}      ${i}
        ${status}       Set Data    ${STATUS}       ${i}
        ${startclass}   Set Data    ${STARTCLASS}   ${i}
        ${endclass}     Set Data    ${ENDCLASS}     ${i}
        
        ${thehour}      Splitter Hour                    ${hour}
        ${newstart}     Convert Date To Program          ${startclass}
        ${newend}       Convert Date To Program          ${endclass}
        ${frmt_day}     Convert Date To Program          ${startclass}

        ${rtn_value}    Day is More Than Other           ${theday}     ${frmt_day}
        ${eng_day}      Convert Date of Day to English   ${weekday}
        ${DAY}          Date Convertion                  ${theday}
        ${rtn_date}     Verify Date                      ${eng_day}    ${DAY}
        
        Run Keyword If  ${rtn_date}  Inicio Faculdade    ${course}     ${eng_day}     ${nowhour}      ${thehour}
        ...       ELSE  Log  [ALERTA]: Hoje não tem essa aula.
    END

############################################################################################################
Access BB Course
    [Arguments]       ${course}
    # ...

Convert Date of Day to English
    [Arguments]       ${weekday}
    ${low_weekday}    Lower String   ${weekday}
    ${ENG_DAY}        Set Weekday    ${low_weekday}
    [Return]          ${ENG_DAY}
 
Verify Date
    [Arguments]       ${eng_day}    ${DAY}
    ${rtn_date}       Run Keyword If    '${eng_day}'=='${DAY}'   Set Variable   ${TRUE}   
    ...       ELSE    Set Variable   ${FALSE}
    [Return]          ${rtn_date}


    
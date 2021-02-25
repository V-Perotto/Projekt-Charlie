*** Settings ***
Resource    ../../file.robot

*** Variables ***
# ${Materia1}        xpath=//div[@id="_3_1termCourses_noterm"]/ul[1]/li[1]/a
# ${Materia2}        xpath=//div[@id="_3_1termCourses_noterm"]/ul[1]/li[2]/a
${Materia}           xpath=//div[@id="_3_1termCourses_noterm"]/ul[1]/li/a[text()]

${EXCEL_COURSE}            Materias
${EXCEL_HOUR}              Horarios
${EXCEL_WEEKDAY}           DiaDaSemana
${EXCEL_SEMESTER}          Semestre
${EXCEL_CURSMTR}           SemestreAtual
${EXCEL_STATUS}            Status
${EXCEL_STARTCLASS}        InicioAulas
${EXCEL_ENDCLASS}          FimAulas

*** Keywords ***
Procedimento Padrão
    Open PUC
    Acessar Blackboard
    Cookies 

############################################################################################################

Inicio Faculdade
    [Arguments]       ${course}   ${weekday}   ${starthour}   ${nowhour}
    ${rtn_college}    Start College     ${weekday}    ${starthour}   ${nowhour}
    ${whatisthis}     Get Type          ${rtn_college}
    Run Keyword If    "${rtn_college}"=="${1}"      Log     Access BB Course    ${course}
    Run Keyword If    "${rtn_college}"=="${2}"      Log     Access BB Course    ${course}
    Run Keyword If    "${rtn_college}"=="${3}"      Log     Access BB Course    ${course}
    Run Keyword If    "${rtn_college}"=="${4}"      Log     Access BB Course    ${course}
    Run Keyword If    "${rtn_college}"=="${5}"      Log     Access BB Course    ${course}
    ...    ELSE IF    "${whatisthis}"!="<class 'int'>"   Log  ${rtn_college}

############################################################################################################

Percorrer Curso do Dia
    ${lenCourses}   Materias Length
    ${theday}       Get Date
    FOR     ${i}    IN RANGE     ${lenCourses}
        ${nowhour}      Get Time 

        Log       ${EXCEL_COURSE}
        ${course}       Set Data    ${EXCEL_COURSE}       ${i}
        # Log To Console      ${course}
        ${hour}         Set Data    ${EXCEL_HOUR}         ${i}
        # Log To Console      ${hour} 
        ${weekday}      Set Data    ${EXCEL_WEEKDAY}      ${i}
        # Log To Console      ${weekday}
        ${semester}     Set Data    ${EXCEL_SEMESTER}     ${i}
        # Log To Console      ${semester}
        ${cursmrt}      Set Data    ${EXCEL_CURSMTR}      ${i}
        # Log To Console      ${cursmrt}
        ${status}       Set Data    ${EXCEL_STATUS}       ${i}
        # Log To Console      ${status}
        ${startclass}   Set Data    ${EXCEL_STARTCLASS}   ${i}
        # Log To Console      ${startclass}
        ${endclass}     Set Data    ${EXCEL_ENDCLASS}     ${i}
        # Log To Console      ${endclass}

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
    [Arguments]       ${eng_day}     ${DAY}
    ${rtn_date}       Run Keyword If    '${eng_day}'=='${DAY}'   Set Variable   ${TRUE}   
    ...       ELSE    Set Variable   ${FALSE}
    [Return]          ${rtn_date}
    
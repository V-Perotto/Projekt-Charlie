*** Settings ***
Resource    ../../file.robot

*** Variables ***
${EXCEL_COURSE}            Materias
${EXCEL_HOUR_START}        Hora_Inicio
${EXCEL_HOUR_END}          Hora_End
${EXCEL_WEEKDAY}           Dia_Semana
${EXCEL_STATUS}            Status
${EXCEL_STARTCLASS}        Inicio_Aulas
${EXCEL_ENDCLASS}          Fim_Aulas

*** Keywords ***
Procedimento Padrão
    filelogger.Filelog    RF    >> INICIOU
    Open PUC
    filelogger.Filelog    RF    >> Acessou navegador no PUC:Blackboard
    Acessar Blackboard
    filelogger.Filelog    RF    >> Entrou no PUC:Blackboard
    Cookies
    filelogger.Filelog    RF    >> Fechou os Cookies
    Cursos
    filelogger.Filelog    RF    >> Acessou os Cursos 

Percorrer Curso do Dia
    ${lenCourses}       Materias Length   ${DIR}  ${MATERIAL}
    ${theday}           Get Date
    FOR       ${i}      IN RANGE    ${lenCourses}
        ${nowhour}      Get Time 
        
        ${course}       Set Data    ${EXCEL_COURSE}       ${i}
        ${hour_start}   Set Data    ${EXCEL_HOUR_START}   ${i}
        ${hour_end}     Set Data    ${EXCEL_HOUR_START}   ${i}
        ${weekday}      Set Data    ${EXCEL_WEEKDAY}      ${i}
        ${status}       Set Data    ${EXCEL_STATUS}       ${i}
        ${startclass}   Set Data    ${EXCEL_STARTCLASS}   ${i}
        ${endclass}     Set Data    ${EXCEL_ENDCLASS}     ${i}

        ${s_hour}       Splitter Hour                     ${hour_start}
        ${e_hour}       Splitter Hour                     ${hour_end}
        ${new_start}    Convert Date To Program           ${startclass}
        ${new_end}      Convert Date To Program           ${endclass}
        ${frmt_day}     Convert Date To Program           ${startclass}

        ${rtn_value}    Day is More Than Other            ${theday}     ${frmt_day}
        ${eng_day}      Convert Date of Day to English    ${weekday}
        ${DAY}          Date Convertion                   ${theday}
        ${rtn_date}     Verify Date                       ${eng_day}    ${DAY}
        
        ${jump_course}  Run Keyword If  ${rtn_date}  Inicio Faculdade   ${course}   ${eng_day}   ${nowhour}   ${s_hour}   ${e_hour}
        ...       ELSE  Log  [ALERTA]: Hoje não tem essa aula.

        ${type}         Get Type    ${jump_course} 
        Run Keyword If  "${type}"!="<class 'int'>"   Log  CONTINUE  
        ...       ELSE  Evaluate    ${i}+${1}
    END
    filelogger.Filelog    RF    Percorreu o curso do dia

Inicio Faculdade
    [Arguments]       ${course}   ${weekday}   ${nowhour}   ${starthour}   ${endhour}
    ${rtn_college}    Number Weekday    ${weekday}       
    ${whatisthis}     Get Type          ${rtn_college}
    ${jump_course}    Run Keyword If    "${rtn_college}"=="${1}"    Access BB Course    ${course}   ${nowhour}    ${starthour}    ${endhour}  
    ${jump_course}    Run Keyword If    "${rtn_college}"=="${2}"    Access BB Course    ${course}   ${nowhour}    ${starthour}    ${endhour}
    ${jump_course}    Run Keyword If    "${rtn_college}"=="${3}"    Access BB Course    ${course}   ${nowhour}    ${starthour}    ${endhour}
    ${jump_course}    Run Keyword If    "${rtn_college}"=="${4}"    Access BB Course    ${course}   ${nowhour}    ${starthour}    ${endhour}
    ${jump_course}    Run Keyword If    "${rtn_college}"=="${5}"    Access BB Course    ${course}   ${nowhour}    ${starthour}    ${endhour}
    ...    ELSE IF    "${whatisthis}"!="<class 'int'>"   Log        ${rtn_college}
    filelogger.Filelog    RF    Iniciou a Keyword "Inicio Faculdade" como o retorno para JumpCourse: "${jump_course}"
    [Return]          ${jump_course}

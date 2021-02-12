*** Settings ***
Library    SeleniumLibrary
Library    String
Library    ../scripts/get_excel_data.py

*** Variables ***
${URL}        https://ava.pucpr.br/blackboardauth/
${BROWSER}    chrome

${COURSE}          Materias
${HOUR}            Horarios
${WEEKDAY}         DiaDaSemana
${SEMESTER}        Semestre
${CURSMTR}         SemestreAtual
${STATUS}          Status
${STARTCLASS}      InicioAulas
${ENDCLASS}        FimAulas    

*** Keywords ***
Open PUC 
    Open Browser    ${URL}    ${BROWSER}
    
###########################################################################################
###            > > > > > > > [xls]        GET EXCEL                                     ###
###########################################################################################

Get Materia Data
    [Arguments]     ${path}   ${materia}
    ${materias}     get_excel_data.get_materia_data     ${path}   ${materia}
    [Return]        ${materias}

Get User Data
    [Arguments]     ${path}   ${user}
    ${login}        get_excel_data.get_user_data        ${path}   ${user}
    [Return]        ${login}

Lower String
    [Arguments]     ${args}
    ${LOW_ARGS}     get_excel_data.lower_string          ${args} 
    [Return]        ${LOW_ARGS}

###########################################################################################
###            > 0 > 1 > 2 > [3]         GET THING                                      ###
###########################################################################################

Set Material Data
    [Arguments]         ${data}
    ${rtn_material}     Get Materia Data     ${DIR}   ${MATERIAL}   
    ${material}         Set Variable         ${rtn_material}[${data}]
    [Return]            ${material}

Materias Length
    ${course}           Get Materia Data     ${DIR}   ${MATERIAL}    
    ${courseLEN}        Evaluate             len(${course}[Materias])
    [Return]            ${courseLEN}

User ID
    ${login}            Get User Data        ${DIR}   ${USER}    
    ${user}             Set Variable         ${login}[username]
    ${pass}             Set Variable         ${login}[password]
    ${username}         Evaluate             ${user}.get(0)
    ${password}         Evaluate             ${pass}.get(0)
    ${ID}               Create List          ${username}   ${password}
    [Return]            ${ID}       

####################################################################################################
#               [X] > > > >          GET & SET MATERIAL DATA        > > > > [Y]                    #
####################################################################################################
# Set Course
#     [Arguments]             ${i}
#     ${course_data}          Set Material Data    ${COURSE}
#     ${rtn_course}           Evaluate             ${course_data}.get(${i})
#     [Return]                ${rtn_course}

# Set Hour
#     [Arguments]             ${i}
#     ${hour_data}            Set Material Data    ${HOUR}
#     ${rtn_hour}             Evaluate             ${hour_data}.get(${i})
#     [Return]                ${rtn_hour}

# Set Weekday
#     [Arguments]             ${i}
#     ${weekday_data}         Set Material Data    ${WEEKDAY}
#     ${rtn_weekday}          Evaluate             ${weekday_data}.get(${i})
#     [Return]                ${rtn_weekday}

# Set Semester
#     [Arguments]             ${i}
#     ${semester_data}        Set Material Data    ${SEMESTER}
#     ${rtn_semester}         Evaluate             ${semester_data}.get(${i})
#     [Return]                ${rtn_semester}

# Set Current Semester
#     [Arguments]             ${i}
#     ${cursmtr_data}         Set Material Data    ${CURSMTR}
#     ${rtn_cursmtr}          Evaluate             ${cursmtr_data}.get(${i})
#     [Return]                ${rtn_cursmtr}

# Set Status
#     [Arguments]             ${i}
#     ${status_data}          Set Material Data    ${STATUS}
#     ${rtn_status}           Evaluate             ${status_data}.get(${i})
#     [Return]                ${rtn_status}

# Set Start Of Classes
#     [Arguments]             ${i}
#     ${startclass_data}      Set Material Data    ${STARTCLASS}
#     ${rtn_startclass}       Evaluate             ${startclass_data}.get(${i})
#     [Return]                ${rtn_startclass}

# Set End Of Classes
#     [Arguments]             ${i}
#     ${endclass_data}        Set Material Data    ${ENDCLASS}
#     ${rtn_endclass}         Evaluate             ${endclass_data}.get(${i})
#     [Return]                ${rtn_endclass}

Set Data
    [Arguments]             ${DATA}    ${i}
    ${_data_}               Set Material Data    ${DATA}
    ${rtn_data}             Evaluate             ${_data_}.get(${i})
    [Return]                ${rtn_data}

###########################################################################################
###         19:45 > 19 / 45 > 1945        SPLITTER                                      ###
###########################################################################################

Splitter Hour
    [Arguments]     ${horario}
    ${Xpart} 	    ${Ypart} = 	Split String 	 ${horario}   :   1
    ${Fpart}        Set Variable        ${Xpart}${Ypart}
    [Return]        ${Fpart}

Splitter Day
    [Arguments]     ${day}
    ${Xpart} 	    ${Ypart} = 	Split String 	 ${horario}   :   1
    ${Fpart}        Set Variable        ${Xpart}${Ypart}
    [Return]
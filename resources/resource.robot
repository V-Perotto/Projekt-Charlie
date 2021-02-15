*** Settings ***
Library    SeleniumLibrary
Library    String
Library    ../scripts/get_excel_data.py

*** Variables ***
${URL}        https://ava.pucpr.br/blackboardauth/
${BROWSER}    chrome

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
Materias Length
    ${course}           Get Materia Data     ${DIR}   ${MATERIAL}    
    ${courseLEN}        Evaluate             len(${course}[Materias])
    [Return]            ${courseLEN}

User ID
    ${login}            Get User Data        ${DIR}   ${LOGIN} 
    Log     ${login}   
    ${user}             Set Variable         ${login}[username]
    ${pass}             Set Variable         ${login}[password]
    ${username}         Evaluate             ${user}.get(0)
    ${password}         Evaluate             ${pass}.get(0)
    ${ID}               Create List          ${username}   ${password}
    [Return]            ${ID}       

####################################################################################################
#               [X] > > > >          GET & SET MATERIAL DATA        > > > > [Y]                    #
####################################################################################################
Set Weekday
    [Arguments]             ${DAY}
    ${SET_DAY}              get_excel_data.set_weekday      ${DAY}
    [Return]                ${SET_DAY}

Start College
    [Arguments]             ${weekday}     ${starthour}     ${nowhour}
    ${RTN_DAY}              get_excel_data.start_college    ${weekday}     ${starthour}     ${nowhour}
    [Return]                ${RTN_DAY}

Set Data
    [Arguments]             ${_data_}       ${i}
    ${rtn_material}         Get Materia Data     ${DIR}   ${MATERIAL} 
    ${dict}                 Set Variable         ${rtn_material}[${_data_}]
    ${rtn_dict}             Evaluate             ${dict}.get(${i})
    [Return]                ${rtn_dict}

# Set Hour
#     [Arguments]             ${i}
#     ${hour_data}            Set Material Data    ${_data_}[Horarios]
#     ${course}               Set Variable         ${course_data}[Material]
#     ${rtn_hour}             Evaluate             ${hour_data}.get(${i})
#     [Return]                ${rtn_hour}

# Set Weekday
#     [Arguments]             ${i}
#     ${weekday_data}         Set Material Data    ${_data_}[DiaDaSemana]
#     ${course}               Set Variable         ${course_data}[Material]
#     ${rtn_weekday}          Evaluate             ${weekday_data}.get(${i})
#     [Return]                ${rtn_weekday}

# Set Semester
#     [Arguments]             ${i}
#     ${semester_data}        Set Material Data    ${_data_}[Semestre]
#     ${course}               Set Variable         ${course_data}[Material]
#     ${rtn_semester}         Evaluate             ${semester_data}.get(${i})
#     [Return]                ${rtn_semester}

# Set Current Semester
#     [Arguments]             ${i}
#     ${cursmtr_data}         Set Material Data    ${_data_}[SemestreAtual]
#     ${course}               Set Variable         ${course_data}[Material]
#     ${rtn_cursmtr}          Evaluate             ${cursmtr_data}.get(${i})
#     [Return]                ${rtn_cursmtr}

# Set Status
#     [Arguments]             ${i}
#     ${status_data}          Set Material Data    ${_data_}[Status]
#     ${course}               Set Variable         ${course_data}[Material]
#     ${rtn_status}           Evaluate             ${status_data}.get(${i})
#     [Return]                ${rtn_status}

# Set Start Of Classes
#     [Arguments]             ${i}
#     ${startclass_data}      Set Material Data    ${_data_}[InicioAulas]
#     ${course}               Set Variable         ${course_data}[Material]
#     ${rtn_startclass}       Evaluate             ${startclass_data}.get(${i})
#     [Return]                ${rtn_startclass}

# Set End Of Classes
#     [Arguments]             ${i}
#     ${endclass_data}        Set Material Data    
#     ${course}               Set Variable         ${course_data}[FimAulas]
#     ${rtn_endclass}         Evaluate             ${endclass_data}.get(${i})
#     [Return]                ${rtn_endclass}


###########################################################################################
###         19:45 > 19 / 45 > 1945        SPLITTER                                      ###
###########################################################################################

Splitter Hour
    [Arguments]     ${horario}
    ${Xpart} 	    ${Ypart} = 	Split String 	 ${horario}   :   1
    ${Fpart}        Set Variable        ${Xpart}${Ypart}
    [Return]        ${Fpart}

Set To
    [Arguments]       ${weekday}
    ${new_weekday}    Set Variable    ${weekday}
    [Return]          ${new_weekday}

Convert Date To Program
    [Arguments]       ${startdate}
    ${last_part}      ${l_part}=        Split String      ${startdate}   /  1
    ${mid_part}       ${first_part}=    Split String      ${l_part}      /  1
    ${frmt_date}      Set Variable      ${first_part}${mid_part}${last_part}
    [Return]          ${frmt_date}
*** Settings ***
Resource   ../file.robot
Library    SeleniumLibrary
Library    String
Library    ../python.py
Library    ../filelogger.py

*** Variables ***
${URL}                  https://ava.pucpr.br/blackboardauth/

*** Keywords ***
Open PUC 
    ${BROWSER}          Set Browser 
    Open Browser        ${URL}    ${BROWSER}
    Maximize Browser Window

####################################################################################################
###            > > > > > > > [xls]          GET EXCEL                                            ###
####################################################################################################

Get Material Data
    [Arguments]         ${path}   ${materia}
    ${materias}         python.get_materia_data     ${path}   ${materia}
    [Return]            ${materias}

Get User Data
    [Arguments]         ${path}   ${user}
    ${login}            python.get_user_data        ${path}   ${user}
    [Return]            ${login}

Get and Set Browser
    [Arguments]         ${path}   ${plan_browser}
    ${browser}          python.set_browser          ${path}   ${plan_browser}
    [Return]            ${browser}

Lower String
    [Arguments]         ${args}
    ${LOW_ARGS}         python.lower_string         ${args} 
    [Return]            ${LOW_ARGS}

Get Type
    [Arguments]         ${args}
    ${type}             python.get_type             ${args}
    [Return]            ${type}

####################################################################################################
###            > 0 > 1 > 2 > [3]            GET THING                                            ###
####################################################################################################

Get Keyword 
    [Arguments]         ${kword}
    python.get_keyword  ${kword}

Materias Length
    [Arguments]         ${dir}      ${materia}
    ${course}           Get Material Data    ${dir}   ${materia}
    ${courseLEN}        Evaluate             len(${course}[Materias])
    [Return]            ${courseLEN}

User ID
    [Arguments]         ${DIR}      ${LOGIN}
    ${login}            Get User Data        ${DIR}   ${LOGIN} 
    Log     ${login}   
    ${user}             Set Variable         ${login}[username]
    ${pass}             Set Variable         ${login}[password]
    ${username}         Evaluate             ${user}.get(0)
    ${password}         Evaluate             ${pass}.get(0)
    ${ID}               Create List          ${username}   ${password}
    [Return]            ${ID}       

Set Browser
    ${DICT_BROWSER}     Get and Set Browser         ${DIR}   ${PLAN_BROWSER}
    ${not_browser}      Set Variable                ${DICT_BROWSER}[Browser]
    ${real_browser}     Set Variable                ${not_browser}[${0}]
    [Return]            ${real_browser}

####################################################################################################
#               [X] > > > >          GET & SET MATERIAL DATA        > > > > [Y]                    #
####################################################################################################

Set Weekday
    [Arguments]         ${DAY}
    ${SET_DAY}          python.set_weekday      ${DAY}
    [Return]            ${SET_DAY}

Number Weekday
    [Arguments]         ${weekday}     ${nowhour}     ${starthour}
    ${RTN_DAY}          python.number_weekday    ${weekday}     ${nowhour}     ${starthour}
    [Return]            ${RTN_DAY}

Set Data
    [Arguments]         ${_data_}      ${i}
    ${rtn_material}     Get Material Data    ${DIR}   ${MATERIAL} 
    ${dict}             Set Variable         ${rtn_material}[${_data_}]
    ${rtn_dict}         Evaluate             ${dict}.get(${i})
    [Return]            ${rtn_dict}

####################################################################################################
###         19:45 > 19 / 45 > 1945          SPLITTER                                             ###
####################################################################################################

Splitter Hour
    [Arguments]         ${horario}
    ${Xpart} 	        ${Ypart} = 	         Split String 	  ${horario}     :  1
    ${Fpart}            Set Variable         ${Xpart}${Ypart}
    [Return]            ${Fpart}

Set To
    [Arguments]         ${weekday}
    ${new_weekday}      Set Variable         ${weekday}
    [Return]            ${new_weekday}

Convert Date To Program
    [Arguments]         ${startdate}
    ${last_part}        ${l_part}=           Split String      ${startdate}   /  1
    ${mid_part}         ${first_part}=       Split String      ${l_part}      /  1
    ${frmt_date}        Set Variable         ${first_part}${mid_part}${last_part}
    [Return]            ${frmt_date}
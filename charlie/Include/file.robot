*** Settings ***
Library      DateTime
Library      filelogger.py
Resource     resources/resource.robot
Resource     resources/WEEK/week.robot
Resource     resources/PageObjects/Login/Login.robot
Resource     resources/PageObjects/Blackboard/blackboard.robot
Resource     resources/PageObjects/Course/Course.robot

*** Variables ***
${DIR}             ${CURDIR}
${MATERIAL}        materias.xls
${LOGIN}           aluno.xls
${PLAN_BROWSER}    navegador.xls              

*** Keywords ***
####################################################################################################
#               [X] > > > >        GET & CONVERT MATERIAL DATA        > > [Y] > > [Z]              #
####################################################################################################

Date Convertion 
    [Arguments]         ${Date}
    ${Day}=             Convert Date  ${Date}   result_format=%A
    [Return]            ${Day}

Get Date
    ${CurDate}          Get Current Date        result_format=%Y%m%d
    [Return]            ${CurDate}

Day is More Than Other
    [Arguments]         ${day}   ${initial}
    ${rtn_value}        Run Keyword If          ${day} > ${initial}     Set Variable    ${TRUE}
    ...                 ELSE                    Set Variable    ${FALSE}
    [Return]            ${rtn_value}

Get Time
    ${CurTime}          Get Current Date        result_format=%H%M
    [Return]            ${CurTime}

####################################################################################################

Convert Date of Day to English
    [Arguments]       ${weekday}
    ${low_weekday}    Lower String   ${weekday}
    ${ENG_DAY}        Set Weekday    ${low_weekday}
    [Return]          ${ENG_DAY}
 
Verify Date
    [Arguments]       ${eng_day}     ${DAY}
    ${rtn_date}       Run Keyword If    '${eng_day}'=='${DAY}'   Set Variable   ${TRUE}   
    ...    ELSE       Set Variable   ${FALSE}
    [Return]          ${rtn_date}

Start Class
    ${nowhour}        Get Time
    ${rtn} =          Wait For Condition      ${nowhour} >= ${start_hour} 

End Class
    ${nowhour}        Get Time
    ${rtn} =          Wait For Condition      ${nowhour} >= ${end_hour}
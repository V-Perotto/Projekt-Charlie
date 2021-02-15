*** Settings ***
Library      DateTime
Resource     resources/resource.robot
Resource     resources/WEEK/week.robot
Resource     resources/PageObjects/Login/Login.robot
Resource     resources/PageObjects/Blackboard/blackboard.robot

*** Variables ***
${DIR}             ${CURDIR}
${MATERIAL}        materias.xls
${LOGIN}           aluno.xls     

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

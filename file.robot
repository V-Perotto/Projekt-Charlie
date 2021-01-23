*** Settings ***
Library      DateTime
Resource     resources/resource.robot
Resource     resources/WEEK/week.robot
Resource     resources/PageObjects/Login/Login.robot
Resource     resources/PageObjects/Blackboard/blackboard.robot
Resource     data/sensive/sensive.robot

*** Keywords ***
Date Convertion 
    [Arguments]    ${Date}
    ${Day}=        Convert Date    ${Date}    result_format=%A
    [Return]       ${Day}

Get Date
    ${CurDate}     Get Current Date    result_format=%Y%m%d
    [Return]       ${CurDate}

Day is more than other
    [Arguments]    ${day}
    Run Keyword If    ${day} > 20210301    Start College
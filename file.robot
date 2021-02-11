*** Settings ***
Library      DateTime
Resource     resources/resource.robot
Resource     resources/WEEK/week.robot
Resource     resources/PageObjects/Login/Login.robot
Resource     resources/PageObjects/Blackboard/blackboard.robot
# Resource     data/sensive/aluno.xlsx
# Resource     data/sensive/materias.xlsx

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
    Run Keyword If    ${day} > 20210101    Log  Iniciar aulas

Get Time
    ${CurTime}     Get Current Date    result_format=%H%M
    [Return]       ${CurTime}
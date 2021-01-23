*** Settings ***
Resource    ../../file.robot

*** Variables ***
${Materia1}        xpath=//div[@id="_3_1termCourses_noterm"]/ul[1]/li[1]/a
${Materia2}        xpath=//div[@id="_3_1termCourses_noterm"]/ul[1]/li[2]/a
${Materia3}        xpath=//div[@id="_3_1termCourses_noterm"]/ul[1]/li[3]/a
${Materia4}        xpath=//div[@id="_3_1termCourses_noterm"]/ul[1]/li[4]/a
${Materia5}        xpath=//div[@id="_3_1termCourses_noterm"]/ul[1]/li[5]/a
${Materia6}        xpath=//div[@id="_3_1termCourses_noterm"]/ul[1]/li[6]/a
${Materia7}        xpath=//div[@id="_3_1termCourses_noterm"]/ul[1]/li[7]/a

*** Keywords ***
Start College
    [Arguments]       ${weekday}
    Run Keyword If    "${weekday}"=="Monday"     Segunda-Feira
    Run Keyword If    "${weekday}"=="Tueday"     Terça-Feira
    Run Keyword If    "${weekday}"=="Wednesday"  Quarta-Feira
    Run Keyword If    "${weekday}"=="Thursday"   Quinta-Feira
    Run Keyword If    "${weekday}"=="Friday"     Sexta-Feira

Segunda-Feira
    Wait Until Element Is Visible

Terça-Feira
    Wait Until Element Is Visible

Quarta-Feira
    Wait Until Element Is Visible

Quinta-Feira
    Wait Until Element Is Visible

Sexta-Feira
    Wait Until Element Is Visible

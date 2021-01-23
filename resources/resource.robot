*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}        https://ava.pucpr.br/blackboardauth/
${BROWSER}    chrome

*** Keywords ***
Open PUC 
    Open Browser    ${URL}    ${BROWSER}
    
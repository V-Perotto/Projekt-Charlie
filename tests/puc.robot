*** Settings ***
Resource                  ../file.robot

# Test Setup      Open PUC  
# Test Teardown   Maximize Browser Window

*** Test Cases ***
Acessar Aulas: PUCPR
    ${theday}     Get Date
    ${weekday}    Date Convertion     ${theday}
    Day is more than other            ${theday}
    # Acessar Blackboard
    # Cookies
    # Acessar matérias
*** Settings ***
Resource     ../file.robot

# Test Setup      Open PUC  
# Test Teardown   Maximize Browser Window

*** Test Cases ***
Acessar Aulas: PUCPR
    Acessar aula
    # Acessar matérias
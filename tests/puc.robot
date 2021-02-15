*** Settings ***
Resource     ../file.robot

# Test Setup      Open PUC  
# Test Teardown   Maximize Browser Window

*** Test Cases ***
Acessar Aulas: PUCPR
    Percorrer Curso do Dia
    # Acessar aula
    # Acessar matérias

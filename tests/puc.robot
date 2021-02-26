*** Settings ***
Resource     ../file.robot

# Test Setup      Open PUC  
# Test Teardown   Maximize Browser Window

*** Test Cases ***
# PUC: Validar Matérias do Dia
Acessar Aulas: PUCPR
    Procedimento Padrão
    Percorrer Curso do Dia
    
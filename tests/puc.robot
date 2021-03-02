*** Settings ***
Resource     ../file.robot

*** Test Cases ***
# PUC: Validar Matérias do Dia
Acessar Aulas: PUCPR
    Procedimento Padrão
    Percorrer Curso do Dia
    
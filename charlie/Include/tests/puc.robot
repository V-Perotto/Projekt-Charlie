*** Settings ***
Resource     ../file.robot
Resource     ../resources/resource.robot

*** Test Cases ***
Acessar Aulas: PUCPR
    filelogger.Filelog     RF  ---------------------------------- [INICIO]: COMEÇOU ----------------------------------  
    Procedimento Padrão
    Percorrer Curso do Dia
    filelogger.Filelog     RF  ---------------------------------- [FIM]: FINALIZOU ----------------------------------
    
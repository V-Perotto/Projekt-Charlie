*** Settings ***
Resource     ../file.robot
Resource     ../resources/resource.robot

*** Test Cases ***
# PUC: Validar Matérias do Dia
Acessar Aulas: PUCPR
    filelogger.Filelog     RF  ----------------- [INICIO]: COMEÇOU -----------------  
    # criar um verificador de horario e excluidor de logs antigos e prints antigas
    Procedimento Padrão
    Percorrer Curso do Dia
    filelogger.Filelog     RF  ----------------- [FIM]: FINALIZOU -----------------
    
*** Settings ***
Resource    ../../../file.robot

*** Variables ***
## fora do iframe
${WEBCONFERENCIA}      xpath=//span[@title="Webconferência"]
${COLLABORATE_ULTRA}   xpath=//h3[@id="anonymous_element_4"]/a/span

## dentro do iframe - blackboard
${SETA_CURSOS}         xpath=//button[@class="icon-button has-tooltip"]
${HORARIO_INICIO}      xpath=//ul/li/ul/li[1]/div/button/div[2]/span[2]/div/span//bdi[1]
${HORARIO_FIM}         xpath=//ul/li/ul/li[1]/div/button/div[2]/span[2]/div/span//bdi[2]

*** Keywords ***
Entrar na Aula
    Acessar Webconferência
    Acessar Collaborate Ultra
    Acessar Curso do Dia

Acessar Webconferência
    # ${result} =   Run Keyword And Return Status   Element Should Be Visible    ${WEBCONFERENCIA}
    # Run Keyword If   ${result}
    Wait Until Element Is Visible   ${WEBCONFERENCIA}
    Click Element       ${WEBCONFERENCIA}

Acessar Collaborate Ultra
    # ${result} =   Run Keyword And Return Status   Element Should Be Visible    ${WEBCONFERENCIA}
    # Run Keyword If   ${result}
    Wait Until Element Is Visible   ${COLLABORATE_ULTRA}
    Click Element       ${COLLABORATE_ULTRA}

Acessar Curso do Dia
    Select Frame
    ${result} =   Run Keyword And Return Status   Element Should Be Visible    ${SETA_CURSOS}
    Run Keyword If      ${result}   Click Element       ${SETA_CURSOS}

# Valida Curso
#     validar começo e fim do horario do curso com o do excel 
#     para então acessar a aula
#     ${HORARIO_INICIO}   
#     ${HORARIO_FIM}      

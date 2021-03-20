*** Settings ***
Resource    ../../../file.robot

*** Variables ***
${WEBCONFERENCIA}      xpath=//span[@title="Webconferência"]
${COLLABORATE_ULTRA}   xpath=//h3[@id="anonymous_element_4"]/a/span
${SETA_CURSOS}               xpath=//button[@class="icon-button has-tooltip"]
${INPUT_HORARIO_INICIO}      xpath=//ul/li/ul/li[1]/div/button/div[2]/span[2]/div/span//bdi[1]
${INPUT_HORARIO_FIM}         xpath=//ul/li/ul/li[1]/div/button/div[2]/span[2]/div/span//bdi[2]
${INPUT_HORARIO}             xpath=//span[@class="date ng-scope ng-isolate-scope"]/div/span[1]
${NOSESSION}                 xpath=//div[@id="body-content"]/div[3]/div/span
${BTN_AULA}                  xpath=//*[@id="session-37bab654b17948ea9e4c67960f358893cdf98400b7324919bd9ac8a133c3b467"]

*** Keywords ***
Entrar na Aula
    filelogger.Filelog     RF  [Entrar na Aula]: ENTROU    
    Acessar Webconferência
    Acessar Collaborate Ultra
    Acessar Curso do Dia
    filelogger.Filelog     RF  [Entrar na Aula]: SAIU

Acessar Webconferência
    filelogger.Filelog     RF  [Acessar Webconferência]: ENTROU
    ${result} =   Run Keyword And Return Status   Element Should Be Visible    ${WEBCONFERENCIA}
    Run Keyword If      ${result}   Click Element   ${WEBCONFERENCIA}
    filelogger.Filelog     RF  [RETORNO]: ${result}
    filelogger.Filelog     RF  [Acessar Webconferência]: SAIU

Acessar Collaborate Ultra
    filelogger.Filelog     RF  [Acessar Collaborate Ultra]: ENTROU
    ${result} =   Run Keyword And Return Status   Element Should Be Visible    ${COLLABORATE_ULTRA}
    Run Keyword If      ${result}   Click Element   ${COLLABORATE_ULTRA}
    filelogger.Filelog     RF  [RETORNO]: ${result}
    filelogger.Filelog     RF  [Acessar Collaborate Ultra]: SAIU

Acessar Curso do Dia
    filelogger.Filelog     RF  [Acessar Curso do Dia]: ENTROU
    Select Frame
    filelogger.Filelog     RF  [FRAME]: entrou
    ${result} =   Run Keyword And Return Status   Element Should Be Visible    ${SETA_CURSOS}
    Run Keyword If      ${result}   Click Element   ${SETA_CURSOS}
    ...    ELSE IF      ${result}==${FALSE}    Click Element    
    Unselect Frame
    filelogger.Filelog     RF  [FRAME]: saiu
    filelogger.Filelog     RF  [RETORNO]: ${result}
    filelogger.Filelog     RF  [Acessar Curso do Dia]: SAIU

Valida Curso
    filelogger.Filelog     RF  [Valida Curso]: ENTROU
    ${HORARIO_INICIO}   Get Text    ${INPUT_HORARIO_INICIO}
    ${HORARIO_FIM}      Get Text    ${INPUT_HORARIO_FIM}
    filelogger.Filelog     RF  [RETORNO]: Inicio: ${HORARIO_INICIO}. Fim: ${HORARIO_FIM} 
    filelogger.Filelog     RF  [Valida Curso]: SAIU

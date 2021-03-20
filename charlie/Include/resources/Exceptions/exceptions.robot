*** Keywords ***
> ERROS:
    [Documentation]   Log para indicar os possíveis erros do robô e locais
    ...               aonde esses erros se encontram. 

    [ERRO_GUD]: Erro ao pegar os dados do usuário. <" + str(e) + ">"        # get_user_data
    [ERRO_GMD]: Erro ao pegar os dados das matérias. <" + str(e) + ">"      # get_materia_data
    [ERRO_SW]: Erro ao indicar o dia da semana. <" + str(e) + ">"           # set_weekday
    [ERRO_SC]: Erro ao validar o dia e horário. <" + str(e) + ">"           # start_college
    
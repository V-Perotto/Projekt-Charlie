import pandas as pd
from os.path import join
from robot.libraries.BuiltIn import BuiltIn
from datetime import datetime

def get_user_data(path, user):
    try: 
        way = join(path, user)
        data = pd.read_excel(way, usecols= ['username','password'])
        login = data.to_dict()
    except Exception as e:
        return "[ERRO_GUD]: Erro ao pegar os dados do usuário. <" + str(e) + ">"
    return login

def get_materia_data(path, materia):
    try:
        way = join(path, materia)
        data = pd.read_excel(way, usecols=['Materias', 'Hora_Inicio', 'Hora_Fim', 'Dia_Semana', 'Status', 'Inicio_Aulas', 'Fim_Aulas'])
        course  = data.to_dict()
    except Exception as e:
        return "[ERRO_GMD]: Erro ao pegar os dados das matérias. <" + str(e) + ">"
    return course

def set_weekday(args):
    try:
        if 'segunda' in args:
            rtn = 'Monday'
            return rtn
        elif 'terça' in args: 
            rtn = 'Tuesday'
            return rtn
        elif 'quarta' in args:
            rtn = 'Wednesday'
            return rtn
        elif 'quinta' in args: 
            rtn = 'Thursday'
            return rtn
        elif 'sexta' in args:
            rtn = 'Friday'
            return rtn
        elif 'sábado' in args: 
            rtn = 'Saturday'
            return rtn
        elif 'domingo' in args:
            rtn = 'Sunday'
            return rtn
        else:
            return '[ERRO]: Data inválida.'
    except Exception as e:
        return "[ERRO_SW]: Erro ao indicar o dia da semana. <" + str(e) + ">"

def number_weekday(weekday, n_hour, s_hour):
    try:
        if 'Monday' in weekday and n_hour >= s_hour:
            return 1
        elif 'Tuesday' in weekday and n_hour >= s_hour:       
            return 2
        elif 'Wednesday' in weekday and n_hour >= s_hour:     
            return 3    
        elif 'Thrusday' in weekday and n_hour >= s_hour:      
            return 4
        elif 'Friday' in weekday and n_hour >= s_hour:        
            return 5
        else:
            return str("[ALERTA]: Sem aula nesse dia")
    except Exception as e:
        return "[ERRO_SC]: Erro ao validar o dia e horário. <" + str(e) + ">"

def get_keyword(kword):
    k = True
    while k:
        rtn = BuiltIn().run_keyword(kword)
        if rtn == -1:
            k = False
        elif rtn == False:
            k = True
        else: 
            k = True

def lower_string(args):
    return args.lower()

def get_type(args):
    return type(args)
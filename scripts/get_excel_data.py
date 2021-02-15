import pandas as pd
from robot.libraries.BuiltIn import BuiltIn

def get_user_data(path, user):
    way = path + '/' + user
    data = pd.read_excel(way, usecols= ['username','password'])
    login = data.to_dict()
    return login

def get_materia_data(path, materia):
    way = path + '/' + materia
    data = pd.read_excel(way, usecols=['Materias', 'Horarios', 'DiaDaSemana', 'Semestre', 'SemestreAtual', 'Status', 'InicioAulas', 'FimAulas'])
    course  = data.to_dict() 
    return course

def set_weekday(args):
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

def start_college(weekday, s_hour, n_hour):
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
        return '[ALERTA]: Sem aula nesse dia'

def lower_string(args):
    return args.lower()

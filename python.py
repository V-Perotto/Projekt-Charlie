from robot.libraries.BuiltIn import BuiltIn
from os.path import join
from filelogger import filelog
import pandas as pd
import traceback

def get_user_data(path, plan_user):
    try: 
        way = join(path, plan_user)
        data = pd.read_excel(way, usecols= ['username','password'])
        login = data.to_dict()
    except Exception as e:
        filelog('PYTHON', '[GUD]:\n' + str(traceback.format_exc()))
        return "[ERRO_GUD]: Erro ao pegar os dados do usuário. <" + str(e) + ">"
    return login

def get_materia_data(path, plan_materia):
    try:
        way = join(path, plan_materia)
        data = pd.read_excel(way, usecols=['Materias', 'Hora_Inicio', 'Hora_Fim', 'Dia_Semana', 'Status', 'Inicio_Aulas', 'Fim_Aulas'])
        course  = data.to_dict()
    except Exception as e:
        filelog('PYTHON', '[GMD]:\n' + str(traceback.format_exc()))
        return "[ERRO_GMD]: Erro ao pegar os dados das matérias. <" + str(e) + ">"
    return course

def set_browser(path, plan_browser):
    try:
        way = join(path, plan_browser)
        data = pd.read_excel(way, usecols=['Browser'])
        browser = data.to_dict()
    except Exception as e:
        filelog('PYTHON', '[SB]:/n' + str(e))
        return "[ERRO_GMD]: Erro ao pegar os dados do browser. <" + str(e) + ">"
    return browser

def set_weekday(args):
    try:
        if 'segunda' or 'segunda-feira' in args:
            rtn = 'Monday'
            return rtn
        elif 'terça' or 'terca' or 'terça-feira' or 'terca-feira' in args: 
            rtn = 'Tuesday'
            return rtn
        elif 'quarta' or 'quarta-feira' in args:
            rtn = 'Wednesday'
            return rtn
        elif 'quinta' or 'quinta-feira' in args: 
            rtn = 'Thursday'
            return rtn
        elif 'sexta' or 'sexta-feira' in args:
            rtn = 'Friday'
            return rtn
        elif 'sábado' or 'sabado' in args: 
            rtn = 'Saturday'
            return rtn
        elif 'domingo' in args:
            rtn = 'Sunday'
            return rtn
        else:
            return '[ERRO]: Data inválida.'
    except Exception as e:
        filelog('PYTHON', '[SW]:\n' + str(traceback.format_exc()))
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
        filelog('PYTHON', '[SC]:\n' +str(traceback.format_exc()))
        return "[ERRO_SC]: Erro ao validar o dia e horário. <" + str(e) + ">"

def get_keyword(kword):
    try:
        k = True
        while k:
            rtn = BuiltIn().run_keyword(kword)
            if rtn == -1:
                k = False
            elif rtn == False:
                k = True
            else: 
                k = True
    except Exception as e:
        filelog('PYTHON', '[RFK]:\n' + str(traceback.format_exc()))
        return '-1:/n' + str(e)
        

def lower_string(args):
    try:
        return args.lower()
    except Exception as e:
        filelog('PYTHON', '[LS]:\n' + str(traceback.format_exc()))
        return '-2:/n' + str(e)

def get_type(args):
    try:
        return type(args)
    except Exception as e:
        filelog('PYTHON', '[GT]:\n' + str(traceback.format_exc()))
        return '-3:/n' + str(e)
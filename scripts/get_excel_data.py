import pandas as pd

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

import pandas as pd

def get_user_data(path, user):
    way = path + '/' + user
    data = pd.read_excel(way) 
    login = pd.DataFrame(data, columns= ['username','password'])
    print (login)

def get_materia_data(path, materia):
    way = path + '/' + materia
    data = pd.read_excel(way) 
    course = pd.DataFrame(data, columns=['Materias', 'Horarios', 'DiaDaSemana', 'Semestre', 'SemestreAtual', 'Status', 'InicioAula', 'FimAula'])
    print (course)

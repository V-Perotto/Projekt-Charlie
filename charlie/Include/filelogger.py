
from os import getcwd 
from os.path import isfile
from os.path import join
from os import listdir
from datetime import datetime

# Obrigado Fabrício por me mostrar como criar um log em python e por ser um
# colega incrível :)
def filelog(name, desc):
    # print("ENTROU")
    if name == "PY_F":
        path_way = getcwd()
        path_logs = path_way + "/results/log_py/ERROR"
    if name == "PY_S":
        path_way = getcwd()
        path_logs = path_way + "/results/log_py/SUCCESS"
    if name == "RF":
        path_way = getcwd()
        path_logs = path_way + "/results/log_rf/"

    # Obtem a data atual e hora
    data = datetime.now().strftime("%d-%m-%Y")
    data_hora = datetime.now().strftime("%d-%m-%Y__%H:%M:%S")

    if (len(listdir(path_logs)) != 0):
        onlyfiles = [f for f in listdir(path_logs) if isfile(join(path_logs, f))]

        if (True in [True for x in onlyfiles if (data in x)]):

            with open(join(path_logs,"CHARLIE_"+ data + ".txt"), "a") as file:
                file.write(data_hora+" : " + desc + '\n')
            return

    with open(join(path_logs,"CHARLIE_"+ data + ".txt"), "a") as file:
        file.write("|===================================================|\n" +
                   "|\t\t\t\t   PROJEKT CHARLIE \t\t\t\t\t|\n" +    # pov: cursed python
                   "|===================================================|\n\n\n" + 
                   data_hora + " : " + desc + '\n')
    return
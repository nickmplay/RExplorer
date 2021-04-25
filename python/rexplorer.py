
from os import listdir
from os.path import isfile, join


def os_list_files(path):
    subd_list = listdir(path)
    onlyfiles = [f for f in subd_list if isfile(join(path, f))]
    onlyfolders = [x for x in subd_list if x not in onlyfiles]
    return {"dir": [path], "subDirs": onlyfolders, "files": onlyfiles}

#print(os_list_files("C:\\Users\\nickm\\Documents\\1_Projects\\js\\Rexplorer"))
#print(os_list_files("C:/Users/nickm/Documents/1_Projects/js/Rexplorer"))

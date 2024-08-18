from os import path

def createFile(dest):
    if not (path.isfile(dest)):
        f=open(dest,'w')
        f.write("this is python scripting")
        f.close()

dest="D:\\Study\\Automation\\APIAutomation\\PythonScripting\\Newfile.txt"

createFile(dest)              #Calling the funcion
print("File created")

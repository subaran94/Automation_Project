def function1(i):          #Usecase1
    print(i)

function1(10)

def function2(*args):             #UseCase2
    for i in args:
        print(i)

function2 (10,20,30,40)

def function3(*args, **kwargs):           #Usecase3
    for i in kwargs.items():
        print(i)

function3 (a=10,b=20,c=30,d=40)
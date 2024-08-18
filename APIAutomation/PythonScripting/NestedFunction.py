def function1():
    x=10
    def function2(x):
        return x+1
    return function2(x)

result=function1()
print(result)

def MainFunction(called):
    print("This is th main function")

    def nestedFunction(called):
        print("This is nested function")
        return called
    return nestedFunction(called)

@MainFunction
def outerFunction():
    print("This is outer function")

outerFunction()

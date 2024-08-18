#factory

B=type("BaseClass",(object,),{})
C1=type("C1",(B,),{'val':5})
C2=type("C2",(B,),{'val':10})

def ClassCreator(bool):
    if bool:
        return C1()
    else:
        return C2()

print(ClassCreator(True).val)
print(ClassCreator(False).val)
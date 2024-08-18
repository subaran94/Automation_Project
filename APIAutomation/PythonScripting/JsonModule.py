import json

Edata= '''
{
    "name":"alice",
    "isWorking":true,
    "skill": ["testing", "deployement", "automation"],
    "personalDetails":{
        "fistName":"alice",
        "age":28,
        "nationality":"indian"
    }
}
'''
#print(Edata)

data= json.loads(Edata)    #Converted json to disctionary in key value pair and array converted to list
#print(data)

data["personalDetails"]["age"] = 33
updated_json_data = json.dumps(data, indent=3)
print(updated_json_data)


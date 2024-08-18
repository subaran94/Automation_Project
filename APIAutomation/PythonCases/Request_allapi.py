import json
import string
import requests

#Headers
header = {"accept": "text/plain", "Content-Type": "application/json"}

#data
request_payload = {"name": "subaran", "job": "leader"}
put_payload= {"name": "subaran", "job": "engineer"}

#Base Url
url = "https://reqres.in/api/users"
Get_id = 10
Put_id = 2

#Post Request
def Post_request():
    response= requests.post(url, json=request_payload, headers=header)
    print(response.status_code)
    #print(response.content)
    json_data= response.json()
    print(json_data)
    json_body= json.dumps(json_data, indent=2)
    print("Post Response body: ", json_body)
    print(json_data['id'])
    user_id= json_data["id"]
    assert response.status_code == 201
    print(json_data["name"])
    assert json_data["name"] == "subaran"

 #Get Request
def Get_request():
    get_url= url + f"/{Get_id}"
    response= requests.get(get_url)
    print(response.status_code)
    assert response.status_code == 200
    json_data = response.json()
    print("Get Response body: ", json_data)
    print(json_data['data']['id'])
    print(json_data['support']['url'])

#Put Request
def Put_request():
    put_url= url + f"/{Put_id}"
    print(put_url)
    response= requests.put(put_url, json=put_payload, headers=header)
    print(response.status_code)
    assert response.status_code == 200
    json_data = response.json()
    print("Put Response body: ", json_data)

#Delete Request
def Delete_requests():
    delete_url= url + f"/{Put_id}"
    print(delete_url)
    response= requests.delete(delete_url)
    print(response.status_code)
    assert response.status_code == 204

#CallMethod
Post_request()
Get_request()
Put_request()
Delete_requests()

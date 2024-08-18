import requests

#Headers
header = {"accept": "text/plain", "Content-Type": "application/json"}

#data
request_payload = {"name": "morpheus", "job": "leader"}

#Base Url
url = "https://reqres.in/api/users"

response = requests.post(url, headers=header, json=request_payload)
print(response.status_code)
print(response.content)

assert response.status_code == 201

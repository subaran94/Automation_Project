import json

import requests

url = "https://reqres.in/api/unknown/2"

response = requests.get(url)
# print(response)
json_response = json.loads(response.text)
# print(json_response)
print(response.content)
# print(response.headers)
# print(response.status_code)
assert response.status_code == 200
# pages = jsonpath.jsonpath(json_response, 'total_pages')
# print(pages[1])

import pytest
import requests

def test_GetRequest():
    baseurl = 'https://reqres.in'
    response= requests.get(url=baseurl + '/api/user/2')
    print(response.status_code)
    assert 200 == response.status_code
    print(response.content)
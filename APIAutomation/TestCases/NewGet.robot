*** Settings ***
Library    RequestsLibrary

*** Variables ***
${base_url}=     https://reqres.in/api/
${req_uri}=     unknown/2

*** Test Cases ***
Get_user_info
    create session    demoSession    ${base_url}
    ${response}=    get request    demoSession      ${req_uri}
    log    ${response.status_code}
    log    ${response.headers}
    log    ${response.content}

*** Keywords ***
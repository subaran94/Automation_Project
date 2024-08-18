*** Settings ***
Library    RequestsLibrary

*** Variables ***
${url}=    https://reqres.in/
${uri}=    api/users/2

*** Test Cases ***
GetUser2
    create session    mysession     ${url}
    ${response}=    get request    mysession    ${uri}
    log     ${response.content}

*** Keywords ***

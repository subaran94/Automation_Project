*** Settings ***
Library    RequestsLibrary
Resource    ../Resources/keyword.robot
Variables    ../Variables/variable.py


*** Test Cases ***
UserProfileRetrive
    create session    mysession    ${Host}
    ${response}=   get request   mysession    ${path}
    log     ${response.status_code}
    log     ${response.content}
    StatusCode_Validation    ${response.status_code}       200
    ResponseContent_Validation    ${response.content}

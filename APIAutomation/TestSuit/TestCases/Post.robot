*** Settings ***
Library    RequestsLibrary
Variables    ../Variables/variable.py
Resource    ../Resources/keyword.robot

*** Test Cases ***
StoreUserProfile
    create session    HostSession    ${Host}
    ${body}     create dictionary    name=morpheus      job=leader
    ${header}    create dictionary    Content-Type=application/json
    ${response}=    post request    HostSession      ${store_path}     data=${body}    headers=${header}
    log    ${response.status_code}
    log    ${response.content}
    StatusCode_Validation    ${response.status_code}     201
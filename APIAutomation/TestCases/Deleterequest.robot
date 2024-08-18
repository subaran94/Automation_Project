*** Settings ***
Library    RequestsLibrary

*** Variables ***
${base_url}=    https://reqres.in/api
${uri}=    /users/2
${code_1}=    200

*** Test Cases ***
Delete_User_registration
    [Tags]    local
    create session    delSession    ${base_url}
    ${response}=    delete request    delSession    ${uri}
    log     ${response.status_code}
    log     ${response.headers}
    run keyword and continue on failure    Status_code_validation    ${response.status_code}

User_reg_update
    [Tags]    local      remote
    create session    updateSession     ${base_url}
    ${body}=    create dictionary     name=morpheus     job=zion resident
    ${header}=    create dictionary    Content-Type=application/json
    ${response}=    put request    updateSession    ${uri}
    log     ${response.status_code}
    log     ${response.headers}
    log     ${response.content}
    run keyword and continue on failure    Status_code_validation_1     ${response.status_code}     ${code_1}
    run keyword and continue on failure    Response_Body_validation      ${response.content}

*** Keywords ***
Status_code_validation
    [Arguments]      ${status_code}
    run keyword and continue on failure    should be equal as strings    ${status_code}   204

Status_code_validation_1
    [Arguments]      ${status_code}     ${code}
    run keyword and continue on failure    should be equal as strings    ${status_code}    200

Response_Body_validation
    [Arguments]      ${response_body}
    log     ${response_body}
    ${body}=    Evaluate    json.loads('''${response_body}''',strict=False)    json
    log     ${body}
    run keyword and continue on failure    should match regexp    ${body['updatedAt']}    [0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}:[0-9]{2}.[0-9]{3}Z

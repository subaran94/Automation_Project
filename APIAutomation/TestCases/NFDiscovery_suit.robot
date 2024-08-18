*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${base_url}     https://reqres.in/
${Get_url}      /api/users/2
${Post_url}      /api/users
${Put_url}      /api/users/3
${Delete_url}      /api/users/4

*** Test Cases ***
NFRegistration
    create session    NrfSession    ${base_url}
    ${json}=   create dictionary    name=morphues    job=leader
    ${header}=    create dictionary    Content-Type=application/json
    ${response}=    post request    NrfSession    ${Post_url}    data=${json}    headers=${header}
    log    ${response.status_code}
    log    ${response.content}
    StatusCode_Validation   ${response.status_code}
    ResponseContent_Validation      ${response.content}

NFUpdate
    create session    NrfSession    ${base_url}
    ${json}=   create dictionary    name=morphues    job=zion resident
    ${header}=    create dictionary    Content-Type=application/json
    ${response}=    put request    NrfSession    ${Put_url}    data=${json}    headers=${header}
    log    ${response.status_code}
    log    ${response.content}
    StatusCode_Validation_GETPUT   ${response.status_code}

NFDiscovery
    create session    NrfSession    ${base_url}
    ${response}=    GET On Session    NrfSession    ${Get_url}
    log    ${response.status_code}
    log    ${response.content}
    StatusCode_Validation_GETPUT   ${response.status_code}

NFDeregistration
    create session    NrfSession    ${base_url}
    ${response}=    delete request    NrfSession    ${Delete_url}
    log    ${response.status_code}
    StatusCode_Validation_Delete   ${response.status_code}

*** Keywords ***
StatusCode_Validation
    [Arguments]    ${response_code}
    should be equal as integers    ${response_code}    201

StatusCode_Validation_GETPUT
    [Arguments]    ${response_code}
    should be equal as integers    ${response_code}    200

StatusCode_Validation_Delete
    [Arguments]    ${response_code}
    should be equal as integers    ${response_code}    204

ResponseContent_Validation
    [Arguments]    ${payload}
    log     ${payload}
    ${body}=    Evaluate    json.loads('''${payload}''',strict=False)    json
    should be equal as strings    ${body['name']}     morphues


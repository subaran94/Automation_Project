*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${base_url}=    https://reqres.in
${uri}=     /api/users
${uri_1}=    /api/users/2
${code}=    201
*** Test Cases ***
NF_Registration
    create session    mysession     ${base_url}
    ${body}=    create dictionary     name=morpheus     job=leader
    ${header}=    create dictionary    Content-Type=application/json
    ${response}=    post request    mysession    ${uri}   data=${body}    headers=${header}
    log     ${response.status_code}
    run keyword and continue on failure    Status_code_validation     ${response.status_code}
    log     ${response.content}
    run keyword and continue on failure    Response_Body_validation      ${response.content}
    log     ${response.headers}

NF_Update
    create session    mysession     ${base_url}
    ${body}=    create dictionary     name=morpheus     job=zion resident
    ${header}=    create dictionary    Content-Type=application/json
    ${response}=    put request    mysession    ${uri_1}   data=${body}    headers=${header}
    log     ${response.status_code}
    #run keyword and continue on failure    Status_code_validation     ${response.status_code}
    log     ${response.content}
    #run keyword and continue on failure    Response_Body_validation      ${response.content}
    log     ${response.headers}
*** Keywords ***
Status_code_validation
    [Arguments]      ${status_code}
    run keyword and continue on failure    should be equal as integers    ${status_code}     ${code}

Response_Body_validation
    [Arguments]      ${response_body}
    log     ${response_body}
    ${body}=    Evaluate    json.loads('''${response_body}''',strict=False)    json
    log     ${body}
    run keyword and continue on failure    should match regexp    ${body['name']}    [A-Za-z]
    run keyword and continue on failure    should be equal as strings    ${body['job']}    leader
    run keyword and continue on failure    should match regexp    ${body['id']}    [0-9]{3}
    run keyword and continue on failure    should match regexp    ${body['createdAt']}    [0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}:[0-9]{2}.[0-9]{3}Z


*** Settings ***
Library    RequestsLibrary
Library    OperatingSystem

*** Variables ***
${base_url}=    https://reqres.in/api
${uri}=     /users
${code}=    201
${NAME}=     morpheus

*** Test Cases ***
UserRegistration
    create session    mysession     ${base_url}
    ${body}=    OperatingSystem.Get Binary File     ${CURDIR}/../testfiles/usercreate.json
    ${header}=    create dictionary    Content-Type=application/json
    ${response}=    post request    mysession    ${uri}   data=${body}    headers=${header}
    log     ${response.status_code}
    log     ${response.content}
    log     ${response.headers}
    run keyword and continue on failure    Status_code_validation     ${response.status_code}
    run keyword and continue on failure    Response_payload_Validation      ${response.content}

*** Keywords ***
Status_code_validation
    [Arguments]      ${status_code}
    ${response_code}=    convert to string    ${status_code}
    run keyword and continue on failure    should be equal as strings    ${response_code}     ${code}

Response_payload_Validation
    [Arguments]      ${payload}
    log    ${payload}
    #${json_out}=    Evaluate    json.loads('''${payload}''',strict=False)    json
    ${json_out}=    Evaluate    json.loads('''${payload}''')
    log    ${json_out}
    run keyword and continue on failure    should be equal    ${json_out['name']}     ${NAME}
    run keyword and continue on failure    should be equal    ${json_out['job']}     leader
    run keyword and continue on failure    should match regexp    ${json_out['id']}     [0-9]{3}
    run keyword and continue on failure    should match regexp    ${json_out['createdAt']}     [0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}:[0-9]{2}.[0-9]{3}Z


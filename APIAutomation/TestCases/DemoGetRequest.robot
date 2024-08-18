*** Settings ***
Library    RequestsLibrary
Library    OperatingSystem
Library    pyDiameter

*** Variables ***
${nrf_ip}=    10.10.34.56
${nrf_port}=    8080
${get_url}=     https://reqres.in/api/
${req_uri}=     unknown/2
${req_uri_1}=     unknown/3
${req_uri_2}=     unknown/4
${code}     200

*** Test Cases ***
Get_On_Single_Resource
    create session    demoSession    ${get_url}
    ${response}=    get request    demoSession      ${req_uri}
    log     ${response.status_code}
    #${response_code}=    convert to string    ${response.status_code}
    #run keyword and continue on failure    should be equal    ${response_code}     200
    log     ${response.content}
    log     ${response.headers}

Get_On_Single_Resource_1
    create session    demoSession    ${get_url}
    ${response}=    get request    demoSession      ${req_uri_1}
    log     ${response.status_code}
    #${response_code}=    convert to string    ${response.status_code}
    #run keyword and continue on failure    should be equal    ${response_code}     200
    log     ${response.content}
    log     ${response.headers}

Get_On_Single_Resource_2
    create session    demoSession    ${get_url}
    ${response}=    get request    demoSession      ${req_uri_2}
    log     ${response.status_code}
    #${response_code}=    convert to string    ${response.status_code}
    #run keyword and continue on failure    should be equal    ${response_code}     200
    run keyword and continue on failure    Status_code_validation     ${response.status_code}
    log     ${response.content}
    run keyword and continue on failure    Response_Body_validation     ${response.content}
    log     ${response.headers}

*** Keywords ***
Status_code_validation
    [Arguments]      ${status_code}
    #${response_code}=    convert to string    ${status_code}
    run keyword and continue on failure    should be equal as integers    ${status_code}     ${code}

Response_Body_validation
    [Arguments]      ${response_body}
    log     ${response_body}
    ${body}=    Evaluate    json.loads('''${response_body}''',strict=False)    json
    log     ${body}
    run keyword and continue on failure    should be equal as strings    ${body['data']['id']}    4
    run keyword and continue on failure    should be equal as strings    ${body['data']['name']}    aqua sky
    log    ${body['support']['url']}
    run keyword and continue on failure    should be equal as strings    ${body['support']['url']}    https://reqres.in/#support-heading



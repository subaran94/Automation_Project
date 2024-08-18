*** Settings ***
Library    RequestsLibrary

*** Variables ***
${url}=     https://reqres.in
${uri}=     /api/users/2
${uri_1}=     /api/users/3
${uri_2}=     /api/users/4
${uri_3}=     /api/users/5
${code}=    200
${code1}=    204
${contentType}=    application/json; charset=utf-8

*** Test Cases ***
NF_Discovery_AUSF
    create session    mysession     ${url}
    ${response}=    get request    mysession    ${uri}
    log    ${response.status_code}
    run keyword and continue on failure    Validation_StatusCode    ${response.status_code}
    log    ${response.content}
    run keyword and continue on failure    Response_bodyValidation     ${response.content}
    log    ${response.headers}
    run keyword and continue on failure    Response_headerValidation     ${response.headers}

NF_Discovery_UDM
    create session    mysession     ${url}
    ${response}=    get request    mysession    ${uri_1}
    log    ${response.status_code}
    run keyword and continue on failure    Validation_StatusCode    ${response.status_code}
    log    ${response.content}
    run keyword and continue on failure    Response_bodyValidation     ${response.content}
    log    ${response.headers}
    run keyword and continue on failure    Response_headerValidation     ${response.headers}

NF_Discovery_SMF
    create session    mysession     ${url}
    ${response}=    get request    mysession    ${uri_2}
    log    ${response.status_code}
    run keyword and continue on failure    Validation_StatusCode    ${response.status_code}
    log    ${response.content}
    run keyword and continue on failure    Response_bodyValidation     ${response.content}
    log    ${response.headers}
    run keyword and continue on failure    Response_headerValidation     ${response.headers}

NF_Discovery_AMF
    create session    mysession     ${url}
    ${response}=    get request    mysession    ${uri_3}
    log    ${response.status_code}
    run keyword and continue on failure    Validation_StatusCode    ${response.status_code}
    log    ${response.content}
    run keyword and continue on failure    Response_bodyValidation     ${response.content}
    log    ${response.headers}
    run keyword and continue on failure    Response_headerValidation     ${response.headers}

NF_Deregistration_AUSF
    create session    mysession     ${url}
    ${response}=    delete request    mysession    ${uri_3}
    log    ${response.status_code}
    run keyword and continue on failure    Validation_StatusCode1    ${response.status_code}

*** Keywords ***
Validation_StatusCode
    [Arguments]     ${Status}
    run keyword and continue on failure    should be equal as strings    ${Status}    ${code}

Validation_StatusCode1
    [Arguments]     ${Status}
    run keyword and continue on failure    should be equal as strings    ${Status}    ${code1}

Response_bodyValidation
    [Arguments]     ${response_body}
    log     ${response_body}
    ${body}=    Evaluate    json.loads('''${response_body}''',strict=False)    json
    log    ${body}
    ${ID}=      convert to string    ${body['data']['id']}
    log    ${ID}
    #run keyword and continue on failure    should be equal as strings    ${body['data']['id']}    2
    #run keyword and continue on failure    should be equal as strings    ${body['data']['first_name']}    Janet
    #run keyword and continue on failure    should be equal as strings    ${body['data']['last_name']}   Weaver
    run keyword and continue on failure    should match regexp    ${ID}    [0-9]
    #run keyword and continue on failure    should be equal as strings    ${ID}    ${object_id}
    run keyword and continue on failure    should match regexp    ${body['data']['first_name']}    [a-zA-Z]
    #run keyword and continue on failure    should be equal as strings    ${body['data']['first_name']}    ${name}

Response_headerValidation
    [Arguments]     ${Res_Headers}
    log     ${Res_Headers}
    run keyword and continue on failure    should be equal as strings    ${Res_Headers['Content-Type']}    ${contentType}
    log    ${Res_Headers['Date']}
    run keyword and continue on failure    should match regexp     ${Res_Headers['Date']}    [a-zA-Z0-9,: ]
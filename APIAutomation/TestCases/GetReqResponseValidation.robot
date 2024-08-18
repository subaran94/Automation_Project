*** Settings ***
Library    RequestsLibrary
Library    Collections


*** Variables ***
${get_url}    https://reqres.in/api/users
${data_id}    4
${content_type}     application/json; charset=utf-8

*** Test Cases ***
Get_UserInfo
    create session    mysession    ${get_url}
    ${response}=    GET On Session    mysession     /${data_id}
    log     ${response.status_code}
    log     ${response.content}
    log     ${response.headers}
    #${status_code}=     convert to string    ${response.status_code}
    #run keyword and continue on failure    should be equal    ${status_code}    200
    run keyword and continue on failure    Status_Code_Validation    ${response.status_code}
    ${Content_Value}=   get from dictionary    ${response.headers}    Content-Type
    run keyword and continue on failure    HTTP_Headers_Validation    ${Content_Value}
    run keyword and continue on failure    HTTP_Response_Body    ${response.content}


*** Keywords ***
Status_Code_Validation
    [Arguments]     ${response_code}
    log     ${response_code}
    #${status_code}=     convert to string    ${response_code}
    #log    ${status_code}
    run keyword and continue on failure    should be equal as integers     ${response_code}    200

HTTP_Headers_Validation
    [Arguments]     ${response_headers}
    run keyword and continue on failure    should be equal as strings     ${response_headers}    ${content_type}

HTTP_Response_Body
    [Arguments]    ${response_body}
    ${body}=    convert to string    ${response_body}
    run keyword and continue on failure    should contain      ${body}    ${data_id}
    ${id}=      get from dictionary    ${body}     id
    log    ${id}


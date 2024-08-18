*** Settings ***
Library    RequestsLibrary

*** Variables ***
${get_url}    https://reqres.in/api/users
${data_id_1}    2
${data_id_2}    3
${data_id_3}    4

*** Test Cases ***
Get_UserInfo
    create session    mysession    ${get_url}
    ${response}=    get request    mysession     /${data_id_1}

    log     ${response.status_code}
    log     ${response.content}
    log     ${response.headers}
    #${status_code}=     convert to string    ${response.status_code}
    #run keyword and continue on failure    should be equal    ${status_code}    200
    run keyword and continue on failure    Status_Code_Validation    ${response.status_code}

Get_UserInfo_1
    create session    mysession    ${get_url}
    ${response}=    get request    mysession     /${data_id_2}

    log     ${response.status_code}
    log     ${response.content}
    log     ${response.headers}
    #${status_code}=     convert to string    ${response.status_code}
    #run keyword and continue on failure    should be equal    ${status_code}    200
    run keyword and continue on failure    Status_Code_Validation    ${response.status_code}

Get_UserInfo_2
    create session    mysession    ${get_url}
    ${response}=    get request    mysession     /${data_id_3}

    log     ${response.status_code}
    log     ${response.content}
    log     ${response.headers}
    #${status_code}=     convert to string    ${response.status_code}
    #run keyword and continue on failure    should be equal    ${status_code}    200
    run keyword and continue on failure    Status_Code_Validation    ${response.status_code}
*** Keywords ***
Status_Code_Validation
    [Arguments]     ${response_code}
    ${status_code}=     convert to string    ${response_code}
    run keyword and continue on failure    should be equal     ${status_code}    200
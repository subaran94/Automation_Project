*** Settings ***
Library    RequestsLibrary
Library    Process

Suite Setup    HostSession
Suite Teardown    Custom_Teardown

*** Variables ***
${Host}     https://reqres.in
${path}     /api/users?page=2
${d_path}   /api/users/2
${store_path}   /api/users

*** Test Cases ***
UserProfileRetrive
    [Tags]    regression    sanity
    ${response}=   GET On Session    mysession    ${path}
    log     ${response.status_code}
    log     ${response.content}
    StatusCode_Validation    ${response.status_code}
    ResponseContent_Validation    ${response.content}

DeleteUserProfile
    [Tags]    regression    sanity    del
    ${response}=    DELETE On Session    mysession      ${d_path}
    log     ${response.status_code}
    StatusCode_Validation    ${response.status_code}

StoreUserProfile
    [Tags]    regression    sanity
    ${body}     create dictionary    name=morpheus      job=leader
    ${header}    create dictionary    Content-Type=application/json
    ${response}=    post request    mysession      ${store_path}     data=${body}    headers=${header}
    log    ${response.status_code}
    log    ${response.content}
    StatusCode_Validation    ${response.status_code}
    ResponseContent_Validation_1    ${response.content}

StoreUserProfile_1
    [Tags]    regression
    ${body}     create dictionary    name=shakti      job=engineer
    ${header}    create dictionary    Content-Type=application/json
    ${response}=    post request    mysession      ${store_path}     data=${body}    headers=${header}
    log    ${response.status_code}
    log    ${response.content}
    StatusCode_Validation    ${response.status_code}
    ResponseContent_Validation_2    ${response.content}

*** Keywords ***
StatusCode_Validation
    [Arguments]    ${statuscode}
    log    ${statuscode}
    ${code}=    convert to string    ${statuscode}
    run keyword and continue on failure    should match regexp    ${code}    [0-9]

ResponseContent_Validation
    [Arguments]    ${payload}
    log    ${payload}
    ${json}=    evaluate    json.loads('''${payload}''')
    log     ${json}
    run keyword and continue on failure    should be equal as integers    ${json['data'][0]['id']}     7

ResponseContent_Validation_1
    [Arguments]    ${payload}
    log    ${payload}
    ${json}=    evaluate    json.loads('''${payload}''')
    log     ${json}
    run keyword and continue on failure    should be equal as strings      ${json['name']}     morpheus
    run keyword and continue on failure    should be equal as strings      ${json['job']}     leader
    run keyword and continue on failure    should match regexp      ${json['id']}     [0-9]
    run keyword and continue on failure    should match regexp      ${json['createdAt']}     [a-zA-Z0-9:.]

ResponseContent_Validation_2
    [Arguments]    ${payload}
    log    ${payload}
    ${json}=    evaluate    json.loads('''${payload}''')
    log     ${json}
    run keyword and continue on failure    should be equal as strings      ${json['name']}     shakti
    run keyword and continue on failure    should be equal as strings      ${json['job']}     engineer
    run keyword and continue on failure    should match regexp      ${json['id']}     [0-9]
    run keyword and continue on failure    should match regexp      ${json['createdAt']}     [a-zA-Z0-9:.]

HostSession
    create session    mysession   ${Host}

Custom_Teardown
    Delete All Sessions

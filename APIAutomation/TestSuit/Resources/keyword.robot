*** Settings ***
Library    RequestsLibrary
Variables     ../Variables/variable.py

*** Keywords ***

StatusCode_Validation
    [Arguments]    ${statuscode}    ${code}
    log    ${statuscode}
    log     ${code}
    run keyword and continue on failure    should be equal as integers    ${statuscode}    ${code}

ResponseContent_Validation
    [Arguments]    ${payload}
    log    ${payload}
    ${json}=    evaluate    json.loads('''${payload}''')
    log     ${json}
    run keyword and continue on failure    should be equal as integers    ${json['data'][0]['id']}     7
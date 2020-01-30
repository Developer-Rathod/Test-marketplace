*** Settings ***
Library     SeleniumLibrary
Resource    ..${/}Resources${/}Variables${/}variables.robot
Resource    ..${/}Resources${/}Locators${/}locators.robot

*** Keywords ***

#####  Keword defination start ######

Generate Auto Email
    [Arguments]     ${emailid}   ${email provider}  ${Auto ID}
    ${Auto ID}=  Generate Auto ID
    Log To Console    ${Auto ID}
    ${Auto Email ID}=    Catenate    SEPARATOR=      ${emailid}  ${Auto ID}   ${email provider}
    Log To Console    ${Auto Email ID}
    [Return]    ${Auto Email ID}
Generate Auto ID
    # Here Evalute keyword is builin and impoting Python modules random and string
    ${temp ID}=    Evaluate    "".join(random.choice(string.ascii_uppercase+string.digits) for i in range(8))    random, string
    [Return]    ${temp ID}

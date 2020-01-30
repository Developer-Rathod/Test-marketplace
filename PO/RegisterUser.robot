*** Settings ***
Library     SeleniumLibrary
Resource    ..${/}Resources${/}Variables${/}variables.robot
Resource    ..${/}Resources${/}Locators${/}locators.robot

*** Keywords ***

Register User With Credential
    [Documentation]     "Regiser User With Valid Email And Password"
    #[Arguments]     ${VALID USER}   ${VALID PASSWD}
    Go To The Register Page
    Fill In FirstName
    Fill In LastName
    Fill In Email
    Fill In Password Field
    Fill In ConfirmPassword
    Click Signup Button
    Sleep    ${DELAY}
    

Register User With Auto Generated Credential
    [Documentation]     "Regiser User With Auto Generated Email"
    #[Arguments]     ${VALID USER}   ${VALID PASSWD}
    Go To The Register Page
    Fill In FirstName
    Fill In LastName
    Generate User Email    register     @mailinator.com
    Fill In Password Field
    Fill In ConfirmPassword
    Click Signup Button
    Sleep    ${DELAY}
    #Verify User Register

#####  Keword defination start ######

Go To The Register Page
    Go To    ${REGISTER URL}
    Wait Until Page Contains    ${REGISTER USER PAGE SHOULD CONTAIN}

Fill In FirstName
    Wait Until Element Is Visible   ${Register First}
    Input Password    ${Register First}    ${REGISTER FIRST NAME}

Fill In LastName
    Wait Until Element Is Visible   ${Register Last}
    Input Password    ${Register Last}      ${REGISTER LAST NAME}

Generate User Email
    [Arguments]     ${emailid}   ${email provider}
    # Here evalute keyword is builin and impoting Python modules random and string
    ${temp}=    Evaluate    "".join(random.choice(string.ascii_uppercase+string.digits) for i in range(8))    random, string
    ${UniqueID}=    Catenate    SEPARATOR=      ${emailid}  ${temp}   ${email provider}
    Wait Until Element Is Visible   ${Register Email}
    Input Text    ${Register Email}     ${UniqueID}
    Sleep    2s
    #[Return]    ${UniqueID}


Fill In Email
    Wait Until Element Is Visible   ${Register Email}
    Input Password    ${Register Email}      ${REGISTER EMAIL ADRESS}

Fill In Password Field
    Wait Until Element Is Visible   ${Register Password}
    Input Password    ${Register Password}    ${REGISTER PASSWD}

Fill In ConfirmPassword
    Wait Until Element Is Visible   ${Register ConfirmPwd}
    Input Password    ${Register ConfirmPwd}    ${REGISTER PASSWD}

Click Signup Button
    Click Element    ${Register Signup}

Verify User Register
    Wait Until Location Is      ${LOGIN URL}

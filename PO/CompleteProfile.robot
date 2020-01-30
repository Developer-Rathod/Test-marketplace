*** Settings ***
[Documentation]     "To verify registration flow for User and Merchant"
Library     SeleniumLibrary
Resource    ..${/}Resources${/}Variables${/}variables.robot
Resource    ..${/}Resources${/}Locators${/}locators.robot

*** Keywords ***
Complete Profile For Registered Merchant
    [Documentation]     "Regiser Merchant With Valid Email And Password"
    # Go To The Home Page Without login User
    Open Complete Profile Link From Email
    Fill In Passwords
    Fill In Store Name
    Fill In About Info
    Sleep    2s
    Fill In FirstName For Merchant
    Fill In LastName For Merchant
    Fill In Email For Merchant
    Fill In PhoneNumber
    Fill In Proposal
    Click Register Button
    Sleep    ${DELAY}
    #Verify Merchant Has Apply

Register Merchant With Auto Generated Credential
    [Documentation]     "Regiser User With Auto Generated Email"
    #[Arguments]     ${VALID USER}   ${VALID PASSWD}
    Go To The Register Merchant Page
    Fill In Company Name
    Fill In Description
    Sleep    2s
    Fill In FirstName For Merchant
    Fill In LastName For Merchant
    Generate Merchant Email    xyz    @xyz.com


#####  Keywords defination start ######

Go To The Register Merchant Page
    Go To    ${MERCHANT REGISTER URL}
    Sleep   4s
    Wait Until Page Contains    ${MERCHANT REGISTER PAGE SHOULD CONTAIN}

Fill In Company Name
    Wait Until Element Is Visible   ${Merchant CompanyName}
    Input Text    ${Merchant CompanyName}    ${REGISTER MERCHANT COMPANY NAME}

Fill In Description
    Wait Until Element Is Visible   ${Merchant Description}
    Input Text      ${Merchant Description}    ${REGISTER MERCHANT DESCRIPTION}

Fill In FirstName For Merchant
    Wait Until Element Is Visible   ${Merchant FirstName}
    Input Text    ${Merchant FirstName}    ${REGISTER MERCHANT FIRST NAME}

Fill In LastName For Merchant
    Wait Until Element Is Visible   ${Merchant LastName}
    Input Text    ${Merchant LastName}      ${REGISTER MERCHANT LAST NAME}

Fill In Email for Merchant
    Wait Until Element Is Visible   ${Merchant Email}
    Input Text    ${Merchant Email}      ${REGISTER MERCHANT EMAIL ADRESS}

Generate Merchant Email
    [Arguments]     ${emailid}   ${email provider}
    # Here evalute keyword is builin and impoting Python modules random and string
    ${temp}=    Evaluate    "".join(random.choice(string.ascii_uppercase+string.digits) for i in range(8))    random, string
    ${UniqueID}=    Catenate    SEPARATOR=      ${emailid}  ${temp}   ${email provider}
    Wait Until Element Is Visible   ${Register Email}
    Input Text    ${Register Email}     ${UniqueID}
    Sleep    2s
    #[Return]    ${UniqueID}

Fill In PhoneNumber
    Wait Until Element Is Visible   ${Merchant PhoneNumber}
    Input Text    ${Merchant PhoneNumber}    ${REGISTER MERCHANT PONENUMBER}

Fill In Proposal
    Wait Until Element Is Visible   ${Merchant Proposal}
    Input Text    ${Merchant Proposal}    ${REGISTER MERCHANT PROPOSAL}

Click Register Button
    Click Element    ${Merchant Register}

Verify Merchant Has Apply
    Wait Until Element Is Visible    ${Info Alert}
    Page Should Contain    ${Info Message}

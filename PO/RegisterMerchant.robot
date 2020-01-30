*** Settings ***
Documentation     To verify registration flow for User and Merchant
Library     SeleniumLibrary
Resource    ..${/}Resources${/}Variables${/}variables.robot
Resource    ..${/}Resources${/}Locators${/}locators.robot

# Resource    ..${/}Resources${/}Commons${/}commons.robot
# Resource    ..${/}PO${/}Login.robot
# Resource    ..${/}PO${/}AdminPage.robot
#
# Suite Setup  commons.Initiate Test
# Suite Teardown  commons.End The Test
#
# *** Variables ***
# #${Auto ID}

# *** Test Cases ***
# Register Merchant With AutoCredential
#     [Tags]      AutoRegisterMerchant
#     Register Merchant With Auto Generated Credential
#

*** Keywords ***

Register Merchant With Credential
    [Documentation]     "Regiser Merchant With Valid Email And Password"
    Go To The Register Merchant Page
    Fill In Company Name    ${REGISTER MERCHANT COMPANY NAME}
    Fill In Description    ${REGISTER MERCHANT DESCRIPTION}
    Sleep    2s
    Fill In FirstName For Merchant      ${REGISTER MERCHANT FIRST NAME}
    Fill In LastName For Merchant       ${REGISTER MERCHANT LAST NAME}
    Fill In Email For Merchant      ${REGISTER MERCHANT EMAIL ADRESS}
    Select Area Code    ${REGISTER MERCHANT AREACODE}
    Fill In PhoneNumber     ${REGISTER MERCHANT PONENUMBER}
    Fill In Proposal        ${REGISTER MERCHANT PROPOSAL}
    Click Register Button
    Sleep    ${DELAY}
    #Verify Merchant Has Apply

Register Merchant With Auto Generated Credential
    [Documentation]     "Regiser User With Auto Generated Credential"
    #[Arguments]     ${VALID USER}   ${VALID PASSWD}
    Go To The Register Merchant Page
    ${Auto ID} =    Generate Auto ID
    ${CName} =      Set Variable  ${Auto ID}-${REGISTER MERCHANT COMPANY NAME}
    ${Des} =        Set Variable  ${Auto ID}-${REGISTER MERCHANT DESCRIPTION}
    ${Fname}=       Set Variable  ${Auto ID}-${REGISTER MERCHANT FIRST NAME}
    ${Lname}=       Set Variable  ${Auto ID}-${REGISTER MERCHANT LAST NAME}
    Fill In Company Name    ${CName}
    Fill In Description    ${Des}
    Sleep    2s
    Fill In FirstName For Merchant      ${Fname}
    Fill In LastName For Merchant       ${Lname}
    ${UniqueEmailID}=    Generate Merchant Email    ${REGISTER MERCHANT EMAIL}   ${Auto ID}    ${REGISTER MERCHANT EMAIL PROVIDER}
    Select Area Code    ${REGISTER MERCHANT AREACODE}
    Fill In PhoneNumber For Merchant     ${REGISTER MERCHANT PONENUMBER}
    Fill In Proposal        ${REGISTER MERCHANT PROPOSAL}
    Sleep    5s
    Log To Console    ${UniqueEmailID}
    Click Register Button
    [Return]    ${UniqueEmailID}

#####  Keywords defination start ######

Go To The Register Merchant Page
    # Go To    ${MERCHANT REGISTER URL}
    # Sleep   4s
    Wait Until Element Is Visible    ${Home Apply Merchant Link}
    Click Element    ${Home Apply Merchant Link}
    Sleep    3s
    #Page Should Contain    ${MERCHANT REGISTER PAGE SHOULD CONTAIN}
    #Wait Until Page Contains    ${MERCHANT REGISTER PAGE SHOULD CONTAIN}

Generate Auto ID
    # Here Evalute keyword is builin and impoting Python modules random and string
    ${temp ID}=    Evaluate    "".join(random.choice(string.ascii_uppercase+string.digits) for i in range(8))    random, string
    [Return]    ${temp ID}

Fill In Company Name
    [Arguments]     ${Args Company}
    Wait Until Element Is Visible   ${Merchant CompanyName}
    Input Text    ${Merchant CompanyName}   ${Args Company}

Fill In Description
    [Arguments]     ${Args Description}
    Wait Until Element Is Visible   ${Merchant Description}
    Input Text      ${Merchant Description}     ${Args Description}

Fill In FirstName For Merchant
    [Arguments]     ${Args Fname}
    Wait Until Element Is Visible   ${Merchant FirstName}
    Input Text    ${Merchant FirstName}     ${Args Fname}

Fill In LastName For Merchant
    [Arguments]     ${Args Lname}
    Wait Until Element Is Visible   ${Merchant LastName}
    Input Text    ${Merchant LastName}      ${Args Lname}

Fill In Email for Merchant
    [Arguments]     ${Args Email}
    Wait Until Element Is Visible   ${Merchant Email}
    Input Text    ${Merchant Email}

Generate Merchant Email
    [Arguments]     ${emailid}  ${Auto ID}  ${email provider}
    ${UniqueEmailID}=    Catenate    SEPARATOR=      ${emailid}  ${Auto ID}   ${email provider}
    #Login To Email Provider    ${UniqueEmailID}
    Sleep    2s
    Wait Until Element Is Visible   ${Register Email}
    Input Text    ${Register Email}     ${UniqueEmailID}
    Sleep    2s
    [Return]    ${UniqueEmailID}

Select Area Code
    [Arguments]     ${Args AreaCode}
    Wait Until Element Is Visible   ${Merchant AreaCode}
    Select From List By Value    ${Merchant AreaCode}    ${Args AreaCode}

Fill In PhoneNumber For Merchant
    [Arguments]     ${Args Phone}
    Wait Until Element Is Visible   ${Merchant PhoneNumber}
    Input Text    ${Merchant PhoneNumber}   ${Args Phone}

Fill In Proposal
    [Arguments]     ${Args Proposal}
    Wait Until Element Is Visible   ${Merchant Proposal}
    Input Text    ${Merchant Proposal}      ${Args Proposal}

Click Register Button
    Click Element    ${Merchant Register}

Verify Merchant Has Apply
    Wait Until Element Is Visible    ${Info Alert}
    Page Should Contain    ${Info Message}

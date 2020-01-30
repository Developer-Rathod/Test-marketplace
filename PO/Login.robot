*** Settings ***
Library     SeleniumLibrary
Resource    ..${/}Resources${/}Variables${/}variables.robot
Resource    ..${/}Resources${/}Locators${/}locators.robot

#Variables         ..${/}Variables${/}TheLibVars.py

*** Keywords ***
Login As User
    [Documentation]   "To perform Login functionality as User"
    Login With Valid Credential    ${LOGIN USER}    ${LOGIN UPASSWD}

Login As Merchant
    [Documentation]   "To perform Login functionality as Merchant"
    Login With Valid Credential    ${LOGIN MERCHANT}    ${LOGIN MPASSWD}

Login As Admin
    [Documentation]   "To perform Login functionality as Admin"
    Login With Valid Credential    ${LOGIN ADMIN}    ${LOGIN APASSWD}

Login With Valid Credential
    [Documentation]     "Positive login test: login with valid credentials"
    [Arguments]     ${Args UserName}   ${Args Password}
    Go To The Login Page
    Fill In Username    ${Args UserName}
    Fill In Password    ${Args Password}
    Click Login Button
    Verify User Logged In   ${Args UserName}
    #Sleep    ${DELAY}

Login User With Google Authentication
    Go To The Login Page
    Click Google Button For Authentication

Login User With Facebook Authentication
    Go To The Login Page
    Click Facebook Button For Authentication

#####  Keword defination start ######

Go To The Login Page
    #Sleep   7s
    Wait Until Element Is Visible    ${Home LoginLink}
    Click Element    ${Home LoginLink}
    #Sleep   3s
    #Wait Until Page Contains    ${LOGIN PAGE SHOULD CONTAIN}

Fill In Username
    [Arguments]     ${Args UserName}
    Wait Until Element Is Visible    ${Login UserName}
    Input Text    ${Login UserName}    ${Args UserName}

Fill In Password
    [Arguments]     ${Args Password}
    Wait Until Element Is Visible    ${Login Password}
    Input Password    ${Login Password}    ${Args Password}

Click Login Button
    Click Element    ${Login LoginButton}

Verify User Logged In
    # #Wait Until Element Is Visible    ${Login LogoutLinkText}
    # #Page Should Contain Link    ${Logout Link}
    # Sleep   2s
    # Wait Until Element Is Visible   ${Header Profile}
    # Log  "User is logged in"

    [Arguments]     ${UniqueEmailID}
    Wait Until Element Is Visible   ${Header Profile}
    Mouse Over    ${Header Profile}
    Sleep    2s
    ${Expected Email}=      Get Text    ${Header Profile Email}
    Should Be Equal As Strings      ${Expected Email}   ${UniqueEmailID}
    #Mouse Over    ${Header Profile}
    Sleep   2s
    Log  "Verified logged in"
Logout
    Wait Until Element Is Visible   ${Header Profile}
    Mouse Over    ${Header Profile}
    Click Element    ${Logout Link}


#
# Click Google Button For Authentication
#     Wait Until Element Is Visible    ${Login Google}
#     Click Element    ${Login Google}
#
# Click Facebook Button For Authentication
#     Wait Until Element Is Visible   ${Login Facebook}
#     Click Element    ${Login Facebook}

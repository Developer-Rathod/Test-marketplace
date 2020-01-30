*** Settings ***
Library     SeleniumLibrary
Resource    ..${/}Resources${/}Variables${/}variables.robot
Resource    ..${/}Resources${/}Locators${/}locators.robot
Resource    ..${/}PO${/}Login.robot

*** Keywords ***
Verify Userpage All Elements
    Login As An User
    Verify Newsfeed Link
    Verify User Profile Nav Tabs

#####  Keword defination start ######
Login As User
    Login.Login With Valid Credential    ${LOGIN USER}    ${LOGIN UPASSWD}
Verify Newsfeed Link
    Wait Until Element Is Visible   ${User Newsfeed Link}
    Log    Newsfeed link is found

Verify User Profile Nav Tabs
    #[Arguments]    @{HOME LINK LIST}
    : FOR    ${i}    IN    @{USER NAVLTAB LIST}
    \   Wait Until Page Contains    ${i}
    Log    All profile tabs are found

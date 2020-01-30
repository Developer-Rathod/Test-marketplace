*** Settings ***
Library     SeleniumLibrary
Resource    ..${/}Resources${/}Variables${/}variables.robot
Resource    ..${/}Resources${/}Locators${/}locators.robot

*** Keywords ***
Approve Registered MerchantLogin As Admin
    [Arguments]     ${UniqueEmailID}
    Login As Admin To Approve Merchant Registration
    Go To The Merchant Requests Page
    Search For Merchant By His Email ID     ${UniqueEmailID}
    Sleep    3s
    Click The Approve Button


#####  Keword defination start ######
# Approve Register MerchantLogin
#     Login As Admin
#     Search for Merchant by his Email id
#     Click The Approve Button
#     log out as admin

Login As Admin To Approve Merchant Registration
    Login.Login As Admin

Go To The Merchant Requests Page
    Wait Until Element Is Visible   ${Header Profile}
    Mouse Over    ${Header Profile}
    Sleep   2s
    Wait Until Element Is Visible    ${Admin Merchant Requests Link}
    #Element Should Be Visible       ${AddPro Link}
    Click Link      ${Admin Merchant Requests Link}
    Wait Until Page Contains    Accepted/Rejected Requests
    Mouse Out   ${Header Profile}
    Click Element    ${Admin Merchant PendingH4}
    Sleep    2s

Search For Merchant By His Email ID
    [Arguments]     ${Args EmailID}
    Wait Until Element Is Visible       ${Admin Merchant Search}
    Input Text    ${Admin Merchant Search}    ${Args EmailID}
    Sleep    2s

Click The Approve Button
    Wait Until Element Is Visible    ${Admin Merchant Approve}
    Click Element    ${Admin Merchant Approve}
    Sleep    5s

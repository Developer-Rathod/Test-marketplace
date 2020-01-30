*** Settings ***
Library     SeleniumLibrary
Resource    ..${/}Resources${/}Variables${/}variables.robot
Resource    ..${/}Resources${/}Locators${/}locators.robot

*** Keywords ***
Error Popup
    Wait Until Element Is Visible    ${Home LoginLink}
    Click Element    ${Home LoginLink}
    Sleep    2s
    Wait Until Element Is Visible    ${Error Alert}
    Page Should Contain    ${Error Message}
    #Alert Should Be Present  ${Error Message}
On Success Message Should Present
    Wait Until Element Is Visible    ${Info Alert}
    Page Should Contain    ${Info Message}

#####  Keword defination start ######
# Error Message handle
# 	[Tags]	error
# 	Popup.Error Popup

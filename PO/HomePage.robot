*** Settings ***
Library     SeleniumLibrary
Resource    ..${/}Resources${/}Variables${/}variables.robot
Resource    ..${/}Resources${/}Locators${/}locators.robot

*** Keywords ***
Verify Homepage All Elements
    Sleep    7s
    Verify Logo
    Verify Menu Links
    Verify Search Button
    Verify Footer

#####  Keword defination start ######

Verify Logo
    Wait Until Element Is Visible   ${Home Logo}
    Log    Logo found

Verify Newsletter Popup Form Load And Closed
    Sleep    10s
    Wait Until Element Is Visible    ${Home Open PopUp}
    Click Element    ${Home NoPopup CheckBox}
    Click Element    ${Home Close Popup}
    Log    Popup close

Verify Menu Links
    #[Arguments]    @{HOME LINK LIST}
    : FOR    ${i}    IN    @{HOME LINK LIST}
    \   Wait Until Page Contains    ${i}
    Log    All links are found

Verify Search Button
    Wait Until Element Is Visible   ${Home Search}
    Log    Search Button found

Verify Footer
    Wait Until Element Is Visible    ${Home FooterLogo}

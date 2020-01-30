*** Settings ***
Library     SeleniumLibrary
Resource    ..${/}Variables${/}variables.robot
Resource    ..${/}Locators${/}locators.robot

*** Keywords ***

Initiate Test
    #[Arguments]     ${SERVER}   ${BROWSER}
    Open Browser    ${SERVER}    ${BROWSER}
    Maximize Browser Window
    #Delete All Cookies
    #Sleep    ${DELAY}
    Wait Until Page Contains Element    ${Home LoginLink}
    #Log To Console    ${Home LoginLink}
End The Test
    Close All Browsers
    Log  Close All Browsers

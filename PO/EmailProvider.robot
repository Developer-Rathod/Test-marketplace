*** Settings ***
Library     SeleniumLibrary
Resource    ..${/}Resources${/}Variables${/}variables.robot
Resource    ..${/}Resources${/}Locators${/}locators.robot
Resource    ..${/}PO${/}MerchantPage.robot


*** Keywords ***
Login To Email Provider With Credential
    [Arguments]     ${Args Email ID}
    Open Browser    ${EMAIL PROVIDER URL}   ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    ${Email Provider Input}
    Input Text    ${Email Provider Input}    ${Args Email ID}
    Click Element    ${Email Provider Go}
    #Sleep    5s
    Page Should Contain    ${Email Provider Page Contains}
    Click Link    ${Email Provider VeriLink}
    Sleep   3s
    Select Frame    ${Email Provider Iframe}
    Click Link    ${Email Provider OpenLink}
    #Sleep   2s
    Select Window       SOMA
    MerchantPage.Merchant Complete Account      ${Args Email ID}

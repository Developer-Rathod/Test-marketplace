*** Settings ***
Library     SeleniumLibrary
Resource    ..${/}Resources${/}Variables${/}variables.robot
Resource    ..${/}Resources${/}Locators${/}locators.robot

*** Keywords ***

Fill In First Name
    [Arguments]   ${Fname Locator}     ${Fname}
    Wait Until Element Is Visible    ${Fname Locator}
    Input Text    ${Fname Locator}     ${Fname}
Fill In Last Name
    [Arguments]   ${Lname Locator}     ${Lname}
    Wait Until Element Is Visible    ${Lname Locator}
    Input Text    ${Lname Locator}     ${Lname}
Fill In Address Line One
    [Arguments]   ${AddressLine1 Locator}     ${AddressLine1}
    Wait Until Element Is Visible    ${AddressLine1 Locator}
    Input Text      ${AddressLine1 Locator}     ${AddressLine1}
Fill In Address Line Two
    [Arguments]   ${AddressLine2 Locator}     ${AddressLine2}
    Wait Until Element Is Visible    ${AddressLine2 Locator}
    Input Text      ${AddressLine2 Locator}     ${AddressLine2}
Fill In City Name
    [Arguments]     ${City Locator}      ${City}
    Wait Until Element Is Visible   ${City Locator}
    Input Text      ${City Locator}      ${City}
Fill In Zip Code
    [Arguments]     ${Zip Locator}       ${Zip}
    Wait Until Element Is Visible   ${Zip Locator}
    Input Text      ${Zip Locator}       ${Zip}
Fill In State Or Province
    [Arguments]     ${State Locator}         ${State}
    Wait Until Element Is Visible       ${State Locator}
    Input Text      ${State Locator}     ${State}
Fill In City
    [Arguments]     ${City Locator}      ${City}
    Wait Until Element Is Visible   ${City Locator}
    Input Text      ${City Locator}      ${City}
Fill In Phone Number
    [Arguments]     ${Phone Locator}     ${Phone}
    Wait Until Element Is Visible   ${Phone Locator}
    Input Text      ${Phone Locator}     ${Phone}
Select Area Code From List
    [Arguments]     ${AreaCode Locator}     ${AreaCode}
    Sleep    5s
    Wait Until Element Is Visible   ${AreaCode Locator}
    Select From List By Value    ${AreaCode Locator}    ${AreaCode}
Fill In Email
    [Arguments]     ${Email Locator}     ${Email}
    Wait Until Element Is Visible   ${Email Locator}
    Input Text      ${Email Locator}     ${Email}
Select Country From List
    [Arguments]     ${CountryList Locator}   ${CountryList}
    Sleep    5s
    Wait Until Element Is Visible   ${CountryList Locator}
    Select From List By Value     ${CountryList Locator}      ${CountryList}

Fill In Element Value
    [Arguments]   ${Element Locator}     ${Element Value}
    Wait Until Element Is Visible     ${Element Locator}
    Input Text    ${Element Locator}     ${Element Value}
    #Click Element     ${Element Locator}     ${Element Value}

Click Element When Visible
    [Arguments]   ${Element}
    Wait Until Element Is Visible    ${Element}
    Click Element     ${Element}
Get Element Text When Visible
    [Arguments]   ${Element}
    Wait Until Element Is Visible  ${Element}
    ${txt} =      Get Text  ${Element}
    [Return]      ${txt}

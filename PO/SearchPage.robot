*** Settings ***
Library     SeleniumLibrary
Resource    ..${/}Resources${/}Variables${/}variables.robot
Resource    ..${/}Resources${/}Locators${/}locators.robot

*** Keywords ***

Start Search For Selected Product Term
    [Documentation]   "To perform Search functionality for Product"
    [Arguments]     ${SEARCH FOR PRODUCT}
    Enter Search Text    ${SEARCH FOR PRODUCT}  ${SEARCH PRODUCT TYPE}
    Element Should Contain    ${Search ItemType Product}    ${SEARCH PRODUCT TYPE}
    #Run Keyword If    "${Search ItemType Product}" == "{SEARCH FOR PRODUCT}"    Click Element   ${Search ItemResult}
    Click Element   ${Search ItemType Product}
    Sleep    5s
    #Go To Home Page
Start Search For Selected User Term
    [Documentation]   "To perform Search functionality for User"
    [Arguments]     ${SEARCH FOR USER}
    Enter Search Text   ${SEARCH FOR USER}  ${SEARCH USER TYPE}
    Element Should Contain    ${Search ItemType User}    ${SEARCH USER TYPE}
    #Run Keyword If    "${Search ItemType User}" == "{SEARCH FOR USER}"    Click Element   ${Search ItemResult}
    Click Element   ${Search ItemType User}
    Sleep    5s
    #Go To Home Page
Start Search For Selected Brand Term
    [Documentation]   "To perform Search functionality for Brand"
    [Arguments]     ${SEARCH FOR BRAND}
    Enter Search Text    ${SEARCH FOR BRAND}  ${SEARCH BRAND TYPE}
    Element Should Contain    ${Search ItemType Brand}    ${SEARCH BRAND TYPE}
    #Run Keyword If    "${Search ItemResult}" == "{SEARCH FOR BRAND}"    Click Element   ${Search ItemResult}
    Click Element   ${Search ItemType Brand}
    Sleep    5s
    #Go To Home Page

#####  Keword defination start ######

Enter Search Text
    [Arguments]     ${Args SearchTerm}     ${Args SearchType}
    Wait Until Element Is Visible    ${Home Search}
    Input Text      ${Home Search}  ${Args SearchTerm}
    Sleep    2s
    Wait Until Element Is Visible    ${Search Term}
    Sleep    2s
    Element Should Contain    ${Search Term}    ${Args SearchTerm}
    #Element Should Contain    ${Search ItemType}    ${Args SearchType}
    #Run Keyword If    "${Args SearchTerm}" == "{SEARCH FOR PRODUCT}"
    #Click Element   ${Search ItemResult}
    #Sleep    5s
Go To Home Page
    Click Element    ${Home Logo}

Create Xpath Accordingly Search Type
    ${id} = Get Element Attribute    ${Search ItemResult}    text
#     Log    ${id}
#     Sleep    5s

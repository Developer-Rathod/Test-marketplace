*** Settings ***
Documentation   Test to verify Search functionality
Library     SeleniumLibrary
Resource    ..${/}Resources${/}Variables${/}variables.robot
Resource    ..${/}Resources${/}Locators${/}locators.robot
Resource    ..${/}Resources${/}Commons${/}commons.robot
Resource    ..${/}PO${/}SearchPage.robot

Suite Setup  commons.Initiate Test
Suite Teardown  commons.End The Test

*** Test Cases ***
Search For Product
    [Tags]      SearchProduct
    SearchPage.Start Search For Selected Product Term      ${SEARCH FOR PRODUCT}   
    Go To Home Page
Search For User
    [Tags]      SearchUser
    SearchPage.Start Search For Selected User Term      ${SEARCH FOR USER}
    Go To Home Page
Search For Brand
    [Tags]      SearchBrand
    SearchPage.Start Search For Selected Brand Term     ${SEARCH FOR BRAND}
    Go To Home Page

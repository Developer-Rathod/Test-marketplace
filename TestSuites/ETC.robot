*** Settings ***
Documentation   Test to verify Merchant can add items functionality.
Library     SeleniumLibrary
Resource    ..${/}Resources${/}Variables${/}variables.robot
Resource    ..${/}Resources${/}Locators${/}locators.robot
Resource    ..${/}Resources${/}Commons${/}commons.robot
Resource    ..${/}PO${/}FilterPage.robot

Suite Setup  commons.Initiate Test
Suite Teardown  commons.End The Test

*** Test Cases ***

Filter Product based on Price
    [Tags]	FilterPrice
Filter Product Based on Merchant
    [Tags]	FilterMerchant
Verify Chat functionality
Veryfy Newsfeed functionality
Negative login senario should produce correct error messages
should be able to register for new account

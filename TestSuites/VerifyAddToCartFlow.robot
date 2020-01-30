*** Settings ***
Documentation   Test to verify Merchant can add items functionality.
Library     SeleniumLibrary
Resource    ..${/}Resources${/}Variables${/}variables.robot
Resource    ..${/}Resources${/}Locators${/}locators.robot
Resource    ..${/}Resources${/}Commons${/}commons.robot
Resource    ..${/}PO${/}CartPage.robot

Suite Setup  commons.Initiate Test
Suite Teardown  commons.End The Test

*** Test Cases ***

Logged In User Add Product To Cart For Shopping
    [Tags]	Login
    CartPage.Add Product To Cart For Shopping   ${PRODUCT NAME}

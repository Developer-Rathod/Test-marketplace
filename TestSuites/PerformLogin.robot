*** Settings ***
Documentation   Test to verify Login functionality as diffrent user type
Library     SeleniumLibrary
Resource    ..${/}Resources${/}Variables${/}variables.robot
Resource    ..${/}Resources${/}Locators${/}locators.robot
Resource    ..${/}Resources${/}Commons${/}commons.robot
Resource    ..${/}PO${/}Login.robot

Suite Setup  commons.Initiate Test
Suite Teardown  commons.End The Test

*** Test Cases ***

Login As User
    [Tags]	LoginUser
    Login.Login As User
    Log     "Hello SOMA User"
    Login.Logout
Login As Merchant
    [Tags]	LoginMerchant
    Login.Login As Merchant
    Log  "Hello SOMA Merchant"
    Login.Logout
Login As Admin
    [Tags]	LoginAdmin
    Login.Login As Admin
    Log  "Hello SOMA Admin"
    Login.Logout
#Login With Invalid Credentials
    #[Tags]  LoginInvalid

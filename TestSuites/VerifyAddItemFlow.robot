*** Settings ***
Documentation   Test to verify Merchant can add items functionality.
Library     SeleniumLibrary
Resource    ..${/}Resources${/}Variables${/}variables.robot
Resource    ..${/}Resources${/}Locators${/}locators.robot
Resource    ..${/}Resources${/}Commons${/}commons.robot
Resource    ..${/}PO${/}Login.robot
Resource    ..${/}PO${/}AddProduct.robot

Suite Setup  commons.Initiate Test
Suite Teardown  commons.End The Test

*** Test Cases ***

Login As Merchant
 	[Tags]	Login
 	Login.Login With Valid Credential    ${LOGIN MERCHANT}    ${LOGIN MPASSWD}
Add Product For Sale
	[Tags]	AddItem
	AddProduct.Add Product For Sale
#Check Product Display Successfully

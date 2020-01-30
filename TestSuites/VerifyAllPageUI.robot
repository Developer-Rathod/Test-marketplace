*** Settings ***
Documentation   Test to verify all (Homepage, Userpage) pages UI elements
Library		SeleniumLibrary
Resource    ..${/}Resources${/}Variables${/}variables.robot
Resource    ..${/}Resources${/}Locators${/}locators.robot
Resource    ..${/}Resources${/}Commons${/}commons.robot
Resource	..${/}PO${/}Login.robot
Resource	..${/}PO${/}HomePage.robot
Resource	..${/}PO${/}UserPage.robot
#Resource	..${/}PO${/}RegisterMerchant.robot
#Resource	..${/}PO${/}Popup.robot

Suite Setup  commons.Initiate Test
Suite Teardown  commons.End The Test

*** Test Cases ***

Verify Homepage Elements
	[Tags]	VerifyHomePage
	HomePage.Verify Homepage All Elements

Verify Userpage Elements
	[Tags]	VerifyUserPage
	UserPage.Verify Userpage All Elements

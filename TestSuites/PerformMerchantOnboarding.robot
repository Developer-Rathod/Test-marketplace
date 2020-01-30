*** Settings ***
Documentation   Test to verify Registration functionality for User and Merchant.
Library     SeleniumLibrary
Resource    ..${/}Resources${/}Variables${/}variables.robot
Resource    ..${/}Resources${/}Locators${/}locators.robot
Resource    ..${/}Resources${/}Commons${/}commons.robot
Resource    ..${/}PO${/}Login.robot
Resource    ..${/}PO${/}RegisterMerchant.robot
Resource    ..${/}PO${/}AdminPage.robot
Resource    ..${/}PO${/}MerchantPage.robot
Resource    ..${/}PO${/}EmailProvider.robot

Suite Setup  commons.Initiate Test
Suite Teardown  commons.End The Test

*** Test Cases ***

# Register User
# 	[Tags]	RegisterUser
# 	RegisterUser.Register User With Credential
#
# Register User With Auto Generated Credentials
# 	[Tags]	AutoUser
# 	RegisterUser.Register User With Auto Generated Credential

# Register Merchant
# 	[Tags]	RegisterMerchant
# 	RegisterMerchant.Register Merchant With Credential

Should Be Able To Register Merchant With Auto Credentials
	[Tags]	AutoMerchant
	${UniqueEmailID} =		Register Merchant With Auto Generated Credential
	Sleep	 10s
	AdminPage.Approve Registered MerchantLogin As Admin		${UniqueEmailID}
	Sleep	 5s
	Login.Logout
	EmailProvider.Login To Email Provider With Credential     ${UniqueEmailID}
	MerchantPage.Merchant Should Complete Account After Verification    ${UniqueEmailID}


# Login User
# 	[Tags]	Login
# 	Login.Login With Valid Credential

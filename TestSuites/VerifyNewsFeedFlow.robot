*** Settings ***
Documentation   Test to verify Merchant can add items functionality.
Library     SeleniumLibrary
Resource    ..${/}Resources${/}Variables${/}variables.robot
Resource    ..${/}Resources${/}Locators${/}locators.robot
Resource    ..${/}Resources${/}Commons${/}commons.robot
Resource    ..${/}PO${/}Login.robot
Resource    ..${/}PO${/}NewsFeedPage.robot

Suite Setup  commons.Initiate Test
Suite Teardown  commons.End The Test

*** Test Cases ***

Post On NewsFeed Page As A Merchant
 	[Tags]	Login
    Post On NewsFeed 	${NEWSFEED VIDEO POST OPTION}
    Logout
    Sleep    2s
    Post On NewsFeed 	${NEWSFEED IMAGE POST OPTION}
    
# Post On NewsFeed Page As A Merchant
#  	[Tags]	Login
#     [Template]      Post On NewsFeed
#  	${NEWSFEED VIDEO POST OPTION}
#     #${NEWSFEED IMAGE POST OPTION}

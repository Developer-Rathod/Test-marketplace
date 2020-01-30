*** Settings ***

Library     SeleniumLibrary
Resource    ..${/}Resources${/}Variables${/}variables.robot
Resource    ..${/}Resources${/}Locators${/}locators.robot
Resource    ..${/}PO${/}Login.robot

*** Keywords ***

Post On NewsFeed
    [Arguments]     ${NewsFeed Post Option}
    Login As Merchant To Post
    Add Post On NewsFeed    ${NewsFeed Post Option}

Login As Merchant To Post
    Login.Login With Valid Credential    ${LOGIN MERCHANT}    ${LOGIN MPASSWD}

Add Post On NewsFeed
    [Arguments]     ${NewsFeed Post Option}
    Go To The NewsFeed Page
    Choose Feed Type Image Or Video    ${NewsFeed Post Option}

    # Upload Images   ${ADDPRO IMAGEPATH}
    # Add Product Details    ${ADDPRO WATCHNAME}    ${ADDPRO DISCOUNT}  ${ADDPRO PRICE}   ${ADDPRO IMAGEPATH}     ${ADDPRO DESCRIPTION}
    # Add Product Specifications    ${ADDPRO OPT MODEL}   ${ADDPRO MODEL VALUE}   ${ADDPRO OPT DIAL}  ${ADDPRO DIAL VALUE}

#####  Keywords defination start ######

Go To The NewsFeed Page
    Sleep   2s
    Wait Until Element Is Visible    ${NewsFeedL Link}
    Click Link      ${NewsFeedL Link}
    #Wait Until Page Contains    Share your thoughts with the community

Choose Feed Type Image Or Video
    [Arguments]     ${Args}
    Sleep   2s
    Run Keyword If    '${Args.Type}'== 'Video'    Video Post     ${Args.Locator}     ${Args.Value}
    Run Keyword If    '${Args.Type}'== 'Image'    Image Post     ${Args.Locator}     ${Args.Value}

Video Post
    [Arguments]    ${Args Locator}     ${Args Value}    ${placeholder}=${empty}
    Sleep    2s
    Wait Until Element Is Visible    ${Args Locator}
    Click Element    ${Args Locator}
    Wait Until Element Is Visible    ${NewsFeedL Video URL}
    #Check If All Character Entered      ${Args Locator}     ${Args Value}
    #${original} =     Set Selenium Timeout    10s
    ${original} =     Get Selenium Speed
    #Log Variables
    Set Selenium Speed    10s
    Input text          ${NewsFeedL Video URL}   ${Args Value}
    Set Selenium Speed    ${original}
    #Set Selenium Timeout    ${original}
    #Sleep    2s
    #Wait Until Element Is Visible    ${NewsFeedL Video OkBtn}
    Wait Until Element Is Enabled    ${NewsFeedL Video OkBtn}
    Click Element    ${NewsFeedL Video OkBtn}
    Sleep    2s
    Wait Until Element Is Visible    ${NewsFeedL Messagebox}
    Input Text      ${NewsFeedL Messagebox}     ${NEWSFEED POST MESSAGE}
    Set Browser Implicit Wait    10s
    Click Element    ${NewsFeedL PostBtn}
    Sleep    2s

# Check If All Character Entered
#     [Arguments]     ${NewsFeedL Video URL}      ${Args Value}
#     #${retry}=3
#     ${length} =     Get Length    ${NewsFeedL Video URL}
#     #:FOR  ${key}     IN     ${length}
#     :FOR  ${key}  IN RANGE   1           3
#     \     Input text          ${NewsFeedL Video URL}   ${Args Value}
#     \     ${inserted_text} =  Get text     ${NewsFeedL Video URL}
#     \     ${result} =         Evaluate     ${inserted_text} = ${Args Value}
#     \     Sleep    2s
#     \     Exit for loop if    ${result} = True


# The value of the input should be
#     [Arguments]    ${expected}
#     #${actual value}=    Get Element Attribute    ${NewsFeedL Video URL}     value
#     ${actual value}=    Get Value    ${NewsFeedL Video URL}
#     Should Be Equal As Strings    ${actual value}    ${expected}
#
# Verify Placeholder
#     [Arguments]    ${locator}    ${placeholder}
#     [Documentation]    Verifies that element identified by locator has placeholder attribute with value of placeholder.
#     ${attr}    Get Element Attribute    ${locator}@value
#     Should Be Equal    ${attr}    ${placeholder}

Image Post
    [Arguments]    ${Args Locator}     ${Args Value}
    Wait Until Element Is Visible    ${Args Locator}
    Click Element    ${Args Locator}
    Choose File    ${NewsFeedL ImageUpload}    ${Args Value}
    Sleep    2s
    Wait Until Element Is Visible    ${NewsFeedL Messagebox}
    Input Text      ${NewsFeedL Messagebox}     ${NEWSFEED POST MESSAGE}
    Click Element    ${NewsFeedL PostBtn}
    Sleep    2s


#Input Text    ${NewsFeedL Video URL}    ${Args Value}
#Press Key    ${NewsFeedL Video URL}     ${Args Value}
#
#Sleep    10s
#Press Key    locator    key

#${text_done}=    Run Keyword And Return Status    Input Text    ${NewsFeedL Video URL}    ${Args Value}
#Run Keyword If    '${text_done}' == 'True'      Click Element    ${NewsFeedL Video OkBtn}
#Input Text    ${NewsFeedL Video URL}    ${Args Value}
#Sleep    5s
#Run Keyword If    '${placeholder}'=='${empty}'    The value of the input should be

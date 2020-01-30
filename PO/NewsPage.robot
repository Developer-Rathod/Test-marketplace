*** Settings ***

Library     SeleniumLibrary
Resource    ..${/}Resources${/}Variables${/}variables.robot
Resource    ..${/}Resources${/}Locators${/}locators.robot
Resource    ..${/}PO${/}Login.robot

*** Keywords ***

Login As Merchant
    Login.Login With Valid Credential    ${LOGIN MERCHANT}    ${LOGIN MPASSWD}
Add Post On NewsFeed
    Go To The NewsFeed Page
    Choose Feed Type Image Or Video

    # Upload Images   ${ADDPRO IMAGEPATH}
    # Add Product Details    ${ADDPRO WATCHNAME}    ${ADDPRO DISCOUNT}  ${ADDPRO PRICE}   ${ADDPRO IMAGEPATH}     ${ADDPRO DESCRIPTION}
    # Add Product Specifications    ${ADDPRO OPT MODEL}   ${ADDPRO MODEL VALUE}   ${ADDPRO OPT DIAL}  ${ADDPRO DIAL VALUE}

#####  Keywords defination start ######

Go To The NewsFeed Page
    Click Element    ${Home Logo}
    Sleep   2s
    Wait Until Element Is Visible    ${NewsFeedL Link}
    Click Link      ${NewsFeedL Link}
    Wait Until Page Contains    Share your thoughts with the community

Choose Feed Type Image Or Video
    [Arguments]     ${Args}
    Sleep   2s
        Run Keyword If    ${Args.PostType}==Video    Video Post     ${Args.Locator}     ${Args.Value}
        Run Keyword If    ${Args.PostType}==Image    Image Post     ${Args.Locator}     ${Args.Value}

    #Wait Until Element Is Visible    ${AddPro ForSale}
    #Click Element       ${AddPro ForSale}


Video Post
    [Arguments]    ${Args Locator}     ${Args Value}

Upload Images
    [Arguments]     ${Args Imagepath}
    Choose File    ${AddPro Image}    ${Args Imagepath}
    Click Element   ${AddPro Next}
    Sleep    2s

Check if Input box is focus
    Set Browser Implicit Wait    10

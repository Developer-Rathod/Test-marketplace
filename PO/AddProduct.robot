*** Settings ***

Library     SeleniumLibrary
Resource    ..${/}Resources${/}Variables${/}variables.robot
Resource    ..${/}Resources${/}Locators${/}locators.robot
Resource    ..${/}PO${/}Login.robot

*** Keywords ***

Login As Merchant
    [Documentation]   "To perform Login functionality as Merchant in order to add Product."
    Login.Login With Valid Credential    ${LOGIN MERCHANT}    ${LOGIN MPASSWD}
Add Product For Sale
    [Documentation]     "To perform Merchant functionality to add Product for sale."
    Go To The Add Product Page
    Choose Product For Sale
    Upload Images   ${ADDPRO IMAGEPATH}
    Add Product Details    ${ADDPRO WATCHNAME}    ${ADDPRO DISCOUNT}  ${ADDPRO PRICE}   ${ADDPRO IMAGEPATH}     ${ADDPRO DESCRIPTION}
    Add Product Specifications    ${ADDPRO OPT MODEL}   ${ADDPRO MODEL VALUE}   ${ADDPRO OPT DIAL}  ${ADDPRO DIAL VALUE}

#####  Keywords defination start ######

Go To The Add Product Page
    Wait Until Element Is Visible   ${Header Profile}
    Mouse Over    ${Header Profile}
    Sleep   2s
    Wait Until Element Is Visible    ${AddPro Link}
    #Element Should Be Visible       ${AddPro Link}
    Click Link      ${AddPro Link}
    Wait Until Page Contains    Add product

Choose Product For Sale
    Sleep   2s
    Element Should Be Visible   ${AddPro ForSale}
    #Wait Until Element Is Visible    ${AddPro ForSale}
    Click Element       ${AddPro ForSale}

Upload Images
    [Arguments]     ${Args Imagepath}
    Choose File    ${AddPro Image}    ${Args Imagepath}
    Click Element   ${AddPro Next}
    Sleep    2s

Add Product Details
    [Arguments]     ${Args WatchName}    ${Args Discount}   ${Args Price}   ${Args Imagepath}   ${Args Description}
    Wait Until Element Is Visible    ${AddPro Name}
    Input Text    ${AddPro Name}    ${Args WatchName}
    Wait Until Element Is Visible    ${AddPro CBDiscount}
    Select Checkbox    ${AddPro CBDiscount}
    ${Is_Checkbox_Selected}=    Run Keyword And Return Status    Checkbox Should Be Selected    ${AddPro CBDiscount}
    Checkbox Should Be Selected    ${AddPro CBDiscount}
    Wait Until Element Is Visible    ${AddPro DiscountP}
    Run Keyword If    '${Is_Checkbox_Selected}'== 'True'    Input Text    ${AddPro DiscountP}    ${Args Discount}
    Input Text    ${AddPro Pricev}    ${Args Price}
    Choose File    ${AddPro Image}    ${Args Imagepath}
    Press Key    ${AddPro DescriptionL}     ${Args Description}
    Click Element   ${AddPro Next}
    Sleep    2s
Add Product Specifications
    [Arguments]     ${Args Model}   ${Args ModelValue}  ${Args Dial}    ${Args DialValue}
    Select From List By Value    ${AddPro SpecL}    ${Args Model}
    Input Text    id=${Args Model}    ${Args ModelValue}
    Select From List By Value    ${AddPro SpecL}    ${Args Dial}
    Input Text    id=${Args Dial}    ${Args DialValue}
    Sleep    2s
    Click Element   ${AddPro Spec Delete}
    Click Element   ${AddPro Next}
    Sleep    2s
    Click Element    ${AddPro CBTerms}
    #Select Checkbox    ${AddPro CBTerms}
    #Click Element    ${AddPro SaveAsDraft}
    #Click Element    ${AddPro Publish}

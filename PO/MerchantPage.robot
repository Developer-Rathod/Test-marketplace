*** Settings ***
Library     SeleniumLibrary
Library     String
Resource    ..${/}Resources${/}Variables${/}variables.robot
Resource    ..${/}Resources${/}Locators${/}locators.robot
Resource    ..${/}PO${/}AddressPage.robot

*** Keywords ***
Merchant Should Complete Account After Verification
    [Arguments]     ${UniqueEmailID}
    Merchant Complete Account    ${UniqueEmailID}

### Key word Defination start #####

Merchant Complete Account
    [Arguments]     ${UniqueEmailID}
    Sleep   5s
    Fill In Merchant Password    ${LOGIN MPASSWD}
    Confirm Password        ${LOGIN MPASSWD}
    Press Next Button
    Sleep   3s
    Fill In Brand Name      ${UniqueEmailID}
    Fill In Tag Line
    Fill In Brand URL    ${UniqueEmailID}
    Fill In Brand Email    ${UniqueEmailID}

    Select Area Code From List    ${BrandL Areacode}    ${BRAND AREA CODE}
    Fill In Phone Number    ${BrandL PhoneNumber}    ${BRAND PHONE NUMBER}
    Fill In Address Line One    ${BrandL Address}    ${BRAND ADDRESS}
    Fill In City    ${BrandL City}    ${BRAND CITY}
    Fill In State Or Province    ${BrandL State}    ${BRAND STATE}

    Select Country From List    ${BrandL CountryList}    ${BRAND COUNTRY NAME}
    Fill In Zip Code    ${BrandL Zip}    ${BRAND ZIP}
    Sleep    3s
    Press Key   ${BrandL AboutBrand}    ${BRAND ABOUT BRAND}
    Click Element   ${BrandL Submit}
    Sleep    6s
    #Verify Merchant Has Complete Account    ${UniqueEmailID}

Fill In Merchant Password
    [Arguments]     ${Args Password}
    Wait Until Element Is Visible    ${MerchantL Complete Pass}
    Input Password    ${MerchantL Complete Pass}    ${Args Password}

Confirm Password
    [Arguments]     ${Args ConPassword}
    Wait Until Element Is Visible    ${MerchantL Confirm Pass}
    Input Password    ${MerchantL Confirm Pass}    ${Args ConPassword}

Press Next Button
    Wait Until Element Is Visible   ${MerchantL Complete BtnNext}
    Click Element    ${MerchantL Complete BtnNext}

Fill In Brand Name
    [Arguments]     ${UniqueEmailID}
    ${AutoID} =     Get Substring    ${UniqueEmailID}    0      15
    #${BN} =     Set Variable    ${AutoID}-${BRAND BRAND NAME}
    Fill In Element Value    ${BrandL BrandName}    ${AutoID}

Fill In Tag Line
    Fill In Element Value    ${BrandL TagLine}    ${BRAND TAG LINE}

Fill In Brand URL
    [Arguments]     ${UniqueEmailID}
    ${AutoID} =     Get Substring    ${UniqueEmailID}    0      15
    #${BURL} =     Set Variable    ${BRAND STORE URL}${AutoID}
    Fill In Element Value    ${BrandL StoreURL}    ${AutoID}

Fill In Brand Email
    [Arguments]     ${UniqueEmailID}
    Fill In Element Value    ${BrandL Email}    ${UniqueEmailID}

Verify Merchant Has Complete Account
    [Arguments]     ${UniqueEmailID}
    Wait Until Element Is Visible   ${Header Profile}
    ${Expected Email}=      Get Text    ${Header Profile Email}
    Should Be Equal As Strings      ${Expected Email}   ${UniqueEmailID}
    #Mouse Over    ${Header Profile}
    Sleep   2s

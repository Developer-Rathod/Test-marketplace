*** Settings ***
Library     SeleniumLibrary
Resource    ..${/}Resources${/}Variables${/}variables.robot
Resource    ..${/}Resources${/}Locators${/}locators.robot
Resource    ..${/}PO${/}AddressPage.robot

*** Keywords ***

Fill Up New Address Details
    Choose Delivery Address Type
    AddressPage.Fill In First Name    ${Delivery Fname}    ${DELIVERY FIRST NAME}
    AddressPage.Fill In Last Name    ${Delivery Lname}    ${DELIVERY LAST NAME}
    Fill In Address Line One    ${Delivery AddLine1}    ${DELIVERY ADDRESS 1}
    Fill In Address Line Two    ${Delivery AddLine2}    ${DELIVERY ADDRESS 2}
    Fill In City Name    ${Delivery City}     ${DELIVERY CITY NAME}
    Fill In Zip Code    ${Delivery Zip}      ${DELIVERY ZIP CODE}
    Fill In State Or Province    ${Delivery State}   ${DELIVERY STATE/PROVINCE}
    Select Country From List    ${Delivery CountryList}     ${DELIVERY LCOUNTRY VALUE}
    Fill In Land Mark
    Select Area Code From List    ${Delivery AreaCode}    ${DELIVERY AREA CODE}
    Fill In Phone Number    ${Delivery Phone}    ${DELIVERY PHONE NUMBER}

Choose Delivery Address Type
    Wait Until Element Is Visible    ${Delivery SelectAdd Type}
    Select From List By Value    ${Delivery SelectAdd Type}    2
Fill In Land Mark
    Fill In Element Value    ${Delivery LLandMark}    ${DELIVERY LAND MARK}

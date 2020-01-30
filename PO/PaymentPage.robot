*** Settings ***
Library     SeleniumLibrary
Resource    ..${/}Resources${/}Variables${/}variables.robot
Resource    ..${/}Resources${/}Locators${/}locators.robot

*** Keywords ***

Fill In Card Number
    [Arguments]   ${PaymentL CardNumber}     ${PAYMENT CARD NUMBER}
    Wait Until Element Is Visible    ${PaymentL CardNumber}
    Input Text    ${PaymentL CardNumber}     ${PAYMENT CARD NUMBER}

Fill In Card Holder Name
    [Arguments]   ${PaymentL CardHolder}     ${PAYMENT CARD NAME}
    Wait Until Element Is Visible    ${PaymentL CardHolder}
    Input Text    ${PaymentL CardHolder}     ${PAYMENT CARD NAME}

Fill In Expiry Date
    [Arguments]   ${PaymentL CardDate}     ${PAYMENT CARD DATE}
    Wait Until Element Is Visible    ${PaymentL CardDate}
    Input Text      ${PaymentL CardDate}     ${PAYMENT CARD DATE}

Fill In CVC Number
    [Arguments]   ${PaymentL CardCVC}     ${PAYMENT CARD CVC}
    Wait Until Element Is Visible    ${PaymentL CardCVC}
    Input Text      ${PaymentL CardCVC}      ${PAYMENT CARD CVC}

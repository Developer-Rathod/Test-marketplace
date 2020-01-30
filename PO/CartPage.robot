*** Settings ***
Documentation    To verify functinality for cart
Library     SeleniumLibrary
Resource    ..${/}Resources${/}Variables${/}variables.robot
Resource    ..${/}Resources${/}Locators${/}locators.robot
Resource    ..${/}PO${/}Login.robot
Resource    ..${/}PO${/}SearchPage.robot
Resource    ..${/}PO${/}DeliveryAddPage.robot
Resource    ..${/}PO${/}PaymentPage.robot
*** Keywords ***

Add Product To Cart For Shopping
    [Arguments]     ${PRODUCT NAME}
    Login To Buy Product
    Check Shopping Cart Has Product
    #Search For Product    ${PRODUCT NAME}
    Add Product To Cart
    Verify Product Added
    Proceed to Checkout
    Choose delivery Address Or Add New Address
    Proceed To Payment
    Complete Order
    Check Order Page

####   Key word Defination  ####

Login To Buy Product
    Login.Login As User
Check Shopping Cart Has Product
    Sleep    3s
    ${Basket Value} =   Run Keyword And Return Status    Element Should Be Visible    ${Cart BasketValue1}
    Run Keyword If    ${Basket Value} == True   Clear shopping Cart And Search For Product
    Run Keyword If    ${Basket Value} == False  Search For Product      ${PRODUCT NAME}
Clear shopping Cart And Search For Product
    Sleep    2s
    Click Element    ${Cart BasketValue1}
    Wait Until Element Is Visible    ${Cart Clear Shopping Cart}
    Click Element    ${Cart Clear Shopping Cart}
    Sleep    7s
    Click Element    ${Home Logo}
    Search For Product    ${PRODUCT NAME}
Search For Product
    [Arguments]     ${PRODUCT NAME}
    SearchPage.Start Search For Selected Product Term    ${PRODUCT NAME}
#Select Product From Search Result
Add Product To Cart
    Sleep    2s
    Wait Until Element Is Visible    ${Cart AddToCart}
    Click Element    ${Cart AddToCart}
    Wait Until Page Contains Element    ${Cart BasketValue1}

Verify Product Added
    Click Element    ${Cart Basket}
    Wait Until Page Contains      ${CART PAGE SHOULD CONTAIN}

Proceed To Checkout
    Sleep    5s
    Wait Until Element Is Visible    ${Cart Proceed}
    Click Element    ${Cart Proceed}

Choose Delivery Address Or Add New Address
    Sleep    3s
    ${Address There}=   Run Keyword And Return Status    Element Should Be Visible    ${Cart RadioAddress}
    Run Keyword If    ${Address There} == False    Add New Address
    Run Keyword If    ${Address There} == True      Choose Delivery Address
Choose Delivery Address
    Click Element    ${Cart RadioAddress}
    Sleep    2s
Add New Address
    Wait Until Element Is Visible    ${Cart New Address}
    Click Element    ${Cart New Address}
    DeliveryAddPage.Fill Up New Address Details

Proceed To Payment
    Wait Until Element Is Visible    ${Cart ProceedPayment}
    Click Element    ${Cart ProceedPayment}
    Sleep    2S
    Add Card Details

Add Card Details
    Fill In Card Number    ${PaymentL CardNumber}    ${PAYMENT CARD NUMBER}
    Fill In Card Holder Name    ${PaymentL CardHolder}     ${PAYMENT CARD NAME}
    Fill In Expiry Date    ${PaymentL CardDate}     ${PAYMENT CARD DATE}
    Fill In CVC Number    ${PaymentL CardCVC}      ${PAYMENT CARD CVC}

Complete Order
    Wait Until Element Is Visible    ${PaymentL Proceed}
    Click Element    ${PaymentL Proceed}
    Sleep    5s
    Page Should Contain    Thank You!

Check Order Page
    Click Element       ${Order Check Link}
    Sleep    2s

#    Click Order Details
#    Verify Order Complete

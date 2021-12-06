*** Settings ***
Library              SeleniumLibrary
Suite Setup          Open Browser    ${WebURL}        ${BROWSERS}
Suite Teardown       Close Browser
Test Template        I want to login with valid credentials and do shopping
# Library              DataDriver        credentials.csv        sheet_name=Sheet1
Variables            login_locators.yaml
Library              DataDriver        valid_credentials.csv        sheet_name=Sheet1

*** Variables ***
${BROWSERS}          headlesschrome
${WebURL}            https://www.saucedemo.com/

*** Keywords ***
I want to login with valid credentials and do shopping
    [Arguments]            ${Vusername}           ${Vpassword}
    Input Text             ${txtUsername}         ${Vusername}
    Input Text             ${txtPassword          ${Vpassword}
    Click Element          ${btnLogin}
    Capture Page Screenshot
    Click Element          ${btnProduct1}
    Capture Page Screenshot
    Click Element          class=shopping_cart_link
    Capture Page Screenshot
    Click Element          ${btnCheckout}
    Capture Page Screenshot
Should successfully redirected to dashboard
    Page Should Contain    Sauce Labs Backpack

Should successfully checkout product
    Page Should Contain    CHECKOUT: YOUR INFORMATION
    
*** Test Cases ***
Login with valid credentials should success with CSV        ${Vusername}     ${Vpassword}
Click Add to cart                                           ${btnProduct1}
See cart                                                    btnCart
Continue to payment                                         ${btnCheckout}
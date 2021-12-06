*** Settings ***
Library              SeleniumLibrary
Suite Setup          Open Browser    ${WebURL}        ${BROWSERS}
Suite Teardown       Close Browser
Test Template        I want to login with valid credentials and do shopping
Library              DataDriver        valid_credentials.csv        sheet_name=Sheet1

*** Variables ***
${BROWSERS}          headlesschrome
${WebURL}            https://www.saucedemo.com/

*** Keywords ***
I want to login with valid credentials and do shopping
    [Arguments]            ${Vusername}           ${Vpassword}
    Input Text             id=user-name           ${Vusername}
    Input Text             id=password            ${Vpassword}
    Click Element          id=login-button
    Capture Page Screenshot
    Click Element          id=add-to-cart-sauce-labs-backpack
    Capture Page Screenshot
    Click Element          class=shopping_cart_link
    Capture Page Screenshot
    Click Element          id=checkout
    Input Text             id=first-name          first
    Input Text             id=last-name           last
    Input Text             id=postal-code         12345
    Capture Page Screenshot
    Click Element          id=continue
    Capture Page Screenshot
    Click Element          id=finish
    Capture Page Screenshot
Should successfully redirected to dashboard
    Page Should Contain    Sauce Labs Backpack

Should successfully redirected to detail information
    Page Should Contain    CHECKOUT: YOUR INFORMATION

Should successfully overview checkout
    Page Should Contain    CHECKOUT: OVERVIEW

Should successfully checkout product
    Page Should Contain    CHECKOUT: COMPLETE!

*** Test Cases ***
Login success and successfully checkout product
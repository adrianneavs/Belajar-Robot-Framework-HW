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
    Click Element          class=product_sort_container
    Select From List By Index       class=product_sort_container    3
    Capture Page Screenshot
    Select From List By Index       class=product_sort_container    2
    Capture Page Screenshot
    Select From List By Index       class=product_sort_container    1
    Capture Page Screenshot
    Select From List By Index       class=product_sort_container    0
    Capture Page Screenshot

*** Test Cases ***
Login success and successfully checkout product
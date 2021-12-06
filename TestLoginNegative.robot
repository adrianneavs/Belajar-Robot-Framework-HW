*** Settings ***
Library              SeleniumLibrary
Suite Setup          Open Browser    ${WebURL}        ${BROWSERS}
Suite Teardown       Close Browser
Test Template        Test Login with no creds
Library              DataDriver        valid_credentials.csv        sheet_name=Sheet1

*** Variables ***
${BROWSERS}          headlesschrome
${WebURL}            https://www.saucedemo.com/

*** Keywords ***
Test Login with no creds
    [Arguments]            ${Vusername}           ${Vpassword}
#No creds at all
    Click Element          id=login-button
    Page Should Contain    Epic sadface: Username is required
    Capture Page Screenshot
    Reload Page
#Not fill password
    Input Text             id=user-name           ${Vusername}
    Click Element          id=login-button
    Page Should Contain    Epic sadface: Password is required
    Capture Page Screenshot
    Reload Page
#Not fill username
    Input Text             id=password           ${Vpassword}
    Click Element          id=login-button
    Page Should Contain    Epic sadface: Username is required
    Capture Page Screenshot
*** Test Cases ***
Test login validations
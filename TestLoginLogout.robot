*** Settings ***
Library              SeleniumLibrary
Suite Setup          Open Browser    ${WebURL}        ${BROWSERS}
Suite Teardown       Close Browser
Test Template        I want to login with all valid credentials
Library              DataDriver        allvalid_credentials.csv        sheet_name=Sheet1

*** Variables ***
${BROWSERS}          headlesschrome
${WebURL}            https://www.saucedemo.com/

*** Keywords ***
I want to login with all valid credentials
    [Arguments]            ${Ausername}           ${Apassword}
    Input Text             id=user-name           ${Ausername}
    Input Text             id=password            ${Apassword}
    Capture Page Screenshot
    Click Element          id=login-button
    Capture Page Screenshot
    Click Element          class=bm-burger-button
    Capture Page Screenshot
    Click Element          id=logout_sidebar_link
    Page Should Contain    Accepted usernames are:
    Capture Page Screenshot

*** Test Cases ***
Login and logout to all credentials successfully
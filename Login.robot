*** Settings ***
Library     SeleniumLibrary
Library     totp.py
Library     addingText.py
Suite Setup     Open Browser        ${URL}      ${BROWSER}
Suite Teardown    Close Browser

*** Variables ***
${BROWSER}          chrome
${URL}              https://seleniumbase.io/realworld/login         #https://www.saucedemo.com/

*** Test Cases ***
Login tests
   #Login Saucedemo
    Login MFA

*** Keywords ***
Login Saucedemo
    Maximize Browser Window
    Wait Until Element Is Visible       id:user-name
    Input Text                          id:user-name                        standard_user
    Input Password                      id:password                         secret_sauce
    Click Element                       id:login-button
    Sleep                               3s
    Click Element                       id:add-to-cart-sauce-labs-bike-light
    Sleep                               3s
    Click Element    id:react-burger-menu-btn
    Sleep    3s
    Click Element    id:logout_sidebar_link
    Sleep    2s

Login MFA
    Maximize Browser Window
    Input Text    id:username    demo_user
    Input Text    id:password    secret_pass
    ${MFAcode}  Code Generator    GAXG2MTEOR3DMMDG
    Input Text    id:totpcode    ${MFAcode}
    Click Element    id:log-in
    ${text}         Get Text    css:html body h1
    #Log    ${text}
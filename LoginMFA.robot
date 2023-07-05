*** Settings ***
Library     SeleniumLibrary
Library     totp.py
Suite Setup     Open Browser        ${URL}      ${BROWSER}
Suite Teardown    Close Browser

*** Variables ***
${BROWSER}          chrome
${URL}              https://seleniumbase.io/realworld/login

*** Test Cases ***
Login MFA
    Maximize Browser Window
    Input Text    id:username    demo_user
    Input Text    id:password    secret_pass
    ${MFAcode}  Code Generator    GAXG2MTEOR3DMMDG
    Input Text    id:totpcode    ${MFAcode}
    Click Element    id:log-in
    ${text}         Get Text    css:html body h1
    Log    ${text}
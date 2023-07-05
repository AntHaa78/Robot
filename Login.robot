*** Settings ***
Documentation       First login test (saucedemo)
Library     SeleniumLibrary
Suite Setup     Open Browser        ${URL}      ${BROWSER}
Suite Teardown    Close Browser

*** Variables ***
${BROWSER}          chrome
${URL}              https://www.saucedemo.com/


*** Tasks ***
First login and select elements
    Login Saucedemo
    Add element to cart then logout

*** Keywords ***
Login Saucedemo
    Open Browser        https://www.saucedemo.com/      chrome
    Maximize Browser Window
    Wait Until Element Is Visible       user-name
    Input Text                          user-name                        standard_user
    Input Password                      id:password                         secret_sauce
    Click Element                       id:login-button
    Sleep                               1s

Add element to cart then logout
    Click Element                       id:add-to-cart-sauce-labs-bike-light
    Sleep                               1s
    Click Element    id:react-burger-menu-btn
    Sleep    1s
    Click Element    id:logout_sidebar_link
    Sleep    1s





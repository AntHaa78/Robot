*** Settings ***
Library     SeleniumLibrary

Suite Setup     Open Browser        https://robocorp.com/docs/      chrome
Suite Teardown      Close All Browsers


*** Test Cases ***
Screenshot Taker
    Open webpage
    Take screenshot

*** Keywords ***
Open webpage
    Maximize Browser Window
    Input Text    css:input    anything
    Sleep    2s

Take screenshot
    Capture Page Screenshot     ${OUTPUT_DIR}/selenium-screenshot-WebScraper.png



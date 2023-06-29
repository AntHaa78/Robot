*** Settings ***
Library     SeleniumLibrary
#Suite Setup     Open Browser    ${URL}  ${BROWSER}
Suite Teardown  Close Browser

*** Variables ***
${URL}      https://www.google.com
${BROWSER}  Chrome

*** Test Cases ***
Google search
    Open Browser    ${URL}  ${BROWSER}
    Wait Until Element Is Visible    id:W0wltc
    Click Element    id:W0wltc
    Input Text    name=q    Lambdatest
    Submit Form
    Sleep    3s
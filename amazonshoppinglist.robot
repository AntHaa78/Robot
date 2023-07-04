*** Settings ***
Library    Browser

*** Variables ***
${BROWSER}    firefox

*** Test Cases ***
Create Shopping list
    Open Amazon Website
    Select And Add First Item
    Select And Add Second Item
    Proceed To Checkout
    End Test

*** Keywords ***
Open Amazon Website
    New Browser     browser=${BROWSER}
    New Page        https://www.amazon.com/

Select And Add First Item
    Fill Text    id=twotabssearchtextbox    Logitech keyboard k400





*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Create Quote for Car
    Open Insurance Application
    Enter Vehicle Data for Automobile
    Enter Insurant Data
    #Enter Product Data
   # Select Price Option
   # Send Quote
   # End Test

*** Keywords ***
Open Insurance Application
    Open Browser    http://sampleapp.tricentis.com/     chrome
    Maximize Browser Window

Enter Vehicle Data for Automobile
    Click Element    id:nav_automobile
    Select From List By Label    id:make      Audi
    Input Text    id:engineperformance    110
    Input Text    id:dateofmanufacture    06/12/1980
    Select From List By Label    id:numberofseats       5
    Select From List By Label    id:fuel        Petrol
    Input Text    id:listprice    30000
    Input Text    id:licenseplatenumber    DMK1234
    Input Text    id:annualmileage   10000
    Click Button    xpath: //*[contains(text(), "Next »")]

Enter Insurant Data
    Input Text    id:firstname    Max
    Input Text    id:lastname    Mustermann
    Input Text    id:birthdate    01/31/1980
    Select Checkbox   xpath://*[@id="gendermale"]
    Sleep    2s
    Close Browser

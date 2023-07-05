*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Create Quote for Car
    Open Insurance Application
    Enter Vehicle Data for Automobile
    Enter Insurant Data
    Enter Product Data
    Select Price Option
    Send Quote
    End Test

*** Keywords ***
Open Insurance Application
    Open Browser    http://sampleapp.tricentis.com/     chrome
    Maximize Browser Window

Enter Vehicle Data for Automobile
    Click Element    id:nav_automobile
    Wait Until Element Is Visible    id:make
    Select From List By Label    id:make      Audi
    Input Text    id:engineperformance    110
    Input Text    id:dateofmanufacture    06/12/1980
    Select From List By Label    id:numberofseats       5
    Select From List By Label    id:fuel        Petrol
    Input Text    id:listprice    30000
    Input Text    id:licenseplatenumber    DMK1234
    Input Text    id:annualmileage   10000
    #Click Button    css:button[id^="next"]
    Click Element   css:section[style="display: block;"] button[id^="next"]

Enter Insurant Data
    Input Text    id:firstname    Max
    Input Text    id:lastname    Mustermann
    Input Text    id:birthdate    01/31/1980
    #Select Radio Button     Gender    Male
    Click Element    css:label[class="ideal-radiocheck-label"] > span
    Input Text    id:streetaddress    Test Street
    Select From List By Label    id:country    Germany
    Input Text    id:zipcode    40123
    Input Text    id:city    Essen
    Select From List By Label    id:occupation    Employee
    #Select Checkbox    css:input[id="speeding"] + span
    Click Element    css:input[id="speeding"] + span
    Scroll Element Into View    id:preventervehicledata
    Click Element   css:section[style="display: block;"] button[id^="next"]

    
Enter Product Data
    Input Text    id:startdate    09/01/2023
    Select From List By Label    id:insurancesum    7.000.000,00
    Select From List By Label    id:meritrating     Bonus 1
    Select From List By Label    id:damageinsurance     Partial Coverage
    Click Element    css:input[id="EuroProtection"] + span
    Select From List By Label    id:courtesycar     No
    Click Element   css:section[style="display: block;"] button[id^="next"]

Select Price Option
    #Select Radio Button    Select option    Gold
    Click Element    css:input[id="selectgold"] + span
    Click Element    css:#nextsendquote     #<- Element not interactable

Send Quote
    Input Text    id:email    max.mustermann@example.com
    Input Text    username    max.mustermann
    Input Text    password    SecretPassword123!
    Input Text    confirmpassword    SecretPassword123!
    Click Button    id:sendemail
    Wait Until Element Is Visible    id:Sending e-mail success!
    Click Button    class:confirm

End Test
    Sleep    2s
    Close Browser

*** Settings ***
Library     OperatingSystem
Library     String

*** Test Cases ***
Open Notepad and append the file
    Append To File    ${EXECDIR}/testing.txt     \nRFW Organisation\n***Settings***\n***Variables***\n***Test cases***
    Append To File    ${EXECDIR}/testing.txt     \n***Tasks***\n***Keywords***\n***Comments***

Open the file and modifiy it
    ${content}=     Get File    ${EXECDIR}/testing.txt
    ${content_modified}=     Replace String    ${content}    RFW    Robot Framework
    Should Contain    ${content_modified}    Robot Framework
    Create File    ${EXECDIR}/testing_modified.txt      ${content_modified}
    #${str}=     Replace String    Hello, world!    world    moon
    #Should Be Equal    ${str}    Hello, moon!
Open the file and adds definitions
    ${content}=     Get File    ${EXECDIR}/testing.txt

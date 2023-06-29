*** Settings ***
Library     OperatingSystem

*** Test Cases ***
Open Notepad
    Append To File    ${EXECDIR}/testing.txt     Hello world!
    Sleep    5s
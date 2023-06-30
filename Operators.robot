*** Settings ***
Documentation   Checking operators

*** Tasks ***
Use If contsruct
    IF    1==2 or 1==1
        Log    This line is executed
    END
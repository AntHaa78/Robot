*** Settings ***
Library     RequestsLibrary
Library     Collections
Suite Setup     Authentification

*** Test Cases ***
Get bookings from restful booker and one random booking among them
    ${body}     Create Dictionary       lastname=Smith
    ${response}     GET     https://restful-booker.herokuapp.com/booking    ${body}
    Status Should Be    200
    Log    ${response.json()}
    ${list}  Set Variable     ${response.json()}
    ${randombooking_dict}=  Evaluate  random.choice($list)  random
    ${randombooking_id}     Set Variable       ${randombooking_dict}[bookingid]
    log to console  \nThe random booking id is: ${randombooking_id}
    ${response}     GET     https://restful-booker.herokuapp.com/booking/${randombooking_id}
    Status Should Be    200
    Log    ${response.json()}
    Log    The booking dates of the random booking are: ${response.json()}[bookingdates]

Post a booking
    ${booking_dates}     Create Dictionary       checkin=2019-07-01      checkout=2019-07-06
    ${body}     Create Dictionary       firstname=Ant       lastname= Haa       totalprice=300      depositpaid=True        bookingdates=${booking_dates}       additionalneeds=Breakfast
    ${response}     POST        url=https://restful-booker.herokuapp.com/booking    json=${body}
    ${id}       Set Variable        ${response.json()}[bookingid]
    Set Suite Variable    ${id}
    ${response}     GET     https://restful-booker.herokuapp.com/booking/${id}
    Log    ${response.json}
    Should Be Equal    ${response.json()}[lastname]    Haap
    Should Be Equal    ${response.json()}[firstname]    Ant
    Should Be Equal As Numbers    ${response.json()}[totalprice]    300
    Dictionary Should Contain Value     ${response.json()}    Breakfast




Delete the booking
    ${header}    Create Dictionary    Cookie=token\=${token}
    ${response}    DELETE    url=https://restful-booker.herokuapp.com/booking/${id}    headers=${header}
    Status Should Be    201    ${response}

*** Keywords ***
Authentification
    ${credentilals}     Create Dictionary       username=admin      password=password123
    ${response}     POST        url=https://restful-booker.herokuapp.com/auth    json=${credentilals}
    Log    ${response.json()}
    ${token}        Set Variable        ${response.json()}[token]
    Log    ${token}
    Set Suite Variable    ${token}
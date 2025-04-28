*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/RC_002_Rediffmail_Send_Mail_Json_Excel.robot
Library    ../ExternalKeywords/DataDrivenKeyword.py


*** Variables ***
${URL}   https://mail.rediff.com/cgi-bin/login.cgi
${Browser}    Chrome
${Options}    --disable-notifications

*** Test Cases ***
Working with Rediffmail with Json file with parameter value
    set screenshot directory    ../Screenshots
    # run keyword if the test case fails
    # run keyword if test failed - can only be uesed with TEARDOWN at test case level
    [Teardown]    run keyword if test failed    capture page screenshot    Failed_Screenshot_Data_Driven_{index}.png

    # Use the function get_max_row_number(sheetName) from DataDrivenKeyword.py file
    ${MAXROWS}=    get max row number    Data
    log to console    ${MAXROWS}


    # Initialte Data datadriven
    # ROw number from which we have to start is from row number 2
    FOR    ${rowNumber}    IN RANGE    2    ${MAXROWS}+1
        Open the browser and navigate to Rediffmail login website    ${URL}   ${Browser}    ${Options}
        Type on the username field    Data    ${rowNumber}    1
        Type on the password field    Data    ${rowNumber}    2
        Click on login button
        Click on Write Mail link
        Type on To field    Data    ${rowNumber}    3
        Type on Subject field    Data    ${rowNumber}    4
        Select the frame in compose area
        Type in compose area    Data    ${rowNumber}    5
        Unselect the frame in compose area
        Click on send link
        Click on gear link
        Click on logout link
        Close the browser

    END



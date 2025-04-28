*** Settings ***
Library    SeleniumLibrary
Library    ../ExternalKeywords/DataDrivenKeyword.py


*** Variables ***


*** Keywords ***
# User defined keywords created with build in keywords of Selenium Library
Open the browser and navigate to Rediffmail login website
    [Arguments]       ${URL}   ${Browser}    ${Options}
    open browser    ${URL}   ${Browser}    ${Options}
    maximize browser window
    set selenium implicit wait    20 Seconds
    # If filename equals to EMBED (case insensitive), then screenshot is embedded as Base64 image to the log.html.
    capture page screenshot    EMBED
    # the name of screenshot is Open-Browser and its extension can be jpeg or png
    # {index} - starts with index 1
    # if filename contains marker {index}, it will be automatically replaced with an unique running index, preventing files to be overwritten
    capture page screenshot    Open-Browser-Rediffmail_Python-Json-Keyword{index}.png

Type on the username field
    [Arguments]    ${SHEETNAME}    ${ROWNUMBER}    ${COLUMNNUMBER}
    ${USERNAMELOCATORVALUE}=    Read Locator    Registration.username_id
    ${USERNAMECELLVALUE}=     Read Data From Cell Of Excel    ${SHEETNAME}    ${ROWNUMBER}    ${COLUMNNUMBER}
    input text    id:${USERNAMELOCATORVALUE}    ${USERNAMECELLVALUE}
    sleep    2 Seconds
    capture page screenshot    type-username-sendingmail-{index}.png

Type on the password field
    [Arguments]    ${SHEETNAME}    ${ROWNUMBER}    ${COLUMNNUMBER}
    ${PASSWORDLOCATORVALUE}=    read locator    Registration.password_id
    ${PASSWORDCELLVALUE}=     Read Data From Cell Of Excel    ${SHEETNAME}    ${ROWNUMBER}    ${COLUMNNUMBER}
    input password    id:${PASSWORDLOCATORVALUE}    ${PASSWORDCELLVALUE}
    capture page screenshot    type-password-sendingmail-{index}.png
    sleep    2 Seconds

Click on login button
    ${SIGNINLOCATORVALUE}=    read locator    Registration.signin_name
    click button    name:${SIGNINLOCATORVALUE}
    capture page screenshot    click-login-button-{index}.png
    sleep    10 Seconds

Click on Write Mail link
    ${WRITEMAILLOCATORVALUE}=    read locator    Inbox.writemail_xpath
    click link    xpath:${WRITEMAILLOCATORVALUE}
    sleep    4 Seconds
    capture page screenshot    click-writemail-link-{index}.png

Type on To field
    [Arguments]   ${SHEETNAME}    ${ROWNUMBER}    ${COLUMNNUMBER}
    ${TOFIELDLOCATORVALUE}=    read locator    Inbox.to_id
    ${TOCELLVALUE}=     Read Data From Cell Of Excel    ${SHEETNAME}    ${ROWNUMBER}    ${COLUMNNUMBER}
    input text    id:${TOFIELDLOCATORVALUE}    ${TOCELLVALUE}
    press key    id:${TOFIELDLOCATORVALUE}    \\13
    capture page screenshot    type-to-field-{index}.png
    sleep    2 seconds

Type on Subject field
    [Arguments]    ${SHEETNAME}    ${ROWNUMBER}    ${COLUMNNUMBER}
    ${SUBJECTFIELDLOCATORVALUE}=    read locator    Inbox.subject_xpath
    ${SUBJECTCELLVALUE}=     Read Data From Cell Of Excel    ${SHEETNAME}    ${ROWNUMBER}    ${COLUMNNUMBER}
    input text    xpath:${SUBJECTFIELDLOCATORVALUE}    ${SUBJECTCELLVALUE}
    capture page screenshot    type-subject-field-{index}.png
    sleep    2 seconds

Select the frame in compose area
    ${FRAMELOCATORVALUE}=    read locator    Inbox.frame_xpath
    select frame    xpath:${FRAMELOCATORVALUE}
    sleep    2 seconds

Type in compose area
    [Arguments]    ${SHEETNAME}    ${ROWNUMBER}    ${COLUMNNUMBER}
    ${COMPOSEAREALOCATORVALUE}=    read locator    Inbox.compose_area_xpath
    ${COMPOSECELLVALUE}=     Read Data From Cell Of Excel    ${SHEETNAME}    ${ROWNUMBER}    ${COLUMNNUMBER}
    input text    xpath:${COMPOSEAREALOCATORVALUE}    ${COMPOSECELLVALUE}
    capture page screenshot    type-compose-field-{index}.png
    sleep    2 seconds

Unselect the frame in compose area
    unselect frame
    sleep    2 seconds

Click on send link
    ${SENDLINKLOCATORVALUE}=    read locator    Inbox.send_xpath
    click link    xpath:${SENDLINKLOCATORVALUE}
    capture page screenshot    click-send-button-{index}.png
    sleep    2 seconds

Click on gear link
    ${GEARLINKLOCATORVALUE}=    read locator    Inbox.gear_xpath
    click link    xpath:${GEARLINKLOCATORVALUE}
    capture page screenshot    click-gear-link-{index}.png
    sleep    2 seconds

Click on logout link
    ${LOGOUTLINKLOCATORVALUE}=    read locator    Inbox.logout_xpath
    click link    xpath:${LOGOUTLINKLOCATORVALUE}
    sleep    2 seconds
    capture page screenshot    click-logout-link-{index}.png

Close the browser
    close browser

# Keyword with return type as the function "read_locator_from_json(locatorName)" in DataDriverKeyword.py python file which is a return type function
Read Locator
    [Arguments]    ${JSONPATH}
    ${VALUE}=    read locator from json    ${JSONPATH}
    [Return]    ${VALUE}

# Keyword with return type as a function "get_data_from_cell(sheetName, row, column)" in DataDriverKeyword.py python file which is a return type function
Read Data From Cell Of Excel
    [Arguments]    ${SHEETNAME}    ${ROWNUMBER}    ${COLUMNNUMBER}
    ${CELLVALUE}=    get data from cell    ${SHEETNAME}    ${ROWNUMBER}    ${COLUMNNUMBER}
    [Return]    ${CELLVALUE}
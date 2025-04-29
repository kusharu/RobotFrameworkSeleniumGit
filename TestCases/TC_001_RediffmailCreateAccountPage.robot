*** Settings ***
Documentation    Work with different elements like edit box, button, drop down, checkbox, radio buttons
Library    SeleniumLibrary

*** Variables ***
${URL}    https://register.rediff.com/register/register.php?FormName=user_details
${Browser}    Chrome
# Set up oprtions for the browser - disable notifications in the browser
${Options}    --disable-notification

*** Test Cases ***
Work with elements
    set screenshot directory    ../Screenshots
    [Setup]    Open browser and navigate to Rediffmail account page and maximize the window    ${URL}    ${Browser}    ${Options}
    [Teardown]    Close the browser

    Get the default page timeout
    Set the page load time value
    # Static wait is not good
    sleep  5 seconds
    # Dynamic Wait    - Implicit wait and Explicit wait
    # Implicit Wait is for all elements  - trying to find element or elements implicitly wait will come into foreplay
    # Explicit Wait - is for a specific element based on certain condition
    Setting the implicit wait
    # Get the default speed of Selenium - The default delay that is waited after each Selenium command
    Get default speed of selenium
    # Set the speed of selenium code execution - Sets the delay that is waited after each Selenium command
    #Get the set value
    Set and get the selenium speed value
    # Emplicit wait for a text in the current page
    Explicit wait for Create a Rediffmail account text to be present in the landing page of Rediffmail account
    # validate the title Rediffmail Free Unlimited Storage for the landing page
    Validate that the title of the landing page is Rediffmail Free Unlimited Storage
    # Validate that the Full Name text is present in Full Name edit box
    Validate that the text is Full Name for the full name edit box
    # Negative validation for Full Name text in full name edit box
    Negative validation for Full Name text for the full name edit box
    # Type on Full Name edit box
    Type on the Full Name edit box
    # Validate that place holder attribute value for Choose Rediffmail ID
    Validate that the placeholder attribute in Choose Rediffmail ID is Enter Rediffmail ID
    # Type on the Choose Rediffmail Id edit box
    Type on Choose Rediffmail Id edit box
    # Validate the attribute value for Check Availability Button
    Validate that Check Availability button contains value attribute with value as Check availability
    # Click on Check Availability button
    Click on Check Availability Button
    # Wait and Get the text Yippie The ID you've chosen is available after clicking on Check Availability Button and then validate Enter password edit box
    Wait and Get the text Yippie The ID you've chosen is available after clicking on Check Availability Button and then validate Enter password edit box
    # Type on Choose Password edit box
    Type on the Choose Password edit box
    # Validate the Retype password text
    Validate the Retype password text
    # Type on the Retype Password edit box
    Type on the Retype Password edit box
    # Validate the Day drop down
    Validate the Day drop down
    # Get All the options from Day drop down
    Get All the options from Day drop down
    # Select the day 05 from the Day drop down using index
    Select the day 05 from the Day drop down using index
    # Get the label and value of the sleected item which is 05
    Get the label and value of the selected item which is 05
    # Validate the Month drop down
    Validate the Month drop down
    # Select the month MAR from the Month drop down using index
    Select the month MAR from the Month drop down using value
    # Validate the Year drop down
    Validate the Year drop down
    # Select the year 2010 from the Year drop down using label
    Select the year 2010 from the Year drop down using label

    # Validate that attribute value f is present for the value attribute in female radio button
    Validate that attribute value f is present for the value attribute in female radio button
    # Validate that the radio button female is not selected
    # Validate that the radio button female is not selected
    # Select the gender as female as defined in radio button
    Select the gender as female as defined in radio button

    # Select the country to live as Australia
    Select the country to live as Australia

    # Validate that the text Click if you don't have an alternate ID is present
    Validate that the text Click if you don't have an alternate ID is present
    # Validate that the check box is not selected
    Validate that the check box is not selected
    # Click on the checkbox for alternate email id
    Click on the checkbox for alternate email id
    # Unselect the checkbox for alternate email id
    Unselect the checkbox for alternate email id
    # Select the checkbox for alternate email id
    Select the checkbox for alternate email id

    # Validate that the text Select a Security Question is present
    Validate that the text Select a Security Question is present
    # Select the option of favourite passtime for the drop down of security question
    Select the option of favourite passtime for the drop down of security question
    # Validate that the text Enter an Answer is present
    Validate that the text Enter an Answer is present
    # Type the security question answer
    Type the security question answer
    # Validate that the text Mother's Maiden Name is present
    Validate that the text Mother's Maiden Name is present
    # Type the Mother Maiden name edit box
    Type the Mother Maiden name edit box

    # Working the drop down not created by Select tag
    Click on the Mobile number drop down and choose Australia as the option

    #Type the mobile number
    Type the mobile number








*** Keywords ***
Open browser and navigate to Rediffmail account page and maximize the window
    [Arguments]    ${URL}    ${Browser}    ${Options}
    open browser    ${URL}    ${Browser}    ${Options}
    maximize browser window
    capture page screenshot    Open-Browser-Create-Account-{index}.png


Get the default page timeout
    # Get the default time out value
    ${def_page_load_timeout}=    get selenium page load timeout
    log to console    Default page load timeout is ${def_page_load_timeout}

Set the page load time value
    # We cannot wait for infinite period of time for the page to load
    # If we set the value for page loading and the page does not load in the stimulated time period , it will throw page load timeout exception
    set selenium page load timeout    200 Seconds
    ${page_load_timeout}=    get selenium page load timeout
    log to console   ${page_load_timeout}

Setting the implicit wait
    set selenium implicit wait    20 Seconds

Get default speed of selenium
    ${def_sel_speed}=    get selenium speed
    log to console    Default Selenium Speed is ${def_sel_speed}

Set and get the selenium speed value
    set selenium speed    1 Seconds
    ${set_sel_speed}=    get selenium speed
    log to console    Set Selenium Speed value is ${set_sel_speed}

Explicit wait for Create a Rediffmail account text to be present in the landing page of Rediffmail account
    # Waits until text appears on the current page
    wait until page contains  Create a Rediffmail account   20 Seconds

Validate that the title of the landing page is Rediffmail Free Unlimited Storage
    # Landing page title not found message will not be thrown if the validation passes
    title should be    Rediffmail Free Unlimited Storage    Landing page title not found

Validate that the text is Full Name for the full name edit box
    element text should be    xpath://label[text() = 'Full Name']    Full Name     Full name text is not present in Full Name edit box

Negative validation for Full Name text for the full name edit box
    element text should not be    xpath://label[text() = 'Full Name']   zzzz     Full name text is present in Full Name edit box

Type on the Full Name edit box
    # Fail as the name attribute value changes at run time
    # input text    name:name9b18d9d7     Sam Mendes
    input text    xpath://input[starts-with(@name, 'name')]     Sam Mendes
    capture page screenshot    Full-Name-{index}.png

Validate that the placeholder attribute in Choose Rediffmail ID is Enter Rediffmail ID
    # changing the placehilder attribute value from Enter Rediffmail ID to hi - to deliberately fail it for Jenkins run
    element attribute value should be    xpath://input[contains(@id, 'login')]      placeholder    Hi    Placeholder attribute value is not Enter Rediffmail ID in Choose Rediffmail ID

Type on Choose Rediffmail Id edit box
    input text    xpath://input[contains(@name, 'login')]    robotraining2025
    capture page screenshot    Choose-Rediffmail-id-{index}.png

Validate that Check Availability button contains value attribute with value as Check availability
    element attribute value should be    xpath://input[@value = 'Check availability']      value    Check availability    Value attribute value is not Check availability in Check Availability button

Click on Check Availability Button
    click button    xpath://input[@value = 'Check availability']
    capture page screenshot    click-check-availability-button-{index}.png

Wait and Get the text Yippie The ID you've chosen is available after clicking on Check Availability Button and then validate Enter password edit box
    wait until element contains    xpath://*[@id="check_availability"]/div/span     Yippie! The ID you've chosen is available.    20 Seconds    Text Yippie! The ID you've chosen is not found
    ${get_Yippie_text}=    get text    class:success
    log to console    ${get_Yippie_text}
    # BuiltIn library Doc - https://robotframework.org/robotframework/latest/libraries/BuiltIn.html#Run%20Keyword%20If
    run keyword if    "${get_Yippie_text}"==" Yippie! The ID you've chosen is available."     element text should be    xpath://label[text() = 'Choose a Password']    Choose a Password     Choose a Password text is not present in Full Name edit box
#    run keyword if    "${get_Yippie_text}"==" zzzz"     input password    xpath://input[@placeholder = 'Enter password']    test@1234

Type on the Choose Password edit box
    input password    xpath://input[@placeholder = 'Enter password']    test@1234
    capture page screenshot    Type-choose-password-{index}.png

Validate the Retype password text
    element text should be    //label[text() = 'Retype Password']    Retype Password    Retype Password text is not present in Retype Password edit box

Type on the Retype Password edit box
    input password    xpath://input[@placeholder = 'Retype password']    test@1234
    capture page screenshot    ReType-choose-password-{index}.png

Validate the Day drop down
    list selection should be    class:day    Day

Get All the options from Day drop down
    ${items_Day_Drop_Down}=    get list items    class:day
    log to console    Options present in day drop down are ${items_Day_Drop_Down}

Select the day 05 from the Day drop down using index
    # If a drop down is created by Select tag, we can use
    # Select From List By Index - index starts with 0
    # Select From List By Value - select by value attribute
    # Select From List By Label - select by label  attribute or the inner text
    # LIST word is relevant with drop down or list UI; not with LIST interface or list advance data type
    select from list by index    class:day    5
    capture page screenshot    select-day-dropdown-{index}.png

Get the label and value of the selected item which is 05
    # Get the value of the value attribute for 05 item selected
    ${label_Selected_item}=    get selected list label    class:day
    # Get the value of the label attribute or inner text value for 05 item selected
    ${value_Selected_item}=    get selected list value    class:day
    log to console    Value of the selected item 05 is ${value_Selected_item}
    log to console    Label of the selected item 05 is ${label_Selected_item}

Validate the Month drop down
    # list selection should be    xpath://select[contains(@name,'DOB_Month')]    Month
    # Compound class value used with xpath
    # list selection should be    xpath://select[@class = 'middle month']    Month
    # Compound class value used with xpath
    # list selection should be    css:select[class = 'middle month']    Month
    # Dot(.) means class
    # list selection should be    css:select.middle    Month
    list selection should be    css:select.month    Month

Select the month MAR from the Month drop down using value
    Select From List By Value  css:select.middle    03
    capture page screenshot    select-month-dropdown-{index}.png

Validate the Year drop down
    list selection should be    class:year    Year

Select the year 2010 from the Year drop down using label
    select from list by label    class:year    2010
    capture page screenshot    select-year-dropdown-{index}.png

Validate that attribute value f is present for the value attribute in female radio button
    element attribute value should be    xpath://input[@value='f']    value    f

Validate that the radio button female is not selected
    # Group name is the name attribute value , but this value is dynamic, so cannot be used
    # by default the male radio button is selected
    radio button should not be selected    gender3d271414

Select the gender as female as defined in radio button
    # Group name is the name attribute value , but this value is dynamic, so cannot be used
    # group_name is the name of the radio button group.
    # value is the id or value attribute of the actual radio button.
    # select radio button    gender3d271414    f
    click element    xpath://input[@value='f']
    capture page screenshot    select-gender-radio-{index}.png

Select the country to live as Australia
    Select From List By Value  xpath://select[contains(@name,'country')]    12
    capture page screenshot    select-country-dropdown-{index}.png

Validate that the text Click if you don't have an alternate ID is present
    page should contain     Click if you don't have an alternate ID

Validate that the check box is not selected
    checkbox should not be selected    xpath://input[contains(@name, 'chk_altemail')]

Click on the checkbox for alternate email id
    select checkbox    xpath://input[contains(@name, 'chk_altemail')]
    capture page screenshot    Click-checkbox-altemailid-{index}.png

Unselect the checkbox for alternate email id
    unselect checkbox    xpath://input[contains(@name, 'chk_altemail')]
    capture page screenshot    UnClick-checkbox-altemailid-{index}.png

Select the checkbox for alternate email id
    click element    xpath://input[contains(@name, 'chk_altemail')]
    capture page screenshot    ClickAgain-checkbox-altemailid-{index}.png

Validate that the text Select a Security Question is present
    element should contain    xpath://label[text()='Select a Security Question']    Select a Security Question    Select a Security Question text is not present

Select the option of favourite passtime for the drop down of security question
    select from list by index    xpath://select[contains(@name, 'hintq')]    2
    capture page screenshot    Select-dropdown-favouritepasstime-{index}.png

Validate that the text Enter an Answer is present
    element should contain    xpath://label[text()='Enter an Answer']    Enter an Answer    Enter an Answer text is not present

Type the security question answer
    input password    css:input[name*='hinta']    Cricket
    capture page screenshot    type-security-answer-{index}.png

Validate that the text Mother's Maiden Name is present
    element should contain    xpath://input[contains(@name, 'mothername')]/preceding-sibling::label    Mother's Maiden Name    Mother's Maiden Name text is not present

Type the Mother Maiden name edit box
    input text    xpath://input[contains(@name, 'mothername')]    Sukla Mukherjee
    capture page screenshot    type-mother-name-{index}.png

# Working the drop down not created by Select tag
Click on the Mobile number drop down and choose Australia as the option
    # Click on Mobile number drop down area
    click element    class:countryCodeText
    # Click on the Australia option
    click element    xpath://li[text()='Australia (+61)']
    capture page screenshot    mobilenumber-dropdown-{index}.png

Type the mobile number
    input text    xpath://input[contains(@name, 'mobno')]    234567
    capture page screenshot    type-mobilenumber-{index}.png

Close the browser
    close browser






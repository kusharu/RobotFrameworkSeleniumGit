# We will create user defined keywords in python with keywords of Selenium Libray and BuiltIn
import time

# Library - https://robot-framework.readthedocs.io/en/latest/autodoc/robot.api.html#robot.api.deco.library
# USe the library annotation to make the class as library
# Imported library is a function
from robot.api.deco import library

# Use the BuiltIn library of robot framework
# Builtin module - https://robot-framework.readthedocs.io/en/latest/autodoc/robot.libraries.html
# Imported BuiltIn is a class
# BuiltIn Robot framework library - https://robotframework.org/robotframework/latest/libraries/BuiltIn.html#Get%20Library%20Instance
# BuiltIn has a method / keyword as get_library_instance() where we can pass the Library that we wish to use.
from robot.libraries.BuiltIn import BuiltIn

# Keyword function  - https://robot-framework.readthedocs.io/en/latest/autodoc/robot.api.html#robot.api.deco.library
# This will act as an annotation to define methods as keywords
from robot.api.deco import keyword

@library
class ExtKeyword:

    # What is the reason to get SeleniumLibrary?
    # a) To use the keywords of selenium library in this python file.
    # b) So that we use the same instance of Chrome driver class, EdgeDriver class or FirefoxDriver used across the Resource file or Test case file
    @keyword
    def __init__(self):
        self.selInst = BuiltIn().get_library_instance('SeleniumLibrary')
        self.BuiltInInst = BuiltIn().get_library_instance('BuiltIn')

    # We need to find if an element/ui exists based on locator value
    # When we create a function that will act as keyword because that function will use the @keyword annotation
    # So we create our own keyword , separate each words of the function by underscore
    # is_element_present(locatorValue)
    @keyword
    def is_element_present(self, locVal):

        # Locator values can be by xpath, css, id, name, class, etc.
        # xpath and css is the position of the element/ui in the webpage
        # Even if the elements/ui are same , their position will not overlap and so their xpath value or css value will be different.
        # If the design of the page is constant, xpath value or css value are safest.
        # Even international coding standards are followed then id value and name value will be unique.
        # When we use the keywords of robot framework in python file use underscore between spaces of the keyword
        listElements = self.selInst.get_webelements(locVal)
        # Number of elements with same locator value
        numberElements = len(listElements)
        print("Number of elements with same locator value is", numberElements) # is seen in log.html
        self.BuiltInInst.log_to_console(numberElements) # is printed out in console
        # if the number Of Elements With Same Locator Value is greater than 0 then element is present.
        # if the number Of Elements With Same Locator Value is equal to 0 then element is not present.
        if(numberElements > 0):
            print("Element exists")# is seen in log.html
            self.BuiltInInst.log_to_console("Element exists")  # is printed out in console
            return True
        else:
            print("Element does not exists") # is seen in log.html
            self.BuiltInInst.log_to_console("Element does not exists")  # is printed out in console
            return False

    @keyword
    def click_on_the_links_of_area(self):
        # Similarility between xpaths of three links in Sustainable cities area:
        # a) //*[@id="main-content"]/article/section[7]/div/div[2]/div[
        # b) ]/div/a
        # Changing portion is the number starting with 1 and ending at 3

        # First link address of the Sustainable cities area - xpath - //*[@id="main-content"]/article/section[7]/div/div[2]/div[1]/div/a
        # Second link address of the Sustainable cities area - xpath -//*[@id="main-content"]/article/section[7]/div/div[2]/div[2]/div/a
        # Second link address of the Sustainable cities area - xpath- //*[@id="main-content"]/article/section[7]/div/div[2]/div[3]/div/a
        part1 = "//*[@id='main-content']/article/section[7]/div/div[2]/div["
        part2 = 1;
        part3 = "]/div/a"
        # While loop will be used when we do not how many links are present in Sustainable cities area
        while(self.is_element_present(part1+(str)(part2)+part3)):
            # Click on the link page
            self.selInst.click_link(part1+(str)(part2)+part3)
            time.sleep(2)
            # Get the title of the page
            titlePage = self.selInst.get_title()
            print("Title of the link page is",titlePage ) # is seen in log.html
            self.BuiltInInst.log_to_console(titlePage) # is printed out in console
            # Get the screenshot of link page
            self.selInst.capture_page_screenshot("EMBED")
            # Log the title of the page
            self.selInst.log_title()
            time.sleep(2)
            #Come back to the landing page
            self.selInst.go_to("https://www.bbc.com/")
            # Get the screenshot of landing page
            self.selInst.capture_page_screenshot("EMBED")
            time.sleep(2)
            part2 = part2+1
            time.sleep(2)











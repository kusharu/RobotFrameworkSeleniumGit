import os
import json
import jsonpath

f = open('C:\\Users\\kaush\\OneDrive\\Desktop\\SeleniumRobotFramework\\JsonFiles\\ElementsRediffmail.json')
print(type(f))
e = f.read() # The read method returns string value
#print(e)

def read_locator_from_json(locatorName):
    # locatorName is the KEY in ElementsRediffmail.json whose VALUE will be picked by this function
    # First open the JSON file
    f = open('C:\\Users\\kaush\\OneDrive\\Desktop\\SeleniumRobotFramework\\JsonFiles\\ElementsRediffmail.json')
    # The file is read with read() method and then it will be parsed with loads() method of JSON package
    response = json.loads(f.read())

    # Travel to get the VAYE of the KEY defined in ElementsRediffmail.json JSON file
    value  = jsonpath.jsonpath(response, locatorName)
    # Jsonpath() method returns a list
    return value[0]

# call the function
key1 = read_locator_from_json("Registration.signin_name")
print(key1)

# call the function
key2 = read_locator_from_json("Inbox.to_id")
print(key2)




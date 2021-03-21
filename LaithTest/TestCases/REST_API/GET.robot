*** Settings ***
Library    Collections    
Resource    ../../Helper/HelperTC.robot
Test Setup    Create Session    mysess    http://localhost:8080/jakarta-ee-getting-started/rest/accountHolders

*** Test Cases ***
TC1
    HelperTC.checkNumberOfAccountHolder    mysess    /    4


TC2
    HelperTC.verfyExistAccountInfo    mysess    /           2
    
TC3 
    HelperTC.verfyNotExistAccountInfo    mysess    /    55
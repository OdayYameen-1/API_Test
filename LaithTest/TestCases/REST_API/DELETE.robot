*** Settings ***
Library    Collections    
Resource    ../../Helper/HelperTC.robot
Test Setup    Create Session    mysess    http://localhost:8080/jakarta-ee-getting-started/rest/accountHolders

*** Test Cases ***

TC1
    deleteAccountHolder_Exist    mysess    /       3
    
TC2
    deleteAccountHolder_NotExist    mysess    /    55
    
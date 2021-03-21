*** Settings ***
Library    Collections    
Resource    ../../Helper/HelperTC.robot
Test Setup    Create Session    mysess    http://localhost:8080/jakarta-ee-getting-started/rest/accountHolders

*** Test Cases ***
TC1
    HelperTC.checkNoAccountHolder    mysess    /    4


TC2
    HelperTC.checkifInformationOfAccountValid_ExistingAccount    mysess    /           2
    
TC3 
    HelperTC.checkifInformationOfAccountValid_NotExistingAccount    mysess    /    55
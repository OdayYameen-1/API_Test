*** Settings ***
Library    Collections    
Resource    ../../Helper/HelperTC.robot
Test Setup    Create Session    mysess    http://localhost:8080/jakarta-ee-getting-started/rest/accountHolders



*** Test Cases ***

TC1
     ${body}     Create Dictionary     id=3    firstName=Ahmad    lastName=Yameen    balance=${3000.33}
     HelperTC.updateAccountHolder_CorrectInfo    mysess    /    3    ${body}
     

TC2
    
     ${body}     Create Dictionary         lastName=Yameen    balance=${3000.33}
    HelperTC.updateAccount_MissFilds    mysess    /    3        ${body}
    

TC3
         ${body}     Create Dictionary     id=3    firstName=Ahmad    lastName=Yameen    balance=Odayyameen
         HelperTC.updateAccountWith_incorrectInfo    mysess    /    3    ${body}
         
TC4
     ${body}     Create Dictionary     id=3    firstName=Ahmad    lastName=Yameen    balance=${3000.33}
    HelperTC.updateAccount_Existing    mysess    /    3    ${body}
    
TC5
     ${body}     Create Dictionary     id=55    firstName=Ahmad    lastName=Yameen    balance=Odayyameen
    updateAccount_NotExist    mysess    /   55      ${body}  

    
*** Settings ***
Library    Collections    
Resource    ../../Helper/HelperTC.robot
Test Setup    Create Session    mysess    http://localhost:8080/jakarta-ee-getting-started/rest/accountHolders


*** Test Cases ***

TC1
    
  ${body}     Create Dictionary     id=3    firstName=Ahmad    lastName=Yameen    balance=${3000.33}
    HelperTC.createAccountHolder_Correct    mysess    /     ${body}
    
TC2
    
     ${body}     Create Dictionary     id=3        balance=${3000.33}
     
    HelperTC.createAccountHolder_NotALLFild    mysess    /    ${body}
    
TC3
      ${body}     Create Dictionary     id=3    firstName=Ahmad    lastName=Yameen    balance=${3000.33}
    HelperTC.createAccountHolder_ExistBefor    mysess    /     ${body}
    

TC4
     ${body}     Create Dictionary     id=3    firstName=Ahmad    lastName=Yameen    balance=OdayWelcom
    HelperTC.createAccountHolder_incorrectData    mysess    /    ${body}
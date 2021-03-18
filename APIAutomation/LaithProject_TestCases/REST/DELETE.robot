*** Settings ***
Library   RequestsLibrary
Library    Collections   
Library    JSONLibrary     
*** Variables ***
${base_url}    http://localhost:8080

*** Test Cases ***

TC DELETE
  Create Session    mysession    ${base_url} 

    ${responce}=    Delete On Session    mysession      /jakarta-ee-getting-started/rest/accountHolders/3 
    
    #Log To Console    ${responce.status_code}
    #Log To Console    ${responce.content}
    #Log To Console    ${responce.headers}            
    
    ${status_code}=    Convert To String    ${responce.status_code}
    Should Be Equal    ${status_code}    200
    

  

      Create Session    mysession    ${base_url} 

    ${responce2}=    Get On Session    mysession      /jakarta-ee-getting-started/rest/accountHolders/3
    
             
    
    ${status_code}=    Convert To String    ${responce2.status_code}
    Should Be Equal    ${status_code}       204
    

  

 
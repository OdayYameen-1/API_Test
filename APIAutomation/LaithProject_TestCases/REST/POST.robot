*** Settings ***
Library    RequestsLibrary    
Library    Collections 
Library    JSONLibrary       
*** Variables ***
${base_url}    http://localhost:8080



*** Test Cases ***
Posting AnAccount    Create Session    mysess    ${base_url}
     
     ${body}               Create Dictionary     id=3    firstName=Ahmad    lastName=Yameen    balance=${3000.33}
   
    #  Log    ${body}    
    ${header}           Create Dictionary       Content-Type=application/json;
   # Log    ${header}    
     ${responce}=     Post On Session    mysess    /jakarta-ee-getting-started/rest/accountHolders    json=${body}
        
    Should Be Equal As Integers    ${responce.status_code}    201
    ${conjson}=       Convert String to JSON    ${responce.content}   
   # Log To Console    type(${conjson})      
    Should Be Equal    ${conjson}    ${body}
    Log To Console    ${responce.status_code}    
    Log To Console    ${responce.content}    
    
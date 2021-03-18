*** Settings ***
Library    RequestsLibrary    
Library    Collections 
Library    JSONLibrary       
*** Variables ***
${base_url}    http://localhost:8080



*** Test Cases ***
Put account
    Create Session    mysess    ${base_url}
     
     ${body}               Create Dictionary     id=3    firstName=Ahmad22    lastName=Yameen22    balance=${1005.33}

     ${responce}=     Put On Session    mysess    /jakarta-ee-getting-started/rest/accountHolders/3    json=${body}
        
    Should Be Equal As Integers    ${responce.status_code}    201
    ####${conjson}=       Convert String to JSON    ${responce.content}      error   becuse null 
   # Log To Console    type(${conjson})      
   
    Log To Console    ${responce.status_code}    
    Log To Console    ${responce.content}    
    
    





     Create Session    mysession    ${base_url} 

    ${responce2}=    Get On Session    mysession      /jakarta-ee-getting-started/rest/accountHolders/3
    
             
    
    ${status_code}=    Convert To String    ${responce2.status_code}
    Should Be Equal    ${status_code}    200
    

  

    Log To Console    ${responce2.content}    

   ${body_res}=    Convert String to JSON    ${responce2.content}
   
    Should Be Equal    ${body_res}       ${body}
    
      ${fname}=      Get Value From Json   ${body_res}    $.firstName
    
        Should Be Equal    ${fname[0]}    Ahmad22    
   
    
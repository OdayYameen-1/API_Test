*** Settings ***
Library   RequestsLibrary
Library    Collections   
Library    JSONLibrary     
*** Variables ***
${base_url}    http://localhost:8080

*** Test Cases ***
Get_ALL
    Create Session    mysession    ${base_url} 

    ${responce}=    Get On Session    mysession      /jakarta-ee-getting-started/rest/accountHolders 
    
    #Log To Console    ${responce.status_code}
    #Log To Console    ${responce.content}
    #Log To Console    ${responce.headers}            
    
    ${status_code}=    Convert To String    ${responce.status_code}
    Should Be Equal    ${status_code}    200
    

  

    ${ContentTypeValue}=    Get From Dictionary    ${responce.headers}    Content-Type
    Log To Console   ${ContentTypeValue}  
    Should Be Equal As Strings    ${ContentTypeValue}    application/json

   ${body}=    Convert String to JSON    ${responce.content}
    ${myjson_fild}=    Convert String to JSON    {"balance": 1000.22, "firstName": "Oday", "id": "2", "lastName": "Yameen"}
    Should Contain    ${body}       ${myjson_fild}
    
   
    
    Should Contain    ${responce.content}    balance
    
GET by id
      Create Session    mysession    ${base_url} 

    ${responce2}=    Get On Session    mysession      /jakarta-ee-getting-started/rest/accountHolders/3
    
             
    
    ${status_code}=    Convert To String    ${responce2.status_code}
    Should Be Equal    ${status_code}    200
    

  

    Log To Console    ${responce2.content}    

   ${body_res}=    Convert String to JSON    ${responce2.content}
   
  
    
      ${fname}=      Get Value From Json   ${body_res}    $.firstName
    
        Should Be Equal    ${fname[0]}    Ahmad22    
   
      ${balance}=     Get Value From Json    ${body_res}    $.balance
      
    Should Be Equal As Numbers    ${balance[0]}    1005.33
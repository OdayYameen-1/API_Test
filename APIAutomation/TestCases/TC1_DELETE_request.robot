*** Settings ***
Library    RequestsLibrary    

*** Variables ***
${base_url}    http://jsonplaceholder.typicode.com



*** Test Cases ***
DELETING A_Post
    Create Session    mysess    ${base_url}
    
   ${responce}=    Delete On Session    mysess    /posts/1    
   
    Log To Console    ${responce.status_code}    
    Log To Console    ${responce.content}    
    
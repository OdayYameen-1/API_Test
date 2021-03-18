*** Settings ***
Library   RequestsLibrary
Library    Collections    
*** Variables ***
${base_url}    http://jsonplaceholder.typicode.com

*** Test Cases ***
GetPosts
    Create Session    mysession    ${base_url} 
    
    ${responce}=    Get On Session    mysession      /posts/1  
    
    #Log To Console    ${responce.status_code}
    #Log To Console    ${responce.content}
    #Log To Console    ${responce.headers}            
    
    ${status_code}=    Convert To String    ${responce.status_code}
    Should Be Equal    ${status_code}    200
    

    ${body}=    Convert To String    ${responce.content}
    Should Contain    ${body}    title

    ${ContentTypeValue}=    Get From Dictionary    ${responce.headers}    Content-Type
    Log To Console   ${ContentTypeValue}  
    Should Be Equal As Strings    ${ContentTypeValue}    application/json; charset=utf-8    








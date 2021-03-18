*** Settings ***
Library    RequestsLibrary    
Library    Collections    
*** Variables ***
${base_url}    http://jsonplaceholder.typicode.com



*** Test Cases ***
Posting A_Post
    Create Session    mysess    ${base_url}
     ${id}=        Convert To Integer    1
     ${body}    Create Dictionary     userId=${id}   id=${id}    title=Oday Yameen       body=this post contain example info
   
      
    ${header}    Create Dictionary       Content-Type=application/json;   
     ${responce}=     Post On Session    mysess    /posts    data=${body}    headers=${header}
   
    Log To Console    ${responce.status_code}    
    Log To Console    ${responce.content}    
    
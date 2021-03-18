*** Settings ***
Library    Collections    
Library    JSONLibrary    
Library    requests    
Library    RequestsLibrary    

*** Variables ***
${base_url}    http://restcountries.eu

*** Test Cases ***
TC_By_GET:
    Create Session    mysess    ${base_url}
    ${responce}=    Get On Session    mysess    /rest/v2/name/usa
    
    ${json_obj}=    To Json    ${responce.content}    
    
    #validate single data
    ${value_name}=    Get Value From Json    ${json_obj}    $[0].name
    Log To Console    ${value_name[0]}    
    Should Be Equal    ${value_name[0]}    United States of America
    
    #validate multiple data
    ${borders}=    Get Value From Json    ${json_obj}    $[0].borders
    Log To Console    ${borders[0]}    
    Should Contain Any    ${borders[0]}       CAN     MEX
     
    
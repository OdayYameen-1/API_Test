*** Settings ***
Library    JSONLibrary    
Library    os
Library    Collections    
Library    requests
Library    OperatingSystem     

*** Test Cases ***
TC:
    ${json_obj}=    Get Binary File    ${CURDIR}/USA.json       
    ${json_obj}=    Convert String to JSON    ${json_obj}

    ${value_name}=    Get Value From Json    ${json_obj}    $.name
        
    Log To Console    ${value_name[0]}    
    Should Be Equal    ${value_name[0]}    United States of America
    
    ${value_code}=    Get Value From Json    ${json_obj}    $.currencies[0].code
    Log To Console    ${value_code[0]}
    Should Be Equal    ${value_code[0]}    USD
    
*** Settings ***
Library    RequestsLibrary    
Library    Collections    
Library    requests    
Library    JSONLibrary   
Library    String    
 
*** Variables ***
${base_url}    https://jsonplaceholder.typicode.com


*** Test Cases ***
TC_Headers
    Create Session    mysess    ${base_url}
    ${responce}=    Get On Session    mysess    /photos
     
    Log To Console    ${responce.headers} 
    
    ${Content-Type_value}=    Get From Dictionary    ${responce.headers}    Content-Type
    Log To Console    ${Content-Type_value} 
    Should Be Equal    ${Content-Type_value}    application/json; charset=utf-8
    
    ${content-encode_value}=    Get From Dictionary    ${responce.headers}    content-encoding
    Log To Console    ${content-encode_value}    
    Should Be Equal    ${content-encode_value}    gzip
    

TC_Cookies
    Create Session    mysess    ${base_url}
    ${res}    Get On Session    mysess    /photos
    
   ${cookies_NAME_VALUE}=    Get From Dictionary    ${res.cookies}    __cfduid
   Log To Console    ${cookies_NAME_VALUE}    
   ##############################################################################
    ${cookies_ALL}=     Get From Dictionary    ${res.headers}    Set-Cookie
   # Log To Console    ${cookies_ALL}    
   
    ${xx}=     Evaluate    type($cookies_ALL) 
          
    Log To Console    ${xx}    
#############      String
#################################################################################     

                   ${words}=     Split String   ${cookies_ALL}    ;
          
                   Log To Console    ${words}    
  
       ${ss}=    Evaluate    type(${words})    
       Log To Console    ${ss}    
      
      #############   List
      #######################################################################
      
      ${vv}=    Set Variable       ${SPACE}domain=.typicode.com   # vv is what i need to search in list
       

#####################################################################################

       ${value}=      Get From List    ${words}    3
       Log To Console    ${value}    
   ####################################################
       ${domain_value}=    Get Index From List    ${words}      ${vv}
       Log To Console    ${domain_value}   
    ######################################################        
       ${test}=    Get Matches    ${words}    ${SPACE}domain*
       Log To Console    ${test}    
       ${valueOfDomain}=     Split String    ${test[0]}       =        
        Should Be Equal    ${valueOfDomain[1]}     .typicode.com   










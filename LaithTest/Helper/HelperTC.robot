*** Variables ***
${EndPoint}    http://localhost:8080/jakarta-ee-getting-started/rest/accountHolders
 
*** Settings ***

Library    RequestsLibrary    
Library    Collections    
Library    JSONLibrary    


*** Keywords ***

#For Get Request
checkNumberOfAccountHolder
    [Arguments]    ${SESSION}    ${path}    ${No_Account}
     ${responce}=    Get On Session    ${SESSION}     ${path}
     ${status_code}=    Convert To String    ${responce.status_code}
     Should Be Equal    ${status_code}    200   
     
     ${NoAcc}    Get Length    ${responce.json()}  
     Should Be Equal As Strings    ${NoAcc}    ${No_Account}
     

verfyExistAccountInfo
    [Arguments]    ${session}      ${path}    ${id}
     ${responce}=    Get On Session    ${SESSION}     ${path}${id}
      ${status_code}=    Convert To String    ${responce.status_code}
     Should Be Equal    ${status_code}    200  
     FOR    ${item}    IN    ${responce.json()}
     \    ${res_id}    Get From Dictionary    ${item}    id  
     \    Run Keyword If    ${res_id}== ${id}    equality    ${res_id}    ${id}
     
     END
     
    
equality
    [Arguments]    ${res_id}    ${id}
     Should Be Equal    ${res_id}    ${id}
verfyNotExistAccountInfo
    [Arguments]        ${session}      ${path}    ${id} 
      ${responce}=    Get On Session    ${SESSION}     ${path}${id}
      Should Be Equal As Strings    ${responce.status_code}    204
      




#Post request
createAccountHolder_Correct
     [Arguments]  ${mysess}  ${path}  ${theJSONdata}
     
     ${response}  POST On Session    ${mysess}    ${path}  json=${theJSONdata}
     
     should be equal as strings  ${response.status_code}  201 
     
     ${id}  get from dictionary  ${theJSONdata}  id
     ${res2}  GET On Session  ${mysess}  ${path}${id}
     should be equal as strings  ${res2.status_code}  200 
     should be equal    ${theJSONdata}       ${res2.json()}  


createAccountHolder_NotALLFild
     [Arguments]  ${mysess}  ${path}  ${theJSONdata}
     ${response}   POST On Session  ${mysess}  ${path}  json=${theJSONdata}
     Should Be Equal As Strings  ${response.status_code}  500 

createAccountHolder_ExistBefor
     [Arguments]  ${mysess}  ${path}  ${theJSONdata}
     ${response}   POST On Session  ${mysess}  ${path}  json=${theJSONdata}
     Should Be Equal As Strings   ${response.status_code}  500

createAccountHolder_incorrectData
     [Arguments]  ${mysess}  ${path}  ${wrong_json_data}
     
     ${response}    POST On Session  ${mysess}    ${path}  json=${wrong_json_data}
     Should Be Equal As Strings   ${response.status_code}  500 




#Put 
updateAccountHolder_CorrectInfo
    [Arguments]      ${mysess}      ${path}      ${account_id}      ${json}
    ${response}  PUT On Session  ${mysess}  ${path}${account_id}  json=${json}
    ${id}  get from dictionary  ${json}  id
    ${res2}  GET On Session  ${mysess}  ${path}${id}
    should be equal as strings  ${res2.status_code}  200
    should be equal     ${json}     ${res2.json()}  


updateAccount_MissFilds
    [Arguments]  ${mysess}  ${path}  ${id}  ${json_Miss_filds} 
    ${response}  PUT On Session  ${mysess}  ${path}${id}  json=${json_Miss_filds}
    Should Be Equal As Strings  ${response.status_code}    500

updateAccountWith_incorrectInfo
    [Arguments]  ${mysess}  ${path}  ${id}  ${json_incorrect}
   
    ${response}     PUT On Session  ${mysess}  ${path}${id}  json=${json_incorrect}
    Should Be Equal As Strings  ${response.status_code}     500

updateAccount_Existing
    [Arguments]  ${mysess}  ${path}  ${id}  ${json_exsist}
    ${response}  PUT On Session  ${mysess}  ${path}${id}  json=${json_exsist}
    Should Be Equal As Strings  ${response.status_code}    500


updateAccount_NotExist
    [Arguments]  ${mysess}  ${path}  ${id}  ${json_not_exist}
    ${response}  PUT On Session  ${mysess}  ${path}${id}  json=${json_not_exist}
    should be equal as strings  ${response.status_code}  204  



#Delete request
deleteAccountHolder_Exist
    [Arguments]  ${mysess}  ${path}  ${id}
    ${response}  DELETE On Session  ${mysess}  ${path}${id}
    should be equal as strings  ${response.status_code}  200 
   



deleteAccountHolder_NotExist
    [Arguments]  ${mysess}  ${path}  ${id}
   
    ${response}  DELETE On Session  ${mysess}  ${path}${id}
    should be equal as strings  ${response.status_code}  204  


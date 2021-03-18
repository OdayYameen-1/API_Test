*** Settings ***
Library    OperatingSystem    
Library    SoapLibrary    

*** Variables ***
${wsdl}    http://localhost:8000/ws/transaction?wsdl

*** Test Cases ***
TC_Descover_IP
    Create SOAP Client    ${wsdl} 
    ${response}    Call SOAP Method With XML    ${CURDIR}/trans.xml   
    Save XML To File    ${response}    ${CURDIR}    trans_result
     ${amount}    Get Data From XML By Tag    ${response}    amount
    Log    ${amount}
    Should Be Equal As Numbers    ${amount}    100
     ${from}    Get Data From XML By Tag    ${response}    from
    Log    ${from}
    Should Be Equal As Integers    ${from}    1    
     ${id}    Get Data From XML By Tag    ${response}    id
    Log    ${id}
    Should Be Equal As Integers    ${id}    1
        ${to}    Get Data From XML By Tag    ${response}    to
    Log    ${to}
    Should Be Equal As Integers    ${to}    2


*** Settings ***
Library    OperatingSystem    
Library    SoapLibrary    

*** Variables ***
${wsdl}    http://ws.cdyne.com/ip2geo/ip2geo.asmx?wsdl

*** Test Cases ***
TC_Descover_IP
    Create SOAP Client    ${wsdl} 
    ${response}    Call SOAP Method With XML    ${CURDIR}/ipRequest.xml   
    Save XML To File    ${response}    ${CURDIR}    response_test
     ${City}    Get Data From XML By Tag    ${response}    City
    Log    ${City}
     ${Country}    Get Data From XML By Tag    ${response}    Country
    Log    ${Country}
     ${CountryCode}    Get Data From XML By Tag    ${response}    CountryCode
    Log    ${CountryCode}


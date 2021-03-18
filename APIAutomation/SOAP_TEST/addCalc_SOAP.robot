*** Settings ***
Library    OperatingSystem    
Library    SoapLibrary    

*** Variables ***
${wsdl}    http://www.dneonline.com/calculator.asmx?wsdl

*** Test Cases ***
ADD_Calculator
    Create SOAP Client    ${wsdl} 
    ${response}    Call SOAP Method With XML    ${CURDIR}/addRequest.xml   
    Save XML To File    ${response}    ${CURDIR}    response_testCALCULATOR
     ${AddResult}    Get Data From XML By Tag    ${response}    AddResult
    Log    ${AddResult}
   
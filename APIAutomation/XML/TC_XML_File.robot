*** Settings ***
Library    os    
Library    XML    
Library    Collections    

*** Test Cases ***
TC
    ${xml_obj}=    Parse Xml    ${CURDIR}/xml.xml    
    #check single value
    #1st way
     ${emp_firstname}=    Get Element Text    ${xml_obj}    .//employee[1]/firstname
    
     Log To Console    ${emp_firstname}   
     Should Be Equal    ${emp_firstname}    Oday
     
    #2nd way
     ${emp_firstname}=   Get Element    ${xml_obj}    .//employee[1]/firstname
    
     Log To Console    ${emp_firstname}   
     Should Be Equal    ${emp_firstname.text}    Oday
     
    #3rd way
    Element Text Should Be    ${xml_obj}    Oday    .//employee[1]/firstname
    
    #check No. of element
    ${count}=    Get Element Count    ${xml_obj}    .//employee
    Should Be Equal As Integers    ${count}    5
    
    #check attibute existance
    Element Attribute Should Be    ${xml_obj}    id    2    .//employee[2]
    
    #check value of chiled element
    ${child_element}=    Get Child Elements    ${xml_obj}    .//employee[2]
    Should Not Be Empty    ${child_element}    
    
    ${fname}=    Get Element Text    ${child_element[0]}    
    ${title}=    Get Element Text    ${child_element[2]}
    
    Log To Console    ${fname}    
    
    Log To Console    ${title}        
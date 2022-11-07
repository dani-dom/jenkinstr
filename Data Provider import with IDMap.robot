*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Resource    ./UsefulKeyWords.robot 
Variables  Robot_Pass_Fail_Report_To_Jama.py

#Test Teardown    Close All Browsers
#Resource    ./Test.robot

*** Variables ***
${TestCase_Name}=    Data_Provider_import_with_IDMap
${JamaPlan_ID}=    2686458



*** Test Cases ***
Web Platfom and DTC Login
    [Tags]    Complete
    #Response Initial Status
    Administration Privileges for Group and Console
Swagger Test
    [Tags]    Complete
    Swagger POST Data Set Creation    DSpath=${DSPostWithMap}
    Swagger POST Data Providers Creation    DPpath=${DPPostWithMap}
    Swagger GET Data Providers Id    datapdatasetid=${datasetid}    number=2  
    Swagger PATCH Add Data to a Data Provider    datasetused=${datasetid}  ids=${dataproviderid1}    file=${PDIBodyFileWithMap}    idpath=${ImportBodyID}  
    Swagger GET 200 ID data Import Request    importid=${PDIid}  
    Swagger PATCH Add Data to a Data Provider    datasetused=${datasetid}  ids=${dataproviderid2}    file=${PDIBodyFileWithMap2}    idpath=${ImportBodyID2}    
    Swagger GET 200 ID data Import Request    importid=${PDIid} 
    Swagger DELETE Data Set with ID   datasetidelete=${datasetid}
    #${Status}  set variable  PASS
    #Set global variable  ${Status}
    Close All Browsers
    #Response Final Status

#Jama Report
 #   Jama_Report  ${TestCase_Name}  ${Status}  ${JamaPlan_ID}  ${${Browser}_${TestCase_Name}_JTC_ID}

*** Settings ***
Documentation                         Common Keywords
Library                               ../Libraries/CustomMethod.py
Library                               JSONLibrary
Library                               Collections


#${expected_Content-Type}              application/json; charset=utf-8
#${Status_Message}                     OK
#${Json_file}                          ../Abstract API/JSON files/response.json
#${schema_file}                        ../Abstract API/JSON files/schema.json
#
#${repo_path}             ../Abstract API/JSON files/harsha-p.jpg
#${text_path}             ../Abstract API/JSON files/admin.txt
*** Keywords ***

Create Token Dictionary
     [arguments]                          ${Headers}=${EMPTY}        ${token}=${EMPTY}      ${app_ID}=${EMPTY}
     &{Header}=              Create Dictionary
     IF  "${Headers}" != "${EMPTY}"
           Set To Dictionary    ${Header}    Content-Type       ${Headers}
     END
     IF  "${token}" != "${EMPTY}"
            Set To Dictionary    ${Header}     Authorization      Bearer ${TOKEN}
     END
     IF  "${app_ID}" != "${EMPTY}"
            Set To Dictionary    ${Header}     app-id        ${app_ID}
     END
     [Return]                           ${Header}
Create form-data dictionary
    ${file_stream} =    Get File For Streaming Upload    ${image_path}
    ${data}=          Create Dictionary        avatar=${file_stream}
    [Return]         ${data}
#Create form-data1 dictionary
#    ${file_stream} =    Get File For Streaming Upload    ${text_path}
#    ${key2}=     Get File For Streaming Upload    ${repo_path}
#    ${data}=          Create Dictionary        avatar=${file_stream}
#    Set To Dictionary     ${data}      key2=${key2}
#    [Return]         ${data}
Validate status code
    [arguments]               ${status_code}       ${expected_status_message}
    Should Be Equal As Strings   ${expected_status_message}  ${response.reason}
    ${expected_status_code}=    Convert To String      ${status_code}
    status should be        ${expected_status_code}          ${response}

Validate Header
    [arguments]                 ${Expected_Content-Type}
    ${content_type} =	        Get From Dictionary 	${response.headers}     	Content-Type
    should contain       ${content_type}              ${expected_Content-Type}

Verifying response time
    log to console           ${response.elapsed.total_seconds()}

Verifying Schema
    [arguments]          ${Expected_Json_Schema}
    ${schema}=        load json from file       ${Expected_Json_Schema}
    validate json by schema       ${response.json()}        ${schema}




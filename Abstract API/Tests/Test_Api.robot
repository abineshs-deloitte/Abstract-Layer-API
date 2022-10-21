*** Settings ***
Documentation           Abstract layer Implementation of APIs library
Variables                ../Libraries/constants.py
Variables                ../Libraries/data.py
Resource                ../Resources/Pages/Request_Library.robot
Resource                ../Resources/commonKeywords.robot
Library                 Collections

*** Test Cases ***
Validating the API using Post method
    ${Headers}=          Create Token Dictionary         ${json_header}
    ${body}=     	Convert String to JSON	${login}
    Validate API calls using different method     ${BASEURL}      ${login_endpoint}        ${Post_Method}     ${Headers}       ${body}
    extracting token           extract_token_path=['token']
    Validate status code        ${success_status_code}       ${success_status_message}
    Validate Header             ${json_header}
    Verifying response time
    Verifying Schema            ${login_schema}

Validating the API using Get method
    ${Headers}=          Create Token Dictionary         ${json_header}        token=${Token}
    Validate API calls using different method     ${BASEURL}      ${user_endpoint}         ${Get_Method}     ${Headers}        query_param=${query_parameter}
    Validate status code        ${success_status_code}       ${success_status_message}
    Validate Header             ${json_header}
    Verifying response time
    Verifying Schema            ${user_schema}

Validating the API using Put method
    ${Headers}=          Create Token Dictionary         ${json_header}         token=${Token}
    ${body}=     	Convert String to JSON	${update_profile}
    Validate API calls using different method     ${BASEURL}      ${update_profile_endpoint}         ${Put_Method}      ${Headers}        ${body}
    Validate status code        ${success_status_code}       ${success_status_message}
    Validate Header             ${json_header}
    Verifying response time
    Verifying Schema            ${update_profile_schema}

Validating the API using form data
    ${Headers}=          Create Token Dictionary              token=${Token}
    ${form_data}=        Create form-data dictionary
    Validate API calls using different method    ${BASEURL}      ${file_upload_Endpoint}         ${Post_Method}      ${Headers}       Form_Data=${form_data}        file_type=${file_type_files}
    Validate status code        ${success_status_code}       ${success_status_message}
    Validate Header             ${json_header}
    Verifying response time

Validating the API which accepts text method
    ${Headers}=          Create Token Dictionary      ${text_header}
    Validate API calls using different method     ${BASEURL2}     ${text_endpoint}        ${Post_Method}           body=${update_data}
    Validate status code        ${success_status_code}       ${success_status_message}
    Validate Header             ${text_content_type}

*** Settings ***
Library                            RequestsLibrary
Library                            OperatingSystem
Library                            JSONLibrary

*** Keywords ***
Validate API calls using different method
    [arguments]     ${BASE_URL}      ${ENDPOINT}        ${METHOD}      ${Header}=${EMPTY}       ${body}=${EMPTY}     ${query_param}=${EMPTY}       ${Form_Data}=${EMPTY}     ${file_type}=${EMPTY}
    [Documentation]                 Validate layer implementation using  method
    ${response}=                  Hit the api and generating the response    ${BASE_URL}         ${ENDPOINT}      ${Header}    ${METHOD}     ${body}    ${query_param}    ${Form_Data}      ${file_type}
    Set Global Variable     ${response}

extracting token
    [arguments]         ${extract_token_path}
    ${Token}      Set Variable        ${response.json() ${extract_token_path}}
    Set Global Variable     ${Token}


Hit the api and generating the response
    [arguments]   ${BASE_URL}      ${POST_ENDPOINT}       ${HEADER}       ${METHOD}  ${body}    ${query_param}   ${Form_Data}     ${file_type}
     IF  "${Form_Data}" != "${EMPTY}"
        ${response}=        Run Keyword       ${METHOD}         ${BASE_URL}${POST_ENDPOINT}        params=${query_param}         headers=${HEADER}       ${file_type}=${Form_Data}
        log to console   ${response.headers}
     ELSE IF   "${body}" != "${EMPTY}"
        TRY
                ${type}=     Evaluate  isinstance(${body},dict)
                ${response}=        Run Keyword       ${METHOD}         ${BASE_URL}${POST_ENDPOINT}        params=${query_param}         headers=${HEADER}       json=${body}
        EXCEPT
#                ${text_body}=       get file            ${body}
                ${response}=        Run Keyword       ${METHOD}         ${BASE_URL}${POST_ENDPOINT}        params=${query_param}         headers=${HEADER}       data=${body}
        END
     ELSE
          ${response}=       Run Keyword      ${METHOD}     ${BASE_URL}${POST_ENDPOINT}        params=${query_param}         headers=${HEADER}
     END
    [Return]    ${response}



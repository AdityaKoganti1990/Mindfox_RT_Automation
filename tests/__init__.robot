*** Settings ***
Library           FlaUILibrary
Library           Process
Resource          ../resources/login.resource

#Suite Setup       Open Application For Suite
#Suite Teardown    Close Application For Suite

*** Variables ***
${pid}    NONE

*** Keywords ***

Open Application For Suite
    ${is_running}=    Run Keyword And Return Status
    ...    Get Process Id    FoxViewerDesktop.exe

    IF    not ${is_running}
        ${app_pid}=    Open FoxViewerDesktop Application
        Set Suite Variable    ${pid}    ${app_pid}
        Sleep    2s
        Login To FoxViewerDesktop    Sri    Sri
        Main Window Should Be Open
    ELSE
        ${existing_pid}=    Get Process Id    FoxViewerDesktop.exe
        Set Suite Variable    ${pid}    ${existing_pid}
    END

Close Application For Suite
    Run Keyword If    '${pid}' != 'NONE'
    ...    Close FoxViewerDesktop Application    ${pid}

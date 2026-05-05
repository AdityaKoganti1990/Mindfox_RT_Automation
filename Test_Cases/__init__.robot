*** Settings ***
Documentation     Mindfox RT Automation root suite. Total Test Cases: 211.
...    Login: 5 | General: 29 | Annotations: 31 | Tools: 48 | Actions: 20 | Image Viewer: 65 | Online Mode: 13.
Library           FlaUILibrary
Library           Process
Library           ../lib/display_check.py
Resource          ../resources/login.resource

Suite Setup        Verify Display Settings
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
        Login To FoxViewerDesktop    admin    admin
        Main Window Should Be Open
    ELSE
        ${existing_pid}=    Get Process Id    FoxViewerDesktop.exe
        Set Suite Variable    ${pid}    ${existing_pid}
    END

Close Application For Suite
    Run Keyword If    '${pid}' != 'NONE'
    ...    Close FoxViewerDesktop Application    ${pid}

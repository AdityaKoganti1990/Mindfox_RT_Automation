*** Settings ***
Documentation     Mindfox RT Automation root suite. Total Test Cases: 340.
...    Login: 5 | General: 72 | Annotations: 33 | Tools: 78 | Actions: 24 | Image Viewer: 78 | Online Mode: 18 | Bug Cases: 32.
Library           FlaUILibrary
Library           Process
Library           ../lib/display_check.py
Resource          ../resources/login.resource
Suite Setup        Verify Display Settings
# Suite Teardown     Run Keywords    Restore Display Settings    AND    Shutdown PC
# Suite Teardown    Close Application For Suite
*** Variables ***
${pid}    NONE

*** Keywords ***

Open Application For Suite
    ${is_running}=    Run Keyword And Return Status
    ...    Get Process Id    FoxViewerDesktop.exe

    IF    not ${is_running}
        Open FoxViewerDesktop Application
        Set Suite Variable    ${pid}    ${APP_PID}
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

Shutdown PC
    Run Process    powershell    -ExecutionPolicy    Bypass    -File    ${CURDIR}/../lib/prompt_shutdown.ps1

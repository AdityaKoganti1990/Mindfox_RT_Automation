*** Settings ***
Documentation     Mindfox RT Automation root suite. Total Test Cases: 333.
...    Login: 5 | General: 43 | Annotations: 31 | Tools: 64 | Actions: 20 | Image Viewer: 65 | Online Mode: 15 | Bug Cases: 90.
Library           FlaUILibrary
Library           Process
Library           ../lib/display_check.py
Resource          ../resources/login.resource

# Suite Setup        Verify Display Settings
# Suite Teardown     Run Keywords    Restore Display Settings    AND    Shutdown PC
#Suite Teardown    Close Application For Suite

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

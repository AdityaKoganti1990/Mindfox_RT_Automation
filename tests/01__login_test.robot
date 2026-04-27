*** Settings ***
Library           FlaUILibrary
Library           Process
Library           AutoItLibrary
Resource          ../resources/login.resource

*** Test Cases ***

MFRTL01 - Verify invalid login credentials show appropriate error message
    [Documentation]    Verify that invalid login credentials show the appropriate error message
    [Tags]    smoke    login
    
    Open FoxViewerDesktop Application
    Login To FoxViewerDesktop    invalid_user    invalid_pass
    Verify Invalid Warning Text
    Log    Invalid login validation completed

MFRTL02 - Verify that the login window can be closed using the close button
    [Documentation]    Verify that the login window can be closed using the close button
    [Tags]    smoke    login

    Click Login Close Button
    Login Window Should Be Closed

MFRTL03 - Verify that the application version is displayed on the login screen
    [Documentation]    Verify that the application version is displayed on the login screen
    [Tags]    smoke    login

    Open FoxViewerDesktop Application
    App Version Text Should Present in login screen

MFRTL04 - Verify valid login credentials allow access to the application
    [Documentation]    Verify that valid login credentials allow access to the application
    [Tags]    smoke    login

    Click Login Close Button
    Open FoxViewerDesktop Application
    Login To FoxViewerDesktop    admin    admin
    Main Window Should Be Open

    Log    Valid login validation completed

MFRTL05 - Verify whether able to close the application using the close button on the main window
    [Documentation]    Verify whether able to close the application using the close button on the main window
    [Tags]    smoke    login

    Click Main Window Close Button
    Main Window Should Be Closed

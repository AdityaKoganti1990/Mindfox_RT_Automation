*** Settings ***
Library           FlaUILibrary
Library           Process
Library           AutoItLibrary
Resource          ../resources/login.resource
Resource          ../resources/General.resource
Resource          ../resources/imageviewer.resource

*** Variables ***
${names}
${Login_window_name}    FoXpert RT - Login

*** Test Cases ***

MFRTG01 - Verify whether able to open projection window from main window
    [Documentation]    Verify whether able to open projection window from main window
    [Tags]    smoke    general

    Open FoxViewerDesktop Application
    Login To FoxViewerDesktop    admin    admin
    Main Window Should Be Open
    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.dcm

MFRTG02 - Verify whether able to close Project.
    [Documentation]    Verify whether able to close Project
    [Tags]    smoke    general
    Close Project
    ${result}=    Element Should Be Disabled    ${Button_Clear_XPATH}
    Should Be Equal As Strings    ${result}    None

MFRTG03 - Verify whether able to load Project folder into application
    [Documentation]    Verify whether able to load Project folder into application
    [Tags]    smoke    general
    Open FolderSet    ${folder_Directory_Path}
    Sleep    1s
    ${result1}=    Element Should Exist    //*[@Name="dp080922 .dcm"]
    Should Be Equal As Strings    ${result1}    True
    ${result2}=    Element Should Exist    //*[@Name="dp081522a.dcm"]
    Should Be Equal As Strings    ${result2}    True
    ${result3}=    Element Should Exist    //*[@Name="DuplexPlate_With_RT.dcm"]
    Should Be Equal As Strings    ${result3}    True
    ${result4}=    Element Should Exist    //*[@Name="MLE_4_0.237.dcm"]
    Should Be Equal As Strings    ${result4}    True
    ${result5}=    Element Should Exist    //*[@Name="MLE_6_0.280.dcm"]
    Should Be Equal As Strings    ${result5}    True
    ${result6}=    Element Should Exist    //*[@Name="MLE_8''0.322.dcm"]
    Should Be Equal As Strings    ${result6}    True
    ${result7}=    Element Should Exist    ${Button_Clear_XPATH}
    Should Be Equal As Strings    ${result7}    True

MFRTG04 - Verify whether able to close Project folder into application
    [Documentation]    Verify whether able to close Project
    [Tags]    smoke    general
    Close Project
    ${result}=    Element Should Be Disabled    ${Button_Clear_XPATH}
    Should Be Equal As Strings    ${result}    None

MFRTG05 - Verify whether able to open Reference Radiograph Atlas from main window
    [Documentation]    Verify whether able to open Reference Radiograph Atlas from main window
    [Tags]    smoke    general
    Open Reference Radiograph Atlas
    Verify window is Opened    Reference Radiograph Atlas

MFRTG06 - Verify whether able to close Reference Radiograph Atlas from main window
    [Documentation]    Verify whether able to close Reference Radiograph Atlas from main window
    [Tags]    smoke    general
    Close Reference Radiograph Atlas
    Verify window is Closed    Reference Radiograph Atlas

MFRTG07 - Verify whether user manual button is available in the application.
    [Documentation]    Verify whether user manual button is available in the application.
    [Tags]    smoke    general
    ${STATUS}=    Element Should Exist    ${User_Manual_Button_XPATH}
    Should Be Equal As Strings    ${STATUS}    True

MFRTG08 - Verify whether able to open audit logs window
    [Documentation]    Verify whether able to open audit logs window
    [Tags]    smoke    general
    Open audit Logs
    Verify window is Opened    Audit Log 

MFRTG09 - Verify whether able to close audit logs window
    [Documentation]    Verify whether able to close audit logs window
    [Tags]    smoke    general
    Close audit Logs
    Verify window is Closed    Audit Log

MFRTG10 - Verify whether able to open service support window
    [Documentation]    Verify whether able to open service support window
    [Tags]    smoke    general
    Open Service Support
    Verify window is Opened    Service Support

MFRTG11 - Verify whether able to close service support window
    [Documentation]    Verify whether able to close service support window
    [Tags]    smoke    general
    Close Service Support
    Verify window is Closed    Service Support

MFRTG12 - Verify whether able to switch to light theme.
    [Documentation]    Verify whether able to switch to light theme
    [Tags]    smoke    general
    Switch Between Window Theme
    Take WindowScreenshot for Comparison    MFRTG12.png
    Compare Result Images    MFRTG12.png    MFRTG12.png

MFRTG13 - Verify whether able to switch to dark theme.
    [Documentation]    Verify whether able to switch to dark theme
    [Tags]    smoke    general
    Switch Between Window Theme
    Take WindowScreenshot for Comparison    MFRTG13.png
    Compare Result Images    MFRTG13.png    MFRTG13.png
MFRTG14 - Verify whether able to set UI scale for RT application.
    [Documentation]    Verify whether able to set UI scale for RT application
    [Tags]    smoke    general
    Set UI Scale For RT Application    125%
    Take WindowScreenshot for Comparison    MFRTG14_1.png
    Run Keyword And Continue On Failure   Compare Result Images    MFRTG14_1.png    MFRTG14_1.png
    Set UI Scale For RT Application    100%
    Take WindowScreenshot for Comparison    MFRTG14_2.png
    Compare Result Images    MFRTG14_2.png    MFRTG14_2.png

MFRTG15 - Verify the UI scale options available in the application.
    [Documentation]    Verify the UI scale options available in the application
    [Tags]    smoke    general
    
    ${options}=    Get All Names From Combobox      ${UI_Scale_Combobox_XPATH}
    List Should Contain Value    ${options}    75
    List Should Contain Value    ${options}    80
    List Should Contain Value    ${options}    90
    List Should Contain Value    ${options}    100
    List Should Contain Value    ${options}    125
    List Should Contain Value    ${options}    150
    List Should Contain Value    ${options}    175
    List Should Contain Value    ${options}    200
    List Should Contain Value    ${options}    225
    List Should Contain Value    ${options}    250
    List Should Contain Value    ${options}    300
MFRTG16 - Verify whether able to minimize application window.
        [Documentation]    Verify window can be minimized
    [Tags]    smoke    login    window-state

    Minimize FoxRT Window
    Wait Until Keyword Succeeds    5x    1s    Assert Window Is Minimized

    Log    Window maximize validation completed

MFRTG17 - Verify Window Can Be Restored From Minmized State
    [Documentation]    Verify window can be restored from Minmized state
    [Tags]    smoke    login    window-state

    Restore FoxRT Window
    Wait Until Keyword Succeeds    5x    1s    Assert Window Is Maximized

    Log    Window restore validation completed

MFRTG19 - Verify whether able to open Help Window.
    [Documentation]    Verify whether able to open Help Window
    [Tags]    smoke    general
    Open Help Menu
    Verify window is Opened    About FoXpert

MFRTG20 - Verify whether the version is shown in the about menu.
    [Documentation]    Verify whether the version is shown in the about menu
    [Tags]    smoke    general
    App Version Text Should Present
    Assert the Version

MFRTG21 - Verify whether sales id is shown in the about menu.
    [Documentation]    Verify whether sales id is shown in the about menu
    [Tags]    smoke    general
    Sales Id Text Should Present

MFRTG22 - Verify whether Web site address is shown in the about menu.
    [Documentation]    Verify whether Web site address is shown in the about menu
    [Tags]    smoke    general
    WebSite Text Should Present

MFRTG23 - Verify whether able to close Help Window.
    [Documentation]    Verify whether able to close Help Window
    [Tags]    smoke    general
    Close Help Menu
    Verify window is Closed    About FoXpert

MFRTG24 - Verify whether able to open UserManagement Window.
    [Documentation]    Verify whether able to open UserManagement Window
    [Tags]    smoke    general
    Open UserManagement Window
    Verify window is Opened    User Management

MFRTG25 - Verify whether able to add a new user in UserManagement Window.
    [Documentation]    Verify whether able to add a new user in UserManagement Window
    [Tags]    smoke    general
    Add New User In UserManagement Window    User1    User1    Level I    5555    Mindfox
    Verify New User Added In UserManagement Window    User1

MFRTG26 - Verify whether able to delete a user from UserManagement Window.
    [Documentation]    Verify whether able to delete a user from UserManagement Window
    [Tags]    smoke    general
    Delete User From UserManagement Window    User1
    Verify User Deleted From UserManagement Window    User1

MFRTG27 - Verify whether able to close UserManagement Window.
    [Documentation]    Verify whether able to close UserManagement Window
    [Tags]    smoke    general
    Close UserManagement Window
    Verify window is Closed    User Management

MFRTG28 - Verify whether able to logout from application.
    [Documentation]    Verify whether able to logout from application
    [Tags]    smoke    general
    Logout From FoxViewerDesktop
    Verify window is Opened    ${Login_window_name}

MFRTG29 - Verify whether able to re-login to application after logout.
    [Documentation]    Verify whether able to re-login to application after logout
    [Tags]    smoke    general
    Login To FoxViewerDesktop    admin    admin
    Main Window Should Be Open

MFRTG30 - Verify whether able to close application window.
    [Documentation]    Verify whether able to close application window
    [Tags]    smoke    general
    Close FoxRT Application Window
    Verify Application Is Closed

    





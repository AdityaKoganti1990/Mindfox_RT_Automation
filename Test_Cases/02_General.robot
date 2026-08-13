*** Settings ***
Documentation     General application test suite. Total Test Cases: 72 (MFRTG01 - MFRTG72).
Library           FlaUILibrary
Library           Process
Library           AutoItLibrary
Resource          ../resources/login.resource
Resource          ../resources/General.resource
Resource          ../resources/Online.resource

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
    ${result1}=    Element Should Exist    /Window/Tab/TabItem/List/ListItem/Text[@Name="dp080922 .dcm"]
    Should Be Equal As Strings    ${result1}    True
    ${result2}=    Element Should Exist    /Window/Tab/TabItem/List/ListItem/Text[@Name="dp081522a.dcm"]
    Should Be Equal As Strings    ${result2}    True
    ${result3}=    Element Should Exist    /Window/Tab/TabItem/List/ListItem/Text[@Name="DuplexPlate_With_RT.dcm"]
    Should Be Equal As Strings    ${result3}    True
    ${result4}=    Element Should Exist    /Window/Tab/TabItem/List/ListItem/Text[@Name="MLE_4_0.237.dcm"]
    Should Be Equal As Strings    ${result4}    True
    ${result5}=    Element Should Exist    /Window/Tab/TabItem/List/ListItem/Text[@Name="MLE_6_0.280.dcm"]
    Should Be Equal As Strings    ${result5}    True
    ${result6}=    Element Should Exist    /Window/Tab/TabItem/List/ListItem/Text[@Name="MLE_8''0.322.dcm"]
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
    # List Should Contain Value    ${options}    150
    # List Should Contain Value    ${options}    175
    # List Should Contain Value    ${options}    200
    # List Should Contain Value    ${options}    225
    # List Should Contain Value    ${options}    250
    # List Should Contain Value    ${options}    300
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
    sleep    0.2s
    Focus    ${MAIN_WINDOW_XPATH}
    Resize FoxRT Application Window    10    10    1850    1000

    Log    Window restore validation completed
MFRTG18 - Verify whether able to open Help Window.
    [Documentation]    Verify whether able to open Help Window
    [Tags]    smoke    general
    Open Help Menu
    Verify window is Opened    About FoXpert
MFRTG19 - Verify whether the version is shown in the about menu.
    [Documentation]    Verify whether the version is shown in the about menu
    [Tags]    smoke    general
    App Version Text Should Present
    Assert the Version
MFRTG20 - Verify whether sales id is shown in the about menu.
    [Documentation]    Verify whether sales id is shown in the about menu
    [Tags]    smoke    general
    Sales Id Text Should Present
MFRTG21 - Verify whether Web site address is shown in the about menu.
    [Documentation]    Verify whether Web site address is shown in the about menu
    [Tags]    smoke    general
    WebSite Text Should Present
MFRTG22 - Verify whether able to close Help Window.
    [Documentation]    Verify whether able to close Help Window
    [Tags]    smoke    general
    Close Help Menu
    Verify window is Closed    About FoXpert
MFRTG23 - Verify whether able to open UserManagement Window.
    [Documentation]    Verify whether able to open UserManagement Window
    [Tags]    smoke    general
    Open UserManagement Window
    Verify window is Opened    User Management
MFRTG24 - Verify whether able to add a new user in UserManagement Window.
    [Documentation]    Verify whether able to add a new user in UserManagement Window
    [Tags]    smoke    general
    Add New User In UserManagement Window    User1    User1    Level I    5555    Mindfox
    Verify New User Added In UserManagement Window    User1    
MFRTG25 - Verify whether able to delete a user from UserManagement Window.
    [Documentation]    Verify whether able to delete a user from UserManagement Window
    [Tags]    smoke    general
    Delete User From UserManagement Window    User1
    Verify User Deleted From UserManagement Window    User1
MFRTG26 - Verify whether able to close UserManagement Window.
    [Documentation]    Verify whether able to close UserManagement Window
    [Tags]    smoke    general
    Close UserManagement Window
    Verify window is Closed    User Management
MFRTG27 - Verify whether able to logout from application.
    [Documentation]    Verify whether able to logout from application
    [Tags]    smoke    general
    Logout From FoxViewerDesktop
    Verify window is Opened    ${Login_window_name}
MFRTG28 - Verify whether able to re-login to application after logout.
    [Documentation]    Verify whether able to re-login to application after logout
    [Tags]    smoke    general
    Login To FoxViewerDesktop    admin    admin
    Main Window Should Be Open
MFRTG29 - Verify whether able to close application window.
    [Documentation]    Verify whether able to close application window
    [Tags]    smoke    general
    Close FoxRT Application Window
    Verify Application Is Closed
MFRTG30 - Verify whether shortcut keys are working for opening files.
    [Documentation]    Verify whether shortcut keys are working for opening files
    [Tags]    smoke    general

    Open FoxViewerDesktop Application
    Login To FoxViewerDesktop    admin    admin
    Press Shortcut Keys    Open File
    Run Keyword And Continue On Failure   Verify window is Opened    Open DICOM / Image Files
    Sleep    0.2s
    Win Close    Open DICOM / Image Files
    Win Wait Close    Open DICOM / Image Files
MFRTG31 - Verify whether shortcut keys are working for export image.
    [Documentation]    Verify whether shortcut keys are working for export image
    [Tags]    smoke    general

    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.dcm
    Press Shortcut Keys    Export Image
    Run Keyword And Continue On Failure   Verify window is Opened    Export Image
    Win Close    Export Image
    Win Wait Close    Export Image
MFRTG32 - Verify whether shortcut keys are working for Open DICOM tag browser.
    [Documentation]    Verify whether shortcut keys are working for Open DICOM tag browser
    [Tags]    smoke    general

    Press Shortcut Keys    DICOM Tag Browser
    Run Keyword And Continue On Failure   Verify window is Opened    DICOM Tag Browser
    Win Close    DICOM Tag Browser
    Win Wait Close    DICOM Tag Browser
MFRTG33 - Verify whether shortcut keys are working for Resetting the view.
    [Documentation]    Verify whether shortcut keys are working for Resetting the view
    [Tags]    smoke    general

    Apply Window Level    1    845    470    1050    570
    Take Actual Screenshot    MFRTG33_before.png
    Press Shortcut Keys    Reset View
    Take Actual Screenshot    MFRTG33_after.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTG33_before.png    MFRTG33_before.png    98
    Run Keyword And Continue On Failure    Compare Result Images    MFRTG33_after.png    MFRTG33_after.png    98
    Run Keyword And Continue On Failure    Compare Result Images    MFRTG33_before.png    MFRTG33_after.png    98    False
    Click    ${window_level_tool_button_xpath}
    Apply Auto Best BNC
MFRTG34 - Verify whether shortcut keys are working for applying invert.
    [Documentation]    Verify whether shortcut keys are working for applying invert
    [Tags]    smoke    general

    Press Shortcut Keys    Toggle Invert
    Take Actual Screenshot    MFRTG34_invert.png
    Run Keyword And Continue On Failure   Compare Result Images    MFRTG34_invert.png    MFRTG34_invert.png    98
    Press Shortcut Keys    Toggle Invert
    Apply Auto Best BNC
MFRTG35 - Verify whether shortcut keys are working for opening report viewer window.
    [Documentation]    Verify whether shortcut keys are working for opening report viewer window
    [Tags]    smoke    general

    Press Shortcut Keys    Generate PDF Report
    Run Keyword And Continue On Failure   Verify window is Opened    Generate Report
    Win Close    Generate Report
    Win Wait Close    Generate Report
MFRTG36 - Verify able to fit image to view using shortcut keys.
    [Documentation]    Verify able to fit image to view using shortcut keys
    [Tags]    smoke    general

    Zoom Image Viewer    ZoomIn    3
    Take Actual Screenshot    MFRTG36_before.png
    Run Keyword And Continue On Failure   Compare Result Images    MFRTG36_before.png    MFRTG36_before.png    98
    Press Shortcut Keys    Fit Image
    Take Actual Screenshot    MFRTG36_fittoview.png
    Run Keyword And Continue On Failure   Compare Result Images    MFRTG36_fittoview.png    MFRTG36_fittoview.png    98
    Run Keyword And Continue On Failure   Compare Result Images    MFRTG36_before.png    MFRTG36_fittoview.png    98    False
    Reset View
    Apply Auto Best BNC
MFRTG37 - Verify whether shortcut keys are working for zooming in the image.
    [Documentation]    Verify whether shortcut keys are working for zooming in the image
    [Tags]    smoke    general

    Take Actual Screenshot    MFRTG37_before.png
    Press Shortcut Keys    Zoom In
    Take Actual Screenshot    MFRTG37_after.png
    Run Keyword And Continue On Failure   Compare Result Images    MFRTG37_after.png    MFRTG37_after.png    98
    Run Keyword And Continue On Failure   Compare Result Images    MFRTG37_before.png    MFRTG37_after.png    98    False
    Reset View
    Apply Auto Best BNC
MFRTG38 - Verify whether shortcut keys are working for zooming out the image.
    [Documentation]    Verify whether shortcut keys are working for zooming out the image
    [Tags]    smoke    general

    Take Actual Screenshot    MFRTG38_before.png
    Press Shortcut Keys    Zoom Out
    Take Actual Screenshot    MFRTG38_after.png
    Run Keyword And Continue On Failure   Compare Result Images    MFRTG38_after.png    MFRTG38_after.png    98
    Run Keyword And Continue On Failure   Compare Result Images    MFRTG38_before.png    MFRTG38_after.png    98    False
    Reset View
    Apply Auto Best BNC
    Close Project
MFRTG39 - Verify whether shortcut keys are working for navigating to previous and next file.
    [Documentation]    Verify whether shortcut keys are working for navigating to previous and next file
    [Tags]    smoke    general

    Open FolderSet    ${folder_Directory_Path}
    Sleep    1s
    Press Shortcut Keys    Next File
    Take Actual Screenshot    MFRTG39_next.png
    Run Keyword And Continue On Failure   Compare Result Images    MFRTG39_next.png    MFRTG39_next.png    98
    Press Shortcut Keys    Previous File
    Take Actual Screenshot    MFRTG39_previous.png
    Run Keyword And Continue On Failure   Compare Result Images    MFRTG39_previous.png    MFRTG39_previous.png    98
    Run Keyword And Continue On Failure   Compare Result Images    MFRTG39_previous.png    MFRTG39_next.png    98    False
MFRTG40 - Verify whether shortcut keys are working for first and last file navigation.
    [Documentation]    Verify whether shortcut keys are working for first and last file navigation
    [Tags]    smoke    general

    Press Shortcut Keys    Last File
    Take Actual Screenshot    MFRTG40_last.png
    Run Keyword And Continue On Failure   Compare Result Images    MFRTG40_last.png    MFRTG40_last.png    98
    Press Shortcut Keys    First File
    Take Actual Screenshot    MFRTG40_first.png
    Run Keyword And Continue On Failure   Compare Result Images    MFRTG40_first.png    MFRTG40_first.png    98
    Run Keyword And Continue On Failure   Compare Result Images    MFRTG40_first.png    MFRTG40_last.png    98    False
    Close Project
MFRTG41 - Verify whether shortcut keys are working for deleting the selected annotation.
    [Documentation]    Verify whether shortcut keys are working for deleting the selected annotation
    [Tags]    smoke    general

    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.dcm
    Add Annotation at custom position    Ruler    845    470    1050    570
    Take Actual Screenshot    MFRTG41_before.png
    Run Keyword And Continue On Failure   Compare Result Images    MFRTG41_before.png    MFRTG41_before.png    98
    Select Annotation At Custom Position    845    470
    Press Shortcut Keys    Delete
    Take Actual Screenshot    MFRTG41_after.png
    Run Keyword And Continue On Failure   Compare Result Images    MFRTG41_after.png    MFRTG41_after.png    98
    Run Keyword And Continue On Failure   Compare Result Images    MFRTG41_before.png    MFRTG41_after.png    100    False
    Reset View
    Apply Auto Best BNC
MFRTG42 - Verify whether shortcut keys are working for cancelling/clear annotation or tool selection.
    [Documentation]    Verify whether shortcut keys are working for cancelling/clear annotation or tool selection
    [Tags]    smoke    general

    Click    ${arrow_annotation_button_xpath}
    Run Keyword And Continue On Failure   Verify Annotation Tool Selected    Arrow    Selected
    Press Shortcut Keys    Escape
    Run Keyword And Continue On Failure   Verify Annotation Tool Selected    Arrow    Not Selected
    Click    ${line_profiler_tool_button_xpath}
    Press Shortcut Keys    Escape
    Run Keyword And Continue On Failure   Verify Tool Selected    Line Profiler    Not Selected
    Click    ${window_level_tool_button_xpath}
    Press Shortcut Keys    Escape
    Run Keyword And Continue On Failure   Verify Tool Selected    Window Level    Not Selected
MFRTG43 - Verify whether CPU/GPU Info window is opening successfully.
    [Documentation]    Verify whether CPU/GPU Info window is opening successfully
    [Tags]    smoke    general

    Select GPU Type    gpu_type=Info
    Sleep    0.2s
    Verify window is Opened    GPU Rendering Info
    Close GPU/CPU Rendering Info Window
    Close Project
MFRTG44 - Verify whether able to open .png files in image viewer.
    [Documentation]    This test case is to verify whether able to open .png files in image viewer.
    
    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.png
    Take Actual Screenshot    MFRTG44_Actual.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTG44_Actual.png    MFRTG44_Actual.png
MFRTG45 - Verify whether able to add annotations to .png files in image viewer.
    [Documentation]    This test case is to verify whether able to add annotations to .png files in image viewer.
    
    Add Text Annotation    This is a text annotation
    Take Actual Screenshot    MFRTG45_Actual.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTG45_Actual.png    MFRTG45_Actual.png
    Delete the annotation
MFRTG46 - Verify whether able to apply window level to .png files in image viewer.
    [Documentation]    This test case is to verify whether able to apply window level to .png files in image viewer.
    
    Apply Window Level    2    845    470    1050    570
    Take Actual Screenshot    MFRTG46_Actual.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTG46_Actual.png    MFRTG46_Actual.png
    Click    ${window_level_tool_button_xpath}
MFRTG47 - Verify whether able to apply filter to .png files in image viewer.
    [Documentation]    This test case is to verify whether able to apply filter to .png files in image viewer.

    Apply Fox Bleach Filter    True
    Take Actual Screenshot    MFRTG47_Actual.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTG47_Actual.png    MFRTG47_Actual.png
    Reset View
    Close Project
MFRTG48 - Verify whether able to open .jpg files in image viewer.
    [Documentation]    This test case is to verify whether able to open .jpg files in image viewer.

    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.jpg
    Take Actual Screenshot    MFRTG48_Actual.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTG48_Actual.png    MFRTG48_Actual.png
MFRTG49 - Verify whether able to add annotations to .jpg files in image viewer.
    [Documentation]    This test case is to verify whether able to add annotations to .jpg files in image viewer.

    Add Text Annotation    This is a text annotation
    Take Actual Screenshot    MFRTG49_Actual.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTG49_Actual.png    MFRTG49_Actual.png
    Delete the annotation    
MFRTG50 - Verify whether able to apply window level to .jpg files in image viewer.
    [Documentation]    This test case is to verify whether able to apply window level to .jpg files in image viewer.

    Apply Window Level    2    845    470    1050    570
    Take Actual Screenshot    MFRTG50_Actual.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTG50_Actual.png    MFRTG50_Actual.png
    Click    ${window_level_tool_button_xpath}
MFRTG51 - Verify whether able to apply filter to .jpg files in image viewer.
    [Documentation]    This test case is to verify whether able to apply filter to .jpg files in image viewer.

    Apply Fox Bleach Filter    True
    Take Actual Screenshot    MFRTG51_Actual.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTG51_Actual.png    MFRTG51_Actual.png
    Reset View
    Close Project
MFRTG52 - Verify whether able to open .bmp files in image viewer.
    [Documentation]    This test case is to verify whether able to open .bmp files in image viewer.

    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.bmp
    Take Actual Screenshot    MFRTG52_Actual.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTG52_Actual.png    MFRTG52_Actual.png
MFRTG53 - Verify whether able to add annotations to .bmp files in image viewer.
    [Documentation]    This test case is to verify whether able to add annotations to .bmp files in image viewer.

    Add Text Annotation    This is a text annotation
    Take Actual Screenshot    MFRTG53_Actual.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTG53_Actual.png    MFRTG53_Actual.png
    Delete the annotation
MFRTG54 - Verify whether able to apply window level to .bmp files in image viewer.
    [Documentation]    This test case is to verify whether able to apply window level to .bmp files in image viewer.

    Apply Window Level    2    845    470    1050    570
    Take Actual Screenshot    MFRTG54_Actual.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTG54_Actual.png    MFRTG54_Actual.png
    Click    ${window_level_tool_button_xpath}
MFRTG55 - Verify whether able to apply filter to .bmp files in image viewer.
    [Documentation]    This test case is to verify whether able to apply filter to .bmp files in image viewer.

    Apply Fox Bleach Filter    True
    Take Actual Screenshot    MFRTG55_Actual.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTG55_Actual.png    MFRTG55_Actual.png
    Reset View
    Close Project
MFRTG56 - Verify whether able to open .tiff files in image viewer.
    [Documentation]    This test case is to verify whether able to open .tiff files in image viewer.

    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.tiff
    Take Actual Screenshot    MFRTG56_Actual.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTG56_Actual.png    MFRTG56_Actual.png
MFRTG57 - Verify whether able to add annotations to .tiff files in image viewer.
    [Documentation]    This test case is to verify whether able to add annotations to .tiff files in image viewer.

    Add Text Annotation    This is a text annotation
    Take Actual Screenshot    MFRTG57_Actual.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTG57_Actual.png    MFRTG57_Actual.png
    Delete the annotation
MFRTG58 - Verify whether able to apply window level to .tiff files in image viewer.
    [Documentation]    This test case is to verify whether able to apply window level to .tiff files in image viewer.

    Apply Window Level    2    845    470    1050    570
    Take Actual Screenshot    MFRTG58_Actual.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTG58_Actual.png    MFRTG58_Actual.png
    Click    ${window_level_tool_button_xpath}
MFRTG59 - Verify whether able to apply filter to .tiff files in image viewer.
    [Documentation]    This test case is to verify whether able to apply filter to .tiff files in image viewer.

    Apply Fox Bleach Filter    True
    Take Actual Screenshot    MFRTG59_Actual.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTG59_Actual.png    MFRTG59_Actual.png
    Reset View
    Close Project
MFRTG60 - Verify whether able to export audit log in csv format.
    [Documentation]    This test case is to verify whether able to export audit log in csv format.

    Open audit Logs
    Apply Audit Log Filter Params    2026-05-01    2026-05-08    All    All
    Export Audit Log    MFRTG60_Audit.csv
    Run Keyword And Continue On Failure   Verify Exported File Saved    MFRTG60_Audit.csv    ${audit_log_exports_directory}
    Close audit Logs
MFRTG61 - Verify whether Clear all files button is disabled when there are no files under the Files tab.
    [Documentation]    This test case is to verify whether Clear all files button is disabled when there are no files under the Files tab.

    Close Project
    Run Keyword And Continue On Failure   VerifyControlState    control_name=${Button_Clear_XPATH}    expected_state=disabled    timeout=1s
MFRTG62 - Verify whether application theme is getting persisted after close and open application.
    [Documentation]    This test case is to verify whether application theme is getting persisted after close and open application.

    Switch Between Window Theme
    Take Actual Screenshot    MFRTG62_Actual.png
    Close FoxRT Application Window
    Open FoxViewerDesktop Application
    Login To FoxViewerDesktop    admin    admin
    Take Actual Screenshot    MFRTG62_Actual2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTG62_Actual.png    MFRTG62_Actual2.png
    Switch Between Window Theme
MFRTG63 - Verify whether status bar message is shown properly after loading files into files tab.
    [Documentation]    This test case is to verify whether status bar message is shown properly after loading files into files tab.

    Open FolderSet    ${folder_Directory_Path}
    Run Keyword And Continue On Failure    Verify Status Bar Message    Loaded 6 file(s) from folder
    Close Project
MFRTG64 - Verify whether units set in application settings are persisted on re-opening the application.
    [Documentation]    This test case is to verify whether units set in application settings are persisted on re-opening the application.

    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.dcm
    Change Units Across Application    inch
    Add Annotation    Ruler
    Take Actual Screenshot    MFRTG64_Actual.png
    Close FoxRT Application Window
    Open FoxViewerDesktop Application
    Login To FoxViewerDesktop    admin    admin
    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.dcm
    Add Annotation    Ruler
    Take Actual Screenshot    MFRTG64_Actual2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTG64_Actual.png    MFRTG64_Actual2.png
    Delete the annotation
    Change Units Across Application    mm
MFRTG65 - Verify whether able to open multiple instances of FoxRT application.
    [Documentation]    This test case is to verify that the 'FoXpert RT is already running.' warning is displayed when a second instance of FoxRT is launched while the first is still running.

    ${warning_message}=    Open FoxViewerDesktop Application
    Run Keyword And Continue On Failure    Should Contain    ${warning_message}    FoXpert RT is already running.
    ...    Expected the 'FoXpert RT is already running.' warning when launching a second instance, but got: '${warning_message}'.
MFRTG66 - Verify whether when new user is created, status is shown correct in user management window.
    [Documentation]    This test case is to verify whether when new user is created, status is shown correct in user management window.

    Open User Management Window
    Add New User In UserManagement Window    TestUser    TestPassword123    Level I    5555    Mindfox
    Run Keyword And Continue On Failure   Verify New User Added In UserManagement Window    TestUser
    Close User Management Window
MFRTG67 - Verify whether when new user is removed, status is shown correct in user management window.
    [Documentation]    This test case is to verify whether when new user is removed, status is shown correct in user management window.

    Open User Management Window
    Delete User From UserManagement Window    TestUser
    Run Keyword And Continue On Failure   Verify User Deleted From UserManagement Window    TestUser
    Close User Management Window
MFRTG68 - Verify whether image info is showing correctly for DICOM files.
    [Documentation]    This test case is to verify whether image info is showing correctly for DICOM files.

    Run Keyword And Continue On Failure    Verify Image Info    DCM    
    ...    Dimensions:1762 × 2144 px    
    ...    Pixel spacing:0.1000 × 0.1000 mm/px    
    ...    Bit depth:16-bit unsigned    
    ...    Intensity min:8520    Intensity max:51798    
    ...    Window C / W:30670 / 36944
    Close Project
MFRTG69 - Verify whether image info is showing correctly for PNG files.
    [Documentation]    This test case is to verify whether image info is showing correctly for PNG files.

    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.png
    Run Keyword And Continue On Failure    Verify Image Info    PNG    
    ...    Dimensions:1762 × 2144 px    
    ...    Pixel spacing:—    
    ...    Bit depth:8-bit unsigned    
    ...    Intensity min:0    Intensity max:255    
    ...    Window C / W:128 / 255
    Close Project
MFRTG70 - Verify whether image info is showing correctly for JPG files.
    [Documentation]    This test case is to verify whether image info is showing correctly for JPG files.

    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.jpg
    Run Keyword And Continue On Failure    Verify Image Info    JPG    
    ...    Dimensions:1762 × 2144 px    
    ...    Pixel spacing:—    
    ...    Bit depth:8-bit unsigned    
    ...    Intensity min:0    Intensity max:255    
    ...    Window C / W:128 / 255
    Close Project
MFRTG71 - Verify whether image info is showing correctly for TIFF files.
    [Documentation]    This test case is to verify whether image info is showing correctly for TIFF files.

    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.tiff
    Run Keyword And Continue On Failure    Verify Image Info    TIFF    
    ...    Dimensions:1762 × 2144 px    
    ...    Pixel spacing:—    
    ...    Bit depth:8-bit unsigned    
    ...    Intensity min:0    Intensity max:255    
    ...    Window C / W:128 / 255
    Close Project
MFRTG72 - Verify whether image info is showing correctly for BMP files.
    [Documentation]    This test case is to verify whether image info is showing correctly for BMP files.

    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.bmp
    Run Keyword And Continue On Failure    Verify Image Info    BMP    
    ...    Dimensions:1762 × 2144 px    
    ...    Pixel spacing:—    
    ...    Bit depth:8-bit unsigned    
    ...    Intensity min:0    Intensity max:255    
    ...    Window C / W:128 / 255
    Close Project
    Close FoxRT Application Window
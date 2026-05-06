*** Settings ***
Library           FlaUILibrary    screenshot_dir=${CURDIR}\\..\\Actual\\test.png
Library           ../lib/flaui_keys_patch.py
Library           Process
Library           ../lib/image_comparator.py
Library           ../lib/ironpy_remote_client.py
Library           AutoItLibrary
Library           Collections
Library           String
Resource          ../resources/login.resource
Resource          ../resources/Tools.resource
Resource          ../resources/Image Viewer Operations.resource
Resource          ../resources/Annotations.resource
*** Variables ***
${project_menu_item_xpaths}    /Window[@AutomationId="FoxRTProMainWindow"]/Button[@AutomationId="Main_Btn_OpenFile"]
${INPUT_FILE_DIALOG_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Window/ComboBox[1]/Edit[@Name="File name:"]
${INPUT_FILE_DIALOG_FALLBACK_XPATH}    /Window/Window/ComboBox[1]/Edit[@Name="File name:"]
${INPUT_FILE_DIALOG_FILENAME_CONTROL_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Window//ComboBox[@AutomationId="FileNameControlHost"]//Edit
${INPUT_FILE_DIALOG_FILENAME_CONTROL_FALLBACK_XPATH}    /Window/Window//ComboBox[@AutomationId="FileNameControlHost"]//Edit
${INPUT_FILE_DIALOG_AUTOMATION_ID_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Window//Edit[@AutomationId="1001"]
${INPUT_FILE_DIALOG_AUTOMATION_ID_FALLBACK_XPATH}    /Window/Window//Edit[@AutomationId="1001"]
${INPUT_FILE_DIALOG_BY_NAME_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Window//Edit[@Name="File name:"]
${INPUT_FILE_DIALOG_BY_NAME_FALLBACK_XPATH}    /Window/Window//Edit[@Name="File name:"]
${OPEN_BUTTON_PRIMARY_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Window//*[@AutomationId="1"]
${OPEN_BUTTON_PRIMARY_FALLBACK_XPATH}    /Window/Window//*[@AutomationId="1"]
${OPEN_BUTTON_XPATH}         /Window[@AutomationId="FoxRTProMainWindow"]/Window//*[@AutomationId="1" and @Name="Open"]
${OPEN_BUTTON_AUTOMATION_ID_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Window//SplitButton[@Name="Open"]
${OPEN_BUTTON_FALLBACK_XPATH}    /Window/Window//*[@AutomationId="1" and @Name="Open"]
${OPEN_BUTTON_AUTOMATION_ID_FALLBACK_XPATH}    /Window/Window//SplitButton[@Name="Open"]
${OPEN_BUTTON_NAME_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Window//Button[@Name="Open"]
${OPEN_BUTTON_NAME_FALLBACK_XPATH}    /Window/Window//Button[@Name="Open"]
${Button_Next_XPATH}         /Window[@AutomationId="FoxRTProMainWindow"]/Button[@AutomationId="Main_Btn_NextFile"]
${Button_Clear_XPATH}         /Window[@AutomationId="FoxRTProMainWindow"]/Tab/TabItem/Button[@AutomationId="Main_Btn_ClearFiles"]
${OpenFolder_Button_XPATH}   /Window[@AutomationId="FoxRTProMainWindow"]/Button[@AutomationId="Main_Btn_OpenFolder"]
${INPUT_FOLDER_DIALOG_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Window/Edit
${Select_Folder_XPATH}         /Window[@AutomationId="FoxRTProMainWindow"]/Window/Button[@Name="Select Folder"]
${PROJECT_CLOSE_WARNING_MESSAGE_XPATH}    //*[@AutomationId="MessageText"]
${PROJECT_CLOSE_WARNING_YES_BUTTON_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Window/Button[@Name="Yes"]
${PROJECT_CLOSE_WARNING_NO_BUTTON_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Window/Button[@Name="No"]
${PROJECT_CLOSE_WARNING_CANCEL_BUTTON_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Window/Button[@Name="Cancel"]
${PROJECT_WARNING_OK_BUTTON_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Window/Button[@Name="OK"]
${PROJECT_WARNING_OK_BUTTON_FALLBACK_XPATH}    /Window/Window/Button[@Name="OK"]
${PROJECT_DUPLICATE_FILES_WINDOW_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Duplicate Files"]
${PROJECT_DUPLICATE_FILES_WINDOW_FALLBACK_XPATH}    /Window/Window[@Name="Duplicate Files"]
${PROJECT_DUPLICATE_FILES_OK_BUTTON_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Duplicate Files"]/Button[@Name="OK"]
${PROJECT_DUPLICATE_FILES_OK_BUTTON_FALLBACK_XPATH}    /Window/Window[@Name="Duplicate Files"]/Button[@Name="OK"]
${User_Manual_Button_XPATH}    //*[@AutomationId="Main_Btn_UserManual"]
${open_about_menu_XPATH}          //*[@AutomationId="Main_Btn_About"]
${open_user_management_menu_XPATH}    //*[@AutomationId="Main_Btn_UserManagement"]
${UI_Scale_Combobox_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]//ComboBox[@AutomationId="Main_Cmb_UiScale"]
${project_Directory_Path}    ${CURDIR}\\..\\Test_Data\\
${folder_Directory_Path}     ${CURDIR}\\..\\Test_Data\\Project Folder_Set1
${Stitch_Files_Directory_Path}     ${CURDIR}\\..\\Test_Data\\StitchTestData\\
${Login_window_name}    FoXpert RT - Login
*** Keywords ***

Open ProjectFile
    [Arguments]    @{project_file_paths}
    ${project_file_path}=    Evaluate    ' '.join(['"' + p + '"' for p in $project_file_paths]) if len($project_file_paths) > 1 else $project_file_paths[0]
    ${warning_clicked}    ${duplicate_warning}=    Dismiss Project Open Warning Popup If Present
    ${clear_enabled_before_open}=    Run Keyword And Return Status    Element Should Be Enabled    ${Button_Clear_XPATH}
    Wait Until Element Exist    ${project_menu_item_xpaths}    2
    Click    ${project_menu_item_xpaths}
    ${warning_clicked}    ${duplicate_warning}=    Dismiss Project Open Warning Popup If Present
    ${input_xpath}=    Get Open File Dialog Input Locator
    Set Text To Textbox    ${input_xpath}    ${project_file_path}
    Click Open File Dialog Button
    Set Retry Timeout    0
    ${loaded}=    Set Variable    ${False}
    FOR    ${i}    IN RANGE    90
        ${warning_clicked}    ${duplicate_warning}=    Dismiss Project Open Warning Popup If Present
        IF    ${warning_clicked} and ${duplicate_warning}
            ${loaded}=    Set Variable    ${True}
            BREAK
        END
        ${clear_enabled}=    Run Keyword And Return Status    Element Should Be Enabled    ${Button_Clear_XPATH}
        IF    ${clear_enabled} and not ${clear_enabled_before_open}
            ${loaded}=    Set Variable    ${True}
            BREAK
        END
        ${dialog_still_open}=    Run Keyword And Return Status    Element Should Exist    ${input_xpath}
        IF    ${clear_enabled_before_open} and not ${dialog_still_open}
            ${loaded}=    Set Variable    ${True}
            BREAK
        END
        Sleep    0.2s
    END
    Reset Retry Timeout
    Should Be True    ${loaded}    Project did not load within expected time.

Dismiss Project Open Warning Popup If Present
    Set Retry Timeout    0
    ${duplicate_warning_visible}=    Run Keyword And Return Status
    ...    Element Should Exist    ${PROJECT_DUPLICATE_FILES_WINDOW_XPATH}
    IF    not ${duplicate_warning_visible}
        ${duplicate_warning_visible}=    Run Keyword And Return Status
        ...    Element Should Exist    ${PROJECT_DUPLICATE_FILES_WINDOW_FALLBACK_XPATH}
    END
    IF    ${duplicate_warning_visible}
        ${warning_clicked}=    Run Keyword And Return Status    Click    ${PROJECT_DUPLICATE_FILES_OK_BUTTON_XPATH}
        IF    not ${warning_clicked}
            ${warning_clicked}=    Run Keyword And Return Status    Click    ${PROJECT_DUPLICATE_FILES_OK_BUTTON_FALLBACK_XPATH}
        END
        Reset Retry Timeout
        RETURN    ${warning_clicked}    ${True}
    END
    ${warning_visible}=    Run Keyword And Return Status
    ...    Element Should Exist    ${PROJECT_WARNING_OK_BUTTON_XPATH}
    ${warning_clicked}=    Set Variable    ${False}
    IF    ${warning_visible}
        ${warning_clicked}=    Run Keyword And Return Status    Click    ${PROJECT_WARNING_OK_BUTTON_XPATH}
    END
    IF    not ${warning_clicked}
        ${warning_visible}=    Run Keyword And Return Status
        ...    Element Should Exist    ${PROJECT_WARNING_OK_BUTTON_FALLBACK_XPATH}
        IF    ${warning_visible}
            ${warning_clicked}=    Run Keyword And Return Status    Click    ${PROJECT_WARNING_OK_BUTTON_FALLBACK_XPATH}
        END
    END
    Reset Retry Timeout
    RETURN    ${warning_clicked}    ${False}

Open FolderSet
    [Arguments]    ${folder_set_path}
    ${warning_clicked}    ${duplicate_warning}=    Dismiss Project Open Warning Popup If Present
    ${next_enabled_before_open}=    Run Keyword And Return Status    Element Should Be Enabled    ${Button_Next_XPATH}
    Click    ${OpenFolder_Button_XPATH}
    Sleep    0.2s
    ${warning_clicked}    ${duplicate_warning}=    Dismiss Project Open Warning Popup If Present
    Set Text To Textbox    ${INPUT_FOLDER_DIALOG_XPATH}    ${folder_set_path}
    Sleep    0.2s
    Click    ${Select_Folder_XPATH}
    Sleep    0.2s
    Set Retry Timeout    0
    ${loaded}=    Set Variable    ${False}
    FOR    ${i}    IN RANGE    90
        ${warning_clicked}    ${duplicate_warning}=    Dismiss Project Open Warning Popup If Present
        IF    ${warning_clicked} and ${duplicate_warning}
            ${loaded}=    Set Variable    ${True}
            BREAK
        END
        ${next_enabled}=    Run Keyword And Return Status    Element Should Be Enabled    ${Button_Next_XPATH}
        IF    ${next_enabled} and not ${next_enabled_before_open}
            ${loaded}=    Set Variable    ${True}
            BREAK
        END
        ${dialog_still_open}=    Run Keyword And Return Status    Element Should Exist    ${INPUT_FOLDER_DIALOG_XPATH}
        IF    ${next_enabled_before_open} and not ${dialog_still_open}
            ${loaded}=    Set Variable    ${True}
            BREAK
        END
        Sleep    0.2s
    END
    Reset Retry Timeout
    Should Be True    ${loaded}    Folder set did not load within expected time.

Select Files From Files Tab
    [Arguments]    ${list_item_name}
    Click    //*[@Name="${list_item_name}"]
    Sleep    0.2s

Open Reference Radiograph Atlas
    Click    //*[@AutomationId="Main_Btn_ReferenceAtlas"]
    Win Wait Active    Reference Radiograph Atlas    ${EMPTY}    2

Close Reference Radiograph Atlas
    Win Activate   Reference Radiograph Atlas
    Win Close    Reference Radiograph Atlas
    Win Wait Close    Reference Radiograph Atlas    ${EMPTY}    2

Open audit Logs
    Click    //*[@AutomationId="Main_Btn_AuditLog"]
    Win Wait Active    Audit Log    ${EMPTY}    2

Close audit Logs
    Win Close    Audit Log
    Win Wait Close    Audit Log    ${EMPTY}    2

Open Service Support
    Click    //*[@AutomationId="Main_Btn_ServiceSupport"]
    Win Wait Active    Service Support    ${EMPTY}    2

Close Service Support
    Win Close    Service Support
    Win Wait Close    Service Support    ${EMPTY}    2

Switch Between Window Theme
    Click    //*[@AutomationId="Main_Btn_Theme"]
    Sleep    0.3s

Minimize/Maximize Application Window
    Click    //*[@AutomationId="Main_Btn_MaximizeRestore"]
    Sleep    0.3s

Open Help Menu
    Click    ${open_about_menu_XPATH}
    Win Wait Active    About FoXpert    ${EMPTY}    2

Close Help Menu
    Win Close    About FoXpert
    Win Wait Close    About FoXpert    ${EMPTY}    2

Open UserManagement Window
    Click    ${open_user_management_menu_XPATH}
    Win Wait Active    User Management    ${EMPTY}    2


Close UserManagement Window
    Win Close    User Management
    Win Wait Close    User Management    ${EMPTY}    2

Logout From FoxViewerDesktop
    Click    //*[@AutomationId="Main_Btn_Logout"]
    Sleep    0.3s
    Click    /Window/Window/Button[@Name="Yes"]
    Win Wait Active    ${Login_window_name}    ${EMPTY}    2

Close Project
    [Arguments]    ${warning_action}=No
    [Documentation]    Close the active project. If unsaved changes trigger the Yes/No/Cancel warning dialog,
    ...    ${warning_action} decides which button to click. Defaults to No (discard changes and close).
    Should Match Regexp    ${warning_action}    ^(Yes|No|Cancel)$
    ...    Unsupported close-project action: ${warning_action}. Use Yes, No or Cancel.
    Click    ${Button_Clear_XPATH}
    ${warning_visible}=    Run Keyword And Return Status
    ...    Wait Until Element Exist    ${PROJECT_CLOSE_WARNING_NO_BUTTON_XPATH}    2
    Run Keyword If    ${warning_visible} and '${warning_action}' == 'Yes'
    ...    Click    ${PROJECT_CLOSE_WARNING_YES_BUTTON_XPATH}
    Run Keyword If    ${warning_visible} and '${warning_action}' == 'No'
    ...    Click    ${PROJECT_CLOSE_WARNING_NO_BUTTON_XPATH}
    Run Keyword If    ${warning_visible} and '${warning_action}' == 'Cancel'
    ...    Click    ${PROJECT_CLOSE_WARNING_CANCEL_BUTTON_XPATH}
    Run Keyword If    ${warning_visible}    Sleep    0.4s
    Run Keyword If    ${warning_visible} and '${warning_action}' == 'Cancel'
    ...    Wait Until Keyword Succeeds    25x    0.2s    Element Should Be Enabled    ${Button_Clear_XPATH}
    Run Keyword If    not (${warning_visible} and '${warning_action}' == 'Cancel')
    ...    Wait Until Keyword Succeeds    25x    0.2s    Element Should Be Disabled    ${Button_Clear_XPATH}

Get Open File Dialog Input Locator
    ${primary_input_found}=    Run Keyword And Return Status
    ...    Wait Until Element Exist    ${INPUT_FILE_DIALOG_BY_NAME_XPATH}    5
    IF    ${primary_input_found}
        RETURN    ${INPUT_FILE_DIALOG_BY_NAME_XPATH}
    END
    @{input_candidates}=    Create List
    ...    ${INPUT_FILE_DIALOG_BY_NAME_FALLBACK_XPATH}
    ...    ${INPUT_FILE_DIALOG_FILENAME_CONTROL_XPATH}
    ...    ${INPUT_FILE_DIALOG_FILENAME_CONTROL_FALLBACK_XPATH}
    ...    ${INPUT_FILE_DIALOG_AUTOMATION_ID_XPATH}
    ...    ${INPUT_FILE_DIALOG_AUTOMATION_ID_FALLBACK_XPATH}
    Set Retry Timeout    0
    FOR    ${attempt}    IN RANGE    25
        FOR    ${input_xpath}    IN    @{input_candidates}
            ${dialog_input_found}=    Run Keyword And Return Status    Element Should Exist    ${input_xpath}
            IF    ${dialog_input_found}
                Reset Retry Timeout
                RETURN    ${input_xpath}
            END
        END
        Sleep    0.2s
    END
    Reset Retry Timeout
    Fail    Could not find the file name input in the Open file dialog.

Click Open File Dialog Button
    [Arguments]    ${preferred_xpath}=${EMPTY}
    ${open_clicked}=    Set Variable    ${False}
    IF    str($preferred_xpath).strip() != ''
        ${open_clicked}=    Run Keyword And Return Status    Click    ${preferred_xpath}
    END
    IF    not ${open_clicked}
        ${open_clicked}=    Run Keyword And Return Status    Click    ${OPEN_BUTTON_XPATH}
    END
    IF    not ${open_clicked}
        ${open_clicked}=    Run Keyword And Return Status    Click    ${OPEN_BUTTON_AUTOMATION_ID_XPATH}
    END
    IF    not ${open_clicked}
        ${open_clicked}=    Run Keyword And Return Status    Click    ${OPEN_BUTTON_FALLBACK_XPATH}
    END
    IF    not ${open_clicked}
        ${open_clicked}=    Run Keyword And Return Status    Click    ${OPEN_BUTTON_AUTOMATION_ID_FALLBACK_XPATH}
    END
    IF    not ${open_clicked}
        ${open_clicked}=    Run Keyword And Return Status    Click    ${OPEN_BUTTON_NAME_XPATH}
    END
    IF    not ${open_clicked}
        ${open_clicked}=    Run Keyword And Return Status    Click    ${OPEN_BUTTON_NAME_FALLBACK_XPATH}
    END
    IF    not ${open_clicked}
        ${open_clicked}=    Run Keyword And Return Status    Click    ${OPEN_BUTTON_PRIMARY_XPATH}
    END
    IF    not ${open_clicked}
        ${open_clicked}=    Run Keyword And Return Status    Click    ${OPEN_BUTTON_PRIMARY_FALLBACK_XPATH}
    END
    Should Be True    ${open_clicked}    Could not find/click the Open button in the file dialog.

Verify window is Opened
    [Arguments]    ${window_name}
    ${result}=    Win Exists    ${window_name}    ${EMPTY}
    Should Be Equal As Numbers    ${result}    1

Verify window is Closed
    [Arguments]    ${window_name}
    ${result}=    Win Exists    ${window_name}    ${EMPTY}
    Should Be Equal As Numbers    ${result}    0

Add New User In UserManagement Window
    [Arguments]    ${userName}    ${password}    ${level}    ${certificateId}    ${company}

    Click    //*[@AutomationId="UserMgmt_Btn_NewUser"]
    Sleep    0.2s
    Set Text To Textbox    //*[@AutomationId="UserMgmt_Txt_Username"]    ${userName}
    Set Text To Textbox    //*[@AutomationId="UserMgmt_Pwd_Password"]    ${password}
    Click    //*[@AutomationId="UserMgmt_Chk_Admin"]
    Select Combobox Item By Name    //*[@AutomationId="UserMgmt_Cmb_Qualification"]    ${level}
    Set Text To Textbox    //*[@AutomationId="UserMgmt_Txt_CertId"]    ${certificateId}
    Set Text To Textbox    //*[@AutomationId="UserMgmt_Txt_Company"]    ${company}
    Click    //*[@AutomationId="UserMgmt_Btn_AddUser"]
    Sleep    0.2s

Verify New User Added In UserManagement Window
    [Arguments]    ${userName}

    ${user_added}=    Element Should Exist    //*[@Name="${userName}"]
    Should Be True    ${user_added}
    Element Should Exist    //*[@Name="User '' created"]

Delete User From UserManagement Window
    [Arguments]    ${userName}

    Click    //*[@Name="${userName}"]
    Sleep    0.2s
    Click    //*[@AutomationId="UserMgmt_Btn_DeleteUser"]
    Sleep    0.2s

Verify User Deleted From UserManagement Window
    [Arguments]    ${userName}
    
    ${user_deleted}=    Listbox Should Not Contain    //*[@AutomationId="UserMgmt_List_Users"]    ${userName}
    Should Be Equal As Strings    ${user_deleted}    None
    Element Should Exist    //*[@Name="User '${userName}' deleted"]
    
Set UI Scale For RT Application
    [Arguments]    ${scale_value}
    Select Combobox Item By Name    ${UI_Scale_Combobox_XPATH}    ${scale_value}

Press Shortcut Keys
    [Arguments]    ${shortcut}
    [Documentation]    Press an application shortcut on the main FoXpert RT window.
    ...
    ...    The argument can be either a friendly action name or a raw key spec.
    ...
    ...    Supported action names (case-insensitive):
    ...    | Open File              | Ctrl+O  |
    ...    | Export Image           | Ctrl+S  |
    ...    | DICOM Tag Browser      | Ctrl+T  |
    ...    | Reset View             | Ctrl+R  |
    ...    | Toggle Invert          | Ctrl+I  |
    ...    | Generate PDF Report    | Ctrl+P  |
    ...    | Fit Image              | Ctrl+F  |
    ...    | Zoom In                | Ctrl++  |
    ...    | Zoom Out               | Ctrl+-  |
    ...    | Previous File          | Left    |
    ...    | Next File              | Right   |
    ...    | First File             | Home    |
    ...    | Last File              | End     |
    ...    | Delete Annotation      | Delete  |
    ...    | Cancel Tool            | Escape  |
    ...
    ...    Raw specs (e.g. ``CTRL+O``, ``LEFT``, ``HOME``, ``DELETE``, ``ESCAPE``) are
    ...    passed through to FlaUI after wrapping in the required ``s'...'`` notation.
    ...
    ...    Examples:
    ...    | Press Shortcut Keys    Open File
    ...    | Press Shortcut Keys    Zoom In
    ...    | Press Shortcut Keys    CTRL+O
    ...    | Press Shortcut Keys    LEFT

    ${key_spec}=    Resolve Shortcut Spec    ${shortcut}
    @{keys}=    Create List    s'${key_spec}'
    Focus    ${MAIN_WINDOW_XPATH}
    Click    ${MAIN_WINDOW_XPATH}
    Press Keys    ${keys}    ${MAIN_WINDOW_XPATH}
    Sleep    0.5s
    Run Keyword If    '${shortcut}' == 'Open File'    Wait Until Element Exist    ${INPUT_FILE_DIALOG_XPATH}    5

Resolve Shortcut Spec
    [Arguments]    ${name}
    [Documentation]    Translate a friendly shortcut name to its FlaUI key spec.
    ...    If the name is not in the mapping, returns it unchanged (uppercased and trimmed)
    ...    so callers can pass raw specs like ``CTRL+O`` directly.
    ${upper}=    Convert To Upper Case    ${name}
    ${trimmed}=    Strip String    ${upper}
    ${mapping}=    Create Dictionary
    ...    OPEN FILE=CTRL+O
    ...    EXPORT IMAGE=CTRL+S
    ...    OPEN DICOM TAG BROWSER=CTRL+T
    ...    DICOM TAG BROWSER=CTRL+T
    ...    RESET VIEW=CTRL+R
    ...    TOGGLE INVERT=CTRL+I
    ...    GENERATE PDF REPORT=CTRL+P
    ...    PDF REPORT=CTRL+P
    ...    FIT IMAGE TO VIEW=CTRL+F
    ...    FIT IMAGE=CTRL+F
    ...    ZOOM IN=CTRL+OEM_PLUS
    ...    ZOOM OUT=CTRL+OEM_MINUS
    ...    PREVIOUS FILE=LEFT
    ...    NEXT FILE=RIGHT
    ...    FIRST FILE=HOME
    ...    LAST FILE=END
    ...    DELETE SELECTED ANNOTATION=DELETE
    ...    DELETE ANNOTATION=DELETE
    ...    CANCEL ACTIVE TOOL=ESCAPE
    ...    CANCEL TOOL=ESCAPE
    ...    CLEAR SELECTION=ESCAPE
    ${has_key}=    Run Keyword And Return Status    Dictionary Should Contain Key    ${mapping}    ${trimmed}
    IF    ${has_key}
        ${spec}=    Get From Dictionary    ${mapping}    ${trimmed}
    ELSE
        ${spec}=    Set Variable    ${trimmed}
    END
    RETURN    ${spec}
    Sleep    0.5s

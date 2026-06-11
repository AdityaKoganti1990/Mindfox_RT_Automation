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
${open_user_management_menu_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Button[@AutomationId="Main_Btn_UserManagement"]
${delete_user_button_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Window/Button[@AutomationId="UserMgmt_Btn_DeleteUser"]
${save_changes_button_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Window/Button[@AutomationId="UserMgmt_Btn_SaveChanges"]
${user_management_users_list_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Window/List[@AutomationId="UserMgmt_List_Users"]
${user_management_status_bar_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Window/Text[12]
${UI_Scale_Combobox_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]//ComboBox[@AutomationId="Main_Cmb_UiScale"]
${audit_log_window_xpath}                /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Audit Log"]
${audit_log_from_date_xpath}             ${audit_log_window_xpath}//*[@AutomationId="FromDate"]
${audit_log_to_date_xpath}               ${audit_log_window_xpath}//*[@AutomationId="ToDate"]
${audit_log_category_combobox_xpath}     ${audit_log_window_xpath}//ComboBox[@AutomationId="AuditLog_Cmb_CategoryFilter"]
${audit_log_user_combobox_xpath}         ${audit_log_window_xpath}//ComboBox[@AutomationId="AuditLog_Cmb_UserFilter"]
${audit_log_load_button_xpath}           ${audit_log_window_xpath}//Button[@AutomationId="AuditLog_Btn_Load"]
${audit_log_export_csv_button_xpath}     ${audit_log_window_xpath}//Button[@AutomationId="AuditLog_Btn_ExportCsv"]
${audit_log_export_dialog_filename_xpath}    ${audit_log_window_xpath}/Window//ComboBox[@AutomationId="FileNameControlHost"]//Edit
${audit_log_export_dialog_filename_fallback_xpath}    ${audit_log_window_xpath}/Window//Edit[@Name="File name:"]
${audit_log_export_dialog_save_button_xpath}    ${audit_log_window_xpath}/Window//Button[@Name="Save"]
${audit_log_export_overwrite_yes_button_xpath}    ${audit_log_window_xpath}/Window/Window/Button[@Name="Yes"]
${audit_log_export_confirmation_ok_button_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[1]/Button[@Name="OK"]
${audit_log_export_confirmation_ok_button_fallback_xpath}    ${MAIN_WINDOW_XPATH}//Window/Button[@Name="OK"]
${audit_log_exports_directory}           ${CURDIR}\\..\\Exports\\Audit Logs\\
${project_Directory_Path}    ${CURDIR}\\..\\Test_Data\\
${folder_Directory_Path}     ${CURDIR}\\..\\Test_Data\\Project Folder_Set1
${Stitch_Files_Directory_Path}     ${CURDIR}\\..\\Test_Data\\StitchTestData\\
${Login_window_name}    FoXpert RT - Login
${import_reference_image_button_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Window/Button[@AutomationId="RefAtlas_Btn_ImportImage"]
${tags_overlay_button_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Button[@AutomationId="Main_Btn_OverlayConfig"]    
${Annotations_Button_UserManagement_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Window/CheckBox[@AutomationId="UserMgmt_Chk_PermAnnotations"]
${Analysis_Button_UserManagement_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Window/CheckBox[@AutomationId="UserMgmt_Chk_PermAnalysis"]
${Filters_Button_UserManagement_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Window/CheckBox[@AutomationId="UserMgmt_Chk_PermFilters"]
${ImageTools_Button_UserManagement_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Window/CheckBox[@AutomationId="UserMgmt_Chk_PermImageTools"]
${fileoperations_Button_UserManagement_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Window/CheckBox[@AutomationId="UserMgmt_Chk_PermFileOps"]
${reporting_Button_UserManagement_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Window/CheckBox[@AutomationId="UserMgmt_Chk_PermReporting"]
${DICOMTags_Button_UserManagement_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Window/CheckBox[@AutomationId="UserMgmt_Chk_PermDicomTags"]
${Calibration_Button_UserManagement_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Window/CheckBox[@AutomationId="UserMgmt_Chk_PermCalibration"]
${ImageStitching_Button_UserManagement_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Window/CheckBox[@AutomationId="UserMgmt_Chk_PermImageStitching"]    
*** Keywords ***

Open ProjectFile
    [Arguments]    @{project_file_paths}
    ${project_file_path}=    Evaluate    ' '.join(['"' + p + '"' for p in $project_file_paths]) if len($project_file_paths) > 1 else $project_file_paths[0]
    ${warning_clicked}    ${duplicate_warning}=    Dismiss Project Open Warning Popup If Present
    Set Retry Timeout    0
    ${clear_enabled_before_open}=    Run Keyword And Return Status    Element Should Be Enabled    ${Button_Clear_XPATH}
    Reset Retry Timeout
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

Select User In User Management Window
    [Arguments]    ${user_name}
    [Documentation]    Click the user with the given display name in the User Management window's user list.
    ...    ${user_name}: The name shown for the user in the list (e.g. 'admin'). Case-sensitive — must match exactly.

    Should Not Be Empty    ${user_name}    User name cannot be empty.
    ${user_item_xpath}=    Set Variable    ${user_management_users_list_xpath}/ListItem/Text[@Name="${user_name}"]
    Wait Until Element Exist    ${user_item_xpath}    5
    Click    ${user_item_xpath}
    Sleep    0.2s

Open audit Logs
    Click    //*[@AutomationId="Main_Btn_AuditLog"]
    Win Wait Active    Audit Log    ${EMPTY}    2

Close audit Logs
    Win Close    Audit Log
    Win Wait Close    Audit Log    ${EMPTY}    2

Apply Audit Log Filter Params
    [Arguments]    ${from_date}=${EMPTY}    ${to_date}=${EMPTY}    ${category}=${EMPTY}    ${user}=${EMPTY}
    [Documentation]    Set Audit Log filter fields and then click the Load button to apply them. Each filter argument is optional — only fields with non-empty values are updated; the Load button is always clicked at the end.
    ...    ${from_date} / ${to_date}: typed into the From/To date pickers (e.g., 2026-01-15).
    ...    ${category}: selected from the Category dropdown by visible name.
    ...    ${user}: selected from the User dropdown by visible name.
    ...
    ...    Examples:
    ...    | Apply Audit Log Filter Params    from_date=2026-01-01    to_date=2026-01-31
    ...    | Apply Audit Log Filter Params    category=Login    user=admin
    ...    | Apply Audit Log Filter Params    2026-01-01    2026-01-31    Login    admin

    Focus    ${audit_log_window_xpath}
    Sleep    0.2s

    IF    '${from_date}' != '${EMPTY}'
        Set Audit Log Date Field    ${audit_log_from_date_xpath}    ${from_date}
    END
    IF    '${to_date}' != '${EMPTY}'
        Set Audit Log Date Field    ${audit_log_to_date_xpath}    ${to_date}
    END
    IF    '${category}' != '${EMPTY}'
        Select Combobox Item By Name    ${audit_log_category_combobox_xpath}    ${category}
        Sleep    0.2s
    END
    IF    '${user}' != '${EMPTY}'
        Select Combobox Item By Name    ${audit_log_user_combobox_xpath}    ${user}
        Sleep    0.2s
    END

    Click    ${audit_log_load_button_xpath}
    Sleep    0.3s

Set Audit Log Date Field
    [Arguments]    ${field_xpath}    ${value}
    [Documentation]    Set a value into a date picker field by clicking to focus, selecting any existing text with Ctrl+A, then typing the new value via OS-level keystrokes.
    ...    Avoids FlaUI's TextBox.set_Text path which calls UIA SetFocus and throws InvalidOperationException on WPF DatePicker controls.

    Click    ${field_xpath}
    Sleep    0.3s
    AutoItLibrary.Send    ^a
    Sleep    0.1s
    AutoItLibrary.Send    {DEL}
    Sleep    0.1s
    AutoItLibrary.Send    ${value}    1
    Sleep    0.2s

Export Audit Log
    [Arguments]    ${file_name}=${EMPTY}    ${folder_path}=${audit_log_exports_directory}
    [Documentation]    Click Export CSV in the Audit Log window, enter the destination path in the Save dialog, and click Save.
    ...    ${file_name}: CSV file name without extension (e.g. AuditLog_MFRTB22). Defaults to a timestamped name AuditLog-YYYYMMDD-HHMMSS.
    ...    ${folder_path}: Destination directory. Defaults to ${audit_log_exports_directory} (= <repo>\\Exports\\Audit Logs\\). Created if missing.
    ...    Handles the Save As overwrite confirmation if the file already exists.
    ...
    ...    Examples:
    ...    | Export Audit Log
    ...    | Export Audit Log    MFRTB22_Audit
    ...    | Export Audit Log    MFRTB22_Audit    ${audit_log_exports_directory}

    IF    '${file_name}' == '${EMPTY}'
        ${file_name}=    Evaluate    __import__('datetime').datetime.now().strftime('AuditLog-%Y%m%d-%H%M%S')
    END

    Create Directory    ${folder_path}
    ${full_path}=    Evaluate    __import__('os').path.join($folder_path, $file_name)

    Click    ${audit_log_export_csv_button_xpath}
    Sleep    0.5s

    ${primary_present}=    Run Keyword And Return Status    Wait Until Element Exist    ${audit_log_export_dialog_filename_xpath}    5
    ${filename_xpath}=    Set Variable If    ${primary_present}    ${audit_log_export_dialog_filename_xpath}    ${audit_log_export_dialog_filename_fallback_xpath}
    Wait Until Element Exist    ${filename_xpath}    5
    Sleep    0.5s
    Set Text To Textbox    ${filename_xpath}    ${full_path}
    Sleep    0.3s
    Click    ${audit_log_export_dialog_save_button_xpath}
    Sleep    0.5s

    ${overwrite_present}=    Run Keyword And Return Status
    ...    Wait Until Element Exist    ${audit_log_export_overwrite_yes_button_xpath}    2
    Run Keyword If    ${overwrite_present}    Click    ${audit_log_export_overwrite_yes_button_xpath}
    Sleep    0.3s

    ${primary_present}=    Run Keyword And Return Status
    ...    Wait Until Element Exist    ${audit_log_export_confirmation_ok_button_xpath}    5
    IF    ${primary_present}
        Click    ${audit_log_export_confirmation_ok_button_xpath}
    ELSE
        ${fallback_present}=    Run Keyword And Return Status
        ...    Wait Until Element Exist    ${audit_log_export_confirmation_ok_button_fallback_xpath}    2
        Run Keyword If    ${fallback_present}    Click    ${audit_log_export_confirmation_ok_button_fallback_xpath}
    END
    Sleep    0.3s
    Log    Audit log exported to: ${full_path}.csv

Verify Exported File Saved
    [Arguments]    ${file_name}    ${folder_path}=${EMPTY}    ${timeout}=30
    [Documentation]    Verify that an exported file exists on disk. Common helper for any export flow (CSV, PDF, image, etc.).
    ...    ${file_name}: Name of the exported file with extension (e.g. MFRTB22_Audit.csv). May also be passed as a full path if ${folder_path} is left empty.
    ...    ${folder_path}: Directory the file should be in. Optional — when empty, ${file_name} is treated as a full path.
    ...    ${timeout}: Seconds to retry the existence check (file system writes can lag); default 30.
    ...
    ...    Examples:
    ...    | Verify Exported File Saved    MFRTB22_Audit.csv    ${audit_log_exports_directory}
    ...    | Verify Exported File Saved    ${audit_log_exports_directory}MFRTB22_Audit.csv
    ...    | Verify Exported File Saved    MFRTIV43_Primary.png    ${Actual_Image_Exports}

    IF    $folder_path
        ${full_path}=    Evaluate    __import__('os').path.join($folder_path, $file_name)
    ELSE
        ${full_path}=    Set Variable    ${file_name}
    END

    Wait Until Keyword Succeeds    ${timeout}x    1s    File Should Exist    ${full_path}
    Log    Verified exported file exists: ${full_path}
    RETURN    ${full_path}

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
    ...    Wait Until Element Exist    ${PROJECT_CLOSE_WARNING_NO_BUTTON_XPATH}    1
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

    Element Should Exist    //*[@Name="${userName}"]

    ${expected_message}=    Set Variable    User '${userName}' created
    Set Retry Timeout    0
    ${status}    ${displayed_message}=    Run Keyword And Ignore Error
    ...    Get Name From Element    ${user_management_status_bar_xpath}
    Reset Retry Timeout
    Should Be Equal As Strings    ${status}    PASS
    ...    Status bar message was not shown after adding user '${userName}'.
    Should Be Equal As Strings    ${displayed_message}    ${expected_message}
    ...    Expected status bar message '${expected_message}' but found '${displayed_message}'.

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

    ${expected_message}=    Set Variable    User '${userName}' deleted
    Set Retry Timeout    0
    ${status}    ${displayed_message}=    Run Keyword And Ignore Error
    ...    Get Name From Element    ${user_management_status_bar_xpath}
    Reset Retry Timeout
    Should Be Equal As Strings    ${status}    PASS
    ...    Status bar message was not shown after deleting user '${userName}'.
    Should Be Equal As Strings    ${displayed_message}    ${expected_message}
    ...    Expected status bar message '${expected_message}' but found '${displayed_message}'.
    
Verify Image Info
    [Arguments]    ${file_type}    @{params}
    [Documentation]    Verify each Image Info field shown in the right-panel tab matches its expected value.
    ...
    ...    ${file_type}: image format identifier (e.g., DCM, PNG, BMP, TIFF). Currently informational only — every format shares the same field set; this argument is forward-looking for per-format routing once the UI distinguishes them.
    ...    @{params}: variadic list of 'Key:Value' strings (e.g., 'Dimensions:1762 × 2144 px'). All mismatches across all fields are collected and reported together at the end.

    @{failures}=    Create List
    FOR    ${param}    IN    @{params}
        ${param}=    Strip String    ${param}
        IF    '${param}' == '${EMPTY}'    CONTINUE
        @{parts}=    Split String    ${param}    :    1
        ${num_parts}=    Get Length    ${parts}
        IF    ${num_parts} != 2
            Append To List    ${failures}    Malformed argument '${param}'. Expected 'Key:Value' format.
            CONTINUE
        END
        ${key}=    Strip String    ${parts}[0]
        ${expected_value}=    Strip String    ${parts}[1]
        ${xpath}=    Resolve Image Info Field XPath    ${key}
        IF    '${xpath}' == '${EMPTY}'
            Append To List    ${failures}    Unknown field '${key}'. Add it to Resolve Image Info Field XPath.
            CONTINUE
        END
        ${get_status}    ${displayed}=    Run Keyword And Ignore Error    Get Name From Element    ${xpath}
        IF    '${get_status}' != 'PASS'
            Append To List    ${failures}    Field '${key}': could not read displayed value (xpath '${xpath}' did not match).
            CONTINUE
        END
        IF    '${displayed}' != '${expected_value}'
            Append To List    ${failures}    Field '${key}': expected '${expected_value}' but found '${displayed}'.
        END
    END
    ${num_failures}=    Get Length    ${failures}
    IF    ${num_failures} > 0
        ${all_failures}=    Catenate    SEPARATOR=\n - \    @{failures}
        Fail    Verify Image Info (${file_type}) found ${num_failures} mismatch(es):\n - ${all_failures}
    END

Resolve Image Info Field XPath
    [Arguments]    ${key}
    [Documentation]    Return the xpath of the value-Text element for the given Image Info field key, or empty string if the key is unknown. Update this dictionary when the UI exposes new fields.

    ${map}=    Create Dictionary
    ...    Dimensions=/Window/Tab/TabItem/Text[5]
    ...    Pixel spacing=/Window/Tab/TabItem/Text[7]
    ...    Bit depth=/Window/Tab/TabItem/Text[9]
    ...    Intensity min=/Window/Tab/TabItem/Text[11]
    ...    Intensity max=/Window/Tab/TabItem/Text[13]
    ...    Window C / W=/Window/Tab/TabItem/Text[15]
    ${has_key}=    Run Keyword And Return Status    Dictionary Should Contain Key    ${map}    ${key}
    IF    not ${has_key}    RETURN    ${EMPTY}
    ${xpath}=    Get From Dictionary    ${map}    ${key}
    RETURN    ${xpath}

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
    # Click    ${MAIN_TITLEBAR_XPATH}
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

*** Settings ***
Library           FlaUILibrary    screenshot_dir=${CURDIR}\\..\\Actual\\test.png
Library           Process
Library           ../lib/image_comparator.py
Library           ../lib/ironpy_remote_client.py
Library           AutoItLibrary
Resource          ../resources/login.resource

*** Variables ***
${project_menu_item_xpaths}    /Window[@AutomationId="FoxRTProMainWindow"]/Button[@AutomationId="Main_Btn_OpenFile"]
${INPUT_FILE_DIALOG_XPATH}    /Window/Window/ComboBox[1]/Edit[@Name="File name:"]
${OPEN_BUTTON_XPATH}         /Window/Window/Button[@Name="Open"]
${Button_Next_XPATH}         /Window[@AutomationId="FoxRTProMainWindow"]/Button[@AutomationId="Main_Btn_NextFile"]
${Button_Clear_XPATH}         /Window[@AutomationId="FoxRTProMainWindow"]/Tab/TabItem/Button[@AutomationId="Main_Btn_ClearFiles"]
${OpenFolder_Button_XPATH}   /Window[@AutomationId="FoxRTProMainWindow"]/Button[@AutomationId="Main_Btn_OpenFolder"]
${INPUT_FOLDER_DIALOG_XPATH}    /Window/Window/Edit
${Select_Folder_XPATH}         /Window/Window/Button[@Name="Select Folder"]
${PROJECT_CLOSE_WARNING_MESSAGE_XPATH}    //*[@AutomationId="MessageText"]
${PROJECT_CLOSE_WARNING_YES_BUTTON_XPATH}    /Window/Window/Button[@Name="Yes"]
${PROJECT_CLOSE_WARNING_NO_BUTTON_XPATH}    /Window/Window/Button[@Name="No"]
${PROJECT_CLOSE_WARNING_CANCEL_BUTTON_XPATH}    /Window/Window/Button[@Name="Cancel"]
${PROJECT_WARNING_OK_BUTTON_XPATH}    /Window/Window/Button[@Name="OK"]
${User_Manual_Button_XPATH}    //*[@AutomationId="Main_Btn_UserManual"]
${open_about_menu_XPATH}          //*[@AutomationId="Main_Btn_About"]
${open_user_management_menu_XPATH}    //*[@AutomationId="Main_Btn_UserManagement"]
${project_Directory_Path}    ${CURDIR}\\..\\test_Images\\
${folder_Directory_Path}     ${CURDIR}\\..\\test_Images\\Project Folder_Set1



*** Keywords ***

Open ProjectFile
    [Arguments]    ${project_file_path}
    Wait Until Element Exist    ${project_menu_item_xpaths}    2
    Sleep    1s
    Click    ${project_menu_item_xpaths}
    Sleep    1s
    Set Text To Textbox    ${INPUT_FILE_DIALOG_XPATH}    ${project_file_path}
    # Send    ${project_file_path}
    Sleep    1s
    Click    ${OPEN_BUTTON_XPATH}
    Sleep    1s
    ${warning_visible}=    Run Keyword And Return Status
    ...    Wait Until Element Exist    ${PROJECT_WARNING_OK_BUTTON_XPATH}    2
    Run Keyword If    ${warning_visible}
    ...    Element Should Exist    ${PROJECT_CLOSE_WARNING_MESSAGE_XPATH}
    Run Keyword If    ${warning_visible}
    ...    Click    ${PROJECT_WARNING_OK_BUTTON_XPATH}
    Sleep    1s
    Wait Until Element Is Enabled    ${Button_Clear_XPATH}    3

Open FolderSet
    [Arguments]    ${folder_set_path}
    Click    ${OpenFolder_Button_XPATH}
    Sleep    1s
    Set Text To Textbox    ${INPUT_FOLDER_DIALOG_XPATH}    ${folder_set_path}
    sleep   1s
    Click    ${Select_Folder_XPATH}
    Sleep    1s
    Wait Until Element Is Enabled    ${Button_Next_XPATH}    3

Select Files From Files Tab
    [Arguments]    ${list_item_name}
    Click    //*[@Name="${list_item_name}"]
    Sleep    1s

Open Reference Radiograph Atlas
    Click    //*[@AutomationId="Main_Btn_ReferenceAtlas"]
    Sleep    1s
    Win Wait Active    Reference Radiograph Atlas    ${EMPTY}    2

Close Reference Radiograph Atlas
    Win Activate   Reference Radiograph Atlas 
    Win Close    Reference Radiograph Atlas
    Sleep    1s
    Win Wait Close    Reference Radiograph Atlas    ${EMPTY}    2

Open audit Logs
    Click    //*[@AutomationId="Main_Btn_AuditLog"]
    Sleep    1s
    Win Wait Active    Audit Log    ${EMPTY}    2

Close audit Logs
    Win Close    Audit Log
    Sleep    1s
    Win Wait Close    Audit Log    ${EMPTY}    2

Open Service Support
    Click    //*[@AutomationId="Main_Btn_ServiceSupport"]
    Sleep    1s
    Win Wait Active    Service Support    ${EMPTY}    2

Close Service Support
    Win Close    Service Support
    Sleep    1s
    Win Wait Close    Service Support    ${EMPTY}    2

Switch Between Window Theme
    Click    //*[@AutomationId="Main_Btn_Theme"]
    Sleep    1s

Minimize/Maximize Application Window
    Click    //*[@AutomationId="Main_Btn_MaximizeRestore"]
    Sleep    1s

Open Help Menu
    Click    ${open_about_menu_XPATH}
    Sleep    1s
    Win Wait Active    About FoXpert    ${EMPTY}    2

Close Help Menu
    Win Close    About FoXpert
    Sleep    1s
    Win Wait Close    About FoXpert    ${EMPTY}    2

Open UserManagement Window
    Click    ${open_user_management_menu_XPATH}
    Sleep    1s
    Win Wait Active    User Management    ${EMPTY}    2


Close UserManagement Window
    Win Close    User Management
    Sleep    1s
    Win Wait Close    User Management    ${EMPTY}    2

Logout From FoxViewerDesktop
    Click    //*[@AutomationId="Main_Btn_Logout"]
    Sleep    1s
    Click    /Window/Window/Button[@Name="Yes"]
    Sleep    1s
    Win Wait Active    FoXpert - Login    ${EMPTY}    2

Close Project
    [Arguments]    ${warning_action}=No
    Should Match Regexp    ${warning_action}    ^(Yes|No|Cancel)$
    ...    Unsupported close-project action: ${warning_action}. Use Yes, No or Cancel.
    Click    ${Button_Clear_XPATH}
    Sleep    0.5s
    ${warning_visible}=    Run Keyword And Return Status
    ...    Wait Until Element Exist    ${PROJECT_CLOSE_WARNING_NO_BUTTON_XPATH}    2
    Run Keyword If    ${warning_visible} and '${warning_action}' == 'Yes'
    ...    Click    ${PROJECT_CLOSE_WARNING_YES_BUTTON_XPATH}
    Run Keyword If    ${warning_visible} and '${warning_action}' == 'No'
    ...    Click    ${PROJECT_CLOSE_WARNING_NO_BUTTON_XPATH}
    Run Keyword If    ${warning_visible} and '${warning_action}' == 'Cancel'
    ...    Click    ${PROJECT_CLOSE_WARNING_CANCEL_BUTTON_XPATH}
    Run Keyword If    ${warning_visible} and '${warning_action}' == 'Cancel'
    ...    Wait Until Keyword Succeeds    5x    1s    Element Should Be Enabled    ${Button_Clear_XPATH}
    Run Keyword If    not (${warning_visible} and '${warning_action}' == 'Cancel')
    ...    Wait Until Keyword Succeeds    5x    1s    Element Should Be Disabled    ${Button_Clear_XPATH}
    Sleep    1s

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
    Sleep    1s
    Set Text To Textbox    //*[@AutomationId="UserMgmt_Txt_Username"]    ${userName}
    Sleep    1s
    Set Text To Textbox    //*[@AutomationId="UserMgmt_Pwd_Password"]    ${password}
    sleep    1s
    Click    //*[@AutomationId="UserMgmt_Chk_Admin"]
    Sleep    1s
    Select Combobox Item By Name    //*[@AutomationId="UserMgmt_Cmb_Qualification"]    ${level}
    Sleep    1s
    Set Text To Textbox    //*[@AutomationId="UserMgmt_Txt_CertId"]    ${certificateId}
    Sleep    1s
    Set Text To Textbox    //*[@AutomationId="UserMgmt_Txt_Company"]    ${company}
    Sleep    1s
    Click    //*[@AutomationId="UserMgmt_Btn_AddUser"]
    Sleep    1s

Verify New User Added In UserManagement Window
    [Arguments]    ${userName}

    ${user_added}=    Element Should Exist    //*[@Name="${userName}"]
    Should Be True    ${user_added}
    Element Should Exist    //*[@Name="User '' created"]

Delete User From UserManagement Window
    [Arguments]    ${userName}

    Click    //*[@Name="${userName}"]
    Sleep    1s
    Click    //*[@AutomationId="UserMgmt_Btn_DeleteUser"]
    Sleep    1s

Verify User Deleted From UserManagement Window
    [Arguments]    ${userName}
    
    ${user_deleted}=    Listbox Should Not Contain    //*[@AutomationId="UserMgmt_List_Users"]    ${userName}
    Should Be Equal As Strings    ${user_deleted}    None
    Element Should Exist    //*[@Name="User '${userName}' deleted"]
    


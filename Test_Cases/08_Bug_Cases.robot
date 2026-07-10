*** Settings ***
Documentation     Bug cases test suite. Total Test Cases: 34 (MFRTB01 - MFRTB34).
Library           FlaUILibrary
Library           Process
Library           AutoItLibrary
Library           OperatingSystem
Resource          ../resources/login.resource
Resource          ../resources/Online.resource
Resource          ../resources/Actions.resource
Resource          ../resources/Tools.resource
Resource          ../resources/Annotations.resource
Resource          ../resources/General.resource
Resource          ../resources/Image Viewer Operations.resource
Resource          ../resources/imageviewer.resource

*** Variables ***

*** Test Cases ***
MFRTB01 - Verify whether adding same file again throws error message.
    [Documentation]    This test case is to verify whether adding same file again throws error message.

    Open FoxViewerDesktop Application
    Login To FoxViewerDesktop    admin    admin
    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.dcm
    Click    ${project_menu_item_xpaths}
    ${input_xpath}=    Get Open File Dialog Input Locator
    Set Text To Textbox    ${input_xpath}    ${project_Directory_Path}MLE_4_0.237.dcm
    Click Open File Dialog Button
    ${duplicate_dialog_visible}=    Run Keyword And Return Status    Wait Until Element Exist    //*[@Name="Duplicate Files"]    5
    Run Keyword And Continue On Failure    Should Be True    ${duplicate_dialog_visible}    Duplicate Files warning was not shown when adding the same file again.
    Dismiss Project Open Warning Popup If Present
    Close Project
MFRTB02 - Verify whether able to draw annotations outide the bounds of image.
    [Documentation]    This test case is to verify whether able to draw annotations outide the bounds of image.

    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.dcm
    Add Annotation at custom position    Ruler    1050    400    1350    400
    Take Actual Screenshot    MFRTB02_Actual.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTB02_Actual.png    MFRTB02_Actual.png
    Delete the annotation
MFRTB03 - Verify whether warning message is shown when trying to remove annotations.
    [Documentation]    This test case is to verify whether warning message is shown when trying to remove annotations.

    Add Annotation    Rectangle
    ${warning_shown}=    Delete the annotation
    Run Keyword And Continue On Failure    Should Be True    ${warning_shown}
    ...    Expected the annotation removal warning popup to appear, but it did not.
MFRTB04 - Verify whether text and labels of annotations are shown properly after flipping the image.
    [Documentation]    This test case is to verify whether text and labels of annotations are shown properly after flipping the image.

    Add Annotation at custom position    Ruler    845    470    1050    570
    Add Text Annotation    This is a text annotation
    Flip Image Viewer    Horizontal
    Take Actual Screenshot    MFRTB04_Actual.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTB04_Actual.png    MFRTB04_Actual.png
    Flip Image Viewer    Vertical
    Take Actual Screenshot    MFRTB04_Actual2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTB04_Actual2.png    MFRTB04_Actual2.png
    Reset View
    Apply Auto Best BNC
MFRTB05 - Verify whether text and labels of annotations are shown properly after rotating the image.
    [Documentation]    This test case is to verify whether text and labels of annotations are shown properly after rotating the image.

    Rotate Image Viewer    Rotate CW
    Take Actual Screenshot    MFRTB05_Actual.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTB05_Actual.png    MFRTB05_Actual.png
    Rotate Image Viewer    Rotate CCW
    Rotate Image Viewer    Rotate CCW
    Take Actual Screenshot    MFRTB05_Actual2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTB05_Actual2.png    MFRTB05_Actual2.png
    Rotate Image Viewer    Rotate CW
    Delete the annotation
    Reset View
    Apply Auto Best BNC
    Close Project
MFRTB06 - Verify whether High Resolution image is getting loaded properly inside image viewer.
    [Documentation]    This test case is to verify whether High Resolution image is getting loaded properly inside image viewer.

    Open ProjectFile    ${project_Directory_Path}25um.dcm
    Take Actual Screenshot    MFRTB06_Actual.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTB06_Actual.png    MFRTB06_Actual.png
    Close Project
MFRTB07 - Verify whether all Annotations, Analysis tools and Image Operation tools are disabled when no image is loaded in image viewer.
    [Documentation]    This test case is to verify whether all Annotations, Analysis tools and Image Operation tools are disabled when no image is loaded in image viewer.

    Run Keyword And Continue On Failure     Verify All Annotation Tools Are Disabled
    Run Keyword And Continue On Failure     Verify All Analysis Tools Are Disabled
    Run Keyword And Continue On Failure     Verify All Image Operation Tools Are Disabled
MFRTB08 - Verify whether warning message is shown when trying to close the application.
    [Documentation]    This test case is to verify whether warning message is shown when trying to close the application.

    Invoke Button    ${MAIN_CLOSE_BTN_XPATH}
    Sleep    1s
    run Keyword And Continue On Failure    VerifyControlState    ${MAIN_CLOSE_CONFIRMATION_YES_BTN_XPATH}    exists    2
    run Keyword And Continue On Failure    VerifyControlState    ${MAIN_CLOSE_CONFIRMATION_NO_BTN_XPATH}    exists    2
    Invoke Button    ${MAIN_CLOSE_CONFIRMATION_NO_BTN_XPATH}
MFRTB09 - Verify whether clear annotations button is disabled when no annotations are added over the image in image viewer.
    [Documentation]    This test case is to verify whether clear annotations button is disabled when no annotations are added over the image in image viewer.

    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.dcm
    Take Actual Screenshot    MFRTB09_Actual.png
    Run Keyword And Continue On Failure    compare Result Images    MFRTB09_Actual.png    MFRTB09_Actual.png
    VerifyControlState    control_name=${delete_annotation_button_xpath}    expected_state=disabled    timeout=1
MFRTB10 - Verify whether warning message is shown when trying to close image after doing modifications.
    [Documentation]    This test case is to verify whether warning message is shown when trying to close image after doing modifications.

    Add Text Annotation    This is a text annotation
    Click    ${Button_Clear_XPATH}
    sleep    0.5s
    ${warning_visible}=    Run Keyword And Return Status    Wait Until Element Exist    /Window/Window/Text[@Name="The current image has unsaved changes. Would you like to export before continuing?"]    5
    Run Keyword And Continue On Failure    Should Be True    ${warning_visible}    Save Changes warning was not shown when trying to close image after doing modifications.
    sleep    0.5s
    Click    /Window/Window/Button[@Name="Cancel"]
    sleep    0.5s
    Delete the annotation
    Close Project
MFRTB11 - Verify whether annotations are getting removed when image is closed in image viewer.
    [Documentation]    This test case is to verify whether annotations are getting removed when image is closed in image viewer.

    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.dcm
    Add Text Annotation    This is a text annotation
    Take Actual Screenshot    MFRTB11_Actual.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTB11_Actual.png    MFRTB11_Actual.png
    Close Project
    Take window Screenshot    MFRTB11_Actual2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTB11_Actual2.png    MFRTB11_Actual2.png
    Close Project
MFRTB12 - Verify whether Area Adjust and Window Level options are not available(disabled) for .png files in image viewer.
    [Documentation]    This test case is to verify whether Area Adjust and Window Level options are not available(disabled) for .png files in image viewer.

    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.png
    Run Keyword And Continue On Failure   VerifyControlState    ${window_level_tool_button_xpath}    not exists
    Run Keyword And Continue On Failure   VerifyControlState    ${window_Level_tool_panel_button_xpath}    not exists
    Close Project
MFRTB13 - Verify whether Area Adjust and Window Level options are not available(disabled) for .jpg files in image viewer.
    [Documentation]    This test case is to verify whether Area Adjust and Window Level options are not available(disabled) for .jpg files in image viewer.

    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.jpg
    Run Keyword And Continue On Failure   VerifyControlState    ${window_level_tool_button_xpath}    not exists
    Run Keyword And Continue On Failure   VerifyControlState    ${window_Level_tool_panel_button_xpath}    not exists
    Close Project
MFRTB14 - Verify whether Area Adjust and Window Level options are not available(disabled) for .bmp files in image viewer.
    [Documentation]    This test case is to verify whether Area Adjust and Window Level options are not available(disabled) for .bmp files in image viewer.

    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.bmp
    Run Keyword And Continue On Failure   VerifyControlState    ${window_level_tool_button_xpath}    not exists
    Run Keyword And Continue On Failure   VerifyControlState    ${window_Level_tool_panel_button_xpath}    not exists
    Close Project
MFRTB15 - Verify whether Area Adjust and Window Level options are not available(disabled) for .tiff files in image viewer.
    [Documentation]    This test case is to verify whether Area Adjust and Window Level options are not available(disabled) for .tiff files in image viewer.

    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.tiff
    Run Keyword And Continue On Failure   VerifyControlState    ${window_level_tool_button_xpath}    not exists
    Run Keyword And Continue On Failure   VerifyControlState    ${window_Level_tool_panel_button_xpath}    not exists
    Close Project
MFRTB16 - Verify whether files added under files tab are getting persisted after close and open application.
    [Documentation]    This test case is to verify whether files added under files tab are getting persisted after close and open application.

    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.dcm
    Close FoxRT Application Window
    Open FoxViewerDesktop Application
    Login To FoxViewerDesktop    admin    admin
    Set Retry Timeout    0
    ${file_persisted}=    Run Keyword And Return Status
    ...    Element Should Exist    /Window/Tab/TabItem/List/ListItem/Text[@Name="MLE_4_0.237.dcm"]
    Reset Retry Timeout
    Run Keyword And Continue On Failure    Should Be Equal As Strings    ${file_persisted}    False
    ...    Expected file 'MLE_4_0.237.dcm' to NOT persist under Files tab after close+reopen, but it was found.
MFRTB17 - Verify whether closing one tab in the right panel closes the entire panel.
    [Documentation]    This test case is to verify whether closing one tab in the right panel closes the entire panel.

    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.dcm
    Click Image Filter Tool
    Select Tab In Right Panel    Filters
    Close Tab In Right Panel    Filters
    Run Keyword And Continue On Failure   VerifyControlState    ${filters_tab_xpath}    exists
    Run Keyword And Continue On Failure   VerifyControlState    ${filters_tab_xpath}    enabled
    sleep    0.2s
    Click    /Window/Button[33]
MFRTB18 - Verify whether delete button is enabled when no user is selected in the user management window.
    [Documentation]    This test case is to verify whether delete button is enabled when no user is selected in the user management window.

    Open User Management Window
    Run Keyword And Continue On Failure   VerifyControlState    ${delete_user_button_xpath}    disabled
    Close User Management Window
MFRTB19 - Verify whether save changes button gets enabled without making changes in the user management window.
    [Documentation]    This test case is to verify whether save changes button gets enabled without making changes in the user management window.

    Open User Management Window
    Select User In User Management Window    admin  
    Run Keyword And Continue On Failure   VerifyControlState    ${save_changes_button_xpath}    disabled
    Close User Management Window
    Close Project
MFRTB20 - Verify whether save changes warning is popped when clsoing the project with IQI analysis performed.
    [Documentation]    This test case is to verify whether save changes warning is popped when clsoing the project with IQI analysis performed.

    Open ProjectFile    ${project_Directory_Path}DuplexPlate_With_RT.dcm
    Detect IQI Wire Phantom Tool
    Sleep    0.2s
    Click    ${Button_Clear_XPATH}
    sleep    0.2s
    ${warning_visible}=    Run Keyword And Return Status    Wait Until Element Exist    /Window/Window/Text[@Name="The current image has unsaved changes. Would you like to export before continuing?"]    5
    Run Keyword And Continue On Failure    Should Be True    ${warning_visible}    Save Changes warning was not shown when trying to close image after doing modifications.
    sleep    0.2s
    Click    /Window/Window/Button[@Name="No"]
    sleep    0.2s
    Close Project
MFRTB21 - Verify whether warning message is shown when trying to change the defect result.
    [Documentation]    This test case is to verify whether warning message is shown when trying to change the defect result.

    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.dcm
    Add Defect Marking and Classification Tool over image    Porosity    Rectangle    821    372    1008    416
    Select Acceptance Criteria Code    Manual
    Select Acceptance Criteria    Accept    Accepted By Manual Inspection
    ${warning_shown}=    Select Acceptance Criteria    Reject    Changing decision to reject
    Run Keyword And Continue On Failure    Should Be True    ${warning_shown}    Confirm Status Change dialog should appear when changing the defect result, but it did not.
    Delete Selected Defect    1
    Click    ${defect_marking_tool_button_xpath}
MFRTB22 - Verify whether able to apply window level over the filtered image propely.
    [Documentation]    This test case is to verify whether able to apply window level over the filtered image propely.

    Apply Fox Bleach Filter    True
    Apply Window Level    1    845    470    1050    570
    Take Actual Screenshot    MFRTB22_Actual.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTB22_Actual.png    MFRTB22_Actual.png
    Click    ${window_level_tool_button_xpath}
    Reset View
    Apply Auto Best BNC
    Close Project
    Fail    Known bug: window level over filtered image does not render correctly.
MFRTB23 - Verify whether dicom tags are getting removed from image viewer after closing the project.
    [Documentation]    This test case is to verify whether dicom tags are getting removed from image viewer after closing the project.

    Take Actual Screenshot    MFRTB23_Actual.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTB23_Actual.png    MFRTB23_Actual.png
MFRTB24 - Verify whether dual viewer closes when all files are removed from files tab.
    [Documentation]    This test case is to verify whether dual viewer closes when all files are removed from files tab.

    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.dcm    
    ...    ${project_Directory_Path}MLE_6_0.280.dcm    
    ...    ${project_Directory_Path}MLE_8''0.322.dcm
    Open/Close Dual View Mode    True
    Run Keyword And Continue On Failure    VerifyControlState    ${LEFT_IMAGE_VIEWER_XPATH}    exists
    Run Keyword And Continue On Failure    VerifyControlState    ${RIGHT_IMAGE_VIEWER_XPATH}    exists
    Take Actual Screenshot    MFRTB24_Actual.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTB24_Actual.png    MFRTB24_Actual.png
    Close Project
    Run Keyword And Continue On Failure    VerifyControlState    ${LEFT_IMAGE_VIEWER_XPATH}    exists
    Run Keyword And Continue On Failure    VerifyControlState    ${RIGHT_IMAGE_VIEWER_XPATH}    not exists
    Take Actual Screenshot    MFRTB24_Actual_2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTB24_Actual_2.png    MFRTB24_Actual_2.png
MFRTB25 - Verify whether Import Reference Image button is disbaled by default on opening the Reference Radiograph Atlas window.
    [Documentation]    This test case is to verify whether Import Reference Image button is disbaled by default on opening the Reference Radiograph Atlas window.

    Open Reference Radiograph Atlas
    Run Keyword And Continue On Failure    VerifyControlState    ${import_reference_image_button_xpath}    disabled
    Close Reference Radiograph Atlas
MFRTB26 - Verify whether Save button is disabled when preset name is not entered.
    [Documentation]    This test case is to verify whether Save button is disabled when preset name is not entered.

    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.dcm
    Click    ${percentile_brightness_contrast_filter_button_xpath}
    sleep    0.2s
    Run Keyword And Continue On Failure    VerifyControlState    ${percentile_brightness_contrast_savePreset_button_xpath}    disabled
    sleep    0.2s
    Click    ${window_XPATH}
MFRTB27 - Verify whether reset view button is getting diabled after closing the project.
    [Documentation]    This test case is to verify whether reset view button is getting diabled after closing the project.

    Zoom Image Viewer    ZoomIn    2
    Close Project
    Run Keyword And Continue On Failure    VerifyControlState    ${reset_view_button_xpath}    disabled
    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.dcm
    Close Project
    Run Keyword And Continue On Failure    VerifyControlState    ${reset_view_button_xpath}    disabled
    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.dcm
    Run keyword And Continue On Failure    VerifyControlState    ${reset_view_button_xpath}    disabled
MFRTB28 - Verify whether able to remove the user that is currently logged in.
    [Documentation]    This test case is to verify whether able to remove the user that is currently logged in.

    Open User Management Window
    Add New User In UserManagement Window    TempUser    TempPassword123    Level I    5555    Mindfox
    Close User Management Window
    Logout From FoxViewerDesktop
    Login To FoxViewerDesktop    TempUser    TempPassword123
    Open User Management Window
    Delete User From UserManagement Window    TempUser
    Run Keyword And Continue On Failure  Verify User Deleted From UserManagement Window    TempUser
    Close User Management Window
    Close FoxRT Application Window
    Fail    Known bug: Currently, the application allows deleting the user that is currently logged in, which should not be allowed.
MFRTB29 - Verify whether annotation selection is getting reset when closing and reopening the project.
    [Documentation]    This test case is to verify whether annotation selection are getting reset when closing and reopening the project.

    Open FoxViewerDesktop Application
    Login To FoxViewerDesktop    admin    admin
    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.dcm
    Sleep    0.2s
    Click    ${ruler_annotation_button_xpath}
    Sleep    0.2s
    Close Project
    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.dcm
    Run Keyword And Continue On Failure    VerifyControlState    ${ruler_annotation_button_xpath}    de-selected
MFRTB30 - Verify whether tools selection is getting reset when closing and reopening the project.
    [Documentation]    This test case is to verify whether tools selection are getting reset when closing and reopening the project.

    Sleep    0.2s
    Click    ${window_level_tool_button_xpath}
    Sleep    0.2s
    Close Project
    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.dcm
    Run Keyword And Continue On Failure    VerifyControlState    ${window_level_tool_button_xpath}    de-selected
    Sleep    0.2s
    Click    ${window_level_tool_button_xpath}
MFRTB31 - Verify whether permissions options are disabled for admin account when full access is provided.
    [Documentation]    This test case is to verify whether permissions options are disabled for admin account when full access is provided.

    Open User Management Window
    Select User In User Management Window    admin
    Run Keyword And Continue On Failure    VerifyControlState    ${Annotations_Button_UserManagement_XPATH}    disabled
    Run Keyword And Continue On Failure    VerifyControlState    ${Analysis_Button_UserManagement_XPATH}    disabled
    Run Keyword And Continue On Failure    VerifyControlState    ${Filters_Button_UserManagement_XPATH}    disabled
    Run Keyword And Continue On Failure    VerifyControlState    ${ImageTools_Button_UserManagement_XPATH}    disabled
    Run Keyword And Continue On Failure    VerifyControlState    ${fileoperations_Button_UserManagement_XPATH}    disabled
    Run Keyword And Continue On Failure    VerifyControlState    ${reporting_Button_UserManagement_XPATH}    disabled
    Run Keyword And Continue On Failure    VerifyControlState    ${DICOMTags_Button_UserManagement_XPATH}    disabled
    Run Keyword And Continue On Failure    VerifyControlState    ${Calibration_Button_UserManagement_XPATH}    disabled
    Run Keyword And Continue On Failure    VerifyControlState    ${ImageStitching_Button_UserManagement_XPATH}    disabled
    Close User Management Window
    Close Project
MFRTB32 - Verify whether able to switch to next and previous image using next and previous buttons after loading the same folder set twice.
    [Documentation]    This test case is to verify whether able to switch to next and previous image using next and previous buttons after loading the same folder set twice.

    Open FolderSet    ${folder_Directory_Path}
    Open FolderSet    ${folder_Directory_Path}
    Press Shortcut Keys    Right
    Press Shortcut Keys    Right
    Take Actual Screenshot    MFRTB32_Actual.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTB32_Actual.png    MFRTB32_Actual.png
    Close Project
    Fail    Known bug: After loading the same folder set twice, the next and previous buttons do not work to switch between images, 
    ...    once fixed make sure correct screenshot is saved in expected result folder.
MFRTB33 - Verify whether deleted annotations are getting persisted after switching between images.
    [Documentation]    This test case is to verify whether deleted annotations are getting persisted after switching between images.

    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.dcm    
    ...    ${project_Directory_Path}MLE_6_0.280.dcm    
    ...    ${project_Directory_Path}MLE_8''0.322.dcm
    Add Annotation    annotation_type=Rectangle
    Take Actual Screenshot    MFRTB33_Actual1.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTB33_Actual1.png    MFRTB33_Actual1.png
    Select Files From Files Tab    MLE_6_0.280.dcm
    Select Files From Files Tab    MLE_4_0.237.dcm
    Take Actual Screenshot    MFRTB33_Actual2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTB33_Actual2.png    MFRTB33_Actual2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTB33_Actual1.png    MFRTB33_Actual2.png
    Delete the annotation
    Select Files From Files Tab    MLE_6_0.280.dcm
    Select Files From Files Tab    MLE_4_0.237.dcm
    Take Actual Screenshot    MFRTB33_Actual3.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTB33_Actual3.png    MFRTB33_Actual3.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTB33_Actual1.png    MFRTB33_Actual3.png    100    False
    Close Project
MFRTB34 - Verify whether removed defects over image are getting persisted after switching between images.
    [Documentation]    This test case is to verify whether removed defects over image are getting persisted after switching between images.

    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.dcm    
    ...    ${project_Directory_Path}MLE_6_0.280.dcm    
    ...    ${project_Directory_Path}MLE_8''0.322.dcm
    Add Defect Marking and Classification Tool over image    Porosity    Rectangle    821    372    1008    416
    Sleep    0.2s
    Click    ${defect_marking_tool_button_xpath}
    Sleep    0.2s
    Take Actual Screenshot    MFRTB34_Actual1.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTB34_Actual1.png    MFRTB34_Actual1.png
    Select Files From Files Tab    MLE_6_0.280.dcm
    Select Files From Files Tab    MLE_4_0.237.dcm
    Take Actual Screenshot    MFRTB34_Actual2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTB34_Actual2.png    MFRTB34_Actual2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTB34_Actual1.png    MFRTB34_Actual2.png
    Delete Selected Defect    1
    Sleep    0.2s
    Click    ${defect_marking_tool_button_xpath}
    Sleep    0.2s
    Select Files From Files Tab    MLE_6_0.280.dcm
    Select Files From Files Tab    MLE_4_0.237.dcm
    Take Actual Screenshot    MFRTB34_Actual3.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTB34_Actual3.png    MFRTB34_Actual3.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTB34_Actual1.png    MFRTB34_Actual3.png    100    False
    Close Project
    Close FoxRT Application Window
    
   



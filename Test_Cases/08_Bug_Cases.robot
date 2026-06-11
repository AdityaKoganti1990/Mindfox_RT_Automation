*** Settings ***
Documentation     Bug cases test suite. Total Test Cases: 90 (MFRTB01 - MFRTB90).
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

MFRTB01 - Verify whether annotations are shown properly after rotating the image.
    [Documentation]    This test case is to verify whether annotations are shown properly after rotating the image.
    
    Open FoxViewerDesktop Application
    Login To FoxViewerDesktop    admin    admin
    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.dcm
    Add Text Annotation    This is a text annotation
    Rotate Image Viewer    Rotate CW
    Rotate Image Viewer    Rotate CW
    Take Actual Screenshot    MFRTB01_Actual.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTB01_Actual.png    MFRTB01_Actual.png
    Rotate Image Viewer    Rotate CCW
    Take Actual Screenshot    MFRTB01_Actual2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTB01_Actual2.png    MFRTB01_Actual2.png    
    Rotate Image Viewer    Rotate CCW

MFRTB02 - Verify whether annotations are shown properly after flipping the image.
    [Documentation]    This test case is to verify whether annotations are shown properly after flipping the image.
    
    Flip Image Viewer    Horizontal
    Take Actual Screenshot    MFRTB02_Actual.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTB02_Actual.png    MFRTB02_Actual.png
    Flip Image Viewer    Horizontal
    Flip Image Viewer    Vertical
    Take Actual Screenshot    MFRTB02_Actual2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTB02_Actual2.png    MFRTB02_Actual2.png
    Flip Image Viewer    Vertical
    Delete the annotation
    Close Project

MFRTB03 - Verify whether able to open .png files in image viewer.
    [Documentation]    This test case is to verify whether able to open .png files in image viewer.
    
    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.png
    Take Actual Screenshot    MFRTB03_Actual.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTB03_Actual.png    MFRTB03_Actual.png

MFRTB04 - Verify whether able to add annotations to .png files in image viewer.
    [Documentation]    This test case is to verify whether able to add annotations to .png files in image viewer.
    
    Add Text Annotation    This is a text annotation
    Take Actual Screenshot    MFRTB04_Actual.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTB04_Actual.png    MFRTB04_Actual.png
    Delete the annotation

MFRTB05 - Verify whether able to apply window level to .png files in image viewer.
    [Documentation]    This test case is to verify whether able to apply window level to .png files in image viewer.
    
    Apply Window Level    2    845    470    1050    570
    Take Actual Screenshot    MFRTB05_Actual.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTB05_Actual.png    MFRTB05_Actual.png
    Click    ${window_level_tool_button_xpath}

MFRTB06 - Verify whether able to apply filter to .png files in image viewer.
    [Documentation]    This test case is to verify whether able to apply filter to .png files in image viewer.

    Apply Fox Bleach Filter    True
    Take Actual Screenshot    MFRTB06_Actual.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTB06_Actual.png    MFRTB06_Actual.png
    Reset View

MFRTB07 - Verify whether able to open .jpg files in image viewer.
    [Documentation]    This test case is to verify whether able to open .jpg files in image viewer.

    Close Project
    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.jpg
    Take Actual Screenshot    MFRTB07_Actual.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTB07_Actual.png    MFRTB07_Actual.png

MFRTB08 - Verify whether able to add annotations to .jpg files in image viewer.
    [Documentation]    This test case is to verify whether able to add annotations to .jpg files in image viewer.

    Add Text Annotation    This is a text annotation
    Take Actual Screenshot    MFRTB08_Actual.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTB08_Actual.png    MFRTB08_Actual.png
    Delete the annotation    

MFRTB09 - Verify whether able to apply window level to .jpg files in image viewer.
    [Documentation]    This test case is to verify whether able to apply window level to .jpg files in image viewer.

    Apply Window Level    2    845    470    1050    570
    Take Actual Screenshot    MFRTB09_Actual.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTB09_Actual.png    MFRTB09_Actual.png
    Click    ${window_level_tool_button_xpath}

MFRTB10 - Verify whether able to apply filter to .jpg files in image viewer.
    [Documentation]    This test case is to verify whether able to apply filter to .jpg files in image viewer.

    Apply Fox Bleach Filter    True
    Take Actual Screenshot    MFRTB10_Actual.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTB10_Actual.png    MFRTB10_Actual.png
    Reset View

MFRTB11 - Verify whether able to open .bmp files in image viewer.
    [Documentation]    This test case is to verify whether able to open .bmp files in image viewer.

    Close Project
    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.bmp
    Take Actual Screenshot    MFRTB11_Actual.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTB11_Actual.png    MFRTB11_Actual.png

MFRTB12 - Verify whether able to add annotations to .bmp files in image viewer.
    [Documentation]    This test case is to verify whether able to add annotations to .bmp files in image viewer.

    Add Text Annotation    This is a text annotation
    Take Actual Screenshot    MFRTB12_Actual.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTB12_Actual.png    MFRTB12_Actual.png
    Delete the annotation

MFRTB13 - Verify whether able to apply window level to .bmp files in image viewer.
    [Documentation]    This test case is to verify whether able to apply window level to .bmp files in image viewer.

    Apply Window Level    2    845    470    1050    570
    Take Actual Screenshot    MFRTB13_Actual.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTB13_Actual.png    MFRTB13_Actual.png
    Click    ${window_level_tool_button_xpath}

MFRTB14 - Verify whether able to apply filter to .bmp files in image viewer.
    [Documentation]    This test case is to verify whether able to apply filter to .bmp files in image viewer.

    Apply Fox Bleach Filter    True
    Take Actual Screenshot    MFRTB14_Actual.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTB14_Actual.png    MFRTB14_Actual.png
    Reset View

MFRTB15 - Verify whether able to open .tiff files in image viewer.
    [Documentation]    This test case is to verify whether able to open .tiff files in image viewer.

    Close Project
    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.tiff
    Take Actual Screenshot    MFRTB15_Actual.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTB15_Actual.png    MFRTB15_Actual.png

MFRTB16 - Verify whether able to add annotations to .tiff files in image viewer.
    [Documentation]    This test case is to verify whether able to add annotations to .tiff files in image viewer.

    Add Text Annotation    This is a text annotation
    Take Actual Screenshot    MFRTB16_Actual.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTB16_Actual.png    MFRTB16_Actual.png
    Delete the annotation

MFRTB17 - Verify whether able to apply window level to .tiff files in image viewer.
    [Documentation]    This test case is to verify whether able to apply window level to .tiff files in image viewer.

    Apply Window Level    2    845    470    1050    570
    Take Actual Screenshot    MFRTB17_Actual.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTB17_Actual.png    MFRTB17_Actual.png
    Click    ${window_level_tool_button_xpath}

MFRTB18 - Verify whether able to apply filter to .tiff files in image viewer.
    [Documentation]    This test case is to verify whether able to apply filter to .tiff files in image viewer.

    Apply Fox Bleach Filter    True
    Take Actual Screenshot    MFRTB18_Actual.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTB18_Actual.png    MFRTB18_Actual.png
    Reset View
    Close Project

MFRTB19 - Verify whether annotations are shown in generated report.
    [Documentation]    This test case is to verify whether annotations are shown in generated report.
    
    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.dcm
    Add Text Annotation    This is a text annotation
    Open Report Viewer
    Set Report Viewer Params    TestReport1    2026-04-15    Test Report Title    True    True    True    True
    Click Export Pdf Button    MFRTB19
    Run Keyword And Continue On Failure    Compare Result Files    MFRTB19.pdf    MFRTB19.pdf    95
    Delete the annotation

MFRTB20 - Verify whether tools are shown in generated report.
    [Documentation]    This test case is to verify whether tools are shown in generated report.
    
    Close Project
    Open ProjectFile    ${project_Directory_Path}DuplexPlate_With_RT.dcm
    Detect IQI Wire Phantom Tool
    Open Report Viewer
    Set Report Viewer Params    TestReport2    2026-04-15    Test Report Title    True    True    True    True
    Click Export Pdf Button    MFRTB20
    Run Keyword And Continue On Failure    Compare Result Files    MFRTB20.pdf    MFRTB20.pdf    95
    Click    ${IQI_wire_phantom_tool_button_xpath}
    Close Project

MFRTB21 - Verify whether able to move annotation labels over the image in image viewer.
    [Documentation]    This test case is to verify whether able to move annotation labels over the image in image viewer.

    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.dcm
    Add Annotation    annotation_type=Ruler
    Take Actual Screenshot    MFRTB21_Actual1.png
    Move annotation Label    886    606    844    515
    Take Actual Screenshot    MFRTB21_Actual2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTB21_Actual2.png    MFRTB21_Actual2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTB21_Actual1.png    MFRTB21_Actual2.png    100    False
    Delete the annotation

MFRTB22 - Verify whether able to export audit log in csv format.
    [Documentation]    This test case is to verify whether able to export audit log in csv format.

    Open audit Logs
    Apply Audit Log Filter Params    2026-05-01    2026-05-08    All    All
    Export Audit Log    MFRTB22_Audit.csv
    Run Keyword And Continue On Failure   Verify Exported File Saved    MFRTB22_Audit.csv    ${audit_log_exports_directory}
    Close audit Logs
    
MFRTB23 - Verify whether Clear all files button is disabled when there are no files under the Files tab.
    [Documentation]    This test case is to verify whether Clear all files button is disabled when there are no files under the Files tab.

    Close Project
    Run Keyword And Continue On Failure   VerifyControlState    control_name=${Button_Clear_XPATH}    expected_state=disabled    timeout=1

MFRTB24 - Verify whether adding same file again throws error message.
    [Documentation]    This test case is to verify whether adding same file again throws error message.

    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.dcm
    Click    ${project_menu_item_xpaths}
    ${input_xpath}=    Get Open File Dialog Input Locator
    Set Text To Textbox    ${input_xpath}    ${project_Directory_Path}MLE_4_0.237.dcm
    Click Open File Dialog Button
    ${duplicate_dialog_visible}=    Run Keyword And Return Status    Wait Until Element Exist    //*[@Name="Duplicate Files"]    5
    Run Keyword And Continue On Failure    Should Be True    ${duplicate_dialog_visible}    Duplicate Files warning was not shown when adding the same file again.
    Dismiss Project Open Warning Popup If Present
    Close Project

MFRTB25 - Verify whether able to draw annotations outide the bounds of image.
    [Documentation]    This test case is to verify whether able to draw annotations outide the bounds of image.

    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.dcm
    Add Annotation at custom position    Ruler    1050    400    1350    400
    Take Actual Screenshot    MFRTB25_Actual.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTB25_Actual.png    MFRTB25_Actual.png
    Delete the annotation

MFRTB26 - Verify whether warning message is shown when trying to remove annotations.
    [Documentation]    This test case is to verify whether warning message is shown when trying to remove annotations.

    Add Annotation    Rectangle
    ${warning_shown}=    Delete the annotation
    Run Keyword And Continue On Failure    Should Be True    ${warning_shown}
    ...    Expected the annotation removal warning popup to appear, but it did not.

MFRTB27 - Verify whether text and labels of annotations are shown properly after flipping the image.
    [Documentation]    This test case is to verify whether text and labels of annotations are shown properly after flipping the image.

    Add Annotation at custom position    Ruler    845    470    1050    570
    Add Text Annotation    This is a text annotation
    Flip Image Viewer    Horizontal
    Take Actual Screenshot    MFRTB27_Actual.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTB27_Actual.png    MFRTB27_Actual.png
    Flip Image Viewer    Vertical
    Take Actual Screenshot    MFRTB27_Actual2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTB27_Actual2.png    MFRTB27_Actual2.png
    Reset View
    Apply Auto Best BNC

MFRTB28 - Verify whether text and labels of annotations are shown properly after rotating the image.
    [Documentation]    This test case is to verify whether text and labels of annotations are shown properly after rotating the image.

    Rotate Image Viewer    Rotate CW
    Take Actual Screenshot    MFRTB28_Actual.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTB28_Actual.png    MFRTB28_Actual.png
    Rotate Image Viewer    Rotate CCW
    Rotate Image Viewer    Rotate CCW
    Take Actual Screenshot    MFRTB28_Actual2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTB28_Actual2.png    MFRTB28_Actual2.png
    Rotate Image Viewer    Rotate CW
    Delete the annotation
    Reset View
    Apply Auto Best BNC
    Close Project

MFRTB29 - Verify whether intensity values are shown in status bar for .png files.
    [Documentation]    This test case is to verify whether intensity values are shown in status bar for .png files.

    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.png
    Hover Mouse Over Image Viewer    930    460
    Verify Intensity Value Not Exists In Status Bar
    Close Project

MFRTB30 - Verify whether intensity values are shown in status bar for .jpg files.
    [Documentation]    This test case is to verify whether intensity values are shown in status bar for .jpg files.

    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.jpg
    Hover Mouse Over Image Viewer    930    460
    Verify Intensity Value Not Exists In Status Bar
    Close Project

MFRTB31 - Verify whether intensity values are shown in status bar for .tiff files.
    [Documentation]    This test case is to verify whether intensity values are shown in status bar for .tiff files.

    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.tiff
    Hover Mouse Over Image Viewer    930    460
    Verify Intensity Value Not Exists In Status Bar
    Close Project

MFRTB32 - Verify whether intensity values are shown in status bar for .bmp files.
    [Documentation]    This test case is to verify whether intensity values are shown in status bar for .bmp files.

    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.bmp
    Hover Mouse Over Image Viewer    930    460
    Verify Intensity Value Not Exists In Status Bar
    Close Project

MFRTB33 - Verify whether RGB values are shown in status bar for .png files.
    [Documentation]    This test case is to verify whether RGB values are shown in status bar for .png files.

    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.png
    Hover Mouse Over Image Viewer    930    460
    Verify RGB Value Exists In Status Bar    135,135,135
    Close Project

MFRTB34 - Verify whether RGB values are shown in status bar for .jpg files.
    [Documentation]    This test case is to verify whether RGB values are shown in status bar for .jpg files.

    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.jpg
    Hover Mouse Over Image Viewer    930    460
    Verify RGB Value Exists In Status Bar    135,135,135
    Close Project

MFRTB35 - Verify whether RGB values are shown in status bar for .tiff files.
    [Documentation]    This test case is to verify whether RGB values are shown in status bar for .tiff files.

    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.tiff
    Hover Mouse Over Image Viewer    930    460
    Verify RGB Value Exists In Status Bar    135,135,135
    Close Project

MFRTB36 - Verify whether RGB values are shown in status bar for .bmp files.
    [Documentation]    This test case is to verify whether RGB values are shown in status bar for .bmp files.

    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.bmp
    Hover Mouse Over Image Viewer    930    460
    Verify RGB Value Exists In Status Bar    135,135,135
    Close Project

MFRTB37 - Verify whether High Resolution image is getting loaded properly inside image viewer.
    [Documentation]    This test case is to verify whether High Resolution image is getting loaded properly inside image viewer.

    Open ProjectFile    ${project_Directory_Path}25um.dcm
    Take Actual Screenshot    MFRTB37_Actual.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTB37_Actual.png    MFRTB37_Actual.png
    Close Project

MFRTB38 - Verify whether all Annotations, Analysis tools and Image Operation tools are disabled when no image is loaded in image viewer.
    [Documentation]    This test case is to verify whether all Annotations, Analysis tools and Image Operation tools are disabled when no image is loaded in image viewer.

    Run Keyword And Continue On Failure     Verify All Annotation Tools Are Disabled
    Run Keyword And Continue On Failure     Verify All Analysis Tools Are Disabled
    Run Keyword And Continue On Failure     Verify All Image Operation Tools Are Disabled

MFRTB39 - Verify whether warning message is shown when trying to close the application.
    [Documentation]    This test case is to verify whether warning message is shown when trying to close the application.

    Invoke Button    ${MAIN_CLOSE_BTN_XPATH}
    Sleep    1s
    run Keyword And Continue On Failure    VerifyControlState    ${MAIN_CLOSE_CONFIRMATION_YES_BTN_XPATH}    exists    2
    run Keyword And Continue On Failure    VerifyControlState    ${MAIN_CLOSE_CONFIRMATION_NO_BTN_XPATH}    exists    2
    Invoke Button    ${MAIN_CLOSE_CONFIRMATION_NO_BTN_XPATH}

MFRTB40 - Verify whether option is provided to open generated report from the application.
    [Documentation]    This test case is to verify whether option is provided to open generated report from the application.

    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.dcm
    Open Report Viewer
    Set Report Viewer Params    TestReport3    2026-04-15    Test Report Title    True    True    True    True
    sleep    0.5s
    click    ${REPORT_VIEWER_EXPORT-PDF_BUTTON_XPATH}
    sleep    0.5s
    Set Text To Textbox    ${EXPORT_PDF_DIALOG_FILENAME_XPATH}    ${CURDIR}\\..\\Actual\\MFRTB40.pdf
    Sleep    0.5s
    Click    ${Export_PDF_DIALOG_SAVE_BUTTON_XPATH}
    Sleep    0.5s
    ${replace_prompt_visible}=    Run Keyword And Return Status
    ...    Wait Until Element Exist    ${EXPORT_PDF_REPLACE_YES_BUTTON_XPATH}    3
    IF    ${replace_prompt_visible}
        IF    'Yes' == 'no'
            Click    ${EXPORT_PDF_REPLACE_NO_BUTTON_XPATH}
        ELSE
            Click    ${EXPORT_PDF_REPLACE_YES_BUTTON_XPATH}
        END
    ELSE
        ${replace_prompt_visible_fallback}=    Run Keyword And Return Status
        ...    Wait Until Element Exist    ${EXPORT_PDF_REPLACE_YES_BUTTON_FALLBACK_XPATH}    2
        IF    ${replace_prompt_visible_fallback}
            IF    'Yes' == 'no'
                Click    ${EXPORT_PDF_REPLACE_NO_BUTTON_FALLBACK_XPATH}
            ELSE
                Click    ${EXPORT_PDF_REPLACE_YES_BUTTON_FALLBACK_XPATH}
            END
        END
    END
    Wait Until Element Exist    ${Report_open_report_button_XPATH}    10
    Run Keyword And Continue On Failure    VerifyControlState    ${Report_open_report_button_XPATH}    exists    2
    sleep    0.2s
    Click    ${Report_close_report_button_XPATH}

MFRTB41 - Verify whether clear annotations button is disabled when no annotations are added over the image in image viewer.
    [Documentation]    This test case is to verify whether clear annotations button is disabled when no annotations are added over the image in image viewer.

    Take Actual Screenshot    MFRTB41_Actual.png
    Run Keyword And Continue On Failure    compare Result Images    MFRTB41_Actual.png    MFRTB41_Actual.png
    VerifyControlState    control_name=${delete_annotation_button_xpath}    expected_state=disabled    timeout=1

MFRTB42 - Verify whether warning message is shown when trying to close image after doing modifications.
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

MFRTB43 - Verify whether able to add wallthickness tool over the testCR.dcm file.
    [Documentation]    This test case is to verify whether able to add wallthickness tool over the testCR.dcm file.

    Open ProjectFile    ${project_Directory_Path}testCR.dcm
    Add Wall Thickness Measurement tool over image    480    340    545    340
    Take Actual Screenshot    MFRTB43_Actual.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTB43_Actual.png    MFRTB43_Actual.png
    Take wall thickness measurement window Screenshot    MFRTB43_Actual2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTB43_Actual2.png    MFRTB43_Actual2.png
    Click Delete Wall Thickness Measurement Annotation    580    270
    Close Project

MFRTB44 - Verify whether annotations are getting removed when image is closed in image viewer.
    [Documentation]    This test case is to verify whether annotations are getting removed when image is closed in image viewer.

    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.dcm
    Add Text Annotation    This is a text annotation
    Take Actual Screenshot    MFRTB44_Actual.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTB44_Actual.png    MFRTB44_Actual.png
    Close Project
    Take window Screenshot    MFRTB44_Actual2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTB44_Actual2.png    MFRTB44_Actual2.png
    Close Project

MFRTB45 - Verify whether Area Adjust and Window Level options are not available(disabled) for .png files in image viewer.
    [Documentation]    This test case is to verify whether Area Adjust and Window Level options are not available(disabled) for .png files in image viewer.

    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.png
    Run Keyword And Continue On Failure   VerifyControlState    ${window_level_tool_button_xpath}    not exists
    Run Keyword And Continue On Failure   VerifyControlState    ${window_Level_tool_panel_button_xpath}    not exists
    Close Project

MFRTB46 - Verify whether Area Adjust and Window Level options are not available(disabled) for .jpg files in image viewer.
    [Documentation]    This test case is to verify whether Area Adjust and Window Level options are not available(disabled) for .jpg files in image viewer.

    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.jpg
    Run Keyword And Continue On Failure   VerifyControlState    ${window_level_tool_button_xpath}    not exists
    Run Keyword And Continue On Failure   VerifyControlState    ${window_Level_tool_panel_button_xpath}    not exists
    Close Project

MFRTB47 - Verify whether Area Adjust and Window Level options are not available(disabled) for .bmp files in image viewer.
    [Documentation]    This test case is to verify whether Area Adjust and Window Level options are not available(disabled) for .bmp files in image viewer.

    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.bmp
    Run Keyword And Continue On Failure   VerifyControlState    ${window_level_tool_button_xpath}    not exists
    Run Keyword And Continue On Failure   VerifyControlState    ${window_Level_tool_panel_button_xpath}    not exists
    Close Project

MFRTB48 - Verify whether Area Adjust and Window Level options are not available(disabled) for .tiff files in image viewer.
    [Documentation]    This test case is to verify whether Area Adjust and Window Level options are not available(disabled) for .tiff files in image viewer.

    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.tiff
    Run Keyword And Continue On Failure   VerifyControlState    ${window_level_tool_button_xpath}    not exists
    Run Keyword And Continue On Failure   VerifyControlState    ${window_Level_tool_panel_button_xpath}    not exists
    Close Project

MFRTB49 - Verify whether files added under files tab are getting persisted after close and open application.
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

MFRTB50 - Verify whether closing one tab in the right panel closes the entire panel.
    [Documentation]    This test case is to verify whether closing one tab in the right panel closes the entire panel.

    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.dcm
    Click Image Filter Tool
    Select Tab In Right Panel    Filters
    Close Tab In Right Panel    Filters
    Run Keyword And Continue On Failure   VerifyControlState    ${filters_tab_xpath}    exists
    Run Keyword And Continue On Failure   VerifyControlState    ${filters_tab_xpath}    enabled
    sleep    0.2s
    Click    /Window/Button[33]

MFRTB51 - Verify whether delete button is enabled when no user is selected in the user management window.
    [Documentation]    This test case is to verify whether delete button is enabled when no user is selected in the user management window.

    Open User Management Window
    Run Keyword And Continue On Failure   VerifyControlState    ${delete_user_button_xpath}    disabled
    Close User Management Window

MFRTB52 - Verify whether save changes button gets enabled without making changes in the user management window.
    [Documentation]    This test case is to verify whether save changes button gets enabled without making changes in the user management window.

    Open User Management Window
    Select User In User Management Window    admin  
    Run Keyword And Continue On Failure   VerifyControlState    ${save_changes_button_xpath}    disabled
    Close User Management Window
    Close Project

MFRTB53 - Verify whether save chnages warning is popped when clsoing the project with IQI analysis performed.
    [Documentation]    This test case is to verify whether save chnages warning is popped when clsoing the project with IQI analysis performed.

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

MFRTB54 - Verify whether warning message is shown when trying to change the defect result.
    [Documentation]    This test case is to verify whether warning message is shown when trying to change the defect result.

    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.dcm
    Add Defect Marking and Classification Tool over image    Porosity    Rectangle    821    372    1008    416
    Select Acceptance Criteria Code    Manual
    Select Acceptance Criteria    Accept    Accepted By Manual Inspection
    ${warning_shown}=    Select Acceptance Criteria    Reject    Changing decision to reject
    Run Keyword And Continue On Failure    Should Be True    ${warning_shown}    Confirm Status Change dialog should appear when changing the defect result, but it did not.
    Delete Selected Defect    1
    Click    ${defect_marking_tool_button_xpath}

MFRTB55 - Verify whether custom defect type is getting added properly and shown in the defect marking and classification tool.
    [Documentation]    This test case is to verify whether custom defect type is getting added properly and shown in the defect marking and classification tool.

    Add Defect Marking and Classification Tool over image    Other    Rectangle    821    372    1008    416    Custom Defect
    Take Actual Screenshot    MFRTB55_Actual.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTB55_Actual.png    MFRTB55_Actual.png
    Delete Selected Defect    1
    Click    ${defect_marking_tool_button_xpath}
    Fail    Known bug: Custom defect type is showing large text which is odd over the image, need to change screenshot once fixed.

MFRTB56 - Verify whether able to evalute custom defect type in the defect marking and classification tool.
    [Documentation]    This test case is to verify whether able to evalute custom defect type in the defect marking and classification tool.

    Add Defect Marking and Classification Tool over image    Other    Rectangle    821    372    1008    416    Custom Defect
    Select Acceptance Criteria Code    Manual
    Select Acceptance Criteria    Accept    Accepted By Manual Inspection
    Take Actual Screenshot    MFRTB56_Actual.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTB56_Actual.png    MFRTB56_Actual.png
    Select Acceptance Criteria    Reject    Rejected By Manual Inspection
    Take Actual Screenshot    MFRTB56_Actual2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTB56_Actual2.png    MFRTB56_Actual2.png
    Delete Selected Defect    1
    Click    ${defect_marking_tool_button_xpath}
    Fail    Known bug: Custom defect type is showing large text which is odd over the image, need to change screenshot once fixed.

MFRTB57 - Verify whether able to export images with defects added over the image.
    [Documentation]    This test case is to verify whether able to export images with defects added over the image.

    Add Defect Marking and Classification Tool over image    Porosity    Rectangle    821    372    1008    416
    Select Acceptance Criteria Code    ASME B31.3
    Evaluate Defect Marked    1
    Add Defect Marking and Classification Tool over image    Crack    Ellipse    821    549    1009    631
    Select Acceptance Criteria Code    ASME B31.3
    Evaluate Defect Marked    2
    Click    ${defect_marking_tool_button_xpath}
    Export Image    MFRTB57_Image    ${Actual_Image_Exports}MFRTB57_Image    PNG     False
    Run Keyword And Continue On Failure    Compare Result Images    ${Actual_Image_Exports}MFRTB57_Image.png    ${Expected_Image_Exports}MFRTB57_Image.png
    Click    ${defect_marking_tool_button_xpath}
    Delete Selected Defect    2
    Delete Selected Defect    1
    Click    ${defect_marking_tool_button_xpath}
    Close Project

MFRTB58 - Verify whether application theme is getting persisted after close and open application.
    [Documentation]    This test case is to verify whether application theme is getting persisted after close and open application.

    Switch Between Window Theme
    Take Actual Screenshot    MFRTB58_Actual.png
    Close FoxRT Application Window
    Open FoxViewerDesktop Application
    Login To FoxViewerDesktop    admin    admin
    Take Actual Screenshot    MFRTB58_Actual2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTB58_Actual.png    MFRTB58_Actual2.png
    Switch Between Window Theme

MFRTB59 - Verify whether apply to apply window level over the filtered image propely.
    [Documentation]    This test case is to verify whether apply to apply window level over the filtered image propely.

    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.dcm
    Apply Fox Bleach Filter    True
    Apply Window Level    1    845    470    1050    570
    Take Actual Screenshot    MFRTB59_Actual.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTB59_Actual.png    MFRTB59_Actual.png
    Click    ${window_level_tool_button_xpath}
    Reset View
    Apply Auto Best BNC
    Close Project
    Fail    Known bug: window level over filtered image does not render correctly.

MFRTB60 - Verify whether status bar message is shown properly after loading files into files tab.
    [Documentation]    This test case is to verify whether status bar message is shown properly after loading files into files tab.

    Open FolderSet    ${folder_Directory_Path}
    Run Keyword And Continue On Failure    Verify Status Bar Message    Loaded 6 file(s) from folder
    Close Project

MFRTB61 - Verify whether units set in application settings are persisted on re-opening the application.
    [Documentation]    This test case is to verify whether units set in application settings are persisted on re-opening the application.

    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.dcm
    Change Units Across Application    inch
    Add Annotation    Ruler
    Take Actual Screenshot    MFRTB61_Actual.png
    Close FoxRT Application Window
    Open FoxViewerDesktop Application
    Login To FoxViewerDesktop    admin    admin
    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.dcm
    Add Annotation    Ruler
    Take Actual Screenshot    MFRTB61_Actual2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTB61_Actual.png    MFRTB61_Actual2.png
    Delete the annotation
    Change Units Across Application    mm

MFRTB62 - Verify whether dicom tags are getting removed from image viewer after closing the project.
    [Documentation]    This test case is to verify whether dicom tags are getting removed from image viewer after closing the project.

    Close Project
    Take Actual Screenshot    MFRTB62_Actual.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTB62_Actual.png    MFRTB62_Actual.png

MFRTB63 - Verify whether able to Cancel IQI detection.
    [Documentation]    This test case is to verify whether able to Cancel IQI detection.

    Open ProjectFile    ${project_Directory_Path}DuplexPlate_With_RT.dcm
    Click    ${IQI_wire_phantom_tool_button_xpath}
    sleep    0.2s
    Click Cancel IQI Detection
    Take Actual Screenshot    MFRTB63_Actual.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTB63_Actual.png    MFRTB63_Actual.png

MFRTB64 - Verify whether IQI detection is working over a filtered image.
    [Documentation]    This test case is to verify whether IQI detection is working over a filtered image.

    Apply Fox Bleach Filter    True
    Run Keyword And Continue On Failure   Detect IQI Wire Phantom Tool
    Take Actual Screenshot    MFRTB64_Actual.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTB64_Actual.png    MFRTB64_Actual.png
    Click    ${IQI_wire_phantom_tool_button_xpath}
    Close Project
    Fail    Known bug: IQI detection over filtered image does not work.

MFRTB65 - Verify whether dual viewer closes when all files are removed from files tab.
    [Documentation]    This test case is to verify whether dual viewer closes when all files are removed from files tab.

    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.dcm    
    ...    ${project_Directory_Path}MLE_6_0.280.dcm    
    ...    ${project_Directory_Path}MLE_8''0.322.dcm
    Open/Close Dual View Mode    True
    Run Keyword And Continue On Failure    VerifyControlState    ${LEFT_IMAGE_VIEWER_XPATH}    exists
    Run Keyword And Continue On Failure    VerifyControlState    ${RIGHT_IMAGE_VIEWER_XPATH}    exists
    Take Actual Screenshot    MFRTB65_Actual.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTB65_Actual.png    MFRTB65_Actual.png
    Close Project
    Run Keyword And Continue On Failure    VerifyControlState    ${LEFT_IMAGE_VIEWER_XPATH}    exists
    Run Keyword And Continue On Failure    VerifyControlState    ${RIGHT_IMAGE_VIEWER_XPATH}    not exists
    Take Actual Screenshot    MFRTB65_Actual_2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTB65_Actual_2.png    MFRTB65_Actual_2.png

MFRTB66 - Verify whether Batch processing option is disabled in online mode.
    [Documentation]    This test case is to verify whether Batch processing option is disabled in online mode.

    Toggle Online Or Offline Mode    Online
    Show or Hide XRay Controller    Hide
    Toggle Motion Controller Window    Hide
    Run Keyword And Continue On Failure    VerifyControlState    ${BATCH_PROCESSING_BUTTON_XPATH}    not exists
    Toggle Online Or Offline Mode    Offline

MFRTB67 - Verify whether Clear All button is disabled in Batch processing window when no files are loaded into it.
   [Documentation]    This test case is to verify whether Clear All button is disabled in Batch processing window when no files are loaded into it.

    Open Batch Processing Window
    Run Keyword And Continue On Failure    VerifyControlState    ${batch_procession_window_clearall_button_XPATH}    disabled
    Close Batch Processing Window

MFRTB68 - Verify whether Run Batch button is disabled in Batch processing window when no files are loaded into it.
    [Documentation]    This test case is to verify whether Run Batch button is disabled in Batch processing window when no files are loaded into it.

    Open Batch Processing Window
    Run Keyword And Continue On Failure    VerifyControlState    ${batch_procession_window_run_batch_button_XPATH}    disabled
    Close Batch Processing Window

MFRTB69 - Verify whether able to open multiple instances of FoxRT application.
    [Documentation]    This test case is to verify that the 'FoXpert RT is already running.' warning is displayed when a second instance of FoxRT is launched while the first is still running.

    ${warning_message}=    Open FoxViewerDesktop Application
    Run Keyword And Continue On Failure    Should Contain    ${warning_message}    FoXpert RT is already running.
    ...    Expected the 'FoXpert RT is already running.' warning when launching a second instance, but got: '${warning_message}'.

MFRTB70 - Verify whether export path is persisted on reopening the export window.
    [Documentation]    This test case is to verify whether export path is persisted on reopening the export window.

    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.dcm
    Export Image    MFRTB70_Image    ${Actual_Image_Exports}MFRTB70_Image    PNG     False
    sleep    0.2s
    Click    ${Export_Image_Button_XPATH}
    sleep    0.2s
    Wait Until Element Exist    ${Export_Image_Window_XPATH}    5
    ${persisted_value}=    Get Name From Element    ${Export_Image_SaveIn_TextField_Xpath}
    Run Keyword And Continue On Failure    Should Contain    ${persisted_value}    Exports\\Image Exports\\Actual
    ...    Expected the export folder to be persisted in the Save In field, but got: '${persisted_value}'.
    sleep    0.2s
    Click    ${Export_Image_Cancel_Button_XPATH}
    sleep    0.2s

MFRTB71 - Verify whether able to move the labels of wall-thickness tool over the image.
    [Documentation]    This test case is to verify whether able to move the labels of the wall-thickness tool over the image in image viewer.

    Add Wall Thickness Measurement tool over image    790    400    840    400
    Take Actual Screenshot    MFRTB71_Actual1.png
    Move annotation Label    840    337    740    310
    Take Actual Screenshot    MFRTB71_Actual2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTB71_Actual2.png    MFRTB71_Actual2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTB71_Actual1.png    MFRTB71_Actual2.png    100    False
    Click Delete Wall Thickness Measurement Annotation    799    313

MFRTB72 - Verify whether clear all button in defect marking window is disabled when no defects are added over the image.
    [Documentation]    This test case is to verify whether clear all button in defect marking window is disabled when no defects are added over the image.

    Click    ${defect_marking_tool_button_xpath}
    Run Keyword And Continue On Failure    VerifyControlState    ${clear_all_defects_xpath}    disabled
    click    ${defect_marking_tool_button_xpath}

MFRTB73 - Verify whether Import Reference Image button is disbaled by default on opening the Reference Radiograph Atlas window.
    [Documentation]    This test case is to verify whether Import Reference Image button is disbaled by default on opening the Reference Radiograph Atlas window.

    Open Reference Radiograph Atlas
    Run Keyword And Continue On Failure    VerifyControlState    ${import_reference_image_button_xpath}    disabled
    Close Reference Radiograph Atlas

MFRTB74 - Verify whether when new user is created, status is shown correct in user management window.
    [Documentation]    This test case is to verify whether when new user is created, status is shown correct in user management window.

    Open User Management Window
    Add New User In UserManagement Window    TestUser    TestPassword123    Level I    5555    Mindfox
    Run Keyword And Continue On Failure   Verify New User Added In UserManagement Window    TestUser
    Close User Management Window

MFRTB75 - Verify whether when new user is removed, status is shown correct in user management window.
    [Documentation]    This test case is to verify whether when new user is removed, status is shown correct in user management window.

    Open User Management Window
    Delete User From UserManagement Window    TestUser
    Run Keyword And Continue On Failure   Verify User Deleted From UserManagement Window    TestUser
    Close User Management Window

MFRTB76 - Verify whether Save button is disabled when preset name is not entered.
    [Documentation]    This test case is to verify whether Save button is disabled when preset name is not entered.

    Click    ${percentile_brightness_contrast_filter_button_xpath}
    sleep    0.2s
    Run Keyword And Continue On Failure    VerifyControlState    ${percentile_brightness_contrast_savePreset_button_xpath}    disabled
    sleep    0.2s
    Click    ${window_XPATH}

MFRTB77 - Verify whether image info is showing correctly for DICOM files.
    [Documentation]    This test case is to verify whether image info is showing correctly for DICOM files.

    Run Keyword And Continue On Failure    Verify Image Info    DCM    
    ...    Dimensions:1762 × 2144 px    
    ...    Pixel spacing:0.1000 × 0.1000 mm/px    
    ...    Bit depth:16-bit unsigned    
    ...    Intensity min:8520    Intensity max:51798    
    ...    Window C / W:30670 / 36944
    Close Project

MFRTB78 - Verify whether image info is showing correctly for PNG files.
    [Documentation]    This test case is to verify whether image info is showing correctly for PNG files.

    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.png
    Run Keyword And Continue On Failure    Verify Image Info    PNG    
    ...    Dimensions:1762 × 2144 px    
    ...    Pixel spacing:—    
    ...    Bit depth:16-bit unsigned    
    ...    Intensity min:0    Intensity max:4096    
    ...    Window C / W:128 / 255
    Close Project

MFRTB79 - Verify whether image info is showing correctly for JPG files.
    [Documentation]    This test case is to verify whether image info is showing correctly for JPG files.

    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.jpg
    Run Keyword And Continue On Failure    Verify Image Info    JPG    
    ...    Dimensions:1762 × 2144 px    
    ...    Pixel spacing:—    
    ...    Bit depth:16-bit unsigned    
    ...    Intensity min:0    Intensity max:4096    
    ...    Window C / W:128 / 255
    Close Project

MFRTB80 - Verify whether image info is showing correctly for TIFF files.
    [Documentation]    This test case is to verify whether image info is showing correctly for TIFF files.

    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.tiff
    Run Keyword And Continue On Failure    Verify Image Info    TIFF    
    ...    Dimensions:1762 × 2144 px    
    ...    Pixel spacing:—    
    ...    Bit depth:16-bit unsigned    
    ...    Intensity min:0    Intensity max:4096    
    ...    Window C / W:128 / 255
    Close Project

MFRTB81 - Verify whether image info is showing correctly for BMP files.
    [Documentation]    This test case is to verify whether image info is showing correctly for BMP files.

    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.bmp
    Run Keyword And Continue On Failure    Verify Image Info    BMP    
    ...    Dimensions:1762 × 2144 px    
    ...    Pixel spacing:—    
    ...    Bit depth:16-bit unsigned    
    ...    Intensity min:0    Intensity max:4096    
    ...    Window C / W:128 / 255
    Close Project

MFRTB82 - Verify whether Tags Overlay button is disabled in Online mode.
    [Documentation]    This test case is to verify whether Tags Overlay button is disabled in Online mode.

    Toggle Online Or Offline Mode    Online
    Run Keyword And Continue On Failure    VerifyControlState    ${tags_overlay_button_xpath}    disabled
    Toggle Online Or Offline Mode    Offline

MFRTB83 - Verify whether reset view button is getting diabled after closing the project.
    [Documentation]    This test case is to verify whether reset view button is getting diabled after closing the project.

    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.dcm
    Zoom Image Viewer    ZoomIn    2
    Close Project
    Run Keyword And Continue On Failure    VerifyControlState    ${reset_view_button_xpath}    disabled
    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.dcm
    Close Project
    Run Keyword And Continue On Failure    VerifyControlState    ${reset_view_button_xpath}    disabled
    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.dcm

MFRTB84 - Verify whether able to remove the user that is currently logged in.
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
    Fail    Known bug: Currently, the application allows deleting the user that is currently logged in, which should not be allowed.`

MFRTB85 - Verify whether annotation selection is getting reset when closing and reopening the project.
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

MFRTB86 - Verify whether tools selection is getting reset when closing and reopening the project.
    [Documentation]    This test case is to verify whether tools selection are getting reset when closing and reopening the project.

    Sleep    0.2s
    Click    ${window_level_tool_button_xpath}
    Sleep    0.2s
    Close Project
    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.dcm
    Run Keyword And Continue On Failure    VerifyControlState    ${window_level_tool_button_xpath}    de-selected
    Sleep    0.2s
    Click    ${window_level_tool_button_xpath}

MFRTB87 - Verify whether permissions options are disabled for admin account when full access is provided.
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

MFRTB88 - Verify whether able to switch to next and previous image using next and previous buttons after loading the same folder set twice.
    [Documentation]    This test case is to verify whether able to switch to next and previous image using next and previous buttons after loading the same folder set twice.

    Open FolderSet    ${folder_Directory_Path}
    Open FolderSet    ${folder_Directory_Path}
    Press Shortcut Keys    Right
    Press Shortcut Keys    Right
    Take Actual Screenshot    MFRTB88_Actual.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTB88_Actual.png    MFRTB88_Actual.png
    Close Project
    Fail    Known bug: After loading the same folder set twice, the next and previous buttons do not work to switch between images, 
    ...    once fixed make sure correct screenshot is saved in expected result folder.

MFRTB89 - Verify whether shortcut key Esc clears all the annotation selection.
    [Documentation]    This test case is to verify whether shortcut key Esc clears all the annotation selection.

    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.dcm
    Click    ${arrow_annotation_button_xpath}
    Press Shortcut Keys    Esc
    Run Keyword And Continue On Failure    VerifyControlState    ${arrow_annotation_button_xpath}    de-selected
    Click    ${ruler_annotation_button_xpath}
    Press Shortcut Keys    Esc
    Run Keyword And Continue On Failure    VerifyControlState    ${ruler_annotation_button_xpath}    de-selected
    Click    ${line_annotation_button_xpath}
    Press Shortcut Keys    Esc
    Run Keyword And Continue On Failure    VerifyControlState    ${line_annotation_button_xpath}    de-selected
    Click    ${rectangle_annotation_button_xpath}
    Press Shortcut Keys    Esc
    Run Keyword And Continue On Failure    VerifyControlState    ${rectangle_annotation_button_xpath}    de-selected
    Click    ${circle_annotation_button_xpath}
    Press Shortcut Keys    Esc
    Run Keyword And Continue On Failure    VerifyControlState    ${circle_annotation_button_xpath}    de-selected
    Click    ${freehand_annotation_button_xpath}
    Press Shortcut Keys    Esc
    Run Keyword And Continue On Failure    VerifyControlState    ${freehand_annotation_button_xpath}    de-selected
    Click    ${text_annotation_button_xpath}
    Press Shortcut Keys    Esc
    Sleep    0.2s
    ${ann_props_visible}=    Run Keyword And Return Status    Wait Until Element Exist    /Window/Window[@Name="Annotation Properties"]    1
    IF    ${ann_props_visible}
        Click    /Window/Window[@Name="Annotation Properties"]/Button[@AutomationId="AnnProps_Btn_Cancel"]
        Sleep    0.2s
    END
    Run Keyword And Continue On Failure    VerifyControlState    ${text_annotation_button_xpath}    de-selected
    Click    ${point_intensity_annotation_button_xpath}
    Press Shortcut Keys    Esc
    Run Keyword And Continue On Failure    VerifyControlState    ${point_intensity_annotation_button_xpath}    de-selected
    Delete the annotation

MFRTB90 - Verify whether pressing Esc key cleares all the tool selection.
    [Documentation]    This test case is to verify whether pressing Esc key cleares all the tool selection.

    Click    ${line_profiler_tool_button_xpath}
    Press Shortcut Keys    Esc
    Run Keyword And Continue On Failure    VerifyControlState    ${line_profiler_tool_button_xpath}    de-selected
    Click    ${roi_statistics_tool_button_xpath}
    Press Shortcut Keys    Esc
    Run Keyword And Continue On Failure    VerifyControlState    ${roi_statistics_tool_button_xpath}    de-selected
    Sleep    0.2s
    Click    ${roi_statistics_tool_button_xpath}
    sleep    0.2s
    Click    ${window_level_tool_button_xpath}
    Press Shortcut Keys    Esc
    Run Keyword And Continue On Failure    VerifyControlState    ${window_level_tool_button_xpath}    de-selected
    Sleep    0.2s
    Click    ${window_level_tool_button_xpath}
    sleep    0.2s
    Click    ${window_Level_tool_panel_button_xpath}
    Press Shortcut Keys    Esc
    Run Keyword And Continue On Failure    VerifyControlState    ${window_Level_tool_panel_button_xpath}    de-selected
    Sleep    0.2s
    Click    ${window_Level_tool_panel_button_xpath}
    sleep    0.2s
    Click    ${pixel_intensity_histogram_button_xpath}
    Press Shortcut Keys    Esc
    Run Keyword And Continue On Failure    VerifyControlState    ${pixel_intensity_histogram_button_xpath}    de-selected
    Sleep    0.2s
    Click    ${pixel_intensity_histogram_button_xpath}
    sleep    0.2s
    Click    ${calibration_tool_button_xpath}
    Press Shortcut Keys    Esc
    Run Keyword And Continue On Failure    VerifyControlState    ${calibration_tool_button_xpath}    de-selected
    Click    ${snr_measurement_tool_button_xpath}
    Press Shortcut Keys    Esc
    Run Keyword And Continue On Failure    VerifyControlState    ${snr_measurement_tool_button_xpath}    de-selected
    Click    ${surface_plot_tool_button_xpath}
    Press Shortcut Keys    Esc
    Run Keyword And Continue On Failure    VerifyControlState    ${surface_plot_tool_button_xpath}    de-selected
    Sleep    0.2s
    Click    ${surface_plot_tool_button_xpath}
    sleep    0.2s
    Click    ${wall_thickness_measurement_tool_button_xpath}
    Press Shortcut Keys    Esc
    Run Keyword And Continue On Failure    VerifyControlState    ${wall_thickness_measurement_tool_button_xpath}    de-selected
    Click    ${cnr_measurement_tool_button_xpath}
    Press Shortcut Keys    Esc
    Run Keyword And Continue On Failure    VerifyControlState    ${cnr_measurement_tool_button_xpath}    de-selected
    Click    ${mtf_measurement_tool_button_xpath}
    Press Shortcut Keys    Esc
    Run Keyword And Continue On Failure    VerifyControlState    ${mtf_measurement_tool_button_xpath}    de-selected
    Sleep    0.2s
    Click    ${mtf_measurement_tool_button_xpath}
    sleep    0.2s
    Click    ${defect_marking_tool_button_xpath}
    Press Shortcut Keys    Esc
    Run Keyword And Continue On Failure    VerifyControlState    ${defect_marking_tool_button_xpath}    de-selected
    Sleep    0.2s
    Click    ${defect_marking_tool_button_xpath}
    sleep    0.2s
    Click    ${Image_Filter_Tool_Button_XPATH}
    Press Shortcut Keys    Esc
    Run Keyword And Continue On Failure    VerifyControlState    ${Image_Filter_Tool_Button_XPATH}    de-selected
    Sleep    0.2s
    Click    ${Image_Filter_Tool_Button_XPATH}
    sleep    0.2s
    Click    ${percentile_brightness_contrast_filter_button_xpath}
    Press Shortcut Keys    Esc
    Run Keyword And Continue On Failure    VerifyControlState    ${percentile_brightness_contrast_filter_button_xpath}    de-selected
    Sleep    0.2s
    Click    ${window_XPATH}
    sleep    0.2s
    Click    ${fox_bleach_filter_button_xpath}
    Press Shortcut Keys    Esc
    Run Keyword And Continue On Failure    VerifyControlState    ${fox_bleach_filter_button_xpath}    de-selected
    Sleep    0.2s
    Click    ${fox_bleach_filter_button_xpath}
    sleep    0.2s
    Apply Auto Best BNC
    Close Project
    Close FoxRT Application Window
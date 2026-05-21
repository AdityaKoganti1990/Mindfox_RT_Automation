*** Settings ***
Documentation     Bug cases test suite. Total Test Cases: 18 (MFRTB01 - MFRTB18).
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

    # Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.dcm
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


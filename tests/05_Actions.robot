*** Settings ***
Library           FlaUILibrary
Library           Process
Library           AutoItLibrary
Resource          ../resources/login.resource
Resource          ../resources/General.resource
Resource          ../resources/imageviewer.resource
Resource          ../resources/Actions.resource

*** Variables ***
@{BATCH_TEST_FILES}    ${project_Directory_Path}MLE_4_0.237.dcm    ${project_Directory_Path}MLE_6_0.280.dcm    ${project_Directory_Path}MLE_8''0.322.dcm
@{BATCH_EXPECTED_OUTPUT_FILES}    MLE_4_0.237.png    MLE_6_0.280.png    MLE_8''0.322.png
@{BATCH_EXPECTED_REPORT_FILES}    MLE_4_0.237_report.pdf    MLE_6_0.280_report.pdf    MLE_8''0.322_report.pdf
@{BATCH_Stitch_TEST_FILES}    ${Stitch_Files_Directory_Path}frame_0110.dcm    ${Stitch_Files_Directory_Path}frame_0135.dcm    ${Stitch_Files_Directory_Path}frame_0160.dcm
@{BATCH_Stitch_EXPECTED_OUTPUT_FILES}    frame_0110.dcm    frame_0135.dcm    frame_0160.dcm
${stitch_output_directory}    ${CURDIR}\\..\\Exports\\StitchOutput\\
*** Test Cases ***
MFRTA01 - Verify whether able to open Report viewer.
    [Documentation]    Verify whether able to open Report viewer.
    [Tags]    MFRTA01

    Open FoxViewerDesktop Application
    Login To FoxViewerDesktop    Sri    Sri
    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.dcm
    Open Report Viewer
    Verify Report Viewer Window Is Open

MFRTA02 - Verify the default display of report viewer.
    [Documentation]    Verify the default display of report viewer.
    [Tags]    MFRTA02
    Focus    ${REPORT_VIEWER_WINDOW_XPATH}
    Sleep    0.1s
    Take Report Viewer Screenshot    MFRTA02.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTA02.png    MFRTA02.png    95

MFRTA03 - Verify whether able to select report viewer Custom template.
    [Documentation]    Verify whether able to select report viewer template.
    [Tags]    MFRTA03

    Select Report Viewer Template    Custom Template
    Sleep    0.1s
    Take Report Viewer Screenshot    MFRTA03.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTA03.png    MFRTA03.png    95

MFRTA04 - Verify whether able to select report viewer Standard template.
    [Documentation]    Verify whether able to select report viewer Standard template.
    [Tags]    MFRTA04
    
    Select Report Viewer Template    Standard Template
    Sleep    0.1s
    Take Report Viewer Screenshot    MFRTA04.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTA04.png    MFRTA04.png    95

MFRTA05 - Verify whether able to generate standard report in report viewer.
    [Documentation]    Verify whether able to generate standard report in report viewer.
    [Tags]    MFRTA05
    
    Set Report Viewer Params    TestReport1    2026-04-15    Test Report Title    True    True    True    True
    Click Export Pdf Button    MFRTA05
    Run Keyword And Continue On Failure    Compare Result Files    MFRTA05.pdf    MFRTA05.pdf    95

MFRTA06 - Verify whether Report Viewer settings page is opened when clicked on settings button.
    [Documentation]    Verify whether Report Viewer settings page is opened when clicked on settings button.
    [Tags]    MFRTA06
    
    Open Report Viewer
    Click Report Viewer Settings Button
    Sleep    0.1s
    Run Keyword And Continue On Failure   Verify Report Viewer Settings Window Is Open
    Sleep    0.1s
    Click    ${Report_Viewer_Settings_Window_Cancel_Button_XPATH}
    Sleep    0.1s

MFRTA07 - Verify whether able to close report viewer window.
    [Documentation]    Verify whether able to close report viewer.
    [Tags]    MFRTA07
    Close Report Viewer
    Verify Report Viewer Window Is Closed

MFRTA08 - Verify whether able to open Batch Processing window.
    [Documentation]    Verify whether able to open Batch Processing window.
    [Tags]    MFRTA08
    
    Open Batch Processing Window
    Sleep    0.1s
    Run Keyword And Continue On Failure   Verify Batch Processing Window Is Open

MFRTA09 - Verify whether able to add files into Batch Processing window.
    [Documentation]    Verify whether able to add files into Batch Processing window.
    [Tags]    MFRTA09

    Add files to Batch Processing Window    @{BATCH_TEST_FILES}
    Sleep    0.1s
    Run Keyword And Continue On Failure   Verify Files Added In Batch Processing Window    @{BATCH_TEST_FILES}

MFRTA10 - Verify whether able to run Batch Process.
    [Documentation]    Verify whether able to run Batch Process.
    [Tags]    MFRTA10

    Run Batch Process
    ...    export_images=yes
    ...    generate_reports=yes
    ...    apply_filter=yes
    ...    window_level_mode=File Default
    ...    window_center=1200
    ...    window_width=2500
    ...    invert_image=no
    ...    export_format=PNG
    ...    output_folder=${CURDIR}\\..\\Exports\\BatchOutput
    ...    report_include_image=yes
    ...    report_output_folder=${CURDIR}\\..\\Exports\\BatchReportOutput
    Sleep    0.1s
    Run Keyword And Continue On Failure
    ...    Verify Batch Process Completed Successfully
    ...    ${CURDIR}\\..\\Exports\\BatchOutput
    ...    @{BATCH_EXPECTED_OUTPUT_FILES}
    Run Keyword And Continue On Failure
    ...    Verify Batch Process Completed Successfully
    ...    ${CURDIR}\\..\\Exports\\BatchReportOutput
    ...    @{BATCH_EXPECTED_REPORT_FILES}

MFRTA11 - Verify whether able to remove files from Batch Processing window.
    [Documentation]    Verify whether able to remove files from Batch Processing window.
    [Tags]    MFRTA11

    Remove All Files From Batch Processing Window
    Sleep    0.1s
    Run Keyword And Continue On Failure   Verify No Files In Batch Processing Window

MFRTA12 - Verify whether able to close Batch Processing window.
    [Documentation]    Verify whether able to close Batch Processing window.
    [Tags]    MFRTA12
    
    Close Batch Processing Window
    Sleep    0.1s
    Run Keyword And Continue On Failure   Verify Batch Processing Window Is Closed

MFRTA13 - Verify whether able to open Stitch window.
    [Documentation]    Verify whether able to open Stitch window.
    [Tags]    MFRTA13
    
    Open Stitch Window
    Sleep    0.1s
    Run Keyword And Continue On Failure   Verify Stitch Window Is Open
MFRTA14 - Verify whether able to add files into Stitch window.
    [Documentation]    Verify whether able to add files into Stitch window.
    [Tags]    MFRTA14

    Add files to Stitch Window    @{BATCH_Stitch_TEST_FILES}
    Sleep    0.1s
    Run Keyword And Continue On Failure   Verify Files Added In Stitch Window    @{BATCH_Stitch_EXPECTED_OUTPUT_FILES}
MFRTA15 - Verify whether able to run Stitch Process.
    [Documentation]    Verify whether able to run Stitch Process.
    [Tags]    MFRTA15

    Run Stitch Process
    ...    direction=Horizontal
    ...    overlap=5
    ...    blend_levels=5
    ...    sub_pixel_refinement=yes
    ...    min_confidence=6
    ...    window_level=Auto Best Contrast
    ...    invert_image=no
    Sleep    0.1s
    Take Stitch Image Screenshot    MFRTA15.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTA15.png    MFRTA15.png    95
MFRTA16 - Verify whether able to Export Stich Images.
    [Documentation]    Verify whether able to Export Stich Images.
    [Tags]    MFRTA16

    Export Stitch Images    ${stitch_output_directory}    PNG    MFRTA16
    Sleep    0.1s
    Run Keyword And Continue On Failure    File Should Exist    ${stitch_output_directory}MFRTA16.png
    Export Stitch Images    ${stitch_output_directory}    JPEG    MFRTA16
    Sleep    0.1s
    Run Keyword And Continue On Failure    File Should Exist    ${stitch_output_directory}MFRTA16.jpg
    Export Stitch Images    ${stitch_output_directory}    TIFF    MFRTA16
    Sleep    0.1s
    Run Keyword And Continue On Failure    File Should Exist    ${stitch_output_directory}MFRTA16.tiff
    Export Stitch Images    ${stitch_output_directory}    BMP    MFRTA16
    Sleep    0.1s
    Run Keyword And Continue On Failure    File Should Exist    ${stitch_output_directory}MFRTA16.bmp
MFRTA17 - Verify whether able to clear all files from Stitch window.
    [Documentation]    Verify whether able to clear all files from Stitch window.
    [Tags]    MFRTA17

    Clear All Files From Stitch Window
    Sleep    0.1s
    Run Keyword And Continue On Failure   Verify No Files In Stitch Window

MFRTA18 - Verify whether able to close Stitch window.
    [Documentation]    Verify whether able to close Stitch window.
    [Tags]    MFRTA18

    Close Stitch Window
    Sleep    0.1s
    Run Keyword And Continue On Failure   Verify Stitch Window Is Closed

MFRTA19 - Verify whether able to open RT simulator.
    [Documentation]    Verify whether able to open RT simulator.
    [Tags]    MFRTA19

    Open RT Simulator
    Sleep    0.1s
    Run Keyword And Continue On Failure   Verify RT Simulator Window Is Open

MFRTA20 - Verify whether able to close RT simulator.
    [Documentation]    Verify whether able to close RT simulator.
    [Tags]    MFRTA20

    Close RT Simulator
    Sleep    0.1s
    Run Keyword And Continue On Failure   Verify RT Simulator Window Is Closed
    Close FoxRT Application Window

    













    





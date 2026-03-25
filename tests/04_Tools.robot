*** Settings ***
Library           FlaUILibrary
Library           Process
Library           AutoItLibrary
Resource          ../resources/login.resource
Resource          ../resources/General.resource
Resource          ../resources/imageviewer.resource
Resource          ../resources/Tools.resource

*** Test Cases ***

MFRTT01 - Verify whether able to add line profiler tool in image viewer
    [Documentation]    Verify whether able to open add line profiler tool in image viewer
    [Tags]    smoke    tools

    Open FoxViewerDesktop Application
    Login To FoxViewerDesktop    Sri    Sri
    Main Window Should Be Open
    Open ProjectFile    ${project_Directory_Path}DuplexPlate_With_RT.dcm
    Add Line Profiler Tool    603    296    986    263
    Take Actual Screenshot    MFRTT01_1.png
    Take Line Profiler window Screenshot    MFRTT01_2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT01_1.png    MFRTT01_1.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT01_2.png    MFRTT01_2.png
    Click    ${line_profiler_tool_button_xpath}
    Close Project

MFRTT02 - Verify whether able to add ROI statistics tool in image viewer
    [Documentation]    Verify whether able to open add ROI statistics tool in image viewer
    [Tags]    smoke    tools
    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.dcm
    Add ROI Statistics Tool    603    296    986    263
    Take Actual Screenshot    MFRTT02_1.png
    Take ROI Statistics window Screenshot    MFRTT02_2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT02_1.png    MFRTT02_1.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT02_2.png    MFRTT02_2.png
    Click    ${roi_statistics_tool_button_xpath}

MFRTT03 - Verify whether able to apply window level over the image.
    [Documentation]    Verify whether able to apply window level over the image.
    [Tags]    smoke    tools
    Apply Window Level    2    845    470    1050    570
    Take Actual Screenshot    MFRTT03.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT03.png    MFRTT03.png
    Click    ${window_level_tool_button_xpath}
    Reset View

MFRTT04 - Verify whether able to open and apply window level from window level panel.
    [Documentation]    Verify whether able to open and apply window level from window level panel.
    [Tags]    smoke    tools

    Open Window Level Panel
    Set Window Level Parameters    37280    25900
    Take Actual Screenshot    MFRTT04_1.png
    Take Window Level Panel Screenshot    MFRTT04_2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT04_1.png    MFRTT04_1.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT04_2.png    MFRTT04_2.png
    Click    ${window_Level_tool_panel_button_xpath}
    Reset View

MFRTT05 - Verify whether able to open Pixel Intensity Histogram.
    [Documentation]    Verify whether able to open Pixel Intensity Histogram.
    [Tags]    smoke    tools

    Click    ${window_XPATH}
    Apply Window Level    2    845    470    1050    570
    Click    ${window_level_tool_button_xpath}
    Open Pixel Intensity Histogram
    Sleep    1s
    Take Actual Screenshot    MFRTT05_1.png
    Take Pixel Intensity Histogram Screenshot    MFRTT05_2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT05_1.png    MFRTT05_1.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT05_2.png    MFRTT05_2.png
    Click    ${pixel_intensity_histogram_button_xpath}
    Reset View

MFRTT06 - Verify whether able to calibrate the image by adding calibration tool.
    [Documentation]    Verify whether able to calibrate the image by adding calibration tool.
    [Tags]    smoke    tools

    Click    ${window_XPATH}   
    Apply Auto Best BNC
    Add Annotation at custom position    Ruler    770    601    773    657
    Add Calibration tool over image    770    476    808    474
    Take Calibration Graph window Screenshot    MFRTT06_1.png
    Calibrate Image    5    mm
    Take Actual Screenshot    MFRTT06_2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT06_1.png    MFRTT06_1.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT06_2.png    MFRTT06_2.png
    Delete the annotation
    Reset View


    





    

    






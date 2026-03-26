*** Settings ***
Library           FlaUILibrary
Library           Process
Library           AutoItLibrary
Resource          ../resources/login.resource
Resource          ../resources/General.resource
Resource          ../resources/imageviewer.resource
Resource          ../resources/Tools.resource
Resource      ../resources/Annotations.resource

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

MFRTT07 - Verify whether able to add SNR Measurement tool over the image.
    [Documentation]    Verify whether able to add SNR Measurement tool over the image.
    [Tags]    smoke    tools

    Click    ${window_XPATH}
    Close Project
    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.dcm
    Apply Auto Best BNC
    Add SNR Measurement tool over image    845    405    1045    490    545    370    675    435    
    Take WindowScreenshot for Comparison    MFRTT07.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT07.png    MFRTT07.png
    Click    ${snr_measurement_tool_button_xpath}
    Reset View

MFRTT08 - Verify whether able to add surface plot 3D tool over the image and view the 3D surface plot.
    [Documentation]    Verify whether able to add surface plot 3D tool over the image and view the 3D surface plot.
    [Tags]    smoke    tools

    Click    ${window_XPATH}
    Apply Auto Best BNC
    Add Surface Plot 3D Tool over image    722    561    815    703
    Take Actual Screenshot    MFRTT08.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT08.png    MFRTT08.png
    Take surface plot window Screenshot    MFRTT08_2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT08_2.png    MFRTT08_2.png
    Click    ${surface_plot_tool_button_xpath}
    Reset View

MFRTT09 - Verify whether able to set colormap for the Surface Plot 3D tool.
    [Documentation]    Verify whether able to set colormap for the Surface Plot 3D tool.
    [Tags]    smoke    tools

    Click    ${window_XPATH}
    Apply Auto Best BNC
    Add Surface Plot 3D Tool over image    722    561    815    703
    Set Surface Plot Colormap    Jet
    Take surface plot window Screenshot    MFRTT09-1.png
    Set Surface Plot Colormap    Plasma
    Take surface plot window Screenshot    MFRTT09-2.png
    Set Surface Plot Colormap    Viridis
    Take surface plot window Screenshot    MFRTT09-3.png
    Set Surface Plot Colormap    Hot
    Take surface plot window Screenshot    MFRTT09-4.png
    Set Surface Plot Colormap    Inferno
    Take surface plot window Screenshot    MFRTT09-5.png
    Set Surface Plot Colormap    Cool
    Take surface plot window Screenshot    MFRTT09-6.png
    Set Surface Plot Colormap    Rainbow
    Take surface plot window Screenshot    MFRTT09-7.png
    Set Surface Plot Colormap    Grayscale
    Take surface plot window Screenshot    MFRTT09-8.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT09-1.png    MFRTT09-1.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT09-2.png    MFRTT09-2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT09-3.png    MFRTT09-3.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT09-4.png    MFRTT09-4.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT09-5.png    MFRTT09-5.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT09-6.png    MFRTT09-6.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT09-7.png    MFRTT09-7.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT09-8.png    MFRTT09-8.png

MFRTT10 - Verify whether able to apply invert over surface plot 3D image.
    [Documentation]    Verify whether able to apply invert over surface plot 3D image.
    [Tags]    smoke    tools
    
    Apply Invert on Surface Plot 3D Image
    Take surface plot window Screenshot    MFRTT10.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT10.png    MFRTT10.png
    Apply Invert on Surface Plot 3D Image

MFRTT11 - Verify whether able to Reset zoom on surface plot 3D image to default state by clicking on Reset View button.
    [Documentation]    Verify whether able to Reset zoom on surface plot 3D image to default state by clicking on Reset View button.
    [Tags]    smoke    tools

    Zoom Surface Plot 3D Image    3
    Take surface plot window Screenshot    MFRTT11_1.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT11_1.png    MFRTT11_1.png
    Click Surface Plot Window Fit View Button
    Take surface plot window Screenshot    MFRTT11_2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT11_2.png    MFRTT11_2.png

MFRTT12 - Verify whether able to Zoom in and Zoom out on surface plot 3D image.
    [Documentation]    Verify whether able to Zoom in and Zoom out on surface plot 3D image.
    [Tags]    smoke    tools

    Zoom Surface Plot 3D Image    3
    Take surface plot window Screenshot    MFRTT12_1.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT12_1.png    MFRTT12_1.png
    Zoom Surface Plot 3D Image    -2
    Take surface plot window Screenshot    MFRTT12_2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT12_2.png    MFRTT12_2.png
    Click Surface Plot Window Fit View Button
MFRTT13 - Verify whether able to Rotate surface plot 3D image.
    [Documentation]    Verify whether able to Rotate surface plot 3D image.
    [Tags]    smoke    tools

    Rotate Surface Plot 3D Image    788    871    1130    875
    Take surface plot window Screenshot    MFRTT13_1.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT13_1.png    MFRTT13_1.png
    Rotate Surface Plot 3D Image    1130    875    788    871
    Take surface plot window Screenshot    MFRTT13_2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT13_2.png    MFRTT13_2.png
    Click Surface Plot Window Fit View Button
    Click    ${surface_plot_tool_button_xpath}
    Reset View

MFRTT14 - Verify whether able to add wall-thickness measurement tool over the image and measure the wall thickness.
    [Documentation]    Verify whether able to add wall-thickness measurement tool over the image and measure the wall thickness.
    [Tags]    smoke    tools

    # Click    ${window_XPATH}
    # Apply Auto Best BNC
    Add Wall Thickness Measurement tool over image    805    400    860    403
    # Take Actual Screenshot    MFRTT14_1.png
    # Take wall thickness measurement window Screenshot    MFRTT14_2.png
    # Run Keyword And Continue On Failure    Compare Result Images    MFRTT14_1.png    MFRTT14_1.png
    # Run Keyword And Continue On Failure    Compare Result Images    MFRTT14_2.png    MFRTT14_2.png
    # Click    ${wall_thickness_measurement_tool_button_xpath}
MFRTT - Test

#     Open FoxViewerDesktop Application
#     Login To FoxViewerDesktop    Sri    Sri
#     Main Window Should Be Open
#     Open ProjectFile    ${project_Directory_Path}DuplexPlate_With_RT.dcm
    # Add SNR Measurement tool over image    845    405    1045    490    545    370    675    435
    # Zoom Surface Plot 3D Image    3
    # Click    ${window_XPATH}
    # Apply Auto Best BNC
    # Add Surface Plot 3D Tool over image    722    561    815    703
    # Rotate Surface Plot 3D Image    788    871    1130    875
    Rotate Surface Plot 3D Image    1130    875    788    871


    





    

    






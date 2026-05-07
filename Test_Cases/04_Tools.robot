*** Settings ***
Documentation     Tools test suite. Total Test Cases: 58 (MFRTT01, MFRTT01-2, MFRTT02 - MFRTT38_2, plus _2 variants of MFRTT27-29 and MFRTT32-38).
Library           FlaUILibrary
Library           Process
Library           AutoItLibrary
Library           Collections
Resource          ../resources/login.resource
Resource          ../resources/General.resource
Resource          ../resources/imageviewer.resource
Resource          ../resources/Tools.resource
Resource      ../resources/Annotations.resource
*** Test Cases ***
MFRTT01 - Verify whether able to add normal line profiler tool in image viewer
    [Documentation]    Verify whether able to open add line profiler tool in image viewer
    [Tags]    smoke    tools
    Open FoxViewerDesktop Application
    Login To FoxViewerDesktop    admin    admin
    Main Window Should Be Open
    Open ProjectFile    ${project_Directory_Path}DuplexPlate_With_RT.dcm
    Add Line Profiler Tool    590    290    967    252    Normal
    Take Actual Screenshot    MFRTT01_1.png
    Take Line Profiler window Screenshot    MFRTT01_2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT01_1.png    MFRTT01_1.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT01_2.png    MFRTT01_2.png
    Click    ${line_profiler_tool_button_xpath}
MFRTT01-2 - Verify whether able to add IQI line profiler tool in image viewer
    [Documentation]    Verify whether able to open add line profiler tool in image viewer
    [Tags]    smoke    tools

    Add Line Profiler Tool    590    290    967    252    Iqi
    Take Actual Screenshot    MFRTT01-2_1.png
    Take Line Profiler window Screenshot    MFRTT01-2_2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT01-2_1.png    MFRTT01-2_1.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT01-2_2.png    MFRTT01-2_2.png
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
    Apply Auto Best BNC
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
    Apply Auto Best BNC
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
    Apply Auto Best BNC
MFRTT06 - Verify whether able to calibrate the image by adding calibration tool.
    [Documentation]    Verify whether able to calibrate the image by adding calibration tool.
    [Tags]    smoke    tools

    Click    ${window_XPATH}   
    Apply Auto Best BNC
    Add Annotation at custom position    Ruler    760    600    760    657
    Add Calibration tool over image    760    475    800    475
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
    Apply Auto Best BNC
MFRTT08 - Verify whether able to add surface plot 3D tool over the image and view the 3D surface plot.
    [Documentation]    Verify whether able to add surface plot 3D tool over the image and view the 3D surface plot.
    [Tags]    smoke    tools

    Click    ${window_XPATH}
    Apply Auto Best BNC
    Add Surface Plot 3D Tool over image    710    558    808    701
    Take Actual Screenshot    MFRTT08.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT08.png    MFRTT08.png
    Take surface plot window Screenshot    MFRTT08_2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT08_2.png    MFRTT08_2.png
    Click    ${surface_plot_tool_button_xpath}
    Reset View
    Apply Auto Best BNC
MFRTT09 - Verify whether able to set colormap for the Surface Plot 3D tool.
    [Documentation]    Verify whether able to set colormap for the Surface Plot 3D tool.
    [Tags]    smoke    tools

    Click    ${window_XPATH}
    Apply Auto Best BNC
    Add Surface Plot 3D Tool over image    710    558    808    701
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
    Set Surface Plot Colormap    Jet
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
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT11_1.png    MFRTT11_1.png    90
    Click Surface Plot Window Fit View Button
    Take surface plot window Screenshot    MFRTT11_2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT11_2.png    MFRTT11_2.png
MFRTT12 - Verify whether able to Zoom in and Zoom out on surface plot 3D image.
    [Documentation]    Verify whether able to Zoom in and Zoom out on surface plot 3D image.
    [Tags]    smoke    tools

    Zoom Surface Plot 3D Image    3
    Take surface plot window Screenshot    MFRTT12_1.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT12_1.png    MFRTT12_1.png    90
    Zoom Surface Plot 3D Image    -2
    Take surface plot window Screenshot    MFRTT12_2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT12_2.png    MFRTT12_2.png    90
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

    Click    ${window_XPATH}
    Apply Auto Best BNC
    Add Wall Thickness Measurement tool over image    805    400    860    403
    Take Actual Screenshot    MFRTT14_1.png
    Take wall thickness measurement window Screenshot    MFRTT14_2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT14_1.png    MFRTT14_1.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT14_2.png    MFRTT14_2.png

MFRTT15 - Verify whether able to adjust the wall thickness measurement line position and update the measurement result accordingly.
    [Documentation]    Verify whether able to adjust the wall thickness measurement line position and update the measurement result accordingly.
    [Tags]    smoke    tools

    Click    ${window_XPATH}
    Adjust Wall Thickness Measurement Line Position    360    845    300    845    1210    865    1145    865    
    Take Actual Screenshot    MFRTT15_1.png
    Take wall thickness measurement window Screenshot    MFRTT15_2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT15_1.png    MFRTT15_1.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT15_2.png    MFRTT15_2.png
    Run Keyword And Continue On Failure    Verify Control Exists in Image Viewer    ${Manual_wall_thickness_detection_method_XPATH}
    Run Keyword And Continue On Failure    Verify Control Exists in Image Viewer    ${Auto_Reset_wall_thickness_line_result_XPATH}
    Click    ${wall_thickness_measurement_tool_button_xpath}
MFRTT16 - Verify whether able to add multiple wall thickness measurement lines and adjust their positions independently.
    [Documentation]    Verify whether able to add multiple wall thickness measurement lines and adjust their positions independently.
    [Tags]    smoke    tools
    
    Click    ${window_XPATH}
    Add Wall Thickness Measurement tool over image    805    465    840    465
    Adjust Wall Thickness Measurement Line Position    413    860    325    860    1690    865    1595    865
    Take Actual Screenshot    MFRTT16_1.png
    Take wall thickness measurement window Screenshot    MFRTT16_2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT16_1.png    MFRTT16_1.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT16_2.png    MFRTT16_2.png
    Run Keyword And Continue On Failure    Verify Control Exists in Image Viewer    ${Manual_wall_thickness_detection_method_XPATH}
    Run Keyword And Continue On Failure    Verify Control Exists in Image Viewer    ${Auto_Reset_wall_thickness_line_result_XPATH}
MFRTT17 - Verify whether able to reset to auto wall thickness measurement line position by clicking on Reset View button.
    [Documentation]    Verify whether able to reset to auto wall thickness measurement line position by clicking on Reset View button.
    [Tags]    smoke    tools

    Click    ${window_XPATH}
    Click Reset Auto Wall Thickness Line Result
    Take Actual Screenshot    MFRTT17_1.png
    Take wall thickness measurement window Screenshot    MFRTT17_2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT17_1.png    MFRTT17_1.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT17_2.png    MFRTT17_2.png
    Verify Control Not Exists in Image Viewer    ${Manual_wall_thickness_detection_method_XPATH}
MFRTT18 - Verify whether graph is getting updated when switching between different wall-thickness measurement annotations.
    [Documentation]    Verify whether graph is getting updated when switching between different wall-thickness measurement annotations.
    [Tags]    smoke    tools

    Click    ${window_XPATH}
    Select Wall Thickness Measurement Annotation    810    313
    Take Actual Screenshot    MFRTT18_1.png
    Take wall thickness measurement window Screenshot    MFRTT18_2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT18_1.png    MFRTT18_1.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT18_2.png    MFRTT18_2.png
    Select Wall Thickness Measurement Annotation    810    359
    Take Actual Screenshot    MFRTT18_3.png
    Take wall thickness measurement window Screenshot    MFRTT18_4.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT18_3.png    MFRTT18_3.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT18_4.png    MFRTT18_4.png
MFRTT19 - Verify whether able to delete the wall thickness measurement annotation and its corresponding graph.
    [Documentation]    Verify whether able to delete the wall thickness measurement annotation and its corresponding graph.
    [Tags]    smoke    tools

    Click    ${window_XPATH}
    Click Delete Wall Thickness Measurement Annotation    810    313
    Click Delete Wall Thickness Measurement Annotation    810    359
    Take Actual Screenshot    MFRTT19.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT19.png    MFRTT19.png
    Reset View
    Apply Auto Best BNC
MFRTT20 - Verify whether able to add CNR measurement tool over the image and measure the CNR.
    [Documentation]    Verify whether able to add CNR measurement tool over the image and measure the CNR.
    [Tags]    smoke    tools

    Click    ${window_XPATH}
    Apply Auto Best BNC
    Add CNR Measurement tool over image    845    405    1045    490    545    370    675    435  
    Take WindowScreenshot for Comparison    MFRTT20.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT20.png    MFRTT20.png    98
    Click    ${cnr_measurement_tool_button_xpath}
    Reset View
MFRTT21 - Verify whether able to add MTF measurement tool over the image and measure the MTF.
    [Documentation]    Verify whether able to add MTF measurement tool over the image and measure the MTF.
    [Tags]    smoke    tools

    Click    ${window_XPATH}
    Apply Auto Best BNC
    Add MTF Measurement tool over image    845    405    1045    490
    Take MTF Measurement window Screenshot    MFRTT21_1.png
    Take Actual Screenshot    MFRTT21_2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT21_1.png    MFRTT21_1.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT21_2.png    MFRTT21_2.png
    Click    ${mtf_measurement_tool_button_xpath}
    Reset View
    Close Project
MFRTT22 - Verify whether able to detect wirepair using Detect IQI wire phantom tool.
    [Documentation]    Verify whether able to detect wirepair using Detect IQI wire phantom tool.
    [Tags]    smoke    tools

    Click    ${window_XPATH}
    Open ProjectFile    ${project_Directory_Path}DuplexPlate_With_RT.dcm
    Detect IQI Wire Phantom Tool
    Take Actual Screenshot    MFRTT22_1.png
    Take IQI Wire Phantom Tool window Screenshot    MFRTT22_2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT22_1.png    MFRTT22_1.png
    Run Keyword And Continue On Failure   Compare Result Images    MFRTT22_2.png    MFRTT22_2.png
    Click    ${IQI_wire_phantom_tool_button_xpath}
    Reset View
    Close Project
MFRTT23 - Verify whether able to mark defects using defect marking & classification tool.
    [Documentation]    Verify whether able to mark defects using defect marking & classification tool.
    [Tags]    smoke    tools

    Click    ${window_XPATH}
    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.dcm
    Add Defect Marking and Classification Tool over image    Porosity    Rectangle    821    372    1008    416
    Take Actual Screenshot    MFRTT23_1.png
    Take Defect Marking and Classification Tool window Screenshot    MFRTT23_2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT23_1.png    MFRTT23_1.png
    Run Keyword And Continue On Failure   Compare Result Images    MFRTT23_2.png    MFRTT23_2.png    95
MFRTT24 - Verify whether able to evaluate the defect marked using defect marking & classification tool.
    [Documentation]    Verify whether able to evaluate the defect marked using defect marking & classification tool.
    [Tags]    smoke    tools

    Evaluate Defect Marked    1
    Take Actual Screenshot    MFRTT24_1.png
    Take Defect Marking and Classification Tool window Screenshot    MFRTT24_2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT24_1.png    MFRTT24_1.png
    Run Keyword And Continue On Failure   Compare Result Images    MFRTT24_2.png    MFRTT24_2.png    95
    Click    ${defect_marking_tool_button_xpath}
MFRTT25 - Verify whether able to delete the defect.
    [Documentation]    Verify whether able to delete the defect.
    [Tags]    smoke    tools

    Add Defect Marking and Classification Tool over image    Crack    Ellipse    821    549    1009    631
    Click    ${defect_marking_tool_button_xpath}
    Add Defect Marking and Classification Tool over image    Undercut    Line    825    172    1012    239
    Take Actual Screenshot    MFRTT25_1.png
    Take Defect Marking and Classification Tool window Screenshot    MFRTT25_2.png
    Delete Selected Defect    3
    Take Actual Screenshot    MFRTT25_3.png
    Take Defect Marking and Classification Tool window Screenshot    MFRTT25_4.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT25_1.png    MFRTT25_1.png
    Run Keyword And Continue On Failure   Compare Result Images    MFRTT25_2.png    MFRTT25_2.png    95
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT25_3.png    MFRTT25_3.png
    Run Keyword And Continue On Failure   Compare Result Images    MFRTT25_4.png    MFRTT25_4.png    95
    Clear AllDefects
    Click    ${defect_marking_tool_button_xpath}
    Reset View
MFRTT26 - Verify whether filters tab is enabled when Image filter tool item is clicked.
    [Documentation]    Verify whether filters tab is enabled when Image filter tool item is clicked.
    [Tags]    smoke    tools

    Click    ${window_XPATH}
    Apply Auto Best BNC
    Click Image Filter Tool
    Run Keyword And Continue On Failure    Verify Control Exists in Image Viewer    ${filter_combobox_xpath}
    Run Keyword And Continue On Failure    Verify Control Exists in Image Viewer    ${filter_apply_button_xpath}
MFRTT27 - Verify whether able to apply image filter and view the changes in the image with GPU Rendering.
    [Documentation]    Verify whether able to apply image filter and view the changes in the image with GPU Rendering.
    [Tags]    smoke    tools    gpu_rendering

    Click    ${window_XPATH}
    Select GPU Type    GPU
    Apply Image Filter    Edge Gradient
    Take Actual Screenshot    MFRTT27.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT27.png    MFRTT27.png
MFRTT28 - Verify whether able to reset the applied image filter by clicking on Reset button in the filter tab with GPU Rendering.
    [Documentation]    Verify whether able to reset the applied image filter by clicking on Reset button in the filter tab with GPU Rendering.
    [Tags]    smoke    tools    gpu_rendering

    Reset Image Filter
    Take Actual Screenshot    MFRTT28.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT28.png    MFRTT28.png
    Apply Auto Best BNC
MFRTT29 - Verify whether able to apply all the available filters in the image filter tool and view the changes in the image with GPU Rendering.
    [Documentation]    Verify whether able to apply all the available filters in the image filter tool and view the changes in the image with GPU Rendering.
    [Tags]    smoke    tools    gpu_rendering

    Click    ${window_XPATH}
    @{filters}=    Create List    Edge Detection    Gradient Magnitude    Morphological Contour    Edge Gradient    High-Pass Sharpen    Low-Pass Smooth     Normalize    Sharpness Boost    Auto Equalise    Gaussian Blur    Fox Bleach        
    FOR    ${filter}    IN    @{filters}
        Apply Image Filter    ${filter}
        Take Actual Screenshot    MFRTT29_${filter}.png
        Run Keyword And Continue On Failure    Compare Result Images    MFRTT29_${filter}.png    MFRTT29_${filter}.png    98
        Reset Image Filter
    END
    Apply Auto Best BNC
MFRTT30 - Verify whether able to rename a filter in the image filter tool and view the updated filter name in the filter combobox.
    [Documentation]    Verify whether able to rename a filter in the image filter tool and view the updated filter name in the filter combobox.
    [Tags]    smoke    tools

    Click    ${window_XPATH}
    Rename Image Filter    Edge Gradient    My Custom Filter1
    Sleep    0.5s
    Run Keyword And Continue On Failure    Verify Filter Exists in Filters List    My Custom Filter1

MFRTT31 - Verify whether able to reset the filter name to default by clicking on Reset button in the filter tab after renaming the filter.
    [Documentation]    Verify whether able to reset the filter name to default by clicking on Reset button in the filter tab after renaming the filter.
    [Tags]    smoke    tools

    Click    ${window_XPATH}
    Reset Filter Name to Default    My Custom Filter1
    Sleep    0.5s
    Run Keyword And Continue On Failure    Verify Filter Not Exists in Filters List    My Custom Filter1
MFRTT32 - Verify whether able to apply Edge Detection filter by modifying the filter parameters and clicking on Apply button in the filter tab with GPU Rendering.
    [Documentation]    Verify whether able to apply Edge Detection filter by modifying the filter parameters and clicking on Apply button in the filter tab with GPU Rendering.
    [Tags]    smoke    tools    gpu_rendering

    Click    ${window_XPATH}
    Set Image Filter Parameters    Edge Detection    Sigma=2.50    Kernel Radius=4    Canny Low Ratio=0.20    Canny High Ratio=0.50
    Sleep    0.5s
    Click Apply Image Filter
    Take Actual Screenshot    MFRTT32.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT32.png    MFRTT32.png
    Reset View
    Apply Auto Best BNC
MFRTT33 - Verify whether able to apply Morphological Contour filter by modifying the filter parameters and clicking on Apply button in the filter tab with GPU Rendering.
    [Documentation]    Verify whether able to apply Morphological Contour filter by modifying the filter parameters and clicking on Apply button in the filter tab with GPU Rendering.
    [Tags]    smoke    tools    gpu_rendering

    Click    ${window_XPATH}
    Set Image Filter Parameters    Morphological Contour    Auto Best Contrast=True    Morph Radius=5
    Sleep    0.5s
    Click Apply Image Filter
    Take Actual Screenshot    MFRTT33.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT33.png    MFRTT33.png
    Reset View
    Apply Auto Best BNC
MFRTT34 - Verify whether able to apply High Pass Sharpen filter by modifying the filter parameters and clicking on Apply button in the filter tab with GPU Rendering.
    [Documentation]    Verify whether able to apply High Pass Sharpen filter by modifying the filter parameters and clicking on Apply button in the filter tab with GPU Rendering.
    [Tags]    smoke    tools    gpu_rendering

    Click    ${window_XPATH}
    Set Image Filter Parameters    High-Pass Sharpen    Auto Best Contrast=True    Butterworth Cutoff=0.50    Butterworth Order=5
    Sleep    0.5s
    Click Apply Image Filter
    Take Actual Screenshot    MFRTT34.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT34.png    MFRTT34.png
    Reset View
    Apply Auto Best BNC
MFRTT35 - Verify whether able to apply Low Pass Smooth filter by modifying the filter parameters and clicking on Apply button in the filter tab with GPU Rendering.
    [Documentation]    Verify whether able to apply Low Pass Smooth filter by modifying the filter parameters and clicking on Apply button in the filter tab with GPU Rendering.
    [Tags]    smoke    tools    gpu_rendering

    Click    ${window_XPATH}
    Set Image Filter Parameters    Low-Pass Smooth    Auto Best Contrast=True    Butterworth Cutoff=0.50    Butterworth Order=5
    Sleep    0.5s
    Click Apply Image Filter
    Take Actual Screenshot    MFRTT35.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT35.png    MFRTT35.png
    Reset View
    Apply Auto Best BNC
MFRTT36 - Verify whether able to apply Sharpness Boost filter by modifying the filter parameters and clicking on Apply button in the filter tab with GPU Rendering.
    [Documentation]    Verify whether able to apply Sharpness Boost filter by modifying the filter parameters and clicking on Apply button in the filter tab with GPU Rendering.
    [Tags]    smoke    tools    gpu_rendering

    Click    ${window_XPATH}
    Set Image Filter Parameters    Sharpness Boost    Auto Best Contrast=True    Unsharp Amount=5.0    Unsharp Sigma=5.0
    Sleep    0.5s
    Click Apply Image Filter
    Take Actual Screenshot    MFRTT36.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT36.png    MFRTT36.png
    Reset View
    Apply Auto Best BNC
MFRTT37 - Verify whether able to apply Gaussian Blur filter by modifying the filter parameters and clicking on Apply button in the filter tab with GPU Rendering.
    [Documentation]    Verify whether able to apply Gaussian Blur filter by modifying the filter parameters and clicking on Apply button in the filter tab with GPU Rendering.
    [Tags]    smoke    tools    gpu_rendering

    Click    ${window_XPATH}
    Set Image Filter Parameters    Gaussian Blur    Auto Best Contrast=True    Sigma=5.00    Kernel Radius=5
    Sleep    0.5s
    Click Apply Image Filter
    Take Actual Screenshot    MFRTT37.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT37.png    MFRTT37.png
    Reset View
    Apply Auto Best BNC
MFRTT38 - Verify whether able to apply Fox Bleach filter by modifying the filter parameters and clicking on Apply button in the filter tab with GPU Rendering.
    [Documentation]    Verify whether able to apply Fox Bleach filter by modifying the filter parameters and clicking on Apply button in the filter tab with GPU Rendering.
    [Tags]    smoke    tools    gpu_rendering

    Click    ${window_XPATH}
    Set Image Filter Parameters    Fox Bleach    Auto Best Contrast=True    Fox Bleach Tile Size=60    Fox Bleach Clip Limit=10.0
    Sleep    0.5s
    Click Apply Image Filter
    Take Actual Screenshot    MFRTT38.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT38.png    MFRTT38.png
    Reset View
    Apply Auto Best BNC
MFRTT27_2 - Verify whether able to apply image filter and view the changes in the image with CPU Rendering.
    [Documentation]    Verify whether able to apply image filter and view the changes in the image with CPU Rendering.
    [Tags]    smoke    tools    cpu_rendering

    Click    ${window_XPATH}
    Select GPU Type    CPU
    Apply Image Filter    Edge Gradient
    Take Actual Screenshot    MFRTT27_2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT27_2.png    MFRTT27_2.png
MFRTT28_2 - Verify whether able to reset the applied image filter by clicking on Reset button in the filter tab with CPU Rendering.
    [Documentation]    Verify whether able to reset the applied image filter by clicking on Reset button in the filter tab with CPU Rendering.
    [Tags]    smoke    tools    cpu_rendering

    Reset Image Filter
    Take Actual Screenshot    MFRTT28_2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT28_2.png    MFRTT28_2.png
    Apply Auto Best BNC
MFRTT29_2 - Verify whether able to apply all the available filters in the image filter tool and view the changes in the image with CPU Rendering.
    [Documentation]    Verify whether able to apply all the available filters in the image filter tool and view the changes in the image with CPU Rendering.
    [Tags]    smoke    tools    cpu_rendering

    Click    ${window_XPATH}
    @{filters}=    Create List    Edge Detection    Gradient Magnitude    Morphological Contour    Edge Gradient    High-Pass Sharpen    Low-Pass Smooth     Normalize    Sharpness Boost    Auto Equalise    Gaussian Blur    Fox Bleach
    FOR    ${filter}    IN    @{filters}
        Apply Image Filter    ${filter}
        Take Actual Screenshot    MFRTT29_2_${filter}.png
        Run Keyword And Continue On Failure    Compare Result Images    MFRTT29_2_${filter}.png    MFRTT29_2_${filter}.png    98
        Reset Image Filter
    END
    Apply Auto Best BNC
MFRTT32_2 - Verify whether able to apply Edge Detection filter by modifying the filter parameters and clicking on Apply button in the filter tab with CPU Rendering.
    [Documentation]    Verify whether able to apply Edge Detection filter by modifying the filter parameters and clicking on Apply button in the filter tab with CPU Rendering.
    [Tags]    smoke    tools    cpu_rendering

    Click    ${window_XPATH}
    Set Image Filter Parameters    Edge Detection    Sigma=2.50    Kernel Radius=4    Canny Low Ratio=0.20    Canny High Ratio=0.50
    Sleep    0.5s
    Click Apply Image Filter
    Take Actual Screenshot    MFRTT32_2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT32_2.png    MFRTT32_2.png
    Reset View
    Apply Auto Best BNC
MFRTT33_2 - Verify whether able to apply Morphological Contour filter by modifying the filter parameters and clicking on Apply button in the filter tab with CPU Rendering.
    [Documentation]    Verify whether able to apply Morphological Contour filter by modifying the filter parameters and clicking on Apply button in the filter tab with CPU Rendering.
    [Tags]    smoke    tools    cpu_rendering

    Click    ${window_XPATH}
    Set Image Filter Parameters    Morphological Contour    Auto Best Contrast=True    Morph Radius=5
    Sleep    0.5s
    Click Apply Image Filter
    Take Actual Screenshot    MFRTT33_2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT33_2.png    MFRTT33_2.png
    Reset View
    Apply Auto Best BNC
MFRTT34_2 - Verify whether able to apply High Pass Sharpen filter by modifying the filter parameters and clicking on Apply button in the filter tab with CPU Rendering.
    [Documentation]    Verify whether able to apply High Pass Sharpen filter by modifying the filter parameters and clicking on Apply button in the filter tab with CPU Rendering.
    [Tags]    smoke    tools    cpu_rendering

    Click    ${window_XPATH}
    Set Image Filter Parameters    High-Pass Sharpen    Auto Best Contrast=True    Butterworth Cutoff=0.50    Butterworth Order=5
    Sleep    0.5s
    Click Apply Image Filter
    Take Actual Screenshot    MFRTT34_2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT34_2.png    MFRTT34_2.png
    Reset View
    Apply Auto Best BNC
MFRTT35_2 - Verify whether able to apply Low Pass Smooth filter by modifying the filter parameters and clicking on Apply button in the filter tab with CPU Rendering.
    [Documentation]    Verify whether able to apply Low Pass Smooth filter by modifying the filter parameters and clicking on Apply button in the filter tab with CPU Rendering.
    [Tags]    smoke    tools    cpu_rendering

    Click    ${window_XPATH}
    Set Image Filter Parameters    Low-Pass Smooth    Auto Best Contrast=True    Butterworth Cutoff=0.50    Butterworth Order=5
    Sleep    0.5s
    Click Apply Image Filter
    Take Actual Screenshot    MFRTT35_2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT35_2.png    MFRTT35_2.png
    Reset View
    Apply Auto Best BNC
MFRTT36_2 - Verify whether able to apply Sharpness Boost filter by modifying the filter parameters and clicking on Apply button in the filter tab with CPU Rendering.
    [Documentation]    Verify whether able to apply Sharpness Boost filter by modifying the filter parameters and clicking on Apply button in the filter tab with CPU Rendering.
    [Tags]    smoke    tools    cpu_rendering

    Click    ${window_XPATH}
    Set Image Filter Parameters    Sharpness Boost    Auto Best Contrast=True    Unsharp Amount=5.0    Unsharp Sigma=5.0
    Sleep    0.5s
    Click Apply Image Filter
    Take Actual Screenshot    MFRTT36_2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT36_2.png    MFRTT36_2.png
    Reset View
    Apply Auto Best BNC
MFRTT37_2 - Verify whether able to apply Gaussian Blur filter by modifying the filter parameters and clicking on Apply button in the filter tab with CPU Rendering.
    [Documentation]    Verify whether able to apply Gaussian Blur filter by modifying the filter parameters and clicking on Apply button in the filter tab with CPU Rendering.
    [Tags]    smoke    tools    cpu_rendering

    Click    ${window_XPATH}
    Set Image Filter Parameters    Gaussian Blur    Auto Best Contrast=True    Sigma=5.00    Kernel Radius=5
    Sleep    0.5s
    Click Apply Image Filter
    Take Actual Screenshot    MFRTT37_2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT37_2.png    MFRTT37_2.png
    Reset View
    Apply Auto Best BNC
MFRTT38_2 - Verify whether able to apply Fox Bleach filter by modifying the filter parameters and clicking on Apply button in the filter tab with CPU Rendering.
    [Documentation]    Verify whether able to apply Fox Bleach filter by modifying the filter parameters and clicking on Apply button in the filter tab with CPU Rendering.
    [Tags]    smoke    tools    cpu_rendering

    Click    ${window_XPATH}
    Set Image Filter Parameters    Fox Bleach    Auto Best Contrast=True    Fox Bleach Tile Size=60    Fox Bleach Clip Limit=10.0
    Sleep    0.5s
    Click Apply Image Filter
    Take Actual Screenshot    MFRTT38_2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT38_2.png    MFRTT38_2.png
    Reset View
    Apply Auto Best BNC
    Select GPU Type    GPU
MFRTT39 - Verify whether able to close filters tab.
    [Documentation]    Verify whether able to close filters tab.
    [Tags]    smoke    tools

    Click    ${window_XPATH}
    Click    ${Image_Filter_Tool_Button_XPATH}
    Run Keyword And Continue On Failure    Verify Control Not Exists in Image Viewer    ${filter_combobox_xpath}
    Run Keyword And Continue On Failure    Verify Control Not Exists in Image Viewer    ${filter_apply_button_xpath}
MFRTT40 - Verify whether able to apply Auto Best BNC and view the changes in the image.
    [Documentation]    Verify whether able to apply Auto Best BNC and view the changes in the image.
    [Tags]    smoke    tools

    Click    ${window_XPATH}
    Apply Auto Best BNC
    Take Actual Screenshot    MFRTT40.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT40.png    MFRTT40.png

MFRTT41 - Verify whether able to reset the applied Auto Best BNC by clicking on Reset View button.
    [Documentation]    Verify whether able to reset the applied Auto Best BNC by clicking on Reset View button.
    [Tags]    smoke    tools

    Reset View
    Take Actual Screenshot    MFRTT41.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT41.png    MFRTT41.png
    Apply Auto Best BNC
MFRTT42 - Verify whether able to apply Persatile Brightness and Contrast and view the changes in the image.
    [Documentation]    Verify whether able to apply Persatile Brightness and Contrast and view the changes in the image.
    [Tags]    smoke    tools

    Click    ${window_XPATH}
    Apply Percentile Brightness and Contrast    35    55
    Take Actual Screenshot    MFRTT42.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT42.png    MFRTT42.png
    Reset View
    Apply Auto Best BNC
MFRTT43 - Verify whether able to save Percentile Brightness and Contrast preset.
    [Documentation]    Verify whether able to save and load Percentile Brightness and Contrast preset.
    [Tags]    smoke    tools
    Save Percentile Brightness and Contrast Preset    PBNC1
    Run Keyword And Continue On Failure    Verify Percentile Brightness and Contrast Preset Exists    PBNC1
MFRTT44 - Verify whether able to load Percentile Brightness and Contrast preset and view the changes in the image.
    [Documentation]    Verify whether able to load Percentile Brightness and Contrast preset and view the changes in the image.
    [Tags]    smoke    tools
    Apply Percentile Brightness and Contrast    5    95
    Save Percentile Brightness and Contrast Preset    PBNC2
    Load Percentile Brightness and Contrast Preset    PBNC1
    Take Actual Screenshot    MFRTT44_1.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT44_1.png    MFRTT44_1.png
    Load Percentile Brightness and Contrast Preset    PBNC2
    Take Actual Screenshot    MFRTT44_2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT44_2.png    MFRTT44_2.png
MFRTT45 - Verify whether able to delete Percentile Brightness and Contrast preset.
    [Documentation]    Verify whether able to delete Percentile Brightness and Contrast preset.
    [Tags]    smoke    tools

    Delete Percentile Brightness and Contrast Preset
    Delete Percentile Brightness and Contrast Preset
    Run Keyword And Continue On Failure    Verify Percentile Brightness and Contrast Preset Exists    PBNC1
    Run Keyword And Continue On Failure    Verify Percentile Brightness and Contrast Preset Exists    PBNC2
    Reset View
    Apply Auto Best BNC
MFRTT46 - Verify whether able to apply Fox Bleach filter using the tool item.
    [Documentation]    Verify whether able to apply Fox Bleach filter using the tool item.
    [Tags]    smoke    tools
    Click    ${window_XPATH}
    Apply Fox Bleach Filter    True
    Take Actual Screenshot    MFRTT46.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT46.png    MFRTT46.png
MFRTT47 - Verify whether able to reset the applied Fox Bleach filter by un-checking the tool item.
    [Documentation]    Verify whether able to reset the applied Fox Bleach filter by un-checking the tool item.
    [Tags]    smoke    tools
    Apply Fox Bleach Filter    False
    Take Actual Screenshot    MFRTT47.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTT47.png    MFRTT47.png
    Reset View
    Close Project
    Close FoxRT Application Window
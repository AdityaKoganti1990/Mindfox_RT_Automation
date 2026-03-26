*** Settings ***
Library           FlaUILibrary    screenshot_dir=${CURDIR}\\..\\Actual\\test.png
Library           Process
Library           ../lib/image_comparator.py
Library           ../lib/ironpy_remote_client.py
Library           AutoItLibrary
Resource          ../resources/imageviewer.resource

*** Variables ***
${line_profiler_tool_button_xpath}           /Window[@AutomationId="FoxRTProMainWindow"]/Pane/Button[@AutomationId="Main_Tgl_LineProfile"]
${line_profiler_window_xpath}    //*[@AutomationId="ProfilePanel"]
${roi_statistics_tool_button_xpath}    //*[@AutomationId="Main_Tgl_RoiStats"]
${roi_statistics_window_xpath}    //*[@AutomationId="RoiPanel"]
${window_level_tool_button_xpath}    //*[@AutomationId="Main_Tgl_AreaAdjust"]
${window_Level_tool_panel_button_xpath}    //*[@AutomationId="Main_Tgl_WindowLevel"]
${window_level_center_input_xpath}    //*[@AutomationId="WinLevel_Txt_WindowCenter"]
${window_level_width_input_xpath}    //*[@AutomationId="WinLevel_Txt_WindowWidth"]
${window_Level_tool_panel_xpath}    //*[@AutomationId="WindowLevelPanel"]
${pixel_intensity_histogram_button_xpath}    //*[@AutomationId="Main_Tgl_Histogram"]
${pixel_intensity_histogram_window_xpath}    //*[@AutomationId="HistogramPanel"]
${calibration_tool_button_xpath}    //*[@AutomationId="Main_Tgl_Calibration"]
${known_distance_input_XPATH}    //*[@AutomationId="Calib_Txt_KnownDistance"]
${mm_units_XPATH}    //*[@AutomationId="Calib_Rdo_UnitMm"]
${inch_units_XPATH}   //*[@AutomationId="Calib_Rdo_UnitInches"]
${Calibration_Apply_button_XPATH}    //*[@AutomationId="Calib_Btn_Apply"]
${calibration_graph_window_XPATH}    //*[@AutomationId="CalibrationPanel"]
${snr_measurement_tool_button_xpath}    //*[@AutomationId="Main_Tgl_Snr"]
${surface_plot_tool_button_xpath}    //*[@AutomationId="Main_Tgl_SurfacePlot"]
${surface_plot_window_xpath}    //*[@AutomationId="SurfacePlotPanel"]
${surface_plot_colormap_combobox_xpath}    //*[@AutomationId="SurfacePlot_Cmb_Colormap"]
${surface_plot_invert_button_xpath}    //*[@AutomationId="SurfacePlot_Tgl_Invert"]
${surface_plot_resetview_button_xpath}    //*[@AutomationId="SurfacePlot_Btn_FitView"]
${wall_thickness_measurement_tool_button_xpath}    //*[@AutomationId="Main_Tgl_WallThickness"]
${wall_thickness_measurement_window_xpath}    //*[@AutomationId="WallThicknessPanel"]
*** Keywords ***

Add Line Profiler Tool
    [Arguments]    ${x1}    ${y1}    ${x2}    ${y2}
    [Documentation]    Activate the Line Profiler tool and draw it on the image viewer.
    Focus    ${window_XPATH}
    Sleep    0.2s
    Click    ${line_profiler_tool_button_xpath}
    Sleep    0.2s
    AutoItLibrary.Mouse Click Drag    left    ${x1}    ${y1}    ${x2}    ${y2}
    Sleep    0.5s

Take Line Profiler window Screenshot
    [Arguments]    ${filename}
    Wait Until Element Exist    ${line_profiler_window_xpath}    5
    ${screenshot_path}=    Take Screenshot    ${line_profiler_window_xpath} 
    Log    Screenshot saved to (temporary): ${screenshot_path}

    ${dest}=    Set Variable    ${actual_image}${filename}
    Create Directory    ${actual_image}
    Move File    ${screenshot_path}    ${dest}

    Log    Screenshot moved to: ${dest}
    RETURN    ${dest}

Add ROI Statistics Tool
    [Arguments]    ${x1}    ${y1}    ${x2}    ${y2}
    [Documentation]    Activate the ROI Statistics tool and draw it on the image viewer.

    Focus    ${window_XPATH}
    Sleep    0.2s
    Click    ${roi_statistics_tool_button_xpath}
    Sleep    0.2s
    AutoItLibrary.Mouse Click Drag    left    ${x1}    ${y1}    ${x2}  ${x1}
    Sleep    0.5s

Take ROI Statistics window Screenshot
    [Arguments]    ${filename}
    Wait Until Element Exist    ${roi_statistics_window_xpath}    5
    ${screenshot_path}=    Take Screenshot    ${roi_statistics_window_xpath}
    Log    Screenshot saved to (temporary): ${screenshot_path}

    ${dest}=    Set Variable    ${actual_image}${filename}
    Create Directory    ${actual_image}
    Move File    ${screenshot_path}    ${dest}

    Log    Screenshot moved to: ${dest}
    RETURN    ${dest}

Apply Window Level
    [Arguments]    ${repeat_count}    ${x1}    ${y1}    ${x2}    ${y2}
    [Documentation]    Activate the Window Level tool and apply it on the image viewer the requested number of times.

    Focus    ${window_XPATH}
    Sleep    0.2s
    Click    ${window_level_tool_button_xpath}
    Sleep    0.2s
    ${repeat_count}=    Convert To Integer    ${repeat_count}
    FOR    ${index}    IN RANGE    ${repeat_count}
        AutoItLibrary.Mouse Click Drag    left    ${x1}    ${y1}    ${x2}    ${y2}
        Sleep    0.5s
    END
    
Open Window Level Panel
    [Documentation]    Open the Window Level panel.
    Click    ${window_XPATH}
    Click    ${window_Level_tool_panel_button_xpath}
    Sleep    0.2s

Set Window Level Parameters
    [Arguments]    ${center_value}    ${width_value}
    [Documentation]    Set some parameters in the Window Level panel to apply window level.
    
    Set Text To Textbox    ${window_level_center_input_xpath}    ${center_value}
    Set Text To Textbox    ${window_level_width_input_xpath}    ${width_value}
    Sleep    0.2s

Take Window Level Panel Screenshot
    [Arguments]    ${filename}
    Wait Until Element Exist    ${window_Level_tool_panel_xpath}    5
    ${screenshot_path}=    Take Screenshot    ${window_Level_tool_panel_xpath}
    Log    Screenshot saved to (temporary): ${screenshot_path}

    ${dest}=    Set Variable    ${actual_image}${filename}
    Create Directory    ${actual_image}
    Move File    ${screenshot_path}    ${dest}

    Log    Screenshot moved to: ${dest}
    RETURN    ${dest}

Open Pixel Intensity Histogram
    [Documentation]    Open the Pixel Intensity Histogram window.
    Click    ${window_XPATH}
    Click    ${pixel_intensity_histogram_button_xpath}
    Sleep    0.2s

Take Pixel Intensity Histogram Screenshot
    [Arguments]    ${filename}
    Wait Until Element Exist    ${pixel_intensity_histogram_window_xpath}    5
    ${screenshot_path}=    Take Screenshot    ${pixel_intensity_histogram_window_xpath}
    Log    Screenshot saved to (temporary): ${screenshot_path}

    ${dest}=    Set Variable    ${actual_image}${filename}
    Create Directory    ${actual_image}
    Move File    ${screenshot_path}    ${dest}

    Log    Screenshot moved to: ${dest}
    RETURN    ${dest}

Click Calibration Tool
    [Documentation]    Click the calibration tool item.
    
    Click    ${window_XPATH}
    Click    ${calibration_tool_button_xpath}
    Sleep    0.2s

Add Calibration tool over image
    [Arguments]    ${x1}    ${y1}    ${x2}    ${y2}

    Focus    ${window_XPATH}
    Sleep    0.2s
    Click Calibration Tool
    AutoItLibrary.Mouse Click Drag    left    ${x1}    ${y1}    ${x2}    ${y2}
    Sleep    0.5s

Calibrate Image
    [Arguments]    ${knownDistance}    ${units}

    Focus    ${window_XPATH}
    Sleep    0.2s
    Set Text To Textbox    ${known_distance_input_XPATH}    ${knownDistance}
    Sleep    0.2s
    Run Keyword If    '${units}'=='mm'    Click    ${mm_units_XPATH}
    Run Keyword If    '${units}'=='inch'    Click    ${inch_units_XPATH}
    Sleep    0.2s
    Click    ${Calibration_Apply_button_XPATH}

Take Calibration Graph window Screenshot
    [Arguments]    ${filename}
    Wait Until Element Exist    ${calibration_graph_window_XPATH}    5
    ${screenshot_path}=    Take Screenshot    ${calibration_graph_window_XPATH}
    Log    Screenshot saved to (temporary): ${screenshot_path}

    ${dest}=    Set Variable    ${actual_image}${filename}
    Create Directory    ${actual_image}
    Move File    ${screenshot_path}    ${dest}

    Log    Screenshot moved to: ${dest}
    RETURN    ${dest}

Add SNR Measurement tool over image
    [Arguments]    ${x1}    ${y1}    ${x2}    ${y2}    ${x3}    ${y3}    ${x4}    ${y4}

    Focus    ${window_XPATH}
    Sleep    0.2s
    Click    ${snr_measurement_tool_button_xpath}
    Sleep    0.2s
    AutoItLibrary.Mouse Click Drag    left    ${x1}    ${y1}    ${x2}    ${y2}
    Sleep    0.2s
    AutoItLibrary.Mouse Click Drag    left    ${x3}    ${y3}    ${x4}    ${y4}
    Sleep    0.2s

Add Surface Plot 3D Tool over image
    [Arguments]    ${x1}    ${y1}    ${x2}    ${y2}

    Focus    ${window_XPATH}
    Sleep    0.2s
    Click    ${surface_plot_tool_button_xpath}
    Sleep    0.2s
    AutoItLibrary.Mouse Click Drag    left    ${x1}    ${y1}    ${x2}    ${y2}
    Sleep    0.5s

Take surface plot window Screenshot
    [Arguments]    ${filename}
    Wait Until Element Exist    ${surface_plot_window_xpath}    5
    ${screenshot_path}=    Take Screenshot    ${surface_plot_window_xpath}
    Log    Screenshot saved to (temporary): ${screenshot_path}

    ${dest}=    Set Variable    ${actual_image}${filename}
    Create Directory    ${actual_image}
    Move File    ${screenshot_path}    ${dest}

    Log    Screenshot moved to: ${dest}
    RETURN    ${dest}

Set Surface Plot Colormap
    [Arguments]    ${colormap}

    Focus    ${window_XPATH}
    Sleep    0.2s
    Select Combobox Item By Name    ${surface_plot_colormap_combobox_xpath}    ${colormap}

Apply Invert on Surface Plot 3D Image
    [Documentation]    Apply invert on surface plot 3D image.

    Focus    ${window_XPATH}
    Sleep    0.2s
    Click    ${surface_plot_invert_button_xpath}
    Sleep    0.2s

Click Surface Plot Window Fit View Button 
    [Documentation]    Click Surface Plot Window Fit View Button.

    Focus    ${window_XPATH}
    Sleep    0.2s
    Click    ${surface_plot_resetview_button_xpath}
    Sleep    0.2s

Zoom Surface Plot 3D Image
    [Arguments]    ${zoom_level}
    [Documentation]    Zoom surface plot 3D image. Positive values zoom in and negative values zoom out.

    Focus    ${window_XPATH}
    Click Surface Plot Window Fit View Button
    Sleep    0.2s
    Click    ${surface_plot_window_xpath}
    Sleep    0.2s
    ${zoom_level}=    Convert To Integer    ${zoom_level}
    ${scroll_count}=    Evaluate    abs(${zoom_level})
    IF    ${scroll_count} == 0
        RETURN
    END
    ${direction}=    Set Variable If    ${zoom_level} > 0    up    down
    AutoItLibrary.Mouse Wheel    ${direction}    ${scroll_count}
    Sleep    0.2s

Rotate Surface Plot 3D Image
    [Arguments]    ${start_x}    ${start_y}    ${end_x}    ${end_y}
    [Documentation]    Rotate surface plot 3D image by right-click dragging on the viewer using user-provided start and end coordinates.

    Focus    ${window_XPATH}
    Sleep    0.2s
    Click    ${surface_plot_window_xpath}
    Sleep    0.2s
    AutoItLibrary.Mouse Click Drag    right    ${start_x}    ${start_y}    ${end_x}    ${end_y}
    Sleep    0.5s

Add Wall Thickness Measurement tool over image
    [Arguments]    ${x1}    ${y1}    ${x2}    ${y2}

    Focus    ${window_XPATH}
    Sleep    0.2s
    Click    ${wall_thickness_measurement_tool_button_xpath}
    Sleep    0.2s
    AutoItLibrary.Mouse Click Drag    left    ${x1}    ${y1}    ${x2}    ${y2}
    Sleep    0.2s

Take wall thickness measurement window Screenshot
    [Arguments]    ${filename}
    Wait Until Element Exist    ${wall_thickness_measurement_window_xpath}    5
    ${screenshot_path}=    Take Screenshot    ${wall_thickness_measurement_window_xpath}
    Log    Screenshot saved to (temporary): ${screenshot_path}

    ${dest}=    Set Variable    ${actual_image}${filename}
    Create Directory    ${actual_image}
    Move File    ${screenshot_path}    ${dest}

    Log    Screenshot moved to: ${dest}
    RETURN    ${dest}










    

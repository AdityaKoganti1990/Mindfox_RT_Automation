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
${Manual_wall_thickness_detection_method_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Tab[2]/TabItem/Custom/Text[@Name="MANUAL"]
${Auto_Reset_wall_thickness_line_result_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Tab[2]/TabItem/Custom/Button[@AutomationId="ResetAutoButton"]
${delete_wall_thickness_measurement_annotation_menu_XPATH}    //*[@Name="Remove"]
${cnr_measurement_tool_button_xpath}    //*[@AutomationId="Main_Tgl_Cnr"]
${mtf_measurement_tool_button_xpath}    //*[@AutomationId="Main_Tgl_Mtf"]
${mtf_measurement_window_xpath}    /Window/Tab[@AutomationId="BottomPanelTabs"]
${IQI_wire_phantom_tool_button_xpath}    //*[@AutomationId="Main_Tgl_IqiDetect"]
${IQI_wire_phantom_cancel_button_xpath}    //*[@AutomationId="Main_Btn_CancelIqiDetection"]
${IQI_wire_phantom_detecting_text_xpath}    //*[contains(@Name,"Detecting IQI")]
${IQI_wire_detected_text_xpath}    //*[@Name="IQI DETECTED"]
${IQI_wire_detected_summary_xpath}    //*[contains(@Name,"IQI detected:")]
${IQI_wire_pair_count_text_xpath}    //*[@AutomationId="WireCountText"]
${IQI_wire_phantom_window_xpath}    /Window/Tab[2]/TabItem/Custom[@AutomationId="ProfilePanel"]
${defect_marking_tool_button_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Pane/Button[@AutomationId="Main_Tgl_DefectMarking"]
${defect_marking_window_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Tab[2]/TabItem/Custom[@AutomationId="DefectPanel"]
${Defect_Cmb_DefectType_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Tab[2]/TabItem/Custom/ComboBox[@AutomationId="Defect_Cmb_DefectType"]
${defect_marking_radio_rectangle_button_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Tab[2]/TabItem/Custom/RadioButton[@AutomationId="Defect_Rdo_ShapeRectangle"]
${defect_marking_radio_line_button_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Tab[2]/TabItem/Custom/RadioButton[@AutomationId="Defect_Rdo_ShapeLine"]
${defect_marking_radio_ellipse_button_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Tab[2]/TabItem/Custom/RadioButton[@AutomationId="Defect_Rdo_ShapeEllipse"]
${clear_all_defects_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Tab[2]/TabItem/Custom/Button[@AutomationId="Defect_Btn_ClearAll"]
${defect_delete_button_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Tab[2]/TabItem/Custom/Button[@AutomationId="Defect_Btn_Delete"]
${evaluate_defect_marking_button_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Tab[2]/TabItem/Custom/Pane/Button[@AutomationId="Defect_Btn_Evaluate"]
${Image_Filter_Tool_Button_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Pane/Button[@AutomationId="Main_Tgl_ImageFilters"]
${filter_combobox_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Tab/TabItem[2]/Custom/Pane/ComboBox[@AutomationId="ImgFilters_Cmb_Filter"]
${filter_apply_button_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Tab/TabItem[2]/Custom/Pane/Button[@AutomationId="ImgFilters_Btn_ApplyFilter"]
${filter_reset_button_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Tab/TabItem[2]/Custom/Pane/Button[@AutomationId="ImgFilters_Btn_Reset"]
${filter_apply_loading_bar_cancel_button_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Button[@AutomationId="Main_Btn_CancelFilter"]
${percentile_brightness_contrast_filter_button_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Pane/Button[@AutomationId="Main_Tgl_PercentileBnC"]    
${percentile_brightness_contrast_savePreset_button_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Window/Button[@AutomationId="Pct_Btn_SavePreset"]
${percentile_brightness_contrast_savePreset_name_textbox_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Window/Edit[@AutomationId="Pct_Txb_NewPresetName"]
${percentile_brightness_contrast_preset_1_99_button_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Window/Button[@AutomationId="Pct_Btn_Preset_1_99"]
${percentile_brightness_contrast_preset_5_95_button_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Window/Button[@AutomationId="Pct_Btn_Preset_5_95"]
${percentile_brightness_contrast_preset_10_90_button_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Window/Button[@AutomationId="Pct_Btn_Preset_10_90"]
${percentile_brightness_contrast_preset_20_80_button_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Window/Button[@AutomationId="Pct_Btn_Preset_20_80"]
${percentile_brightness_contrast_low_slider_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Window/Slider[1]
${percentile_brightness_contrast_high_slider_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Window/Slider[2]
${percentile_brightness_contrast_low_value_text_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Window/Text[3]
${percentile_brightness_contrast_high_value_text_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Window/Text[5]
${percentile_brightness_contrast_load_preset_button}    /Window[@AutomationId="FoxRTProMainWindow"]/Window/List/DataItem/Button[1]
${selectNormalProfilerType_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]//Tab[2]/TabItem/Custom/RadioButton[@AutomationId="ModeNormal"]
${selectIQIProfilerType_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]//Tab[2]/TabItem/Custom/RadioButton[@AutomationId="ModeIqi"]
${fox_bleach_filter_button_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Pane/Button[@AutomationId="Main_Tgl_FoxBleach"]
${filter_rename_button_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Tab/TabItem[2]/Custom/Pane/Button[1]
${filter_rename_textbox_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Tab/TabItem[2]/Custom/Pane/Edit[@AutomationId="ImgFilters_Rename_TxtName"]   
${filter_reset_to_default_button_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Tab/TabItem[2]/Custom/Pane/Button[@AutomationId="ImgFilters_Rename_BtnResetDefault"]
${filter_save_button_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Tab/TabItem[2]/Custom/Pane/Button[@AutomationId="ImgFilters_Rename_BtnSave"]    
*** Keywords ***

Add Line Profiler Tool
    [Arguments]    ${x1}    ${y1}    ${x2}    ${y2}    ${profilerType}=${EMPTY}
    [Documentation]    Activate the Line Profiler tool and draw it on the image viewer.
    Focus    ${window_XPATH}
    Sleep    0.2s
    Click    ${line_profiler_tool_button_xpath}
    Sleep    0.2s
    AutoItLibrary.Mouse Click Drag    left    ${x1}    ${y1}    ${x2}    ${y2}
    Sleep    0.5s
    Run Keyword If    '${profilerType}'=='Normal'    click    ${selectNormalProfilerType_XPATH}
    Run Keyword If    '${profilerType}'=='Iqi'    click    ${selectIQIProfilerType_XPATH}
    Sleep    0.2s

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
    Send    {TAB}
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
    Sleep    1s

Take surface plot window Screenshot
    [Arguments]    ${filename}
    Wait Until Element Exist    ${surface_plot_window_xpath}    5
    Sleep    0.5s
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

Adjust Wall Thickness Measurement Line Position
    [Arguments]    ${start_x1}    ${start_y1}    ${end_x1}    ${end_y1}    ${start_x2}    ${start_y2}    ${end_x2}    ${end_y2}
    [Documentation]    Adjust wall thickness measurement line position by dragging the endpoints of the line using user-provided start and end coordinates.

    Focus    ${window_XPATH}
    Sleep    0.2s
    Click    ${wall_thickness_measurement_window_xpath}
    Sleep    0.2s
    AutoItLibrary.Mouse Click Drag    left    ${start_x1}    ${start_y1}    ${end_x1}    ${end_y1}
    Sleep    0.2s
    AutoItLibrary.Mouse Click Drag    left    ${start_x2}    ${start_y2}    ${end_x2}    ${end_y2}

Click Reset Auto Wall Thickness Line Result
    [Documentation]    Click the reset auto wall thickness line result button.

    Focus    ${window_XPATH}
    Sleep    0.2s
    Click    ${Auto_Reset_wall_thickness_line_result_XPATH}
    Sleep    0.2s

Select Wall Thickness Measurement Annotation
    [Arguments]    ${x}    ${y}
    [Documentation]    Select wall thickness measurement annotation by clicking on it using user-provided coordinates.

    Focus    ${window_XPATH}
    Sleep    0.2s
    AutoItLibrary.Mouse Click    left    ${x}    ${y}
    Sleep    0.2s

Click Delete Wall Thickness Measurement Annotation
    [Arguments]    ${x}    ${y}
    [Documentation]    Delete wall thickness measurement annotation by right-clicking on it using user-provided coordinates and selecting delete option from the context menu.

    Focus    ${window_XPATH}
    Sleep    0.2s
    AutoItLibrary.Mouse Click    right    ${x}    ${y}
    Sleep    0.2s
    Click    ${delete_wall_thickness_measurement_annotation_menu_XPATH}
    Sleep    0.2s

Add CNR Measurement tool over image
    [Arguments]    ${x1}    ${y1}    ${x2}    ${y2}    ${x3}    ${y3}    ${x4}    ${y4}

    Focus    ${window_XPATH}
    Sleep    0.2s
    Click    ${cnr_measurement_tool_button_xpath}
    Sleep    0.2s
    AutoItLibrary.Mouse Click Drag    left    ${x1}    ${y1}    ${x2}    ${y2}
    Sleep    0.2s
    AutoItLibrary.Mouse Click Drag    left    ${x3}    ${y3}    ${x4}    ${y4}

Add MTF Measurement tool over image
    [Arguments]    ${x1}    ${y1}    ${x2}    ${y2}

    Focus    ${window_XPATH}
    Sleep    0.2s
    Click    ${mtf_measurement_tool_button_xpath}
    Sleep    0.2s
    AutoItLibrary.Mouse Click Drag    left    ${x1}    ${y1}    ${x2}    ${y2}
    Sleep    0.5s

Take MTF Measurement window Screenshot
    [Arguments]    ${filename}
    Wait Until Element Exist    ${mtf_measurement_window_xpath}    5
    ${screenshot_path}=    Take Screenshot    ${mtf_measurement_window_xpath}
    Log    Screenshot saved to (temporary): ${screenshot_path}

    ${dest}=    Set Variable    ${actual_image}${filename}
    Create Directory    ${actual_image}
    Move File    ${screenshot_path}    ${dest}

    Log    Screenshot moved to: ${dest}
    RETURN    ${dest}

Detect IQI Wire Phantom Tool
    [Documentation]    Activate the IQI Wire Phantom Detection tool to detect the wires on the phantom and display the detection result on the viewer.

    Focus    ${window_XPATH}
    Sleep    0.2s
    Click    ${IQI_wire_phantom_tool_button_xpath}
    Sleep    0.2s
    Wait Until Element Exist    ${IQI_wire_phantom_window_xpath}
    Sleep    0.2s

Take IQI Wire Phantom Tool window Screenshot
    [Arguments]    ${filename}
    Wait Until Element Exist    ${IQI_wire_phantom_window_xpath}    5
    ${screenshot_path}=    Take Screenshot    ${IQI_wire_phantom_window_xpath}
    Log    Screenshot saved to (temporary): ${screenshot_path}

    ${dest}=    Set Variable    ${actual_image}${filename}
    Create Directory    ${actual_image}
    Move File    ${screenshot_path}    ${dest}

    Log    Screenshot moved to: ${dest}
    RETURN    ${dest}
    
Add Defect Marking and Classification Tool over image
    [Arguments]    ${DefectType}    ${radioButtonType}    ${x1}    ${y1}    ${x2}    ${y2}

    Focus    ${window_XPATH}
    Sleep    0.2s
    Click    ${defect_marking_tool_button_xpath}
    Sleep    0.2s
    Wait Until Element Exist    ${defect_marking_window_xpath}    5
    Sleep    0.2s
    Select Combobox Item By Name    ${Defect_Cmb_DefectType_XPATH}    ${DefectType}
    Sleep    0.2s
    Run Keyword If    '${radioButtonType}'=='Rectangle'    click    ${defect_marking_radio_rectangle_button_xpath}
    Run Keyword If    '${radioButtonType}'=='Line'    click    ${defect_marking_radio_line_button_xpath}
    Run Keyword If    '${radioButtonType}'=='Ellipse'    click    ${defect_marking_radio_ellipse_button_xpath}
    Sleep    0.2s
    AutoItLibrary.Mouse Click Drag    left    ${x1}    ${y1}    ${x2}    ${y2}
    Sleep    0.5s

Take Defect Marking and Classification Tool window Screenshot
    [Arguments]    ${filename}
    Wait Until Element Exist    ${defect_marking_window_xpath}    5
    ${screenshot_path}=    Take Screenshot    ${defect_marking_window_xpath}
    Log    Screenshot saved to (temporary): ${screenshot_path}

    ${dest}=    Set Variable    ${actual_image}${filename}
    Create Directory    ${actual_image}
    Move File    ${screenshot_path}    ${dest}

    Log    Screenshot moved to: ${dest}
    RETURN    ${dest}

Clear AllDefects
    [Documentation]    Clear all the defects marked on the image by the Defect Marking and Classification tool.

    Focus    ${window_XPATH}
    Sleep    0.2s
    Wait Until Element Exist    ${defect_marking_window_xpath}    5
    Sleep    0.2s
    Click    ${clear_all_defects_xpath}
    Sleep    0.2s

Delete Selected Defect
    [Arguments]    ${listItemNo}
    [Documentation]    Delete a defect marked on the image by the Defect Marking and Classification tool by clicking on it to select it and then pressing delete key.

    Focus    ${window_XPATH}
    Sleep    0.2s
    Wait Until Element Exist    ${defect_marking_window_xpath}    5
    Sleep    0.2s
    Click    /Window[@AutomationId="FoxRTProMainWindow"]/Tab[2]/TabItem/Custom/List/ListItem[${listItemNo}]  
    Sleep    0.2s
    Click    ${defect_delete_button_xpath}
    Sleep    0.2s

Evaluate Defect Marked
    [Arguments]    ${listItemNo}
    [Documentation]    Evaluate if the defect type of a defect marked on the image by the Defect Marking and Classification tool is correct by clicking on it to select it and then getting the defect type value from the combobox.

    Focus    ${window_XPATH}
    Sleep    0.2s
    Wait Until Element Exist    ${defect_marking_window_xpath}    5
    Sleep    0.2s
    Click    /Window[@AutomationId="FoxRTProMainWindow"]/Tab[2]/TabItem/Custom/List/ListItem[${listItemNo}]  
    Sleep    0.2s
    Click    ${evaluate_defect_marking_button_xpath}
    Sleep    0.2s

Click Image Filter Tool
    [Documentation]    Activate the Image Filter tool.

    Focus    ${window_XPATH}
    Sleep    0.2s
    Click    ${Image_Filter_Tool_Button_XPATH}
    Sleep    0.2s
    Wait Until Element Exist    ${filter_combobox_xpath}    5
    Sleep    0.2s

Apply Image Filter
    [Arguments]    ${filterName}
    [Documentation]    Set an image filter by selecting the filter from the filter combobox in the Image Filter tool.

    Focus    ${window_XPATH}
    Sleep    0.2s
    Select Combobox Item By Name    ${filter_combobox_xpath}    ${filterName}
    Sleep    0.2s
    Click Apply Image Filter

Reset Image Filter
    [Documentation]    Reset the image filter by clicking the reset button.
    Focus    ${window_XPATH}
    Sleep    0.2s
    Click    ${filter_reset_button_xpath}
    Sleep    0.2s

Click Apply Image Filter
    [Documentation]    Click the Apply Filter button in the Image Filter tool.

    Focus    ${window_XPATH}
    Sleep    0.2s
    ${filter_tool_open}=    Run Keyword And Return Status
    ...    Wait Until Element Exist    ${filter_apply_button_xpath}    1
    Run Keyword If    not ${filter_tool_open}    Click Image Filter Tool
    Click    ${filter_apply_button_xpath}
    Sleep    0.2s
    Wait Until Element Is Offscreen    ${filter_apply_loading_bar_cancel_button_xpath}    5
    Sleep    0.2s
    Wait Until Element Is Enabled    ${project_menu_item_xpaths}
    Sleep    0.2s

Set Percentile Brightness and Contrast Slider Value
    [Arguments]    ${slider_xpath}    ${value}
    [Documentation]    Set a percentile slider to the requested value (0-100) by dragging the slider thumb.

    ${value}=    Convert To Integer    ${value}
    Should Be True    0 <= ${value} <= 100
    ...    Percentile slider value must be between 0 and 100. Received: ${value}

    ${slider_rect}=    Get Rectangle Bounding From Element    ${slider_xpath}    BoundingRectangle
    ${thumb_xpath}=    Set Variable    ${slider_xpath}/Thumb
    ${thumb_rect}=    Get Rectangle Bounding From Element    ${thumb_xpath}    BoundingRectangle

    ${slider_x}=    Get From List    ${slider_rect}    0
    ${slider_y}=    Get From List    ${slider_rect}    1
    ${slider_width}=    Get From List    ${slider_rect}    2
    ${slider_height}=    Get From List    ${slider_rect}    3
    ${thumb_x}=    Get From List    ${thumb_rect}    0
    ${thumb_y}=    Get From List    ${thumb_rect}    1
    ${thumb_width}=    Get From List    ${thumb_rect}    2
    ${thumb_height}=    Get From List    ${thumb_rect}    3

    ${start_x}=    Evaluate    int(${thumb_x} + (${thumb_width} / 2))
    ${start_y}=    Evaluate    int(${thumb_y} + (${thumb_height} / 2))
    ${thumb_half}=    Evaluate    ${thumb_width} / 2
    ${min_x}=    Evaluate    ${slider_x} + ${thumb_half}
    ${max_x}=    Evaluate    ${slider_x} + ${slider_width} - ${thumb_half}
    ${target_x}=    Evaluate    int(${min_x} + ((${max_x} - ${min_x}) * ${value} / 100))
    ${target_y}=    Evaluate    int(${slider_y} + (${slider_height} / 2))

    AutoItLibrary.Mouse Click Drag    left    ${start_x}    ${start_y}    ${target_x}    ${target_y}
    Sleep    0.2s

    ${current}=    Get Percentile Slider Current Value    ${slider_xpath}
    ${pixels_per_unit}=    Evaluate    max(1.0, (${max_x} - ${min_x}) / 100.0)

    FOR    ${attempt}    IN RANGE    60
        IF    ${current} == ${value}
            BREAK
        END
        ${delta}=    Evaluate    ${value} - ${current}
        ${abs_delta}=    Evaluate    abs(${delta})
        ${direction}=    Set Variable If    ${delta} > 0    1    -1
        ${coarse_step}=    Evaluate    int(max(1, round(${abs_delta} * ${pixels_per_unit} * 0.6)))
        ${step_pixels}=    Set Variable If    ${abs_delta} <= 2    1    ${coarse_step}
        ${step_pixels}=    Evaluate    min(15, max(1, ${step_pixels}))

        ${thumb_rect}=    Get Rectangle Bounding From Element    ${thumb_xpath}    BoundingRectangle
        ${thumb_x}=    Get From List    ${thumb_rect}    0
        ${thumb_y}=    Get From List    ${thumb_rect}    1
        ${thumb_width}=    Get From List    ${thumb_rect}    2
        ${thumb_height}=    Get From List    ${thumb_rect}    3
        ${start_x}=    Evaluate    int(${thumb_x} + (${thumb_width} / 2))
        ${start_y}=    Evaluate    int(${thumb_y} + (${thumb_height} / 2))
        ${nudge_target_x}=    Evaluate    int(min(${max_x}, max(${min_x}, ${start_x} + (${direction} * ${step_pixels}))))
        IF    ${nudge_target_x} == ${start_x}
            BREAK
        END

        AutoItLibrary.Mouse Click Drag    left    ${start_x}    ${start_y}    ${nudge_target_x}    ${target_y}
        Sleep    0.05s
        ${current}=    Get Percentile Slider Current Value    ${slider_xpath}
    END

    Run Keyword If    ${current} != ${value}
    ...    Log
    ...    Could not reach requested ${value} after drag adjustments. Current value is ${current}.
    ...    WARN
    RETURN    ${current}

Get Percentile Slider Current Value
    [Arguments]    ${slider_xpath}
    [Documentation]    Read the current numeric value of a slider via its RangeValue pattern.
    ${raw}=    Get Property From Element    ${slider_xpath}    RANGEVALUE
    ${current}=    Evaluate    int(round(float($raw)))
    RETURN    ${current}

Apply Percentile Brightness and Contrast
    [Arguments]    ${low_percent}=20    ${high_percent}=80
    [Documentation]    Apply Percentile Brightness and Contrast by setting Low % and High % trackbar values.

    ${low_percent}=    Convert To Integer    ${low_percent}
    ${high_percent}=    Convert To Integer    ${high_percent}
    Should Be True    0 <= ${low_percent} <= 100
    ...    Low % value must be between 0 and 100. Received: ${low_percent}
    Should Be True    0 <= ${high_percent} <= 100
    ...    High % value must be between 0 and 100. Received: ${high_percent}
    Should Be True    ${low_percent} <= ${high_percent}
    ...    Low % must be less than or equal to High %. Received Low=${low_percent}, High=${high_percent}

    Focus    ${window_XPATH}
    Sleep    0.2s
    ${popup_open}=    Run Keyword And Return Status
    ...    Wait Until Element Exist    ${percentile_brightness_contrast_savePreset_button_xpath}    1
    Run Keyword If    not ${popup_open}    Click    ${percentile_brightness_contrast_filter_button_xpath}
    Run Keyword If    not ${popup_open}    Wait Until Element Exist    ${percentile_brightness_contrast_savePreset_button_xpath}    5
    Sleep    0.2s
    ${actual_low}=    Set Percentile Brightness and Contrast Slider Value    ${percentile_brightness_contrast_low_slider_xpath}    ${low_percent}
    ${actual_high}=    Set Percentile Brightness and Contrast Slider Value    ${percentile_brightness_contrast_high_slider_xpath}    ${high_percent}
    Sleep    0.2s
    Log    Requested Low/High: ${low_percent}/${high_percent}. Applied Low/High: ${actual_low}/${actual_high}
    Should Be Equal As Integers    ${actual_low}    ${low_percent}
    ...    Low % mismatch. Requested ${low_percent}, but applied ${actual_low}.
    Should Be Equal As Integers    ${actual_high}    ${high_percent}
    ...    High % mismatch. Requested ${high_percent}, but applied ${actual_high}.
    Click    ${window_XPATH}
    Wait Until Element Does Not Exist    ${percentile_brightness_contrast_savePreset_button_xpath}    5
    Sleep    0.2s

Apply Percentile Brightness and Contrast Preset
    [Arguments]    ${preset}
    [Documentation]    Apply Percentile Brightness and Contrast filter from the Image Filter tool.

    Focus    ${window_XPATH}
    Sleep    0.2s
    ${popup_open}=    Run Keyword And Return Status
    ...    Wait Until Element Exist    ${percentile_brightness_contrast_savePreset_button_xpath}    1
    Run Keyword If    not ${popup_open}    Click    ${percentile_brightness_contrast_filter_button_xpath}
    Run Keyword If    not ${popup_open}    Wait Until Element Exist    ${percentile_brightness_contrast_savePreset_button_xpath}    5
    Sleep    0.2s
    Run Keyword If    '${preset}'=='1-99'    Click    ${percentile_brightness_contrast_preset_1_99_button_xpath}
    Run Keyword If    '${preset}'=='5-95'    Click    ${percentile_brightness_contrast_preset_5_95_button_xpath}
    Run Keyword If    '${preset}'=='10-90'    Click    ${percentile_brightness_contrast_preset_10_90_button_xpath}
    Run Keyword If    '${preset}'=='20-80'    Click    ${percentile_brightness_contrast_preset_20_80_button_xpath}
    Sleep    0.2s
    Click    ${window_XPATH}
    Wait Until Element Does Not Exist    ${percentile_brightness_contrast_savePreset_button_xpath}    5
    Sleep    0.2s

Save Percentile Brightness and Contrast Preset
    [Arguments]    ${preset_name}
    [Documentation]    Save a Percentile Brightness and Contrast preset with the provided preset name.

    Should Not Be Empty    ${preset_name}    Preset name cannot be empty.
    ${preset_name}=    Strip String    ${preset_name}
    Should Not Be Empty    ${preset_name}    Preset name cannot be blank.

    Focus    ${window_XPATH}
    Sleep    0.2s
    ${popup_open}=    Run Keyword And Return Status
    ...    Wait Until Element Exist    ${percentile_brightness_contrast_savePreset_button_xpath}    1
    Run Keyword If    not ${popup_open}    Click    ${percentile_brightness_contrast_filter_button_xpath}
    Run Keyword If    not ${popup_open}    Wait Until Element Exist    ${percentile_brightness_contrast_savePreset_button_xpath}    5
    Sleep    0.2s

    Set Text To Textbox    ${percentile_brightness_contrast_savePreset_name_textbox_xpath}    ${preset_name}
    Sleep    0.2s
    Click    ${percentile_brightness_contrast_savePreset_button_xpath}
    Sleep    0.2s

Load Percentile Brightness and Contrast Preset
    [Arguments]    ${preset}
    [Documentation]    Load a Percentile Brightness and Contrast preset by clicking on it in the preset list.

    Focus    ${window_XPATH}
    Sleep    0.2s
    ${popup_open}=    Run Keyword And Return Status
    ...    Wait Until Element Exist    ${percentile_brightness_contrast_savePreset_button_xpath}    1
    Run Keyword If    not ${popup_open}    Click    ${percentile_brightness_contrast_filter_button_xpath}
    Run Keyword If    not ${popup_open}    Wait Until Element Exist    ${percentile_brightness_contrast_savePreset_button_xpath}    5
    Sleep    0.2s
    Click    /Window[@AutomationId="FoxRTProMainWindow"]/Window/List//Button[@Name="Apply preset ${preset}"]
    Sleep    0.2s
    Click    ${window_XPATH}
    Wait Until Element Does Not Exist    ${percentile_brightness_contrast_savePreset_button_xpath}    5
    Sleep    0.2s

Delete Percentile Brightness and Contrast Preset
    [Arguments]    ${listItemNo}=1
    [Documentation]    Delete a Percentile Brightness and Contrast preset with the provided preset name.

    Focus    ${window_XPATH}
    Sleep    0.2s
    ${popup_open}=    Run Keyword And Return Status
    ...    Wait Until Element Exist    ${percentile_brightness_contrast_savePreset_button_xpath}    1
    Run Keyword If    not ${popup_open}    Click    ${percentile_brightness_contrast_filter_button_xpath}
    Run Keyword If    not ${popup_open}    Wait Until Element Exist    ${percentile_brightness_contrast_savePreset_button_xpath}    5
    Sleep    0.2s
    Click    /Window[@AutomationId="FoxRTProMainWindow"]/Window/List/DataItem[${listItemNo}]/Button[2]
    Sleep    0.2s
    Click    ${window_XPATH}
    Wait Until Element Does Not Exist    ${percentile_brightness_contrast_savePreset_button_xpath}    5
    Sleep    0.2s

Verify Percentile Brightness and Contrast Preset Exists
    [Arguments]    ${preset}
    [Documentation]    Verify that a Percentile Brightness and Contrast preset with the provided preset name exists in the preset list.

    Focus    ${window_XPATH}
    Sleep    0.2s
    ${popup_open}=    Run Keyword And Return Status
    ...    Wait Until Element Exist    ${percentile_brightness_contrast_savePreset_button_xpath}    1
    Run Keyword If    not ${popup_open}    Click    ${percentile_brightness_contrast_filter_button_xpath}
    Run Keyword If    not ${popup_open}    Wait Until Element Exist    ${percentile_brightness_contrast_savePreset_button_xpath}    5
    Sleep    0.2s
    ${preset_exists}=    Run Keyword And Return Status
    ...    Wait Until Element Exist    /Window[@AutomationId="FoxRTProMainWindow"]/Window/List/DataItem/Button[@Name="${preset}"]    1
    Click    ${window_XPATH}

Apply Fox Bleach Filter
    [Arguments]    ${action}=select
    [Documentation]    Set Fox Bleach tool item state based on action: select/on/true to enable, unselect/off/false to disable.

    Focus    ${window_XPATH}
    Sleep    0.2s
    ${action}=    Evaluate    str($action).strip().lower()
    IF    '${action}'=='select' or '${action}'=='on' or '${action}'=='true'
        ${target_state}=    Set Variable    ON
    ELSE IF    '${action}'=='unselect' or '${action}'=='off' or '${action}'=='false'
        ${target_state}=    Set Variable    OFF
    ELSE
        Fail    Invalid action '${action}'. Use: select, unselect, on, off, True, or False.
    END
    ${fox_bleach_state}=    Get Toggle State    ${fox_bleach_filter_button_xpath}
    Run Keyword If    '${fox_bleach_state}'!='${target_state}'    Click    ${fox_bleach_filter_button_xpath}
    Sleep    0.2s

Rename Image Filter
    [Arguments]    ${filterName}    ${newFilterName}
    [Documentation]    Rename the image filter by selecting the filter from the filter combobox in the Image Filter tool.

    Focus    ${window_XPATH}
    Sleep    0.2s
    ${filter_tool_open}=    Run Keyword And Return Status
    ...    Wait Until Element Exist    ${filter_combobox_xpath}    1
    Run Keyword If    not ${filter_tool_open}    Click Image Filter Tool
    Select Combobox Item By Name    ${filter_combobox_xpath}    ${filterName}
    Sleep    0.2s
    Click    ${filter_rename_button_xpath}
    Sleep    0.2s
    Set Text To Textbox    ${filter_rename_textbox_xpath}    ${newFilterName}
    Sleep    0.2s
    Click    ${filter_save_button_xpath}
    Sleep    0.2s

Verify Filter Exists in Filters List
    [Arguments]    ${filterName}
    [Documentation]    Verify that a filter with the provided name exists in the filters list of the Image Filter tool.

    Focus    ${window_XPATH}
    Sleep    0.2s
    ${filter_tool_open}=    Run Keyword And Return Status
    ...    Wait Until Element Exist    ${filter_combobox_xpath}    1
    Run Keyword If    not ${filter_tool_open}    Click Image Filter Tool
    ${available_filter_names}=    Get All Names From Combobox    ${filter_combobox_xpath}
    ${available_filter_texts}=    Get All Texts From Combobox    ${filter_combobox_xpath}
    Log    Available filter names: ${available_filter_names}
    Log    Available filter texts: ${available_filter_texts}
    Combobox Should Contain    ${filter_combobox_xpath}    ${filterName}
    Log    Filter exists in the Image Filter list as expected.
    RETURN    ${TRUE}

Reset Filter Name to Default
    [Arguments]    ${filterName}
    [Documentation]    Reset the selected image filter name to its default value from the Image Filter tool.

    Focus    ${window_XPATH}
    Sleep    0.2s
    ${filter_tool_open}=    Run Keyword And Return Status
    ...    Wait Until Element Exist    ${filter_combobox_xpath}    1
    Run Keyword If    not ${filter_tool_open}    Click Image Filter Tool
    Select Combobox Item By Name    ${filter_combobox_xpath}    ${filterName}
    Sleep    0.2s
    Click    ${filter_rename_button_xpath}
    Sleep    0.2s
    Wait Until Element Exist    ${filter_rename_textbox_xpath}    5
    Wait Until Element Exist    ${filter_reset_to_default_button_xpath}    5
    Click    ${filter_reset_to_default_button_xpath}
    Sleep    0.2s

Verify Filter Not Exists in Filters List
    [Arguments]    ${filterName}
    [Documentation]    Verify that a filter with the provided name does not exist in the filters list of the Image Filter tool.

    Focus    ${window_XPATH}
    Sleep    0.2s
    ${filter_tool_open}=    Run Keyword And Return Status
    ...    Wait Until Element Exist    ${filter_combobox_xpath}    1
    Run Keyword If    not ${filter_tool_open}    Click Image Filter Tool
    ${available_filter_names}=    Get All Names From Combobox    ${filter_combobox_xpath}
    ${available_filter_texts}=    Get All Texts From Combobox    ${filter_combobox_xpath}
    Log    Available filter names: ${available_filter_names}
    Log    Available filter texts: ${available_filter_texts}
    Should Not Contain    ${available_filter_names}    ${filterName}
    Should Not Contain    ${available_filter_texts}    ${filterName}
    Log    Filter does not exist in the Image Filter list as expected.
    RETURN    ${TRUE}

Set Image Filter Parameters
    [Arguments]    ${filterName}    @{parameterPairs}
    [Documentation]    Select an image filter and set supported parameters using Parameter=Value pairs.

    Focus    ${window_XPATH}
    Sleep    0.2s
    ${filter_tool_open}=    Run Keyword And Return Status
    ...    Wait Until Element Exist    ${filter_combobox_xpath}    1
    Run Keyword If    not ${filter_tool_open}    Click Image Filter Tool

    ${filter_display_name}=    Resolve Image Filter Display Name    ${filterName}
    Select Combobox Item By Name    ${filter_combobox_xpath}    ${filter_display_name}
    Sleep    0.5s
    ${selected_filter_texts}=    Get All Selected Texts From Combobox    ${filter_combobox_xpath}
    Should Contain    ${selected_filter_texts}    ${filter_display_name}
    ...    Selected filter should be '${filter_display_name}'.

    ${parameter_count}=    Get Length    ${parameterPairs}
    IF    ${parameter_count} == 0
        Log    No parameters provided for '${filter_display_name}'. Filter selection completed.
        RETURN    ${TRUE}
    END

    FOR    ${parameter_pair}    IN    @{parameterPairs}
        ${separator_index}=    Evaluate    str($parameter_pair).find('=')
        Should Be True    ${separator_index} > 0
        ...    Invalid image filter parameter format '${parameter_pair}'. Use Parameter=Value.
        ${parameter_name}=    Evaluate    str($parameter_pair)[:${separator_index}].strip()
        ${parameter_value}=    Evaluate    str($parameter_pair)[${separator_index}+1:].strip()
        Should Not Be Empty    ${parameter_name}    Image filter parameter name cannot be empty.
        Should Not Be Empty    ${parameter_value}    Image filter parameter value cannot be empty for '${parameter_name}'.
        Set Image Filter Parameter    ${filter_display_name}    ${parameter_name}    ${parameter_value}
    END

    RETURN    ${TRUE}

Normalize Image Filter Name
    [Arguments]    ${filterName}

    Should Not Be Empty    ${filterName}    Image filter name cannot be empty.
    ${filter_key}=    Evaluate    ''.join(ch.lower() for ch in str($filterName).strip() if ch.isalnum())
    Should Not Be Empty    ${filter_key}    Image filter name cannot be blank.

    IF    '${filter_key}'=='none' or '${filter_key}'=='nofilter'
        RETURN    nofilter
    ELSE IF    '${filter_key}'=='cannyedge' or '${filter_key}'=='edgedetection'
        RETURN    cannyedge
    ELSE IF    '${filter_key}'=='vectorgradientmagnitude' or '${filter_key}'=='gradientmagnitude'
        RETURN    vectorgradientmagnitude
    ELSE IF    '${filter_key}'=='morphologicalgradient' or '${filter_key}'=='morphologicalcontour'
        RETURN    morphologicalgradient
    ELSE IF    '${filter_key}'=='sobeledge' or '${filter_key}'=='edgegradient'
        RETURN    sobeledge
    ELSE IF    '${filter_key}'=='butterworthhighpass' or '${filter_key}'=='highpasssharpen'
        RETURN    butterworthhighpass
    ELSE IF    '${filter_key}'=='butterworthlowpass' or '${filter_key}'=='lowpasssmooth'
        RETURN    butterworthlowpass
    ELSE IF    '${filter_key}'=='normalization' or '${filter_key}'=='normalize'
        RETURN    normalization
    ELSE IF    '${filter_key}'=='unsharpmask' or '${filter_key}'=='sharpnessboost'
        RETURN    unsharpmask
    ELSE IF    '${filter_key}'=='histogramequalization' or '${filter_key}'=='autoequalise'
        RETURN    histogramequalization
    ELSE IF    '${filter_key}'=='gaussiansmooth' or '${filter_key}'=='gaussianblur'
        RETURN    gaussiansmooth
    ELSE IF    '${filter_key}'=='clahe' or '${filter_key}'=='foxbleach'
        RETURN    clahe
    END

    Fail    Unsupported image filter '${filterName}'. Supported filters: No Filter, Edge Detection, Gradient Magnitude, Morphological Contour, Edge Gradient, High-Pass Sharpen, Low-Pass Smooth, Normalize, Sharpness Boost, Auto Equalise, Gaussian Blur, Fox Bleach.

Resolve Image Filter Display Name
    [Arguments]    ${filterName}

    ${filter_key}=    Normalize Image Filter Name    ${filterName}
    IF    '${filter_key}'=='nofilter'
        RETURN    No Filter
    ELSE IF    '${filter_key}'=='cannyedge'
        RETURN    Edge Detection
    ELSE IF    '${filter_key}'=='vectorgradientmagnitude'
        RETURN    Gradient Magnitude
    ELSE IF    '${filter_key}'=='morphologicalgradient'
        RETURN    Morphological Contour
    ELSE IF    '${filter_key}'=='sobeledge'
        RETURN    Edge Gradient
    ELSE IF    '${filter_key}'=='butterworthhighpass'
        RETURN    High-Pass Sharpen
    ELSE IF    '${filter_key}'=='butterworthlowpass'
        RETURN    Low-Pass Smooth
    ELSE IF    '${filter_key}'=='normalization'
        RETURN    Normalize
    ELSE IF    '${filter_key}'=='unsharpmask'
        RETURN    Sharpness Boost
    ELSE IF    '${filter_key}'=='histogramequalization'
        RETURN    Auto Equalise
    ELSE IF    '${filter_key}'=='gaussiansmooth'
        RETURN    Gaussian Blur
    END
    RETURN    Fox Bleach

Normalize Image Filter Parameter Name
    [Arguments]    ${parameterName}

    Should Not Be Empty    ${parameterName}    Image filter parameter name cannot be empty.
    ${parameter_key}=    Evaluate    ''.join(ch.lower() for ch in str($parameterName).strip() if ch.isalnum())
    Should Not Be Empty    ${parameter_key}    Image filter parameter name cannot be blank.
    IF    '${parameter_key}'=='autocalculatebestbnc' or '${parameter_key}'=='autobnc' or '${parameter_key}'=='bestbnc'
        RETURN    autobestcontrast
    ELSE IF    '${parameter_key}'=='kernalradius'
        RETURN    kernelradius
    END
    RETURN    ${parameter_key}

Convert Image Filter Parameter To Boolean
    [Arguments]    ${value}    ${field_name}=value

    ${normalized}=    Evaluate    str($value).strip().lower()
    ${is_true}=    Evaluate    $normalized in ('true','1','yes','y','on')
    ${is_false}=    Evaluate    $normalized in ('false','0','no','n','off')
    IF    ${is_true}
        RETURN    ${True}
    END
    IF    ${is_false}
        RETURN    ${False}
    END
    Fail    Invalid input for ${field_name}: ${value}. Use yes/no, true/false, or 1/0.

Set Image Filter Parameter
    [Arguments]    ${filterName}    ${parameterName}    ${parameterValue}

    ${parameter_key}=    Normalize Image Filter Parameter Name    ${parameterName}
    Set Image Filter Parameter By AutomationId    ${parameter_key}    ${parameterValue}
    Log    Set filter '${filterName}' parameter '${parameterName}' to ${parameterValue}.
    RETURN    ${TRUE}

Set Image Filter Parameter By AutomationId
    [Arguments]    ${parameter_key}    ${parameter_value}
    [Documentation]    Set filter parameter by searching for control by AutomationId using flexible XPath.
    
    Focus    ${window_XPATH}
    Sleep    0.1s
    
    # Map parameter keys to their AutomationId patterns
    IF    '${parameter_key}'=='autobestcontrast'
        ${xpath}=    Set Variable    //*[@AutomationId="ImgFilters_Chk_AutoBestContrast"]
        Wait Until Element Exist    ${xpath}    2
        ${bool_value}=    Convert Image Filter Parameter To Boolean    ${parameter_value}    ${parameter_key}
        Set Checkbox State    ${xpath}    ${bool_value}
    ELSE IF    '${parameter_key}'=='sigma'
        Set Image Filter Numeric Parameter By Flexible XPath    Sigma    ${parameter_value}
    ELSE IF    '${parameter_key}'=='kernelradius'
        Set Image Filter Numeric Parameter By Flexible XPath    KernelRadius    ${parameter_value}
    ELSE IF    '${parameter_key}'=='cannylowratio'
        Set Image Filter Numeric Parameter By Flexible XPath    CannyLow    ${parameter_value}
    ELSE IF    '${parameter_key}'=='cannyhighratio'
        Set Image Filter Numeric Parameter By Flexible XPath    CannyHigh    ${parameter_value}
    ELSE IF    '${parameter_key}'=='morphradius'
        Set Image Filter Numeric Parameter By Flexible XPath    MorphRadius    ${parameter_value}
    ELSE IF    '${parameter_key}'=='butterworthcutoff'
        Set Image Filter Numeric Parameter By Flexible XPath    ButterworthCutoff    ${parameter_value}
    ELSE IF    '${parameter_key}'=='butterworthorder'
        Set Image Filter Numeric Parameter By Flexible XPath    ButterworthOrder    ${parameter_value}
    ELSE IF    '${parameter_key}'=='unsharpamount'
        Set Image Filter Numeric Parameter By Flexible XPath    UnsharpAmount    ${parameter_value}
    ELSE IF    '${parameter_key}'=='unsharpsigma'
        Set Image Filter Numeric Parameter By Flexible XPath    UnsharpSigma    ${parameter_value}
    ELSE IF    '${parameter_key}'=='foxbleachtilesize' or '${parameter_key}'=='clahetilesize' or '${parameter_key}'=='tilesize'
        Set Image Filter Numeric Parameter By Flexible XPath    ClaheTileSize    ${parameter_value}
    ELSE IF    '${parameter_key}'=='foxbleachcliplimit' or '${parameter_key}'=='clahecliplimit' or '${parameter_key}'=='cliplimit'
        Set Image Filter Numeric Parameter By Flexible XPath    ClaheClipLimit    ${parameter_value}
    ELSE
        Fail    Unknown parameter: ${parameter_key}
    END

Set Image Filter Numeric Parameter By Flexible XPath
    [Arguments]    ${param_name}    ${param_value}
    [Documentation]    Set a numeric image-filter parameter (NUD) by its AutomationId.

    ${param_value}=    Evaluate    float($param_value)
    ${nud_xpath}=    Set Variable    //Edit[@AutomationId="ImgFilters_${param_name}_Num"]
    Wait Until Element Exist    ${nud_xpath}    2

    @{tab_keys}=    Create List    s'TAB'
    Click    ${nud_xpath}
    Sleep    0.1s
    Set Text To Textbox    ${nud_xpath}    ${param_value}
    Sleep    0.1s
    Press Keys    ${tab_keys}    ${nud_xpath}

Resolve Tool XPath
    [Arguments]    ${tool_name}
    [Documentation]    Translate a friendly tool name to its toggle button XPath.
    ...    Supported names (case-insensitive, ignoring spaces/punctuation):
    ...    Line Profiler, ROI Statistics, Window Level, Pixel Intensity Histogram,
    ...    Calibration, SNR, Surface Plot, Wall Thickness, CNR, MTF,
    ...    IQI Wire Phantom, Defect Marking, Image Filter,
    ...    Percentile Brightness Contrast, Fox Bleach. A raw XPath is returned unchanged.
    ${value}=    Evaluate    str($tool_name).strip()
    Should Not Be Empty    ${value}    Tool name cannot be empty.
    ${is_xpath}=    Evaluate    $value.startswith(('/', '('))
    IF    ${is_xpath}
        RETURN    ${value}
    END
    ${key}=    Evaluate    ''.join(ch.lower() for ch in $value if ch.isalnum())
    ${mapping}=    Create Dictionary
    ...    lineprofiler=${line_profiler_tool_button_xpath}
    ...    roistatistics=${roi_statistics_tool_button_xpath}
    ...    roistats=${roi_statistics_tool_button_xpath}
    ...    windowlevel=${window_level_tool_button_xpath}
    ...    areaadjust=${window_level_tool_button_xpath}
    ...    pixelintensityhistogram=${pixel_intensity_histogram_button_xpath}
    ...    histogram=${pixel_intensity_histogram_button_xpath}
    ...    calibration=${calibration_tool_button_xpath}
    ...    snr=${snr_measurement_tool_button_xpath}
    ...    snrmeasurement=${snr_measurement_tool_button_xpath}
    ...    surfaceplot=${surface_plot_tool_button_xpath}
    ...    wallthickness=${wall_thickness_measurement_tool_button_xpath}
    ...    wallthicknessmeasurement=${wall_thickness_measurement_tool_button_xpath}
    ...    cnr=${cnr_measurement_tool_button_xpath}
    ...    cnrmeasurement=${cnr_measurement_tool_button_xpath}
    ...    mtf=${mtf_measurement_tool_button_xpath}
    ...    mtfmeasurement=${mtf_measurement_tool_button_xpath}
    ...    iqiwirephantom=${IQI_wire_phantom_tool_button_xpath}
    ...    iqiwire=${IQI_wire_phantom_tool_button_xpath}
    ...    iqi=${IQI_wire_phantom_tool_button_xpath}
    ...    iqidetect=${IQI_wire_phantom_tool_button_xpath}
    ...    defectmarking=${defect_marking_tool_button_xpath}
    ...    defect=${defect_marking_tool_button_xpath}
    ...    imagefilter=${Image_Filter_Tool_Button_XPATH}
    ...    imagefilters=${Image_Filter_Tool_Button_XPATH}
    ...    percentilebrightnesscontrast=${percentile_brightness_contrast_filter_button_xpath}
    ...    percentilebnc=${percentile_brightness_contrast_filter_button_xpath}
    ...    foxbleach=${fox_bleach_filter_button_xpath}
    ${has_key}=    Run Keyword And Return Status    Dictionary Should Contain Key    ${mapping}    ${key}
    IF    not ${has_key}
        Fail    Unsupported tool '${tool_name}'. Supported: Line Profiler, ROI Statistics, Window Level, Pixel Intensity Histogram, Calibration, SNR, Surface Plot, Wall Thickness, CNR, MTF, IQI Wire Phantom, Defect Marking, Image Filter, Percentile Brightness Contrast, Fox Bleach.
    END
    ${xpath}=    Get From Dictionary    ${mapping}    ${key}
    RETURN    ${xpath}

Verify Tool Selected
    [Arguments]    ${tool_name}    ${expected_state}=${EMPTY}
    [Documentation]    Read whether a tool toggle button is selected.
    ...
    ...    Returns ``Selected`` or ``Not Selected``. If ``expected_state`` is supplied
    ...    (``Selected`` or ``Not Selected``, case-insensitive), the actual state is
    ...    asserted against it.
    ...
    ...    Examples:
    ...    | ${state}=    Verify Tool Selected    Line Profiler
    ...    | Verify Tool Selected    Calibration    Selected
    ...    | Verify Tool Selected    SNR            Not Selected
    ${xpath}=    Resolve Tool XPath    ${tool_name}
    ${toggle_state}=    Get Toggle State    ${xpath}
    ${actual_state}=    Set Variable If    '${toggle_state}' == 'ON'    Selected    Not Selected
    Log    Tool '${tool_name}' is currently ${actual_state}.
    IF    '${expected_state}' != '${EMPTY}'
        ${expected_key}=    Evaluate    ''.join(ch.lower() for ch in str($expected_state) if ch.isalnum())
        IF    '${expected_key}' == 'selected'
            ${expected_label}=    Set Variable    Selected
        ELSE IF    '${expected_key}' == 'notselected'
            ${expected_label}=    Set Variable    Not Selected
        ELSE
            Fail    Unsupported expected state '${expected_state}'. Use 'Selected' or 'Not Selected'.
        END
        Should Be Equal As Strings    ${actual_state}    ${expected_label}
        ...    Tool '${tool_name}' should be ${expected_label}, but it is ${actual_state}.
    END
    RETURN    ${actual_state}

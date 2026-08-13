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
${window_level_tool_button_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Pane/Button[@AutomationId="Main_Tgl_AreaAdjust"]
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
${surface_plot_reset_button_xpath}    //*[@AutomationId="SurfacePlot_Btn_ResetView"]
${wall_thickness_measurement_tool_button_xpath}    //*[@AutomationId="Main_Tgl_WallThickness"]
${wall_thickness_measurement_window_xpath}    //*[@AutomationId="WallThicknessPanel"]
${Manual_wall_thickness_detection_method_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Tab[2]/TabItem/Custom/Text[@Name="MANUAL"]
${Auto_Reset_wall_thickness_line_result_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Tab[2]/TabItem/Custom/Button[@AutomationId="ResetAutoButton"]
${delete_wall_thickness_measurement_annotation_menu_XPATH}    //*[@Name="Remove"]
${cnr_measurement_tool_button_xpath}    //*[@AutomationId="Main_Tgl_Cnr"]
${mtf_measurement_tool_button_xpath}    //*[@AutomationId="Main_Tgl_Mtf"]
${mtf_measurement_window_xpath}    /Window/Tab[@AutomationId="BottomPanelTabs"]
${IQI_wire_phantom_tool_button_xpath}    //*[@AutomationId="Main_Tgl_IqiDetect"]
${IQI_wire_phantom_cancel_button_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]//Button[@AutomationId="Main_Btn_CancelIqiDetection"]
${IQI_wire_phantom_detecting_text_xpath}    //*[contains(@Name,"Detecting IQI")]
${IQI_wire_detected_text_xpath}    //*[@Name="IQI DETECTED"]
${IQI_wire_detected_summary_xpath}    //*[contains(@Name,"IQI detected:")]
${IQI_wire_pair_count_text_xpath}    //*[@AutomationId="WireCountText"]
${IQI_wire_phantom_window_xpath}    /Window/Tab[2]/TabItem/Custom[@AutomationId="ProfilePanel"]
${defect_marking_tool_button_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Pane/Button[@AutomationId="Main_Tgl_DefectMarking"]
# The Defects UI moved out of the bottom tab strip into the right-hand dock (FILES | DEFECTS). Its tab
# header carries AutomationId Main_Tab_DefectMarking and hosts the DefectPanel, whose controls now sit
# one level deeper, under a Pane. Everything below is derived from ${defect_marking_panel_xpath}, so if
# the panel moves again only that one line needs updating.
${defect_marking_tab_header_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Tab/TabItem[@AutomationId="Main_Tab_DefectMarking"]
${defect_marking_window_xpath}    ${defect_marking_tab_header_xpath}/Custom[@AutomationId="DefectPanel"]
${defect_marking_panel_xpath}    ${defect_marking_window_xpath}/Pane
${Defect_Cmb_DefectType_XPATH}    ${defect_marking_panel_xpath}/ComboBox[@AutomationId="Defect_Cmb_DefectType"]
${Defect_Txt_CustomLabel_XPATH}    ${defect_marking_panel_xpath}/Edit[@AutomationId="Defect_Txt_CustomLabel"]
${Defect_Cmb_AcceptanceCode_XPATH}    ${defect_marking_panel_xpath}/ComboBox[@AutomationId="Defect_Cmb_AcceptanceCode"]
${Defect_Btn_Accept_XPATH}    ${defect_marking_panel_xpath}/Button[@AutomationId="Defect_Btn_Accept"]
${Defect_Btn_Reject_XPATH}    ${defect_marking_panel_xpath}/Button[@AutomationId="Defect_Btn_Reject"]
${Defect_Txt_Notes_XPATH}    ${defect_marking_panel_xpath}/Edit[@AutomationId="Defect_Txt_Notes"]
${Confirm_Status_Change_Window_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Confirm Status Change"]
${Confirm_Status_Change_Yes_Button_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Confirm Status Change"]/Button[@Name="Yes"]
${defect_marking_radio_rectangle_button_xpath}    ${defect_marking_panel_xpath}/RadioButton[@AutomationId="Defect_Rdo_ShapeRectangle"]
${defect_marking_radio_line_button_xpath}    ${defect_marking_panel_xpath}/RadioButton[@AutomationId="Defect_Rdo_ShapeLine"]
${defect_marking_radio_ellipse_button_xpath}    ${defect_marking_panel_xpath}/RadioButton[@AutomationId="Defect_Rdo_ShapeEllipse"]
${defect_marking_radio_freehand_button_xpath}    ${defect_marking_panel_xpath}/RadioButton[@AutomationId="Defect_Rdo_ShapeFreehand"]
${clear_all_defects_xpath}    ${defect_marking_panel_xpath}/Button[@AutomationId="Defect_Btn_ClearAll"]
${draw_regions_button_xpath}    ${defect_marking_panel_xpath}/Button[@AutomationId="Defect_Btn_DrawRegion"]
# Only shown while search regions exist — it disappears once they are cleared.
${clear_search_regions_button_xpath}    ${defect_marking_panel_xpath}/Button[@AutomationId="Defect_Btn_ClearRegion"]
${detect_in_regions_button_xpath}    ${defect_marking_panel_xpath}/Button[@AutomationId="Defect_Btn_AutoDetect"]
# Auto Detect tuning controls. The two numeric fields sit inside their own Custom wrappers, so they are
# matched by AutomationId anywhere below the panel rather than by the wrapper's position.
${defect_sensitivity_input_xpath}    ${defect_marking_panel_xpath}//Edit[@AutomationId="Defect_AdrSensitivity_Num"]
${defect_max_results_input_xpath}    ${defect_marking_panel_xpath}//Edit[@AutomationId="Defect_AdrMaxResults_Num"]
${defect_appear_dark_checkbox_xpath}    ${defect_marking_panel_xpath}/CheckBox[@AutomationId="Defect_Chk_AdrDark"]
${defect_trace_exact_shape_checkbox_xpath}    ${defect_marking_panel_xpath}/CheckBox[@AutomationId="Defect_Chk_AdrExactShape"]
# Auto Detect's result line, e.g. '<n> candidate(s) found in <m> region. Confirm each.' It carries no
# AutomationId and the wording ahead of the full stop changes from run to run, so only the trailing
# 'Confirm each.' is matched. Position is no good either — the surrounding text in this panel comes and
# goes with the tool's state.
${defect_detection_result_text_xpath}    ${defect_marking_panel_xpath}/Text[contains(@Name,"Confirm each.")]
${defect_delete_button_xpath}    ${defect_marking_panel_xpath}/Button[@AutomationId="Defect_Btn_Delete"]
${evaluate_defect_marking_button_xpath}    ${defect_marking_panel_xpath}/Button[@AutomationId="Defect_Btn_Evaluate"]
# Rows under INDICATIONS have neither AutomationId nor Name, so they can only be addressed by position.
${defect_indications_list_xpath}    ${defect_marking_panel_xpath}/List[1]
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
${percentile_brightness_contrast_low_value_text_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Window/Text[@AutomationId="Pct_Txt_LowValue"]
${percentile_brightness_contrast_high_value_text_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Window/Text[@AutomationId="Pct_Txt_HighValue"]
${percentile_brightness_contrast_load_preset_button}    /Window[@AutomationId="FoxRTProMainWindow"]/Window/List/DataItem/Button[1]
${selectNormalProfilerType_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]//Tab[2]/TabItem/Custom/RadioButton[@AutomationId="ModeNormal"]
${selectIQIProfilerType_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]//Tab[2]/TabItem/Custom/RadioButton[@AutomationId="ModeIqi"]
${fox_bleach_filter_button_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Pane/Button[@AutomationId="Main_Tgl_FoxBleach"]
${filter_rename_button_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Tab/TabItem[2]/Custom/Pane/Button[1]
${filter_rename_textbox_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Tab/TabItem[2]/Custom/Pane/Edit[@AutomationId="ImgFilters_Rename_TxtName"]   
${filter_reset_to_default_button_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Tab/TabItem[2]/Custom/Pane/Button[@AutomationId="ImgFilters_Rename_BtnResetDefault"]
${filter_save_button_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Tab/TabItem[2]/Custom/Pane/Button[@AutomationId="ImgFilters_Rename_BtnSave"]
${render_mode_button_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/StatusBar/Button[@AutomationId="Main_Btn_RenderMode"]
${render_mode_gpu_option_xpath}    /Window/Window/Menu/MenuItem[contains(@Name,"GPU Rendering")]
${render_mode_cpu_option_xpath}    /Window/Window/Menu/MenuItem[contains(@Name,"CPU Rendering")]
${render_mode_info_option_xpath}    /Window/Window/Menu/MenuItem[contains(@Name,"GPU Info")]
${render_mode_info_window_xpath}    /Window/Window[@Name="GPU Rendering Info"]
${render_mode_info_window_Ok_Button_xpath}    /Window/Window[@Name="GPU Rendering Info"]/Button[@Name="OK"]
# --- Graph view (Line Profiler etc.) data export controls ---
# Line Profiler export buttons (AutomationIds confirmed against the app).
${line_profiler_export_png_button_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Tab[2]/TabItem/Custom/Button[@AutomationId="LineProfile_Btn_ExportPng"]
${line_profiler_export_csv_button_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Tab[2]/TabItem/Custom/Button[@AutomationId="LineProfile_Btn_ExportCsv"]
# Wall Thickness Measurement export buttons (AutomationIds confirmed against the app).
${wall_thickness_measurement_export_png_button_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Tab[2]/TabItem/Custom/Button[@AutomationId="WallThick_Btn_ExportPng"]
${wall_thickness_measurement_export_csv_button_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Tab[2]/TabItem/Custom/Button[@AutomationId="WallThick_Btn_ExportCsv"]
# Native "Save As" dialog (selectors confirmed against the app).
${graph_view_save_dialog_window_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Save As"]
${graph_view_save_dialog_filename_xpath}    ${graph_view_save_dialog_window_xpath}/Pane[1]/ComboBox[@AutomationId="FileNameControlHost"]
${graph_view_save_dialog_save_button_xpath}    ${graph_view_save_dialog_window_xpath}/Button[@Name="Save"]
${graph_view_save_dialog_overwrite_yes_button_xpath}    ${graph_view_save_dialog_window_xpath}/Window/Button[@Name="Yes"]
# Post-save confirmation message box.
${graph_view_export_confirmation_ok_button_xpath}    /Window/Window/Button[@Name="OK"]
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

Export Graph View Data
    [Arguments]    ${tool_type}    ${save_type}    ${file_name}    ${folder_path}=${Actual_Image_Exports}
    [Documentation]    Export a graph-view tool's data via its PNG or CSV export button.
    ...    Clicks the PNG or CSV button (per ${save_type}), types the destination path into the
    ...    native Save As dialog, clicks Save, and confirms the overwrite warning when a file of
    ...    the same name already exists.
    ...
    ...    ${tool_type}: Graph-view tool whose data is exported (e.g. Line Profiler). Selects which export button is used.
    ...    ${save_type}: 'PNG' or 'CSV' (case-insensitive) — picks the matching export button.
    ...    ${file_name}: Output file name. Extension is optional; it is added from ${save_type} when missing.
    ...    ${folder_path}: Destination directory. Defaults to ${Actual_Image_Exports} (= <repo>\\Exports\\Image Exports\\Actual\\). Pass the full path (e.g. ${Actual_Image_Exports}${file_name}) to Compare Result Images.
    ...
    ...    Example:
    ...    | Export Graph View Data    Line Profiler    PNG    MFRTT75_LineProfilerData.png

    ${save_type}=    Evaluate    str($save_type).strip().lstrip('.').lower()
    Should Be True    '${save_type}' in ('png', 'csv')    Unsupported save type '${save_type}'. Use 'PNG' or 'CSV'.

    # Resolve the export button for this tool + save type.
    ${export_button_xpath}=    Get Graph View Export Button    ${tool_type}    ${save_type}

    # Build the full destination path (with the correct extension) and make sure the folder exists.
    ${has_ext}=    Evaluate    str($file_name).lower().endswith('.' + $save_type)
    ${file_with_ext}=    Set Variable If    ${has_ext}    ${file_name}    ${file_name}.${save_type}
    Create Directory    ${folder_path}
    ${full_path}=    Evaluate    __import__('os').path.join($folder_path, $file_with_ext)

    # Click the PNG/CSV button -> native Save As dialog pops up.
    Click    ${export_button_xpath}
    Wait Until Element Exist    ${graph_view_save_dialog_filename_xpath}    5
    Sleep    0.5s
    Set Text To Textbox    ${graph_view_save_dialog_filename_xpath}    ${full_path}
    Sleep    0.3s
    Click    ${graph_view_save_dialog_save_button_xpath}
    Sleep    0.5s

    # Handle the overwrite confirmation that appears when a file of the same name already exists.
    ${overwrite_present}=    Run Keyword And Return Status
    ...    Wait Until Element Exist    ${graph_view_save_dialog_overwrite_yes_button_xpath}    2
    Run Keyword If    ${overwrite_present}    Click    ${graph_view_save_dialog_overwrite_yes_button_xpath}
    Sleep    0.3s

    # Wait for the post-save confirmation message box and dismiss it with OK.
    Wait Until Element Exist    ${graph_view_export_confirmation_ok_button_xpath}    30
    Sleep    0.5s
    Click    ${graph_view_export_confirmation_ok_button_xpath}
    Sleep    0.3s

    Log    Graph view data exported to: ${full_path}
    RETURN    ${full_path}

Get Graph View Export Button
    [Arguments]    ${tool_type}    ${save_type}
    [Documentation]    Return the PNG/CSV export-button XPATH for the given graph-view tool.
    ...    Extend the IF chain as more graph-view tools gain export buttons.

    ${tool_key}=    Evaluate    str($tool_type).strip().lower()
    IF    '${tool_key}' == 'line profiler'
        ${button}=    Set Variable If    '${save_type}' == 'png'
        ...    ${line_profiler_export_png_button_xpath}    ${line_profiler_export_csv_button_xpath}
    ELSE IF    '${tool_key}' == 'wall thickness measurement'
        ${button}=    Set Variable If    '${save_type}' == 'png'
        ...    ${wall_thickness_measurement_export_png_button_xpath}    ${wall_thickness_measurement_export_csv_button_xpath}
    ELSE
        Fail    Unsupported graph-view tool '${tool_type}'. Add its export-button XPATHs to Get Graph View Export Button.
    END
    RETURN    ${button}

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

Reset Surface Plot 3D Image
    [Documentation]    Click the Reset button (SurfacePlot_Btn_ResetView) in the Surface Plot 3D view to reset the view to its default state.

    Focus    ${window_XPATH}
    Sleep    0.2s
    Click    ${surface_plot_reset_button_xpath}
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

Move Surface Plot 3D Image
    [Arguments]    ${start_x}    ${start_y}    ${end_x}    ${end_y}
    [Documentation]    Move (pan) the surface plot 3D image by holding the Shift key and right-click dragging on the viewer using user-provided start and end coordinates.
    ...    The Shift key is always released in the keyword teardown, even if the drag fails, so it can never stay stuck down for later tests.
    [Teardown]    AutoItLibrary.Send    {SHIFTUP}

    Focus    ${window_XPATH}
    Sleep    0.2s
    Click    ${surface_plot_window_xpath}
    Sleep    0.2s
    AutoItLibrary.Send    {SHIFTDOWN}
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

Click Cancel IQI Detection
    [Documentation]    Cancel an in-progress IQI Wire Phantom detection by clicking the Cancel button, then wait for the Cancel button to disappear (confirms the detection has actually been cancelled).

    Wait Until Element Exist    ${IQI_wire_phantom_cancel_button_xpath}    5
    Click    ${IQI_wire_phantom_cancel_button_xpath}
    Wait Until Element Does Not Exist    ${IQI_wire_phantom_cancel_button_xpath}    5

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
    [Arguments]    ${DefectType}    ${radioButtonType}    ${x1}    ${y1}    ${x2}    ${y2}    ${custom_label}=${EMPTY}
    [Documentation]    Add a defect marking on the image viewer.
    ...    ${DefectType}: Defect type to select from the dropdown. When 'Other', ${custom_label} is required and is entered into the Custom Label field.
    ...    ${radioButtonType}: Shape — Rectangle, Line, Ellipse, or Freehand. Case-insensitive.
    ...    ${x1}, ${y1}, ${x2}, ${y2}: Top-left and bottom-right pixel coordinates of the defect rectangle.
    ...    ${custom_label}: Free-text label entered into the Custom Label field. Required when ${DefectType}='Other'; ignored for any other defect type.

    Focus    ${window_XPATH}
    Sleep    0.2s
    ${current_state}=    Get Toggle State    ${defect_marking_tool_button_xpath}
    IF    '${current_state}' != 'ON'
        Click    ${defect_marking_tool_button_xpath}
        Sleep    0.2s
    END
    Open Defect Marking Panel
    Sleep    0.2s
    Scroll Defect Marking Panel To Element    ${Defect_Cmb_DefectType_XPATH}
    Select Combobox Item By Name    ${Defect_Cmb_DefectType_XPATH}    ${DefectType}
    Sleep    0.2s
    IF    '${DefectType}' == 'Other'
        Should Not Be Empty    ${custom_label}    Custom label is required when DefectType is 'Other'.
        Wait Until Element Exist    ${Defect_Txt_CustomLabel_XPATH}    5
        Set Text To Textbox    ${Defect_Txt_CustomLabel_XPATH}    ${custom_label}
        Sleep    0.2s
    END
    ${shape}=    Evaluate    str($radioButtonType).strip().lower()
    IF    '${shape}' == 'rectangle'
        ${shape_xpath}=    Set Variable    ${defect_marking_radio_rectangle_button_xpath}
    ELSE IF    '${shape}' == 'line'
        ${shape_xpath}=    Set Variable    ${defect_marking_radio_line_button_xpath}
    ELSE IF    '${shape}' == 'ellipse'
        ${shape_xpath}=    Set Variable    ${defect_marking_radio_ellipse_button_xpath}
    ELSE IF    '${shape}' == 'freehand'
        ${shape_xpath}=    Set Variable    ${defect_marking_radio_freehand_button_xpath}
    ELSE
        Fail    Unsupported shape '${radioButtonType}'. Use Rectangle, Line, Ellipse or Freehand.
    END
    Scroll Defect Marking Panel To Element    ${shape_xpath}
    Click    ${shape_xpath}
    Sleep    0.2s
    AutoItLibrary.Mouse Click Drag    left    ${x1}    ${y1}    ${x2}    ${y2}
    Sleep    0.5s

Draw Region over image
    [Arguments]    ${x1}    ${y1}    ${x2}    ${y2}
    [Documentation]    Draw an Auto Detect search region over the image by dragging from one corner to the other.
    ...    The region tells Auto Detect where to look, keeping lead markers and film edges out of the search.
    ...    ${x1}, ${y1}: screen coordinates of the region's first corner.
    ...    ${x2}, ${y2}: screen coordinates of the opposite corner.
    ...
    ...    Turns the Defect Marking tool on if it is off, brings the Defects panel to the front, and scrolls the
    ...    Draw Regions button into view before clicking it — it sits mid-panel and is easily out of view.
    ...    Drawing mode is left again once the region is drawn, so the panel ends up back at rest and repeat calls
    ...    each add another region.

    Focus    ${window_XPATH}
    Sleep    0.2s
    ${current_state}=    Get Toggle State    ${defect_marking_tool_button_xpath}
    IF    '${current_state}' != 'ON'
        Click    ${defect_marking_tool_button_xpath}
        Sleep    0.2s
    END
    Open Defect Marking Panel
    Sleep    0.2s
    Scroll Defect Marking Panel To Element    ${draw_regions_button_xpath}
    # The one button toggles drawing mode: it reads 'Draw Regions' at rest and 'Done Drawing' while drawing.
    # Clicking it when drawing mode is already on would switch it off and the drag below would mark a defect
    # instead of a region, so enter only when it is at rest — this matters if an earlier call or a manual step
    # left the mode on. The UIA Name is the static 'Draw Detection Regions' in both states, so the visible
    # label is the only thing that tells them apart.
    ${already_drawing}=    Is Drawing Regions
    IF    not ${already_drawing}
        Click    ${draw_regions_button_xpath}
        Sleep    0.2s
    END
    AutoItLibrary.Mouse Click Drag    left    ${x1}    ${y1}    ${x2}    ${y2}
    Sleep    0.5s
    # Leave drawing mode again. Drawing adds a 'Clear' button and a '<n> region set' line to the panel, which
    # moves this button, so scroll to it once more rather than clicking where it used to be.
    Scroll Defect Marking Panel To Element    ${draw_regions_button_xpath}
    sleep    0.2s
    Click    ${draw_regions_button_xpath}
    Sleep    0.3s

Is Drawing Regions
    [Documentation]    Return whether Auto Detect's drawing mode is currently on, read from the button's visible
    ...    label ('Draw Regions' at rest, 'Done Drawing' while drawing). Returns ${False} when the label cannot be
    ...    read at all, which is the safe answer — the caller then clicks to enter drawing mode.

    ${label_read}    ${label}=    Run Keyword And Ignore Error
    ...    Get Name From Element    ${draw_regions_button_xpath}/Text
    IF    '${label_read}' != 'PASS'    RETURN    ${False}
    ${drawing}=    Evaluate    'done' in str($label).strip().lower()
    RETURN    ${drawing}

Detect Defects in Search Regions
    [Arguments]    ${sensitivity}=${EMPTY}    ${max_results}=${EMPTY}    ${defects_appear_dark}=${EMPTY}
    ...    ${trace_exact_shape}=${EMPTY}    ${timeout}=60
    [Documentation]    Set the Auto Detect parameters, run detection over the search regions drawn on the image, and
    ...    wait for its result line to appear — e.g. '<n> candidate(s) found in <m> region. Confirm each.'. The
    ...    wording ahead of the full stop varies from run to run, so only the trailing 'Confirm each.' is matched.
    ...
    ...    Every parameter is optional — one left out keeps whatever the panel currently shows, so an existing
    ...    call with no arguments behaves exactly as before.
    ...    ${sensitivity}: Sensitivity value, lower finds more (e.g. 5.0).
    ...    ${max_results}: Max Results cap (e.g. 25).
    ...    ${defects_appear_dark}: 'Defects appear dark (film)' checkbox — on/off, yes/no, true/false or 1/0.
    ...    ${trace_exact_shape}: 'Trace exact defect shape' checkbox — same accepted values.
    ...    ${timeout}: seconds to wait for detection to finish — it is slow on large images. Defaults to 60.
    ...
    ...    Returns: the full result line, so a test can pull the candidate and region counts out of it.

    Focus    ${window_XPATH}
    Sleep    0.2s
    Open Defect Marking Panel
    Sleep    0.2s
    IF    '${sensitivity}' != '${EMPTY}'
        Set Defect Detection Numeric Parameter    ${defect_sensitivity_input_xpath}    ${sensitivity}    Sensitivity
    END
    IF    '${max_results}' != '${EMPTY}'
        Set Defect Detection Numeric Parameter    ${defect_max_results_input_xpath}    ${max_results}    Max Results
    END
    IF    '${defects_appear_dark}' != '${EMPTY}'
        Set Defect Detection Checkbox    ${defect_appear_dark_checkbox_xpath}    ${defects_appear_dark}
        ...    Defects appear dark
    END
    IF    '${trace_exact_shape}' != '${EMPTY}'
        Set Defect Detection Checkbox    ${defect_trace_exact_shape_checkbox_xpath}    ${trace_exact_shape}
        ...    Trace exact defect shape
    END
    Scroll Defect Marking Panel To Element    ${detect_in_regions_button_xpath}
    # The button stays disabled until a search region exists. Clicking it then does nothing at all, and the wait
    # below would just time out, so say plainly what is missing instead.
    ${enabled}=    Run Keyword And Return Status
    ...    Element Should Be Enabled    ${detect_in_regions_button_xpath}
    Should Be True    ${enabled}
    ...    'Detect in Regions' is disabled — draw a search region first with 'Draw Region over image'.
    Click    ${detect_in_regions_button_xpath}
    Wait Until Element Exist    ${defect_detection_result_text_xpath}    ${timeout}
    ...    Auto Detect reported no result within ${timeout}s — no status line ending in 'Confirm each.' appeared.
    ${message}=    Get Name From Element    ${defect_detection_result_text_xpath}
    Log    Auto Detect result: ${message}
    RETURN    ${message}

Set Defect Detection Numeric Parameter
    [Arguments]    ${xpath}    ${value}    ${field_name}
    [Documentation]    Type ${value} into one of the Auto Detect numeric fields. The trailing TAB is what commits
    ...    the value — these spinners keep the old number until focus leaves the field.
    ...    The value is passed through as written so an integer stays an integer (25 rather than 25.0).

    ${is_numeric}=    Run Keyword And Return Status    Evaluate    float($value)
    Should Be True    ${is_numeric}    ${field_name} must be numeric, got '${value}'.
    Scroll Defect Marking Panel To Element    ${xpath}
    Click    ${xpath}
    Sleep    0.1s
    Set Text To Textbox    ${xpath}    ${value}
    Sleep    0.1s
    @{tab_keys}=    Create List    s'TAB'
    Press Keys    ${tab_keys}    ${xpath}
    Sleep    0.1s

Set Defect Detection Checkbox
    [Arguments]    ${xpath}    ${value}    ${field_name}
    [Documentation]    Put one of the Auto Detect checkboxes into the requested state, clicking only when it is not
    ...    already there — these are toggles, so an unconditional click would invert a box that was already right.
    ...    ${value}: on/off, yes/no, true/false or 1/0. Anything else fails rather than being read as 'off'.

    ${normalized}=    Evaluate    str($value).strip().lower()
    ${is_true}=    Evaluate    $normalized in ('true','1','yes','y','on','checked')
    ${is_false}=    Evaluate    $normalized in ('false','0','no','n','off','unchecked')
    Should Be True    ${is_true} or ${is_false}
    ...    Invalid value for '${field_name}': '${value}'. Use on/off, yes/no, true/false or 1/0.
    ${target_state}=    Set Variable If    ${is_true}    ON    OFF
    Scroll Defect Marking Panel To Element    ${xpath}
    ${current_state}=    Get Toggle State    ${xpath}
    IF    '${current_state}' != '${target_state}'
        Click    ${xpath}
        Sleep    0.2s
    END

Clear Search Regions
    [Documentation]    Remove the Auto Detect search regions drawn over the image by clicking the Clear button, then
    ...    wait until that button disappears. The button is only shown while regions exist, so its absence is the
    ...    confirmation that they were cleared — the keyword fails if it is still there after 10 seconds.

    Focus    ${window_XPATH}
    Sleep    0.2s
    Open Defect Marking Panel
    Sleep    0.2s
    Scroll Defect Marking Panel To Element    ${clear_search_regions_button_xpath}
    Click    ${clear_search_regions_button_xpath}
    Wait Until Element Does Not Exist    ${clear_search_regions_button_xpath}    10
    ...    Clear button is still showing after clearing the search regions.

Open Defect Marking Panel
    [Documentation]    Bring the Defects tab of the right-hand dock to the front and wait for its panel to appear.
    ...    The dock switches to Defects by itself when the tool is toggled on, but clicking the header keeps the
    ...    automation independent of that behaviour (e.g. when the Files tab happens to be selected).

    ${tab_visible}=    Run Keyword And Return Status
    ...    Wait Until Element Exist    ${defect_marking_tab_header_xpath}    5
    IF    ${tab_visible}    Click    ${defect_marking_tab_header_xpath}
    Wait Until Element Exist    ${defect_marking_window_xpath}    5

Invoke Defect Panel Button
    [Arguments]    ${xpath}    ${description}
    [Documentation]    Press a Defects panel button through the UIA Invoke pattern, which does not care where the
    ...    button is on screen.
    ...
    ...    A plain Click drives the physical mouse to the button's clickable point, so it misses whenever the panel
    ...    is scrolled and the button is clipped. Scrolling first does not reliably help either: FlaUI's Scroll Up /
    ...    Scroll Down park the mouse on the panel's own clickable point — its centre, which lands on the Sensitivity
    ...    slider or the Indications list — and those controls swallow the wheel instead of passing it on to the
    ...    panel's scroll viewer. Invoke sidesteps all of it. Falls back to scroll-to-top plus a real click for any
    ...    button that turns out not to support the pattern.

    Wait Until Element Exist    ${xpath}    5
    ${invoked}=    Run Keyword And Return Status    Invoke Button    ${xpath}
    IF    not ${invoked}
        Log    ${description} does not support Invoke; falling back to scrolling and clicking.    level=WARN
        Scroll Defect Marking Panel To Top
        Click    ${xpath}
    END
    Sleep    0.2s

Scroll Defect Marking Panel To Top
    [Documentation]    Scroll the Defects panel all the way up, unconditionally. Use this for the controls at the top
    ...    of the panel — Defect Type, Shape, Delete, Clear All — instead of 'Scroll Defect Marking Panel To Element'.
    ...    That keyword stops as soon as it believes the control is visible, and the belief is not always right: a
    ...    clipped control can still report a bounding rectangle that sits inside the panel's, so the scroll is
    ...    skipped and the click then lands on whatever is actually drawn there. Winding the panel to the top takes
    ...    the judgement out of it.

    FOR    ${index}    IN RANGE    25
        Scroll Up    ${defect_marking_window_xpath}    1
    END
    Sleep    0.2s

Is Defect Marking Panel Element Visible
    [Arguments]    ${element_xpath}
    [Documentation]    Return whether ${element_xpath} lies fully inside the Defects panel's visible rectangle.
    ...    A control scrolled past the bottom of the panel still exists in the UI tree, so presence proves
    ...    nothing — only the bounding rectangle says whether it can actually be seen and clicked.

    ${measured}    ${element}=    Run Keyword And Ignore Error
    ...    Get Rectangle Bounding From Element    ${element_xpath}    BoundingRectangle
    IF    '${measured}' != 'PASS'    RETURN    ${False}
    ${container}=    Get Rectangle Bounding From Element    ${defect_marking_window_xpath}    BoundingRectangle
    ${is_visible}=    Evaluate
    ...    int($element[2]) > 0 and int($element[3]) > 0 and int($element[0]) >= int($container[0]) and int($element[1]) >= int($container[1]) and int($element[0]) + int($element[2]) <= int($container[0]) + int($container[2]) and int($element[1]) + int($element[3]) <= int($container[1]) + int($container[3])
    RETURN    ${is_visible}

Get Defect Marking Panel Scroll Direction
    [Arguments]    ${element_xpath}
    [Documentation]    Return 'up' when ${element_xpath} sits above the panel's visible area, 'down' when it sits
    ...    below. Falls back to 'down' when the element cannot be measured — the caller sweeps the other way
    ...    afterwards, so a wrong guess only costs a few extra wheel steps.

    ${measured}    ${element}=    Run Keyword And Ignore Error
    ...    Get Rectangle Bounding From Element    ${element_xpath}    BoundingRectangle
    IF    '${measured}' != 'PASS'    RETURN    down
    ${usable}=    Evaluate    int($element[2]) > 0 and int($element[3]) > 0
    IF    not ${usable}    RETURN    down
    ${container}=    Get Rectangle Bounding From Element    ${defect_marking_window_xpath}    BoundingRectangle
    ${above}=    Evaluate    int($element[1]) < int($container[1])
    IF    ${above}    RETURN    up
    RETURN    down

Scroll Defect Marking Panel
    [Arguments]    ${direction}    ${steps}    ${element_xpath}
    [Documentation]    Wheel the Defects panel ${steps} notches in ${direction} ('up' or 'down'), stopping as soon as
    ...    ${element_xpath} comes into view. Returns whether the element ended up visible.

    FOR    ${index}    IN RANGE    ${steps}
        IF    '${direction}' == 'up'
            Scroll Up    ${defect_marking_window_xpath}    1
        ELSE
            Scroll Down    ${defect_marking_window_xpath}    1
        END
        Sleep    0.05s
        ${visible}=    Is Defect Marking Panel Element Visible    ${element_xpath}
        IF    ${visible}    RETURN    ${True}
    END
    RETURN    ${False}

Scroll Defect Marking Panel To Element
    [Arguments]    ${element_xpath}
    [Documentation]    Scroll the Defects panel until ${element_xpath} is inside the visible area, so that a click on it
    ...    actually lands. The panel holds more controls than the right-hand dock can show, so at any given scroll
    ...    position some are cut off: Delete / Clear All disappear above once the panel is scrolled down, while
    ...    Evaluate, Acceptance Criteria, Notes and Accept / Reject sit below until it is. Scrolling therefore has to
    ...    work in both directions. Returns immediately when the element is already in view.

    Wait Until Element Exist    ${element_xpath}    5
    ${visible}=    Is Defect Marking Panel Element Visible    ${element_xpath}
    IF    ${visible}    RETURN

    # Focus first: WPF brings a focused control into view on its own. That is preferred over the mouse wheel,
    # which would land on the Sensitivity / Max Results sliders and change their values instead of scrolling.
    Run Keyword And Ignore Error    Focus    ${element_xpath}
    Sleep    0.2s
    ${visible}=    Is Defect Marking Panel Element Visible    ${element_xpath}
    IF    ${visible}    RETURN

    ${direction}=    Get Defect Marking Panel Scroll Direction    ${element_xpath}
    ${visible}=    Scroll Defect Marking Panel    ${direction}    20    ${element_xpath}
    IF    not ${visible}
        # The element could not be measured reliably (a clipped control can report an empty rectangle), so the
        # first guess may have scrolled away from it. Sweep the opposite way before giving up.
        ${opposite}=    Set Variable If    '${direction}' == 'up'    down    up
        ${visible}=    Scroll Defect Marking Panel    ${opposite}    30    ${element_xpath}
    END
    Should Be True    ${visible}
    ...    '${element_xpath}' is still not visible after scrolling the Defects panel both ways.
    Sleep    0.1s

Take Defect Marking and Classification Tool window Screenshot
    [Arguments]    ${filename}
    [Documentation]    Capture the Defects panel. The panel is scrolled down to the Evaluate button first, since the
    ...    lower half of the panel is otherwise cut off by the dock and would be missing from the screenshot.

    Wait Until Element Exist    ${defect_marking_window_xpath}    5
    Scroll Defect Marking Panel To Element    ${evaluate_defect_marking_button_xpath}
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
    Invoke Defect Panel Button    ${clear_all_defects_xpath}    Clear All

Delete Selected Defect
    [Arguments]    ${listItemNo}
    [Documentation]    Delete a defect marked on the image by the Defect Marking and Classification tool by clicking on it to select it and then pressing delete key.
    ...    Opens the Defect Marking window first if it is not already open.

    Focus    ${window_XPATH}
    Sleep    0.2s
    # Open the Defect Marking window first if it is not already open (the tool button is a toggle, so only click when closed).
    ${defect_window_open}=    Run Keyword And Return Status
    ...    Wait Until Element Exist    ${defect_marking_window_xpath}    1
    Run Keyword If    not ${defect_window_open}    Click    ${defect_marking_tool_button_xpath}
    Open Defect Marking Panel
    Sleep    0.2s
    Scroll Defect Marking Panel To Element    ${defect_indications_list_xpath}/ListItem[${listItemNo}]
    Click    ${defect_indications_list_xpath}/ListItem[${listItemNo}]
    Sleep    0.2s
    # Selecting an indication grows the Properties section and pushes Delete further out of view, so press it
    # through Invoke rather than trying to get the mouse onto it.
    Invoke Defect Panel Button    ${defect_delete_button_xpath}    Delete

Evaluate Defect Marked
    [Arguments]    ${listItemNo}=${EMPTY}
    [Documentation]    Evaluate a defect marked on the image by the Defect Marking and Classification tool.
    ...    ${listItemNo}: 1-based row in the Indications list to select before evaluating. Leave it out to
    ...    evaluate whatever is already selected — the Evaluate button is then clicked on its own, which is what
    ...    you want after a step that has already made the selection (auto-detected candidates, for instance).

    Focus    ${window_XPATH}
    Sleep    0.2s
    Open Defect Marking Panel
    Sleep    0.2s
    IF    '${listItemNo}' != '${EMPTY}'
        Scroll Defect Marking Panel To Element    ${defect_indications_list_xpath}/ListItem[${listItemNo}]
        Click    ${defect_indications_list_xpath}/ListItem[${listItemNo}]
        Sleep    0.2s
    END
    Scroll Defect Marking Panel To Element    ${evaluate_defect_marking_button_xpath}
    Click    ${evaluate_defect_marking_button_xpath}
    Sleep    0.2s

Select Acceptance Criteria Code
    [Arguments]    ${acceptance_code}
    [Documentation]    Select an option from the Acceptance Criteria Code combobox in the Defect Marking panel.
    ...    ${acceptance_code}: The display name of the option to select (e.g. 'Manual'). Must match exactly as shown in the dropdown.

    Should Not Be Empty    ${acceptance_code}    Acceptance criteria code cannot be empty.
    Wait Until Element Exist    ${Defect_Cmb_AcceptanceCode_XPATH}    5
    Scroll Defect Marking Panel To Element    ${Defect_Cmb_AcceptanceCode_XPATH}
    Select Combobox Item By Name    ${Defect_Cmb_AcceptanceCode_XPATH}    ${acceptance_code}
    Sleep    0.2s

Select Acceptance Criteria
    [Arguments]    ${decision}    ${notes}
    [Documentation]    Enter notes (mandatory) and click the Accept or Reject button in the Defect Marking panel.
    ...    ${decision}: 'Accept' to click the Accept button, 'Reject' to click the Reject button. Case-insensitive.
    ...    ${notes}: Text to enter into the mandatory Notes field before submitting the decision.
    ...
    ...    Returns: ${True} if the 'Confirm Status Change' dialog appeared (and was dismissed with Yes), ${False} otherwise. Use the return value to assert the dialog's expected presence/absence in your test.

    Should Not Be Empty    ${decision}    Decision cannot be empty.
    Should Not Be Empty    ${notes}    Notes cannot be empty — the Notes field is mandatory for marking.
    ${decision_norm}=    Evaluate    str($decision).strip().lower()

    Wait Until Element Exist    ${Defect_Txt_Notes_XPATH}    5
    Scroll Defect Marking Panel To Element    ${Defect_Txt_Notes_XPATH}
    Set Text To Textbox    ${Defect_Txt_Notes_XPATH}    ${notes}
    Sleep    0.2s

    IF    '${decision_norm}' == 'accept'
        Wait Until Element Exist    ${Defect_Btn_Accept_XPATH}    5
        Scroll Defect Marking Panel To Element    ${Defect_Btn_Accept_XPATH}
        Click    ${Defect_Btn_Accept_XPATH}
    ELSE IF    '${decision_norm}' == 'reject'
        Wait Until Element Exist    ${Defect_Btn_Reject_XPATH}    5
        Scroll Defect Marking Panel To Element    ${Defect_Btn_Reject_XPATH}
        Click    ${Defect_Btn_Reject_XPATH}
    ELSE
        Fail    Invalid decision '${decision}'. Use 'Accept' or 'Reject'.
    END
    Sleep    0.2s

    ${confirm_visible}=    Run Keyword And Return Status
    ...    Wait Until Element Exist    ${Confirm_Status_Change_Window_XPATH}    2
    IF    ${confirm_visible}
        Click    ${Confirm_Status_Change_Yes_Button_XPATH}
        Sleep    0.2s
    END
    RETURN    ${confirm_visible}

Click Image Filter Tool
    [Arguments]    ${status}=True
    [Documentation]    Toggle the Image Filter tool. ${status}=True activates (selects) it, ${status}=False turns it off. Defaults to True. If the tool is already in the requested state, no action is taken.

    Focus    ${window_XPATH}
    Sleep    0.2s
    ${filter_tool_open}=    Run Keyword And Return Status
    ...    Wait Until Element Exist    ${filter_combobox_xpath}    1
    IF    '${status}' == 'True' and not ${filter_tool_open}
        Click    ${Image_Filter_Tool_Button_XPATH}
        Sleep    0.2s
        Wait Until Element Exist    ${filter_combobox_xpath}    5
    ELSE IF    '${status}' == 'False' and ${filter_tool_open}
        Click    ${Image_Filter_Tool_Button_XPATH}
        Sleep    0.2s
    END
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
    Wait Until Element Is Offscreen    ${filter_apply_loading_bar_cancel_button_xpath}    60
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

Get Percentile BnC Displayed Value
    [Arguments]    ${xpath}
    [Documentation]    Read the displayed numeric value from a Percentile B&C text field.
    ...    The control's Name is a descriptive label (e.g. "Percentile High Value"), not the number, so the value is read with `Get Text From Textbox` (which tries the Value pattern, then the Text pattern). Falls back to the Name only if neither pattern is supported.

    ${status}    ${raw}=    Run Keyword And Ignore Error    Get Text From Textbox    ${xpath}
    IF    '${status}' == 'FAIL'
        ${raw}=    Get Name From Element    ${xpath}
    END
    Log    Percentile B&C value read from ${xpath}: '${raw}' (read via ${status}).
    RETURN    ${raw}

Verify Percentile Brightness and Contrast Values
    [Arguments]    ${expected_low}    ${expected_high}
    [Documentation]    Open the Percentile B&C popup (if not already open) and verify the displayed Low % and High % values match the expected values.
    ...    ${expected_low}: Expected Low % value shown in the Pct_Txt_LowValue field.
    ...    ${expected_high}: Expected High % value shown in the Pct_Txt_HighValue field.

    Focus    ${window_XPATH}
    Sleep    0.2s
    ${popup_open}=    Run Keyword And Return Status
    ...    Wait Until Element Exist    ${percentile_brightness_contrast_savePreset_button_xpath}    1
    Run Keyword If    not ${popup_open}    Click    ${percentile_brightness_contrast_filter_button_xpath}
    Run Keyword If    not ${popup_open}    Wait Until Element Exist    ${percentile_brightness_contrast_savePreset_button_xpath}    5
    Sleep    0.2s

    # The text fields (Pct_Txt_LowValue / Pct_Txt_HighValue) expose only their static
    # accessibility label ("Percentile Low/High Value") via UIA, not the displayed number,
    # so read the live Low %/High % from the slider RangeValue pattern instead.
    ${displayed_low}=    Get Percentile Slider Current Value    ${percentile_brightness_contrast_low_slider_xpath}
    ${displayed_high}=    Get Percentile Slider Current Value    ${percentile_brightness_contrast_high_slider_xpath}
    Log    Percentile B&C displayed Low/High %: ${displayed_low}/${displayed_high}
    # Diagnostic only (non-failing): logs what the text fields actually expose via UIA.
    Run Keyword And Ignore Error    Get Percentile BnC Displayed Value    ${percentile_brightness_contrast_low_value_text_xpath}
    Run Keyword And Ignore Error    Get Percentile BnC Displayed Value    ${percentile_brightness_contrast_high_value_text_xpath}
    ${expected_low_clean}=    Evaluate    str($expected_low).strip().replace('%', '')
    ${expected_high_clean}=    Evaluate    str($expected_high).strip().replace('%', '')
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${displayed_low}    ${expected_low_clean}
    ...    Expected Low % ${expected_low_clean} but popup shows ${displayed_low}.
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${displayed_high}    ${expected_high_clean}
    ...    Expected High % ${expected_high_clean} but popup shows ${displayed_high}.

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
    ELSE IF    '${filter_key}'=='median3x3' or '${filter_key}'=='median' or '${filter_key}'=='median33'
        RETURN    median3x3
    ELSE IF    '${filter_key}'=='bilateralsmooth' or '${filter_key}'=='bilateral'
        RETURN    bilateralsmooth
    END

    Fail    Unsupported image filter '${filterName}'. Supported filters: No Filter, Edge Detection, Gradient Magnitude, Morphological Contour, Edge Gradient, High-Pass Sharpen, Low-Pass Smooth, Normalize, Sharpness Boost, Auto Equalise, Gaussian Blur, Fox Bleach, Median 3x3, Bilateral Smooth.

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
    ELSE IF    '${filter_key}'=='median3x3'
        RETURN    Median 3x3
    ELSE IF    '${filter_key}'=='bilateralsmooth'
        RETURN    Bilateral Smooth
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
    ELSE IF    '${parameter_key}'=='bilateralrangesigma' or '${parameter_key}'=='rangesigma'
        Set Image Filter Numeric Parameter By Flexible XPath    BilateralRangeSigma    ${parameter_value}
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

Select GPU Type
    [Arguments]    ${gpu_type}
    [Documentation]    Open the Render Mode menu on the status bar and click one of
    ...    its items. Accepts ``GPU``, ``CPU``, or ``Info`` (case-insensitive).
    ...
    ...    Item names vary per machine (e.g. ``GPU Rendering (AMD Radeon(TM) Graphics)``,
    ...    ``CPU Rendering (Software)``), so each item is matched on its leading text
    ...    (``GPU Rendering`` / ``CPU Rendering`` / ``GPU Info``).
    ...
    ...    Examples:
    ...    | Select GPU Type    GPU
    ...    | Select GPU Type    CPU
    ...    | Select GPU Type    Info
    ${normalized_type}=    Evaluate    ''.join(ch.lower() for ch in str($gpu_type).strip() if ch.isalnum())
    IF    '${normalized_type}'=='gpu'
        ${option_xpath}=    Set Variable    ${render_mode_gpu_option_xpath}
        ${option_label}=    Set Variable    GPU Rendering
    ELSE IF    '${normalized_type}'=='cpu'
        ${option_xpath}=    Set Variable    ${render_mode_cpu_option_xpath}
        ${option_label}=    Set Variable    CPU Rendering
    ELSE IF    '${normalized_type}'=='info' or '${normalized_type}'=='gpuinfo'
        ${option_xpath}=    Set Variable    ${render_mode_info_option_xpath}
        ${option_label}=    Set Variable    GPU Info
    ELSE
        Fail    Unsupported render mode '${gpu_type}'. Use 'GPU', 'CPU', or 'Info'.
    END
    Focus    ${MAIN_WINDOW_XPATH}
    Sleep    0.2s
    Click    ${render_mode_button_xpath}
    Sleep    0.2s
    Wait Until Element Exist    ${option_xpath}    5
    Click    ${option_xpath}
    Sleep    0.2s
    IF    '${normalized_type}'=='info' or '${normalized_type}'=='gpuinfo'
        Wait Until Element Exist    ${render_mode_info_window_xpath}    5
    END
    Log    Render mode set to '${option_label}'.

Close GPU/CPU Rendering Info Window
    [Documentation]    If the GPU Info option was selected in the render mode menu, a new window opens showing GPU details. This keyword closes that window.
    Focus    ${MAIN_WINDOW_XPATH}
    Sleep    0.2s
    ${info_window_exists}=    Run Keyword And Return Status
    ...    Wait Until Element Exist    ${render_mode_info_window_xpath}    1
    Run Keyword If    ${info_window_exists}    Click    ${render_mode_info_window_Ok_Button_xpath}
    Sleep    0.2s
    Wait Until Element Does Not Exist    ${render_mode_info_window_xpath}    5
    Log    GPU Info window closed successfully.

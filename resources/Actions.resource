*** Settings ***
Library           FlaUILibrary    screenshot_dir=${CURDIR}\\..\\Actual\\test.png
Library           Process
Library           OperatingSystem
Library           ../lib/image_comparator.py
Library           ../lib/ironpy_remote_client.py
Library           AutoItLibrary
Resource          ../resources/login.resource
Resource          ../resources/General.resource
Resource          ../resources/imageviewer.resource
Resource    Tools.resource

*** Variables ***
${REPORT_VIEWER_BUTTON_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Pane/Button[@AutomationId="Main_Btn_GenerateReport"]
${REPORT_VIEWER_WINDOW_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Generate Report"]
${REPORT_VIEWER_CANCEL_BUTTON_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Generate Report"]/Button[@AutomationId="Report_Btn_Cancel"]
${REPORT_VIEWER_EXPORT-PDF_BUTTON_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Generate Report"]/Button[@AutomationId="Report_Btn_ExportPdf"]
${REPORT_VIEWER_Close_BUTTON_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Generate Report"]/Button[@AutomationId="Report_Btn_Close"]
${Standard-Template_RadioButton_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Generate Report"]/Pane/RadioButton[@AutomationId="Report_Rdo_StandardTemplate"]
${Custom-Template_RadioButton_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Generate Report"]/Pane/RadioButton[@AutomationId="Report_Rdo_CustomTemplate"]
${Report_Viewer_Settings_Button_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Generate Report"]/Button[@AutomationId="Report_Btn_Settings"]
${Report_viewer_Report_number_TextBox_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Generate Report"]/Pane/Edit[@AutomationId="Report_Txt_ReportNumber"]
${Report_viewer_Report_date_TextBox_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Generate Report"]/Pane/Custom/Edit[@AutomationId="DateTextBox"]
${Report_viewer_Report_title_TextBox_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Generate Report"]/Pane/Edit[@AutomationId="Report_Txt_ReportTitle"]
${report_include_report_radiographich_images_checkbox_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Generate Report"]/Pane/CheckBox[@AutomationId="Report_Chk_IncludeImage"]
${report_include_measurements_checkbox_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Generate Report"]/Pane/CheckBox[@AutomationId="Report_Chk_IncludeMeasurements"]
${report_include_IQI_wire_analysis_checkbox_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Generate Report"]/Pane/CheckBox[@AutomationId="Report_Chk_IncludeWireAnalysis"]
${report_include_defect_indications_checkbox_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Generate Report"]/Pane/CheckBox[@AutomationId="Report_Chk_IncludeDefects"]
${EXPORT_PDF_DIALOG_FILENAME_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Generate Report"]/Window[@Name="Save Report as PDF"]/Pane[1]/ComboBox[@AutomationId="FileNameControlHost"]
${Export_PDF_DIALOG_SAVE_BUTTON_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Generate Report"]/Window[@Name="Save Report as PDF"]/Button[@Name="Save"]
${EXPORT_PDF_REPLACE_YES_BUTTON_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Window/Window/Window/Button[@Name="Yes"]
${EXPORT_PDF_REPLACE_YES_BUTTON_FALLBACK_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Window/Window/Window/Button[@Name="Yes"]
${EXPORT_PDF_REPLACE_NO_BUTTON_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Window/Window/Window/Button[@Name="No"]
${EXPORT_PDF_REPLACE_NO_BUTTON_FALLBACK_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Window/Window/Window/Button[@Name="No"]
${Report_open_report_button_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="FoXpert RT"]/Button[@Name="Open Report"]
${Report_close_report_button_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="FoXpert RT"]/Button[@Name="Close"]
${report_viewer_settings_window_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Window/Window[@Name="Company Profile"]
${Report_Viewer_Settings_Window_Cancel_Button_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Window/Window[@Name="Company Profile"]/Button[@AutomationId="CompanyProfile_Btn_Cancel"]
${Report_Viewer_Window_Cancel_Button_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Generate Report"]/Button[@AutomationId="Report_Btn_Cancel"]    
${BATCH_PROCESSING_BUTTON_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Pane/Button[@AutomationId="Main_Btn_BatchProcessing"]    
${batch_procession_window_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Batch Processing"]
${batch_procession_window_Cancel_Button_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Batch Processing"]/Button[@AutomationId="Batch_Btn_CloseDialog"]
${batch_procession_window_Add_Files_Button_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Batch Processing"]/Button[@AutomationId="Batch_Btn_AddFiles"]
${batch_procession_window_Add_Files_Button_By_Name_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Batch Processing"]/Button[@Name="Add Files"]
${batch_procession_window_Add_Files_Button_By_Name_Fallback_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Batch Processing"]/Button[@Name="Add files"]
${batch_file_dialog_input_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Batch Processing"]/Window/ComboBox[1]/Edit[@Name="File name:"]
${batch_file_dialog_open_button_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Batch Processing"]/Window//*[@AutomationId="1" and @Name="Open"]
${batch_procession_window_clearall_button_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Batch Processing"]/Button[@AutomationId="Batch_Btn_ClearAll"]
${batch_procession_window_run_batch_button_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Batch Processing"]/Button[@AutomationId="Batch_Btn_RunBatch"]
${batch_operation_export_images_checkbox_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Batch Processing"]/Pane/CheckBox[@AutomationId="Batch_Chk_ExportImages"]
${batch_operation_generate_reports_checkbox_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Batch Processing"]/Pane/CheckBox[@AutomationId="Batch_Chk_GenerateReports"]
${batch_operation_apply_filter_checkbox_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Batch Processing"]/Pane/CheckBox[@AutomationId="Batch_Chk_ApplyFilter"]
${batch_window_level_mode_combobox_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Batch Processing"]/Pane/ComboBox[@AutomationId="Batch_Cmb_WindowLevelMode"]
${batch_window_level_window_center_textbox_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Batch Processing"]/Pane/Edit[@AutomationId="Batch_Txt_WindowCenter"]
${batch_window_level_window_width_textbox_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Batch Processing"]/Pane/Edit[@AutomationId="Batch_Txt_WindowWidth"]
${batch_window_level_invert_image_checkbox_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Batch Processing"]/Pane/CheckBox[@AutomationId="Batch_Chk_InvertImage"]
${batch_export_format_combobox_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Batch Processing"]/Pane/ComboBox[@AutomationId="Batch_Cmb_ExportFormat"]
${batch_output_folder_textbox_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Batch Processing"]/Pane/Edit[@AutomationId="Batch_Txt_OutputFolder"]
${batch_output_folder_browse_button_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Batch Processing"]/Pane/Button[@AutomationId="Batch_Btn_BrowseOutputFolder"]
${batch_report_include_image_checkbox_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Batch Processing"]/Pane/CheckBox[@AutomationId="Batch_Chk_IncludeImageInReport"]
${batch_report_output_folder_textbox_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Batch Processing"]/Window/Edit[@AutomationId="Batch_Txt_ReportOutputFolder"]
${batch_report_output_folder_browse_button_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Batch Processing"]/Pane/Button[@AutomationId="Batch_Btn_BrowseReportFolder"]
${batch_output_folder_dialog_input_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Batch Processing"]/Window/Edit[@Name="Folder:" and @AutomationId="1152"]
${batch_output_folder_dialog_select_button_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Batch Processing"]/Window/Button[@Name="Select Folder" and @AutomationId="1"]   
${stitch_button_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Pane/Button[@AutomationId="Main_Btn_ImageStitching"]    
${stitch_window_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Image Stitching"]
${stitch_window_close_button_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Image Stitching"]/Button[@AutomationId="Stitching_Btn_Close"]
${stitch_window_add_files_button_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Image Stitching"]/Button[@AutomationId="Stitching_Btn_AddFiles"]
${stitch_window_add_files_button_by_name_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Image Stitching"]/Button[@Name="Add Files"]
${stitch_window_add_files_button_by_name_fallback_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Image Stitching"]/Button[@Name="Add files"]
${stitch_window_add_files_button_contains_name_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Image Stitching"]//Button[contains(@Name,"Add")]
${stitch_window_clearall_button_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Image Stitching"]/Button[@AutomationId="Stitching_Btn_ClearAll"]
# IMAGE INDEX panel. The cards live in an ItemsControl; each DataItem is named after its view model class
# ('FoxViewerDesktop.ViewModels.StitchSourceItem'), so a file can only be recognised by the TextBlock inside
# its card, never by the item's own Name.
${stitch_source_list_xpath}    ${stitch_window_xpath}//List[@AutomationId="Stitching_SourceList"]
# Canvas area the indexed images get placed onto — the region 'Take Stitch View Screenshot' captures.
${stitch_canvas_view_xpath}    ${stitch_window_xpath}/Pane[@AutomationId="Stitching_CanvasScroll"]
# The stitched output itself. Exists only after a stitch has run, alongside the 'Back to Edit' button.
${stitch_result_image_xpath}    ${stitch_window_xpath}//Image[@AutomationId="Stitching_ResultImage"]
# SELECTED IMAGE section — all four act on the image currently selected on the canvas, and are disabled
# while nothing is selected.
${stitch_rotate_left_button_xpath}    ${stitch_window_xpath}//Button[@AutomationId="Stitching_Btn_RotateLeft"]
${stitch_rotate_right_button_xpath}    ${stitch_window_xpath}//Button[@AutomationId="Stitching_Btn_RotateRight"]
${stitch_forward_button_xpath}    ${stitch_window_xpath}//Button[@AutomationId="Stitching_Btn_Forward"]
${stitch_back_button_xpath}    ${stitch_window_xpath}//Button[@AutomationId="Stitching_Btn_Back"]
${stitch_remove_button_xpath}    ${stitch_window_xpath}//Button[@AutomationId="Stitching_Btn_Remove"]
${stitch_clear_canvas_button_xpath}    ${stitch_window_xpath}//Button[@AutomationId="Stitching_Btn_Clear"]
# Whatever has been placed on the canvas. Only used to confirm a clear actually emptied it, and only when the
# items were visible beforehand — so an unrecognised item shape costs the check, not a false failure.
${stitch_canvas_items_xpath}    ${stitch_canvas_view_xpath}//List/*
${stitch_recent_summary_text_xpath}    ${stitch_window_xpath}//Text[@AutomationId="Stitching_Txt_RecentSummary"]
${stitch_recent_count_input_xpath}    ${stitch_window_xpath}//Edit[@AutomationId="Stitching_Num_RecentCount"]
${stitch_window_add_all_button_xpath}    ${stitch_window_xpath}/Button[@AutomationId="Stitching_Btn_AddAll"]
# Renamed from Stitching_Btn_ClearAll in the redesign.
${stitch_window_clear_index_button_xpath}    ${stitch_window_xpath}/Button[@AutomationId="Stitching_Btn_ClearIndex"]
${stitch_file_dialog_input_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Image Stitching"]/Window/ComboBox[1]/Edit[@Name="File name:"]
${stitch_file_dialog_open_button_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Image Stitching"]/Window//*[@AutomationId="1" and @Name="Open"]
${stitch_configuration_scrollviewer_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Image Stitching"]/Pane[2]
${stitch_blend_levels_nud_input_xpath}    ${stitch_window_xpath}//Edit[@AutomationId="Stitching_BlendLevels_Num"]
${stitch_min_confidence_nud_input_xpath}    ${stitch_window_xpath}//Edit[@AutomationId="Stitching_MinConfidence_Num"]
${stitch_window_level_combobox_xpath}    ${stitch_window_xpath}//ComboBox[@AutomationId="Stitching_Cmb_WindowLevel"]
${stitch_invert_image_checkbox_xpath}    ${stitch_window_xpath}//CheckBox[@AutomationId="Stitching_Chk_Invert"]
# --- Stitch controls as of the Auto/Manual redesign -------------------------------------------------------
# Detector, Blend levels, Min confidence, Window level and Invert image moved inside the 'Output options'
# expander; Edge blend and Feather sit outside it. Everything is anchored on AutomationId rather than on the
# positional paths, because adding a control shifts every index after it — the Feather NUD did exactly that
# to Custom[1]/Custom[2] inside the expander.
${stitch_output_options_group_xpath}    ${stitch_window_xpath}/Pane[3]/Group
${stitch_output_options_header_xpath}    ${stitch_window_xpath}//Button[@AutomationId="HeaderSite"]
${stitch_detector_combobox_xpath}    ${stitch_window_xpath}//ComboBox[@AutomationId="Stitching_Cmb_Detector"]
${stitch_edge_blend_checkbox_xpath}    ${stitch_window_xpath}//CheckBox[@AutomationId="Stitching_Chk_Feather"]
${stitch_feather_nud_input_xpath}    ${stitch_window_xpath}//Edit[@AutomationId="Stitching_Feather_Num"]
${stitch_auto_stitch_button_xpath}    ${stitch_window_xpath}//Button[@AutomationId="Stitching_Btn_AutoStitch"]
${stitch_apply_manual_button_xpath}    ${stitch_window_xpath}//Button[@AutomationId="Stitching_Btn_ApplyManual"]
# Appears only once a stitch has produced a result — the signal that the run finished.
${stitch_back_to_edit_button_xpath}    ${stitch_window_xpath}//Button[@AutomationId="Stitching_Btn_BackToEdit"]
${stitch_save_image_button_xpath}    ${stitch_window_xpath}//Button[@AutomationId="Stitching_Btn_Save"]
${Stitch_IMAGE_VIEWER_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Image Stitching"]/Pane[3]/Image
# 'Save Image' opens the standard Windows Save-As dialog, so it is driven with AutoIt control identifiers
# rather than XPaths. The controls below are that dialog's, not the app's.
${stitch_save_dialog_title}    Save Stitched Image
${stitch_save_filename_control}    [CLASS:Edit; INSTANCE:1]
${stitch_save_filetype_control}    [CLASS:ComboBox; INSTANCE:2]
${stitch_save_button_control}    [CLASS:Button; INSTANCE:2]
# The Save dialog is a native #32770 parented to the Stitch window. All of the locators below were read off
# the live dialog and confirmed to resolve through FlaUI.
#
# Do not drive this dialog with AutoIt class-instance identifiers: 'Save' and 'Cancel' are the only controls
# of native class Button (the toolbar ones are Button3d/AJOSplitButton), which makes [CLASS:Button; INSTANCE:2]
# the *Cancel* button. That is what silently abandoned the save and left the previous run's file in place.
${stitch_save_dialog_xpath}    ${stitch_window_xpath}/Window[@Name="Save Stitched Image"]
${stitch_save_dialog_filename_xpath}    ${stitch_save_dialog_xpath}//Edit[@AutomationId="1001"]
${stitch_save_dialog_filename_by_name_xpath}    ${stitch_save_dialog_xpath}//Edit[@Name="File name:"]
${stitch_save_dialog_filename_host_xpath}    ${stitch_save_dialog_xpath}//ComboBox[@AutomationId="FileNameControlHost"]//Edit
${stitch_save_dialog_filetype_xpath}    ${stitch_save_dialog_xpath}//ComboBox[@AutomationId="FileTypeControlHost"]
${stitch_save_dialog_save_button_xpath}    ${stitch_save_dialog_xpath}/Button[@AutomationId="1"]
${stitch_save_dialog_cancel_button_xpath}    ${stitch_save_dialog_xpath}/Button[@AutomationId="2"]
${stitch_save_overwrite_dialog_title}    Confirm Save As
${stitch_save_overwrite_yes_button_control}    [TEXT:&Yes]
${stitch_save_overwrite_yes_button_fallback_control}    [TEXT:Yes]
${stitch_save_overwrite_yes_button_instance_control}    [CLASS:Button; INSTANCE:1]
${rt_simulator_button_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Pane/Button[@AutomationId="Main_Btn_RtSimulator"]
${rt_simulator_window_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="FoXpert RT Simulator"]
${rt_simulator_window_close_button_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="FoXpert RT Simulator"]/Button[3]
*** Keywords ***
Open Report Viewer
    [Documentation]    Open Report Viewer. If a scrollbar is present on the main toolbar pane (Generate Report button hidden below visible area), scroll the pane to the bottom before clicking. Otherwise click directly without scrolling.

    Click    ${MAIN_WINDOW_XPATH}
    Sleep    0.2s
    Scroll To Report Viewer Button
    Click    ${REPORT_VIEWER_BUTTON_XPATH}
    Sleep    0.2s
    Wait Until Element Exist    ${REPORT_VIEWER_Close_BUTTON_XPATH}    5
    Sleep    1s
    Resize Report Viewer Window    0    0    1900    1025
    Sleep    1s
    Resize FoxRT Application Window    10    10    1850    1000
    Sleep    1s

Scroll To Report Viewer Button
    [Documentation]    If a vertical scrollbar is present (and visible) on the main toolbar pane, scroll the pane to the bottom so the Generate Report button comes into view. Skips silently when no scrollbar is shown (the toolbar contents already fit and the button is in view).

    ${scrollbar_xpath}=    Set Variable    ${MAIN_WINDOW_XPATH}/Pane/ScrollBar
    ${scrollbar_present}=    Run Keyword And Return Status    Wait Until Element Exist    ${scrollbar_xpath}    1
    IF    not ${scrollbar_present}
        Log    No scrollbar on toolbar pane; Generate Report button should already be in view.
        RETURN
    END

    ${scrollbar_visible}=    Run Keyword And Return Status    Element Should Not Be Offscreen    ${scrollbar_xpath}
    IF    not ${scrollbar_visible}
        Log    Toolbar scrollbar element exists but is offscreen; skipping scroll.
        RETURN
    END

    Log    Scrollbar visible on toolbar pane; scrolling pane to the bottom.
    Focus    ${MAIN_WINDOW_XPATH}
    FOR    ${index}    IN RANGE    30
        Scroll Down    ${MAIN_WINDOW_XPATH}/Pane    1
        Sleep    0.05s
    END
    Sleep    0.2s


Resize Report Viewer Window
    [Arguments]    ${x}=0    ${y}=0    ${width}=1280    ${height}=800
    Restore FoxRT Window
    Focus    ${REPORT_VIEWER_WINDOW_XPATH}
    Win Move    [ACTIVE]    ${EMPTY}    ${x}    ${y}    ${width}    ${height}
    Sleep    1s

Resize Batch Processing Window
    [Arguments]    ${x}=0    ${y}=0    ${width}=1280    ${height}=800
    Restore FoxRT Window
    Focus    ${batch_procession_window_XPATH}
    Win Move    [ACTIVE]    ${EMPTY}    ${x}    ${y}    ${width}    ${height}
    Sleep    1s

Verify Report Viewer Window Is Open
    [Documentation]    Verify Report Viewer Window Is Open
    
    Element Should Exist    ${REPORT_VIEWER_WINDOW_XPATH}

Take Report Viewer Screenshot
    [Documentation]    Take Report Viewer Screenshot
    [Arguments]    ${filename}

    ${screenshot_path}=    Take Screenshot    ${REPORT_VIEWER_WINDOW_XPATH}
    Log    Screenshot saved to (temporary): ${screenshot_path}

    ${dest}=    Set Variable    ${actual_image}${filename}
    Create Directory    ${actual_image}
    Move File    ${screenshot_path}    ${dest}

    Log    Screenshot moved to: ${dest}
    RETURN    ${dest}

Select Report Viewer Template
    [Documentation]    Select Report Viewer Template
    [Arguments]    ${template_name}
    
    Focus    ${REPORT_VIEWER_WINDOW_XPATH}
    Sleep    0.2s
    Run Keyword If    "${template_name}" == "Standard Template"    Click    ${Standard-Template_RadioButton_XPATH}
    Run Keyword If    "${template_name}" == "Custom Template"    Click    ${Custom-Template_RadioButton_XPATH}
    Sleep    0.2s

Set Report Viewer Params
    [Arguments]    ${report_number}=${EMPTY}    ${report_date}=${EMPTY}    ${report_title}=${EMPTY}
    ...    ${include_Radiographic_Images}=${EMPTY}    ${include_Measurements}=${EMPTY}
    ...    ${include_IQI_Wire_Analysis}=${EMPTY}    ${include_Defect_Indications}=${EMPTY}
    ...    ${template}=Standard Template
    [Documentation]    Set Report Viewer Params without popup dialogs. Uses passed arguments or default values.
    ...    ${template} selects the report template radio button before applying params (default: "Standard Template"). Pass "Custom Template" for the custom variant.

    Focus    ${REPORT_VIEWER_WINDOW_XPATH}
    Sleep    0.2s
    Select Report Viewer Template    ${template}

    ${default_report_number}=    Evaluate    __import__('datetime').datetime.now().strftime('RPT-%Y%m%d-%H%M%S')
    ${default_report_date}=    Evaluate    __import__('datetime').datetime.now().strftime('%Y-%m-%d')
    ${default_report_title}=    Set Variable    Radiographic Inspection Report

    IF    '${report_number}' == '${EMPTY}'
        ${report_number}=    Set Variable    ${default_report_number}
    END
    IF    '${report_date}' == '${EMPTY}'
        ${report_date}=    Set Variable    ${default_report_date}
    END
    IF    '${report_title}' == '${EMPTY}'
        ${report_title}=    Set Variable    ${default_report_title}
    END
    IF    '${include_Radiographic_Images}' == '${EMPTY}'
        ${include_Radiographic_Images}=    Set Variable    yes
    END
    IF    '${include_Measurements}' == '${EMPTY}'
        ${include_Measurements}=    Set Variable    yes
    END
    IF    '${include_IQI_Wire_Analysis}' == '${EMPTY}'
        ${include_IQI_Wire_Analysis}=    Set Variable    yes
    END
    IF    '${include_Defect_Indications}' == '${EMPTY}'
        ${include_Defect_Indications}=    Set Variable    yes
    END

    ${include_radiographic_images_bool}=    Convert User Input To Boolean    ${include_Radiographic_Images}    Include Radiographic Image
    ${include_measurements_bool}=    Convert User Input To Boolean    ${include_Measurements}    Include Measurements
    ${include_iqi_wire_analysis_bool}=    Convert User Input To Boolean    ${include_IQI_Wire_Analysis}    Include IQI Wire Analysis
    ${include_defect_indications_bool}=    Convert User Input To Boolean    ${include_Defect_Indications}    Include Defect Indications

    Set Text To Textbox    ${Report_viewer_Report_number_TextBox_XPATH}    ${report_number}
    Sleep    0.2s
    Set Text To Textbox    ${Report_viewer_Report_date_TextBox_XPATH}    ${report_date}
    Sleep    0.2s
    Set Text To Textbox    ${Report_viewer_Report_title_TextBox_XPATH}    ${report_title}
    Sleep    0.2s
    Set Checkbox State    ${report_include_report_radiographich_images_checkbox_XPATH}    ${include_radiographic_images_bool}
    Set Checkbox State    ${report_include_measurements_checkbox_XPATH}    ${include_measurements_bool}
    Set Checkbox State    ${report_include_IQI_wire_analysis_checkbox_XPATH}    ${include_iqi_wire_analysis_bool}
    Set Checkbox State    ${report_include_defect_indications_checkbox_XPATH}    ${include_defect_indications_bool}
    Sleep    0.2s

Convert User Input To Boolean
    [Documentation]    Convert yes/no, true/false, 1/0 style input values to boolean.
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

Click Export Pdf Button
    [Arguments]    ${file_name}=${EMPTY}    ${warning_action}=Yes
    [Documentation]    Click Export Pdf Button
    
    IF    '${file_name}' == '${EMPTY}'
        ${file_name}=    Evaluate    __import__('datetime').datetime.now().strftime('MFRTA_%Y%m%d_%H%M%S')
    END
    ${warning_action}=    Evaluate    str($warning_action).strip().lower()
    Click    ${REPORT_VIEWER_EXPORT-PDF_BUTTON_XPATH}
    Sleep    0.5s
    Set Text To Textbox    ${EXPORT_PDF_DIALOG_FILENAME_XPATH}    ${CURDIR}\\..\\Actual\\${file_name}.pdf
    Sleep    0.5s
    Click    ${Export_PDF_DIALOG_SAVE_BUTTON_XPATH}
    Sleep    0.5s
    ${replace_prompt_visible}=    Run Keyword And Return Status
    ...    Wait Until Element Exist    ${EXPORT_PDF_REPLACE_YES_BUTTON_XPATH}    3
    IF    ${replace_prompt_visible}
        IF    '${warning_action}' == 'no'
            Click    ${EXPORT_PDF_REPLACE_NO_BUTTON_XPATH}
        ELSE
            Click    ${EXPORT_PDF_REPLACE_YES_BUTTON_XPATH}
        END
    ELSE
        ${replace_prompt_visible_fallback}=    Run Keyword And Return Status
        ...    Wait Until Element Exist    ${EXPORT_PDF_REPLACE_YES_BUTTON_FALLBACK_XPATH}    2
        IF    ${replace_prompt_visible_fallback}
            IF    '${warning_action}' == 'no'
                Click    ${EXPORT_PDF_REPLACE_NO_BUTTON_FALLBACK_XPATH}
            ELSE
                Click    ${EXPORT_PDF_REPLACE_YES_BUTTON_FALLBACK_XPATH}
            END
        END
    END
    Wait Until Element Exist    ${Report_open_report_button_XPATH}    10
    Sleep    0.2s
    Click    ${Report_close_report_button_XPATH}
    Sleep    0.2s

Click Report Viewer Settings Button
    Click    ${Report_Viewer_Settings_Button_XPATH}
    Sleep    0.5s

Verify Report Viewer Settings Window Is Open
    Win Exists    ${report_viewer_settings_window_XPATH}

Verify Report Viewer Window Is Closed
    [Documentation]    Verify Report Viewer Window Is Open
    
    Element Should Not Exist    ${REPORT_VIEWER_WINDOW_XPATH}

Close Report Viewer
    Click    ${Report_Viewer_Window_Cancel_Button_XPATH}
    Sleep    0.5s

Open Batch Processing Window
    Click    ${BATCH_PROCESSING_BUTTON_XPATH}
    Sleep    0.5s
    Resize Batch Processing Window    100    100    1250    900
    Sleep    0.2s
    Resize FoxRT Application Window    10    10    1850    1000
    Sleep    0.2s

Verify Batch Processing Window Is Open
    Win Exists    ${batch_procession_window_XPATH}

Close Batch Processing Window
    Click    ${batch_procession_window_Cancel_Button_XPATH}
    Sleep    0.5s
    Wait Until Element Does Not Exist    ${batch_procession_window_XPATH}    5
    Sleep    0.5s

Verify Batch Processing Window Is Closed
    Element Should Not Exist    ${batch_procession_window_XPATH}
    Sleep    0.5s

Add files to Batch Processing Window
    [Arguments]    @{file_paths}
    [Documentation]    Add one or more files to Batch Processing window. Uses a fast single-dialog multi-file selection with reliable fallback.

    ${clean_file_paths}=    Evaluate    [str(p).strip() for p in $file_paths if str(p).strip()]
    ${path_count}=    Evaluate    len($clean_file_paths)
    Should Be True    ${path_count} > 0    Provide at least one file path to add in Batch Processing window.

    FOR    ${file_path}    IN    @{clean_file_paths}
        ${file_exists}=    Evaluate    __import__('os').path.exists($file_path)
        Should Be True    ${file_exists}    File path does not exist: ${file_path}
    END

    Wait Until Element Exist    ${batch_procession_window_XPATH}    5
    Click Add Files In Batch Processing
    ${input_xpath}    ${open_xpath}=    Get Batch Open File Dialog Locators

    ${dialog_file_value}=    Evaluate    ' '.join([f'\"{p}\"' for p in $clean_file_paths])
    Set Text To Textbox    ${input_xpath}    ${dialog_file_value}
    Click Open File Dialog Button    ${open_xpath}

    ${dialog_closed}=    Run Keyword And Return Status
    ...    Wait Until Element Does Not Exist    ${input_xpath}    2
    IF    ${dialog_closed}
        RETURN
    END

    # Fallback only when multi-file string is not accepted by the dialog.
    ${remaining_files}=    Set Variable    @{clean_file_paths}
    FOR    ${file_path}    IN    @{remaining_files}
        ${dialog_still_open}=    Run Keyword And Return Status    Element Should Exist    ${input_xpath}
        IF    not ${dialog_still_open}
            Click Add Files In Batch Processing
            ${input_xpath}    ${open_xpath}=    Get Batch Open File Dialog Locators
        END
        Set Text To Textbox    ${input_xpath}    ${file_path}
        Click Open File Dialog Button    ${open_xpath}
        Wait Until Element Does Not Exist    ${input_xpath}    2
    END

Click Add Files In Batch Processing
    ${add_clicked}=    Run Keyword And Return Status    Click    ${batch_procession_window_Add_Files_Button_XPATH}
    IF    not ${add_clicked}
        ${add_clicked}=    Run Keyword And Return Status    Click    ${batch_procession_window_Add_Files_Button_By_Name_XPATH}
    END
    IF    not ${add_clicked}
        ${add_clicked}=    Run Keyword And Return Status    Click    ${batch_procession_window_Add_Files_Button_By_Name_Fallback_XPATH}
    END
    Should Be True    ${add_clicked}    Could not find/click Add Files button in Batch Processing window.

Get Batch Open File Dialog Locators
    ${input_found}=    Run Keyword And Return Status
    ...    Wait Until Element Exist    ${batch_file_dialog_input_xpath}    2
    IF    ${input_found}
        RETURN    ${batch_file_dialog_input_xpath}    ${batch_file_dialog_open_button_xpath}
    END
    ${generic_input_xpath}=    Get Open File Dialog Input Locator
    RETURN    ${generic_input_xpath}    ${EMPTY}

Verify Files Added In Batch Processing Window
    [Arguments]    @{file_paths}
    [Documentation]    Verify that each provided file is visible in the Batch Processing window.

    ${clean_file_paths}=    Evaluate    [str(p).strip() for p in $file_paths if str(p).strip()]
    ${path_count}=    Evaluate    len($clean_file_paths)
    Should Be True    ${path_count} > 0    Provide at least one file path to verify in Batch Processing window.

    Wait Until Element Exist    ${batch_procession_window_XPATH}    5

    FOR    ${file_path}    IN    @{clean_file_paths}
        ${file_name}=    Evaluate    __import__('os').path.basename($file_path)
        ${exact_name_xpath}=    Set Variable    ${batch_procession_window_XPATH}//*[@Name="${file_name}"]
        ${contains_name_xpath}=    Set Variable    ${batch_procession_window_XPATH}//*[contains(@Name,"${file_name}")]

        ${found_exact}=    Run Keyword And Return Status
        ...    Wait Until Element Exist    ${exact_name_xpath}    2

        ${found_contains}=    Set Variable    ${False}
        IF    not ${found_exact}
            ${found_contains}=    Run Keyword And Return Status
            ...    Wait Until Element Exist    ${contains_name_xpath}    2
        END

        Should Be True
        ...    ${found_exact} or ${found_contains}
        ...    File not found in Batch Processing window: ${file_name}
    END

Remove All Files From Batch Processing Window
    [Documentation]    Remove all files from Batch Processing window.
    Wait Until Element Exist    ${batch_procession_window_XPATH}    5
    Click    ${batch_procession_window_clearall_button_XPATH}
    Sleep    0.5s

Verify No Files In Batch Processing Window
    [Documentation]    Verify no files are listed in Batch Processing window.
    Wait Until Element Exist    ${batch_procession_window_XPATH}    5
    ${dcm_entries_xpath}=    Set Variable
    ...    ${batch_procession_window_XPATH}//*[contains(@Name,'.dcm') or contains(@Name,'.DCM')]
    ${files_present}=    Run Keyword And Return Status
    ...    Wait Until Element Exist    ${dcm_entries_xpath}    1
    Should Not Be True
    ...    ${files_present}
    ...    Expected no files in Batch Processing window, but one or more file entries are still visible.

Run Batch Process
    [Arguments]    ${export_images}=yes    ${generate_reports}=yes    ${apply_filter}=yes
    ...    ${window_level_mode}=${EMPTY}    ${window_center}=${EMPTY}    ${window_width}=${EMPTY}
    ...    ${invert_image}=no
    ...    ${export_format}=${EMPTY}    ${output_folder}=${EMPTY}
    ...    ${report_include_image}=yes    ${report_output_folder}=${EMPTY}
   
    [Documentation]    Set Batch Processing options and then click Run Batch.

    Wait Until Element Exist    ${batch_procession_window_XPATH}    5
    Focus    ${batch_procession_window_XPATH}
    Sleep    0.2s

    ${export_images_bool}=    Convert User Input To Boolean    ${export_images}    Export Images
    ${generate_reports_bool}=    Convert User Input To Boolean    ${generate_reports}    Generate Reports
    ${apply_filter_bool}=    Convert User Input To Boolean    ${apply_filter}    Apply Filter
    ${invert_image_bool}=    Convert User Input To Boolean    ${invert_image}    Invert Image

    Set Checkbox State    ${batch_operation_export_images_checkbox_XPATH}    ${export_images_bool}
    Set Checkbox State    ${batch_operation_generate_reports_checkbox_XPATH}    ${generate_reports_bool}
    Set Checkbox State    ${batch_operation_apply_filter_checkbox_XPATH}    ${apply_filter_bool}
    Set Checkbox State    ${batch_window_level_invert_image_checkbox_XPATH}    ${invert_image_bool}

    IF    str($window_level_mode).strip() != ''
        Select Combobox Item By Name    ${batch_window_level_mode_combobox_XPATH}    ${window_level_mode}
    END

    ${manual_fields_provided}=    Evaluate    str($window_center).strip() != '' or str($window_width).strip() != ''
    ${manual_mode_requested}=    Evaluate    str($window_level_mode).strip().lower() == 'manual'

    IF    ${manual_fields_provided} and not ${manual_mode_requested}
        Select Combobox Item By Name    ${batch_window_level_mode_combobox_XPATH}    Manual
        ${manual_mode_requested}=    Set Variable    ${True}
    END

    IF    ${manual_mode_requested}
        Should Not Be Equal As Strings
        ...    ${window_center}
        ...    ${EMPTY}
        ...    Window Center is required when Window Level mode is Manual.
        Should Not Be Equal As Strings
        ...    ${window_width}
        ...    ${EMPTY}
        ...    Window Width is required when Window Level mode is Manual.
        Wait Until Element Exist    ${batch_window_level_window_center_textbox_XPATH}    2
        Wait Until Element Exist    ${batch_window_level_window_width_textbox_XPATH}    2
        Set Text To Textbox    ${batch_window_level_window_center_textbox_XPATH}    ${window_center}
        Set Text To Textbox    ${batch_window_level_window_width_textbox_XPATH}    ${window_width}
    END

    IF    str($export_format).strip() != ''
        Select Combobox Item By Name    ${batch_export_format_combobox_XPATH}    ${export_format}
    END

    ${default_output_folder}=    Set Variable    ${CURDIR}\\..\\Actual\\BatchOutput
    IF    str($output_folder).strip() == ''
        ${output_folder}=    Set Variable    ${default_output_folder}
    END
    Create Directory    ${output_folder}
    Sleep    0.2s

    Click    ${batch_output_folder_browse_button_XPATH}
    ${dialog_input_found}=    Run Keyword And Return Status
    ...    Wait Until Element Exist    ${batch_output_folder_dialog_input_xpath}    5
    ${dialog_input_xpath}=    Set Variable    ${batch_output_folder_dialog_input_xpath}
    ${dialog_select_xpath}=    Set Variable    ${batch_output_folder_dialog_select_button_xpath}
    IF    not ${dialog_input_found}
        Wait Until Element Exist    ${INPUT_FOLDER_DIALOG_XPATH}    3
        ${dialog_input_xpath}=    Set Variable    ${INPUT_FOLDER_DIALOG_XPATH}
        ${dialog_select_xpath}=    Set Variable    ${Select_Folder_XPATH}
    END

    ${dialog_set_success}=    Run Keyword And Return Status
    ...    Set Text To Textbox    ${dialog_input_xpath}    ${output_folder}
    IF    not ${dialog_set_success}
        Click    ${dialog_input_xpath}
        Sleep    0.1s
        Send    ^a
        Send    {DEL}
        Send    ${output_folder}
    END
    Sleep    0.2s
    Click    ${dialog_select_xpath}
    Sleep    0.3s
    Sleep    0.2s

    IF    ${generate_reports_bool}
        ${report_include_image_bool}=    Convert User Input To Boolean    ${report_include_image}    Include Image in Report
        Set Checkbox State    ${batch_report_include_image_checkbox_XPATH}    ${report_include_image_bool}

        ${default_report_output_folder}=    Set Variable    ${CURDIR}\\..\\Actual\\BatchReportOutput
        IF    str($report_output_folder).strip() == ''
            ${report_output_folder}=    Set Variable    ${default_report_output_folder}
        END
        Create Directory    ${report_output_folder}
        Sleep    0.2s

        Click    ${batch_report_output_folder_browse_button_XPATH}
        ${report_dialog_input_found}=    Run Keyword And Return Status
        ...    Wait Until Element Exist    ${batch_output_folder_dialog_input_xpath}    5
        ${report_dialog_input_xpath}=    Set Variable    ${batch_output_folder_dialog_input_xpath}
        ${report_dialog_select_xpath}=    Set Variable    ${batch_output_folder_dialog_select_button_xpath}
        IF    not ${report_dialog_input_found}
            Wait Until Element Exist    ${INPUT_FOLDER_DIALOG_XPATH}    3
            ${report_dialog_input_xpath}=    Set Variable    ${INPUT_FOLDER_DIALOG_XPATH}
            ${report_dialog_select_xpath}=    Set Variable    ${Select_Folder_XPATH}
        END

        ${report_dialog_set_success}=    Run Keyword And Return Status
        ...    Set Text To Textbox    ${report_dialog_input_xpath}    ${report_output_folder}
        IF    not ${report_dialog_set_success}
            Click    ${report_dialog_input_xpath}
            Sleep    0.1s
            Send    ^a
            Send    {DEL}
            Send    ${report_output_folder}
        END
        Sleep    0.2s
        Click    ${report_dialog_select_xpath}
        Sleep    0.3s
    END

    Click    ${batch_procession_window_run_batch_button_XPATH}
    Sleep    0.5s
    Wait Until Element Exist    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Batch Processing"]/Text[contains(@Name, 'Complete —')]
    Sleep    0.5s

Verify Batch Process Completed Successfully
    [Documentation]    Verify expected batch output files are available in the given path.
    [Arguments]    ${path}    @{file_names}

    Should Not Be Empty    ${path}    Provide the path where batch output files should be verified.
    ${file_count}=    Get Length    ${file_names}
    Should Be True    ${file_count} > 0    Provide at least one expected file name to verify.

    Directory Should Exist    ${path}

    FOR    ${file_name}    IN    @{file_names}
        ${file_path}=    Join Path    ${path}    ${file_name}
        Wait Until Keyword Succeeds    30x    1s    File Should Exist    ${file_path}
    END

Open Stitch Window
    [Documentation]    Open the Stitch window and size it to match the main application window, so screenshots and
    ...    coordinate-based steps see it at a known, repeatable size. The Stitch window is owned by the main
    ...    window, so it stays above it even though the two now occupy the same rectangle.

    Click    ${MAIN_WINDOW_XPATH}
    Sleep    0.2s
    Click    ${stitch_button_xpath}
    Sleep    0.2s
    Wait Until Element Exist    ${stitch_window_xpath}    5
    Sleep    1s
    Resize FoxRT Application Window    10    10    1850    1000
    Sleep    0.2s
    Resize Stitch Window    10    10    1850    1000
    Sleep    0.2s

Resize Stitch Window
    [Arguments]    ${x}=0    ${y}=0    ${width}=1280    ${height}=800
    Restore FoxRT Window
    Focus    ${stitch_window_xpath}
    Win Move    [ACTIVE]    ${EMPTY}    ${x}    ${y}    ${width}    ${height}
    Sleep    1s

Verify Stitch Window Is Open
    [Documentation]    Verify Stitch Window Is Open
    
    Element Should Exist    ${stitch_window_xpath}

Close Stitch Window
    Click    ${stitch_window_close_button_xpath}
    Sleep    0.5s
    Wait Until Element Does Not Exist    ${stitch_window_xpath}    5
    Sleep    0.5s

Add files to Stitch Window
    [Arguments]    @{file_paths}
    [Documentation]    Add one or more files to Stitch window. Uses a fast single-dialog multi-file selection with reliable fallback.

    ${clean_file_paths}=    Evaluate    [str(p).strip() for p in $file_paths if str(p).strip()]
    ${path_count}=    Evaluate    len($clean_file_paths)
    Should Be True    ${path_count} > 0    Provide at least one file path to add in Stitch window.

    FOR    ${file_path}    IN    @{clean_file_paths}
        ${file_exists}=    Evaluate    __import__('os').path.exists($file_path)
        Should Be True    ${file_exists}    File path does not exist: ${file_path}
    END

    Wait Until Element Exist    ${stitch_window_xpath}    5
    Click Add Files In Stitch Window
    ${input_xpath}    ${open_xpath}=    Get Stitch Open File Dialog Locators

    ${dialog_file_value}=    Evaluate    ' '.join([f'\"{p}\"' for p in $clean_file_paths])
    Set Text To Textbox    ${input_xpath}    ${dialog_file_value}
    Click Open File Dialog Button    ${open_xpath}

    ${dialog_closed}=    Run Keyword And Return Status
    ...    Wait Until Element Does Not Exist    ${input_xpath}    2
    IF    ${dialog_closed}
        RETURN
    END

    # Fallback only when multi-file string is not accepted by the dialog.
    ${remaining_files}=    Set Variable    @{clean_file_paths}
    FOR    ${file_path}    IN    @{remaining_files}
        ${dialog_still_open}=    Run Keyword And Return Status    Element Should Exist    ${input_xpath}
        IF    not ${dialog_still_open}
            Click Add Files In Stitch Window
            ${input_xpath}    ${open_xpath}=    Get Stitch Open File Dialog Locators
        END
        Set Text To Textbox    ${input_xpath}    ${file_path}
        Click Open File Dialog Button    ${open_xpath}
        Wait Until Element Does Not Exist    ${input_xpath}    2
    END

Click Add Files In Stitch Window
    ${add_clicked}=    Run Keyword And Return Status    Click    ${stitch_window_add_files_button_xpath}
    IF    not ${add_clicked}
        ${add_clicked}=    Run Keyword And Return Status    Click    ${stitch_window_add_files_button_by_name_xpath}
    END
    IF    not ${add_clicked}
        ${add_clicked}=    Run Keyword And Return Status    Click    ${stitch_window_add_files_button_by_name_fallback_xpath}
    END
    IF    not ${add_clicked}
        ${add_clicked}=    Run Keyword And Return Status    Click    ${stitch_window_add_files_button_contains_name_xpath}
    END
    Should Be True    ${add_clicked}    Could not find/click Add Files button in Stitch window.

Rotate Image In Canvas
    [Arguments]    ${direction}
    [Documentation]    Rotate the image currently selected on the Stitch canvas by 90 degrees.
    ...    ${direction}: '90DegreeCounterClockwise' or '90DegreeClockwise'. Case and spacing are ignored, and
    ...    CCW / CW / Left / Right are accepted as shorthand.
    ...
    ...    The rotation buttons belong to the SELECTED IMAGE section, so they only work on a selected canvas
    ...    image — with nothing selected they are disabled, and this keyword says so rather than clicking into
    ...    the void.

    ${key}=    Evaluate    ''.join(str($direction).split()).lower().replace('-', '').replace('_', '')
    # Matched exactly, never with a substring test: '90degreecounterclockwise' ends with 'clockwise', so an
    # `in` check would send a counter-clockwise request to the clockwise button.
    @{counter_clockwise}=    Create List    90degreecounterclockwise    90degreesconterclockwise
    ...    counterclockwise    anticlockwise    ccw    left    rotateleft
    @{clockwise}=    Create List    90degreeclockwise    90degreesclockwise    clockwise    cw    right
    ...    rotateright

    ${is_ccw}=    Evaluate    $key in $counter_clockwise
    ${is_cw}=    Evaluate    $key in $clockwise
    IF    ${is_ccw}
        ${xpath}=    Set Variable    ${stitch_rotate_left_button_xpath}
        ${label}=    Set Variable    90DegreeCounterClockwise
    ELSE IF    ${is_cw}
        ${xpath}=    Set Variable    ${stitch_rotate_right_button_xpath}
        ${label}=    Set Variable    90DegreeClockwise
    ELSE
        Fail    Unsupported rotation '${direction}'. Use 90DegreeCounterClockwise or 90DegreeClockwise.
    END

    Wait Until Element Exist    ${stitch_window_xpath}    5
    Wait Until Element Exist    ${xpath}    5
    ...    The ${label} rotation button was not found in the Stitch window.
    ${enabled}=    Run Keyword And Return Status    Element Should Be Enabled    ${xpath}
    Should Be True    ${enabled}
    ...    The ${label} rotation button is disabled — select an image on the canvas before rotating it.

    ${pressed}=    Run Keyword And Return Status    Invoke Button    ${xpath}
    IF    not ${pressed}
        ${pressed}=    Run Keyword And Return Status    Click    ${xpath}
    END
    Should Be True    ${pressed}    Could not press the ${label} rotation button.
    Sleep    0.4s

Reorder Image In Canvas
    [Arguments]    ${direction}
    [Documentation]    Change the stacking order of the image currently selected on the Stitch canvas.
    ...    ${direction}: 'Forward' to bring it in front of the images it overlaps, 'Back' to send it behind them.
    ...    Case and spacing are ignored, and Front / InFront / Bring Forward / Behind / Backward / Send Back are
    ...    accepted as shorthand.
    ...
    ...    Both buttons belong to the SELECTED IMAGE section, so they only apply to a selected canvas image —
    ...    with nothing selected they are disabled, and this keyword says so rather than pressing a dead button.

    ${key}=    Evaluate    ''.join(str($direction).split()).lower().replace('-', '').replace('_', '')
    # Exact matching, not substring: 'backward' contains 'back' and 'forward' shares its tail, so a loose test
    # would send some requests the wrong way while still passing.
    @{forward_words}=    Create List    forward    front    infront    bringforward    bringtofront
    @{back_words}=    Create List    back    behind    backward    sendback    sendbackward    sendtoback

    ${is_forward}=    Evaluate    $key in $forward_words
    ${is_back}=    Evaluate    $key in $back_words
    IF    ${is_forward}
        ${xpath}=    Set Variable    ${stitch_forward_button_xpath}
        ${label}=    Set Variable    Forward
    ELSE IF    ${is_back}
        ${xpath}=    Set Variable    ${stitch_back_button_xpath}
        ${label}=    Set Variable    Back
    ELSE
        Fail    Unsupported reorder direction '${direction}'. Use Forward or Back.
    END

    Wait Until Element Exist    ${stitch_window_xpath}    5
    Wait Until Element Exist    ${xpath}    5
    ...    The '${label}' button was not found in the Stitch window.
    ${enabled}=    Run Keyword And Return Status    Element Should Be Enabled    ${xpath}
    Should Be True    ${enabled}
    ...    The '${label}' button is disabled — select an image on the canvas before reordering it.

    ${pressed}=    Run Keyword And Return Status    Invoke Button    ${xpath}
    IF    not ${pressed}
        ${pressed}=    Run Keyword And Return Status    Click    ${xpath}
    END
    Should Be True    ${pressed}    Could not press the '${label}' button.
    Sleep    0.4s

Remove Image From Canvas
    [Documentation]    Remove the image currently selected on the Stitch canvas, leaving it in the IMAGE INDEX so
    ...    it can be placed again. Use `Clear Index From Stitch Window` to empty the index itself.
    ...
    ...    The button belongs to the SELECTED IMAGE section, so it only applies to a selected canvas image — with
    ...    nothing selected it is disabled, and this keyword says so rather than pressing a dead button.

    Wait Until Element Exist    ${stitch_window_xpath}    5
    Wait Until Element Exist    ${stitch_remove_button_xpath}    5
    ...    The 'Remove' button (Stitching_Btn_Remove) was not found in the Stitch window.
    ${enabled}=    Run Keyword And Return Status    Element Should Be Enabled    ${stitch_remove_button_xpath}
    Should Be True    ${enabled}
    ...    The 'Remove' button is disabled — select an image on the canvas before removing it.

    ${pressed}=    Run Keyword And Return Status    Invoke Button    ${stitch_remove_button_xpath}
    IF    not ${pressed}
        ${pressed}=    Run Keyword And Return Status    Click    ${stitch_remove_button_xpath}
    END
    Should Be True    ${pressed}    Could not press the 'Remove' button.
    Sleep    0.4s

Clear Canvas
    [Documentation]    Take every image off the Stitch canvas with the 'Clear canvas' button. The IMAGE INDEX is
    ...    left alone — use `Clear Index From Stitch Window` for that.
    ...
    ...    Returns quietly if the button is disabled, since that means the canvas is already empty and clearing
    ...    it again would be asking for the state it is already in.

    Wait Until Element Exist    ${stitch_window_xpath}    5
    Wait Until Element Exist    ${stitch_clear_canvas_button_xpath}    5
    ...    The 'Clear canvas' button (Stitching_Btn_Clear) was not found in the Stitch window.

    Set Retry Timeout    0
    ${enabled}=    Run Keyword And Return Status
    ...    Element Should Be Enabled    ${stitch_clear_canvas_button_xpath}
    IF    not ${enabled}
        Reset Retry Timeout
        Log    'Clear canvas' is disabled; taking the canvas to be empty already.    level=WARN
        RETURN
    END
    ${had_items}=    Run Keyword And Return Status    Element Should Exist    ${stitch_canvas_items_xpath}
    Reset Retry Timeout

    ${pressed}=    Run Keyword And Return Status    Invoke Button    ${stitch_clear_canvas_button_xpath}
    IF    not ${pressed}
        ${pressed}=    Run Keyword And Return Status    Click    ${stitch_clear_canvas_button_xpath}
    END
    Should Be True    ${pressed}    Could not press the 'Clear canvas' button.

    # Only worth asserting when the items were actually visible before the click; otherwise there is nothing
    # to compare against and a missing item locator would fail a clear that worked perfectly well.
    IF    ${had_items}
        Wait Until Element Does Not Exist    ${stitch_canvas_items_xpath}    5
        ...    The canvas still holds images after pressing 'Clear canvas'.
    END
    Sleep    0.3s

Take Stitch View Screenshot
    [Arguments]    ${filename}    ${xpath}=${stitch_canvas_view_xpath}
    [Documentation]    Capture the Stitch window's canvas view and save it into the Actual folder as ${filename},
    ...    ready for `Compare Result Images`. Mirrors `Take Actual Screenshot`, but framed on the canvas
    ...    (Stitching_CanvasScroll) instead of the main image viewer.
    ...    ${filename}: name to save as, e.g. MFRTA17_Canvas.png.
    ...    ${xpath}: region to capture — defaults to the canvas; pass ${stitch_window_xpath} for the whole window.
    ...
    ...    Returns: the full path the screenshot was saved to.

    Wait Until Element Exist    ${xpath}    5
    Sleep    0.2s    # Let any pending canvas redraw finish before capturing
    ${screenshot_path}=    Take Screenshot    ${xpath}
    Log    Screenshot saved to (temporary): ${screenshot_path}

    ${dest}=    Set Variable    ${actual_image}${filename}
    Create Directory    ${actual_image}
    Move File    ${screenshot_path}    ${dest}

    Log    Screenshot moved to: ${dest}
    RETURN    ${dest}

Take Stitch Window Screenshot
    [Arguments]    ${filename}
    [Documentation]    Capture the whole Stitch window — title bar, IMAGE INDEX, canvas and the controls on the
    ...    right — and save it into the Actual folder as ${filename}, ready for `Compare Result Images`.
    ...    Use `Take Stitch View Screenshot` instead when only the canvas matters; a full-window shot also picks
    ...    up the index and the option controls, so unrelated changes there will show as differences.
    ...    ${filename}: name to save as, e.g. MFRTA17_StitchWindow.png.
    ...
    ...    Returns: the full path the screenshot was saved to.

    ${dest}=    Take Stitch View Screenshot    ${filename}    ${stitch_window_xpath}
    RETURN    ${dest}

Take Stitched Result Screenshot
    [Arguments]    ${filename}
    [Documentation]    Capture just the stitched output image and save it into the Actual folder as ${filename},
    ...    ready for `Compare Result Images`.
    ...
    ...    The result image only exists once a stitch has produced one, so call this after `Run Stitch Process` —
    ...    before that the capture fails with a locator error rather than saving an empty or stale picture.
    ...    Framing on the result rather than the canvas keeps the baseline free of the surrounding chrome, so
    ...    zoom level, selection handles and canvas background cannot cause a false difference.
    ...    ${filename}: name to save as, e.g. MFRTA18_Result.png.
    ...
    ...    Returns: the full path the screenshot was saved to.

    ${dest}=    Take Stitch View Screenshot    ${filename}    ${stitch_result_image_xpath}
    RETURN    ${dest}

Click Stitch Window Add All Button
    [Documentation]    Press 'Add all' in the Stitch window, which puts every image currently open in the viewer
    ...    into the IMAGE INDEX.
    ...
    ...    Pressing goes through the UIA Invoke pattern first, with a real mouse click as fallback — Invoke needs
    ...    no clickable point, so it works even if the button is scrolled out of view.
    ...
    ...    How many cards this adds depends on what is open in the viewer and on the 'Show recent' cap, so the
    ...    keyword deliberately asserts nothing about the outcome; use `Verify Files Added In Stitch Window` for
    ...    that.

    Wait Until Element Exist    ${stitch_window_xpath}    5
    Wait Until Element Exist    ${stitch_window_add_all_button_xpath}    5
    ...    'Add all' (Stitching_Btn_AddAll) was not found in the Stitch window.

    ${pressed}=    Run Keyword And Return Status
    ...    Invoke Button    ${stitch_window_add_all_button_xpath}
    IF    not ${pressed}
        ${pressed}=    Run Keyword And Return Status
        ...    Click    ${stitch_window_add_all_button_xpath}
    END
    Should Be True    ${pressed}    Could not press the 'Add all' button in the Stitch window.
    Sleep    0.5s

Get Stitch Open File Dialog Locators
    ${input_found}=    Run Keyword And Return Status
    ...    Wait Until Element Exist    ${stitch_file_dialog_input_xpath}    2
    IF    ${input_found}
        RETURN    ${stitch_file_dialog_input_xpath}    ${stitch_file_dialog_open_button_xpath}
    END
    ${generic_input_xpath}=    Get Open File Dialog Input Locator
    RETURN    ${generic_input_xpath}    ${EMPTY}

Verify Files Added In Stitch Window
    [Arguments]    @{file_paths}
    [Documentation]    Verify that each given file has a card in the Stitch window's IMAGE INDEX.
    ...
    ...    The index is an ItemsControl of cards (Stitching_SourceList). Each card carries its file name in its
    ...    own TextBlock, while the DataItem wrapping it is named after the view model class — so a file is only
    ...    ever recognisable by the card's text, and the search is scoped to the list rather than to the whole
    ...    window, which also holds hint text and the canvas.
    ...
    ...    Only file names are compared, so full paths can be passed in.

    ${clean_file_paths}=    Evaluate    [str(p).strip() for p in $file_paths if str(p).strip()]
    ${path_count}=    Evaluate    len($clean_file_paths)
    Should Be True    ${path_count} > 0    Provide at least one file path to verify in Stitch window.

    Wait Until Element Exist    ${stitch_window_xpath}    5
    Wait Until Element Exist    ${stitch_source_list_xpath}    5
    ...    The Stitch window's image index (Stitching_SourceList) is not present.

    FOR    ${file_path}    IN    @{clean_file_paths}
        ${file_name}=    Evaluate    __import__('os').path.basename($file_path)

        ${found}=    Run Keyword And Return Status
        ...    Wait Until Element Exist    ${stitch_source_list_xpath}//Text[@Name="${file_name}"]    2
        IF    not ${found}
            # A long name may be shown elided, so fall back to a partial match on the card text.
            ${found}=    Run Keyword And Return Status
            ...    Wait Until Element Exist    ${stitch_source_list_xpath}//*[contains(@Name,"${file_name}")]    2
        END

        IF    not ${found}
            ${card_count}=    Get Stitch Index Card Count
            ${summary}=    Get Stitch Index Summary
            Fail    File '${file_name}' has no card in the Stitch image index. The index holds ${card_count} card(s) and the window reports: '${summary}'. If more files were expected, the 'Show recent' limit may be capping what the index shows.
        END
    END

Get Stitch Index Card Count
    [Documentation]    Return how many cards the Stitch image index currently holds. Used to make a missing-file
    ...    failure diagnosable — 'expected 6, index holds 5' points straight at the 'Show recent' cap.

    Set Retry Timeout    0
    ${count}=    Set Variable    ${0}
    FOR    ${index}    IN RANGE    1    51
        ${exists}=    Run Keyword And Return Status
        ...    Element Should Exist    ${stitch_source_list_xpath}/DataItem[${index}]
        IF    not ${exists}    BREAK
        ${count}=    Set Variable    ${index}
    END
    Reset Retry Timeout
    RETURN    ${count}

Get Stitch Index Summary
    [Documentation]    Return the index's own summary line ("Showing all N image(s) open in the viewer."), or a
    ...    placeholder when it cannot be read. Reported alongside a missing-file failure.

    ${read_ok}    ${summary}=    Run Keyword And Ignore Error
    ...    Get Name From Element    ${stitch_recent_summary_text_xpath}
    IF    '${read_ok}' != 'PASS'    RETURN    summary unavailable
    RETURN    ${summary}

Clear Index From Stitch Window
    [Documentation]    Empty the Stitch window's IMAGE INDEX by pressing 'Clear index', then wait until no cards are
    ...    left — so a press that did not register fails here rather than as a puzzling result in the next step.
    ...
    ...    The button is pressed through the UIA Invoke pattern first, falling back to a real mouse click: Invoke
    ...    needs no clickable point, so it works even when the button is scrolled out of view.
    ...    The pre-redesign id (Stitching_Btn_ClearAll) is kept as a last resort for older builds.

    Wait Until Element Exist    ${stitch_window_xpath}    5
    Wait Until Element Exist    ${stitch_window_clear_index_button_xpath}    5
    ...    'Clear index' (Stitching_Btn_ClearIndex) was not found in the Stitch window.

    ${pressed}=    Run Keyword And Return Status
    ...    Invoke Button    ${stitch_window_clear_index_button_xpath}
    IF    not ${pressed}
        ${pressed}=    Run Keyword And Return Status
        ...    Click    ${stitch_window_clear_index_button_xpath}
    END
    IF    not ${pressed}
        Click    ${stitch_window_clearall_button_xpath}
    END

    Wait Until Element Does Not Exist    ${stitch_source_list_xpath}/DataItem[1]    5
    ...    The Stitch image index still holds cards after pressing 'Clear index'.
    Sleep    0.2s

Clear All Files From Stitch Window
    [Documentation]    Older name for `Clear Index From Stitch Window`, kept so existing tests keep working.
    ...    Prefer the new name — it matches what the button is now called in the UI.

    Clear Index From Stitch Window

Verify No Files In Stitch Window
    [Documentation]    Verify no files are listed in Stitch window.
    Wait Until Element Exist    ${stitch_window_xpath}    5
    ${dcm_entries_xpath}=    Set Variable
    ...    ${stitch_window_xpath}//*[contains(@Name,'.dcm') or contains(@Name,'.DCM')]
    ${files_present}=    Run Keyword And Return Status
    ...    Wait Until Element Exist    ${dcm_entries_xpath}    1
    Should Not Be True
    ...    ${files_present}
    ...    Expected no files in Stitch window, but one or more file entries are still visible.

Run Stitch Process
    [Arguments]    ${mode}=Auto    ${detector}=${EMPTY}    ${blend_levels}=${EMPTY}    ${min_confidence}=${EMPTY}
    ...    ${window_level}=${EMPTY}    ${invert_image}=${EMPTY}    ${edge_blend}=${EMPTY}    ${feather}=${EMPTY}
    ...    ${timeout}=60
    [Documentation]    Run the stitch and wait for it to finish.
    ...
    ...    ${mode}: 'Auto' presses Auto Stitch and lets the app work everything out — no other argument applies.
    ...    'Manual' applies whichever settings are given and then presses Stitch (manual layout).
    ...
    ...    Every setting is optional and only touched when supplied, so a test can change one thing and leave the
    ...    rest of the panel alone. Settings are named for their UI labels:
    ...    ${detector}: 'Detector (auto)' dropdown, e.g. 'SIFT (robust)'.
    ...    ${blend_levels}: 'Blend levels' (1-8).
    ...    ${min_confidence}: 'Min confidence (auto)' (0.05-0.50).
    ...    ${window_level}: 'Window level' dropdown, e.g. 'Auto Best Contrast'.
    ...    ${invert_image}: 'Invert image' checkbox — on/off, yes/no, true/false.
    ...    ${edge_blend}: 'Edge blend (feather overlaps)' checkbox — same accepted values.
    ...    ${feather}: 'Feather' percentage.
    ...    ${timeout}: seconds to wait for the stitch to complete. Defaults to 60.
    ...
    ...    Completion is detected by the 'Back to Edit' button appearing, which only exists once a stitch has
    ...    produced a result.

    ${mode_key}=    Evaluate    ''.join(str($mode).split()).lower()
    Wait Until Element Exist    ${stitch_window_xpath}    5
    Focus    ${stitch_window_xpath}
    Sleep    0.2s

    IF    '${mode_key}' == 'auto'
        ${settings}=    Create List    ${detector}    ${blend_levels}    ${min_confidence}
        ...    ${window_level}    ${invert_image}    ${edge_blend}    ${feather}
        ${supplied}=    Evaluate    [v for v in $settings if str(v).strip()]
        IF    ${supplied}
            Log    Auto mode works the settings out for itself; these arguments are ignored: ${supplied}    level=WARN
        END
        Press Stitch Run Button    ${stitch_auto_stitch_button_xpath}    Auto Stitch
    ELSE IF    '${mode_key}' == 'manual'
        Set Stitch Manual Parameters    ${detector}    ${blend_levels}    ${min_confidence}
        ...    ${window_level}    ${invert_image}    ${edge_blend}    ${feather}
        Press Stitch Run Button    ${stitch_apply_manual_button_xpath}    Stitch (manual layout)
    ELSE
        Fail    Unsupported stitch mode '${mode}'. Use 'Auto' or 'Manual'.
    END

    Wait Until Element Exist    ${stitch_back_to_edit_button_xpath}    ${timeout}
    ...    Stitching did not finish within ${timeout}s — the 'Back to Edit' button never appeared.
    Sleep    0.5s

Set Stitch Manual Parameters
    [Arguments]    ${detector}    ${blend_levels}    ${min_confidence}
    ...    ${window_level}    ${invert_image}    ${edge_blend}    ${feather}
    [Documentation]    Apply the manual-mode settings that were supplied, leaving the rest untouched.
    ...    Edge blend and Feather sit on the panel itself; the other four live behind the 'Output options'
    ...    expander, which is opened only if one of them was asked for and closed again afterwards.

    ${edge_blend_bool}=    Set Variable    ${None}
    IF    '${edge_blend}' != '${EMPTY}'
        ${edge_blend_bool}=    Convert User Input To Boolean    ${edge_blend}    Edge Blend
    END

    # Feather only has meaning while edge blending is on, and the app disables its input when it is off.
    # Asking for both at once cannot be honoured, so reject it before changing anything rather than applying
    # half the request and then failing on a disabled textbox.
    IF    '${feather}' != '${EMPTY}' and $edge_blend_bool is False
        Fail    feather=${feather} conflicts with edge_blend=${edge_blend}: Feather only applies while 'Edge blend (feather overlaps)' is ticked, and its input is disabled while it is not. Either drop the feather argument or pass edge_blend=yes.
    END

    IF    $edge_blend_bool is not None
        Set Checkbox State    ${stitch_edge_blend_checkbox_xpath}    ${edge_blend_bool}
        Sleep    0.2s
    END
    IF    '${feather}' != '${EMPTY}'
        # Feather is greyed out until edge blending is on, so a value asked for without edge_blend=yes could
        # never be applied. Turn it on rather than failing — asking for a feather amount says you want it.
        IF    '${edge_blend}' == '${EMPTY}'
            ${feather_enabled}=    Run Keyword And Return Status
            ...    Element Should Be Enabled    ${stitch_feather_nud_input_xpath}
            IF    not ${feather_enabled}
                Log    feather was given without edge_blend, and the Feather input is disabled; ticking 'Edge blend (feather overlaps)' so the value can be applied.    level=WARN
                Set Checkbox State    ${stitch_edge_blend_checkbox_xpath}    ${True}
                Sleep    0.3s
            END
        END
        Set Stitch Numeric Input Value    ${stitch_feather_nud_input_xpath}    ${feather}    0    100    Feather
        ...    enabled_by=with 'Edge blend (feather overlaps)' ticked — pass edge_blend=yes
    END

    ${expander_settings}=    Create List    ${detector}    ${blend_levels}    ${min_confidence}
    ...    ${window_level}    ${invert_image}
    ${needs_expander}=    Evaluate    any(str(v).strip() for v in $expander_settings)
    IF    not ${needs_expander}    RETURN

    Expand Stitch Output Options

    IF    '${detector}' != '${EMPTY}'
        ${detector_options}=    Get All Names From Combobox    ${stitch_detector_combobox_xpath}
        ${detector_valid}=    Evaluate    $detector in $detector_options
        Should Be True    ${detector_valid}
        ...    Unsupported Detector: ${detector}. Available options: ${detector_options}
        Select Combobox Item By Name    ${stitch_detector_combobox_xpath}    ${detector}
        Sleep    0.2s
    END
    IF    '${blend_levels}' != '${EMPTY}'
        Set Stitch Numeric Input Value    ${stitch_blend_levels_nud_input_xpath}    ${blend_levels}    1    8    Blend Levels
    END
    IF    '${min_confidence}' != '${EMPTY}'
        Set Stitch Numeric Input Value    ${stitch_min_confidence_nud_input_xpath}    ${min_confidence}    0.05    0.50    Min Confidence
    END
    IF    '${window_level}' != '${EMPTY}'
        ${window_level_options}=    Get All Names From Combobox    ${stitch_window_level_combobox_xpath}
        ${window_level_valid}=    Evaluate    $window_level in $window_level_options
        Should Be True    ${window_level_valid}
        ...    Unsupported Window Level: ${window_level}. Available options: ${window_level_options}
        Select Combobox Item By Name    ${stitch_window_level_combobox_xpath}    ${window_level}
        Sleep    0.2s
    END
    IF    '${invert_image}' != '${EMPTY}'
        ${invert_image_bool}=    Convert User Input To Boolean    ${invert_image}    Invert Image
        Set Checkbox State    ${stitch_invert_image_checkbox_xpath}    ${invert_image_bool}
        Sleep    0.2s
    END

    Collapse Stitch Output Options

Get Stitch Output Options State
    [Documentation]    Return 'Expanded' or 'Collapsed' for the 'Output options' expander. Read from the
    ...    ExpandCollapse pattern on the expander itself; if that cannot be read — the Group is addressed by
    ...    position and could move — fall back to whether the controls inside it are reachable.

    ${read_ok}    ${state}=    Run Keyword And Ignore Error
    ...    Get Property From Element    ${stitch_output_options_group_xpath}    EXPAND_COLLAPSE_STATE
    IF    '${read_ok}' == 'PASS'    RETURN    ${state}

    Set Retry Timeout    0
    ${content_reachable}=    Run Keyword And Return Status
    ...    Element Should Exist    ${stitch_detector_combobox_xpath}
    Reset Retry Timeout
    IF    ${content_reachable}    RETURN    Expanded
    RETURN    Collapsed

Toggle Stitch Output Options
    [Documentation]    Press the expander header once, through Invoke where possible so it works regardless of
    ...    where the header has scrolled to.

    Wait Until Element Exist    ${stitch_output_options_header_xpath}    5
    ...    The 'Output options' expander header (HeaderSite) was not found in the Stitch window.
    ${pressed}=    Run Keyword And Return Status    Invoke Button    ${stitch_output_options_header_xpath}
    IF    not ${pressed}
        Click    ${stitch_output_options_header_xpath}
    END
    Sleep    0.3s

Expand Stitch Output Options
    [Documentation]    Open the 'Output options' expander, doing nothing if it is already open.

    ${state}=    Get Stitch Output Options State
    IF    '${state}' == 'Expanded'    RETURN
    Toggle Stitch Output Options
    Wait Until Element Exist    ${stitch_detector_combobox_xpath}    5
    ...    'Output options' was expanded but its controls did not appear.

Collapse Stitch Output Options
    [Documentation]    Close the 'Output options' expander, doing nothing if it is already closed. Checking the
    ...    state first matters: a blind second click would re-open it whenever something else had closed it.

    ${state}=    Get Stitch Output Options State
    IF    '${state}' == 'Collapsed'    RETURN
    Toggle Stitch Output Options

Exit Stitched Result View
    [Documentation]    Leave the stitched result view and go back to the canvas by pressing 'Back to Edit', then
    ...    wait for that button to disappear — it exists only while a result is being shown, so its absence is
    ...    the confirmation that the view actually switched.
    ...
    ...    Call this after capturing the result if the test carries on working with the canvas; a run left in the
    ...    result view would otherwise have the next canvas step acting on a view that is not there.

    Wait Until Element Exist    ${stitch_back_to_edit_button_xpath}    5
    ...    'Back to Edit' was not found — the Stitch window does not appear to be showing a result.
    ${pressed}=    Run Keyword And Return Status
    ...    Invoke Button    ${stitch_back_to_edit_button_xpath}
    IF    not ${pressed}
        ${pressed}=    Run Keyword And Return Status    Click    ${stitch_back_to_edit_button_xpath}
    END
    Should Be True    ${pressed}    Could not press the 'Back to Edit' button.
    Wait Until Element Does Not Exist    ${stitch_back_to_edit_button_xpath}    10
    ...    Still showing the stitched result after pressing 'Back to Edit'.
    Sleep    0.3s

Press Stitch Run Button
    [Arguments]    ${xpath}    ${description}
    [Documentation]    Press one of the two stitch buttons, Invoke first with a real click as fallback.

    Wait Until Element Exist    ${xpath}    5
    ...    The '${description}' button was not found in the Stitch window.
    ${pressed}=    Run Keyword And Return Status    Invoke Button    ${xpath}
    IF    not ${pressed}
        ${pressed}=    Run Keyword And Return Status    Click    ${xpath}
    END
    Should Be True    ${pressed}    Could not press the '${description}' button.
    Sleep    1s

Set Stitch Numeric Input Value
    [Arguments]    ${input_xpath}    ${value}    ${minimum}    ${maximum}    ${field_name}    ${enabled_by}=${EMPTY}
    [Documentation]    Set a stitch numeric value through the NUD text input and verify the applied value.
    ...    ${enabled_by}: what has to be true for the input to be editable, quoted back in the failure message
    ...    when it is disabled.

    ${value}=    Convert To Number    ${value}
    ${minimum}=    Convert To Number    ${minimum}
    ${maximum}=    Convert To Number    ${maximum}
    Should Be True
    ...    ${minimum} <= ${value} <= ${maximum}
    ...    ${field_name} must be between ${minimum} and ${maximum}. Received: ${value}

    ${value_text}=    Evaluate    str($value).rstrip('0').rstrip('.') if '.' in str($value) else str($value)
    Wait Until Element Exist    ${input_xpath}    2

    # A disabled input rejects ValuePattern.SetValue with a bare COM ElementNotEnabledException that names
    # nothing, so check first and say which field it was and what would make it editable.
    ${is_enabled}=    Run Keyword And Return Status    Element Should Be Enabled    ${input_xpath}
    IF    not ${is_enabled}
        ${hint}=    Set Variable If    '${enabled_by}' == '${EMPTY}'
        ...    ${EMPTY}    ${SPACE}It only becomes editable ${enabled_by}.
        Fail    Cannot set ${field_name} to ${value_text}: the input is disabled.${hint}
    END

    Set Text To Textbox    ${input_xpath}    ${value_text}
    Sleep    0.05s

    ${applied_text}=    Get Text From Textbox    ${input_xpath}
    ${has_value}=    Evaluate    __import__('re').search(r'-?\\d+(?:\\.\\d+)?', str($applied_text)) is not None
    Should Be True    ${has_value}    Could not read numeric value from ${field_name} input: ${applied_text}
    ${applied_value}=    Evaluate    float(__import__('re').search(r'-?\\d+(?:\\.\\d+)?', str($applied_text)).group())
    ${difference}=    Evaluate    abs($applied_value - $value)
    Should Be True
    ...    ${difference} <= 0.0001
    ...    ${field_name} mismatch. Requested ${value}, but input shows ${applied_value}.

Save Stitched Image
    [Arguments]    ${output_folder}    ${save_format}=PNG    ${file_name}=${EMPTY}
    [Documentation]    Save the stitched result to ${output_folder} in the requested format, via the 'Save Image'
    ...    button and the Windows Save-As dialog it opens.
    ...    ${output_folder}: folder to save into; created if it does not exist.
    ...    ${save_format}: PNG, JPEG/JPG, TIFF/TIF, BMP or DICOM/DCM.
    ...    ${file_name}: name without extension. Defaults to a timestamped name when omitted.
    ...
    ...    Returns: the full path of the saved file, once it has actually appeared on disk.

    Wait Until Element Exist    ${stitch_window_xpath}    5
    Wait Until Element Exist    ${stitch_save_image_button_xpath}    5
    ...    The 'Save Image' button (Stitching_Btn_Save) was not found — has a stitch been run yet?

    ${format_label}    ${file_extension}=    Get Stitch Save Format Details    ${save_format}

    Should Not Be Empty    ${output_folder}    Output folder is required to save the stitched image.
    Create Directory    ${output_folder}

    IF    str($file_name).strip() == ''
        ${file_name}=    Evaluate    __import__('datetime').datetime.now().strftime('StitchImage_%Y%m%d_%H%M%S')
    ELSE
        ${file_name}=    Evaluate    __import__('os').path.splitext(str($file_name).strip())[0]
    END

    ${save_file_name}=    Set Variable    ${file_name}.${file_extension}
    ${save_file_path}=    Join Path    ${output_folder}    ${save_file_name}
    ${file_already_exists}=    Evaluate    __import__('os').path.exists($save_file_path)

    ${pressed}=    Run Keyword And Return Status    Invoke Button    ${stitch_save_image_button_xpath}
    IF    not ${pressed}
        ${pressed}=    Run Keyword And Return Status    Click    ${stitch_save_image_button_xpath}
    END
    Should Be True    ${pressed}    Could not press the 'Save Image' button.
    Wait Until Element Exist    ${stitch_save_dialog_xpath}    10
    ...    The '${stitch_save_dialog_title}' dialog did not open after pressing 'Save Image'.

    # Type first, then the name: changing the type rewrites the name box, so doing it the other way round
    # would throw the name away. The pause lets that rewrite land before the name is typed over it.
    Select Stitch Save Format    ${format_label}
    Sleep    0.6s

    Set Stitch Save Dialog File Name    ${save_file_path}
    # Last look before committing — if anything has rewritten the box since, put the name back.
    ${final_ok}    ${final_name}=    Run Keyword And Ignore Error
    ...    Get Text From Textbox    ${stitch_save_dialog_filename_xpath}
    ${still_right}=    Run Keyword And Return Status
    ...    Should Be Equal As Strings    ${final_name}    ${save_file_path}
    IF    not ${still_right}
        Log    File name box drifted to '${final_name}' before saving; setting it again.    level=WARN
        Set Stitch Save Dialog File Name    ${save_file_path}
    END
    Press Stitch Save Dialog Save Button
    Handle Stitch Save Overwrite Warning If Present    ${file_already_exists}
    Win Wait Close    ${stitch_save_dialog_title}    ${EMPTY}    10

    Wait Until Keyword Succeeds    30x    1s    File Should Exist    ${save_file_path}
    RETURN    ${save_file_path}

Get Stitch Save Format Selection
    [Documentation]    Return the 'Save as type' entry currently showing, or an empty string if it cannot be read.

    ${read_ok}    ${selection}=    Run Keyword And Ignore Error
    ...    Control Command    ${stitch_save_dialog_title}    ${EMPTY}
    ...    ${stitch_save_filetype_control}    GetCurrentSelection    ${EMPTY}
    IF    '${read_ok}' != 'PASS'    RETURN    ${EMPTY}
    RETURN    ${selection}

Select Stitch Save Format
    [Arguments]    ${format_label}
    [Documentation]    Choose ${format_label} in the Save dialog's 'Save as type' list, by keyboard.
    ...
    ...    The control is a DirectUI AppControlHost, not a real combobox: expanding it exposes no items at all,
    ...    so `Select Combobox Item By Name` and AutoIt's SelectString both succeed while changing nothing —
    ...    which is how a TIFF run quietly saved a PNG. Opening the list and typing the entry's first letter does
    ...    work, and the selection is read back to prove it.
    ...
    ...    Typing the letter again cycles through entries sharing that initial, so the loop copes if two formats
    ...    ever start with the same letter (today PNG/JPEG/TIFF/BMP/DICOM are all distinct).

    ${current}=    Get Stitch Save Format Selection
    IF    '${current}' == '${format_label}'    RETURN

    ${initial}=    Evaluate    str($format_label).strip()[0]
    FOR    ${attempt}    IN RANGE    6
        Click    ${stitch_save_dialog_filetype_xpath}
        Sleep    0.4s
        AutoItLibrary.Send    ${initial}
        Sleep    0.3s
        AutoItLibrary.Send    {ENTER}
        Sleep    0.4s
        ${current}=    Get Stitch Save Format Selection
        IF    '${current}' == '${format_label}'    RETURN
    END

    Fail    Could not select '${format_label}' in 'Save as type'; it is showing '${current}'. Check the entry's exact wording — the label has to match the dialog text character for character.

Set Stitch Save Dialog File Name
    [Arguments]    ${file_path}
    [Documentation]    Put ${file_path} into the Save-As dialog's 'File name' box.
    ...
    ...    Locates the box the same way `Export Audit Log` does, through the dialog's FileNameControlHost — the
    ...    route already proven against this app. AutoIt's [CLASS:Edit] identifiers are kept only as a last
    ...    resort: in the modern dialog the box lives inside a ComboBoxEx, so that index lands on a different
    ...    control, writes there quite happily, and the dialog saves under its own default name instead.
    ...
    ...    Reading the value back is only a partial check — writing to the wrong control and reading that same
    ...    control also matches — so locators are tried strictly best-known-first rather than first-that-answers.

    @{filename_xpaths}=    Create List    ${stitch_save_dialog_filename_xpath}
    ...    ${stitch_save_dialog_filename_host_xpath}    ${stitch_save_dialog_filename_by_name_xpath}

    # Typed with real keystrokes rather than set through UIA. Writing the value with Set Text To Textbox puts
    # the text on screen — it reads back correctly from both UIA and AutoIt — but the shell does not register
    # it as an edit, so on Save it uses its own remembered name instead. That is how a TIFF run wrote
    # 'stitched.tiff': the box showed the right path the whole time. PNG only escaped it because no filter
    # change occurred, which leaves the shell's own name state alone. Same reasoning as `Set Audit Log Date
    # Field`, which types into its picker for the same reason.
    ${box}=    Set Variable    ${EMPTY}
    FOR    ${xpath}    IN    @{filename_xpaths}
        ${exists}=    Run Keyword And Return Status    Wait Until Element Exist    ${xpath}    2
        IF    ${exists}
            ${box}=    Set Variable    ${xpath}
            BREAK
        END
    END
    Should Not Be Empty    ${box}
    ...    Could not find the Save dialog's 'File name' box with any known locator.

    FOR    ${attempt}    IN RANGE    3
        Click    ${box}
        Sleep    0.2s
        AutoItLibrary.Send    ^a
        Sleep    0.1s
        AutoItLibrary.Send    {DEL}
        Sleep    0.1s
        AutoItLibrary.Send    ${file_path}    1
        Sleep    0.4s
        ${read_ok}    ${current}=    Run Keyword And Ignore Error    Get Text From Textbox    ${box}
        ${matches}=    Run Keyword And Return Status
        ...    Should Be Equal As Strings    ${current}    ${file_path}
        IF    ${matches}
            Log    File name typed into ${box} (attempt ${attempt})
            RETURN
        END
    END

    Fail    Could not get '${file_path}' to stay in the Save dialog's 'File name' box; it currently reads '${current}'. Saving now would fall back to the dialog's default name.

Press Stitch Save Dialog Save Button
    [Documentation]    Press Save in the Save-As dialog.
    ...
    ...    Deliberately by AutomationId '1' rather than by an AutoIt class instance: in this dialog only Save and
    ...    Cancel carry the native class 'Button', so [CLASS:Button; INSTANCE:2] resolves to Cancel and quietly
    ...    throws the save away.

    Wait Until Element Exist    ${stitch_save_dialog_save_button_xpath}    5
    ...    The Save button was not found in the '${stitch_save_dialog_title}' dialog.
    ${pressed}=    Run Keyword And Return Status
    ...    Invoke Button    ${stitch_save_dialog_save_button_xpath}
    IF    not ${pressed}
        ${pressed}=    Run Keyword And Return Status    Click    ${stitch_save_dialog_save_button_xpath}
    END
    Should Be True    ${pressed}    Could not press Save in the '${stitch_save_dialog_title}' dialog.
    Sleep    0.3s

Handle Stitch Save Overwrite Warning If Present
    [Arguments]    ${overwrite_expected}=${False}
    [Documentation]    If an overwrite confirmation appears during Stitch export, confirm it by clicking Yes.

    IF    not ${overwrite_expected}
        RETURN
    END

    ${overwrite_visible}=    Run Keyword And Return Status
    ...    Win Wait Active    ${stitch_save_overwrite_dialog_title}    ${EMPTY}    2

    ${yes_clicked}=    Set Variable    ${False}
    IF    ${overwrite_visible}
        ${yes_clicked}=    Run Keyword And Return Status
        ...    Control Click
        ...    ${stitch_save_overwrite_dialog_title}
        ...    ${EMPTY}
        ...    ${stitch_save_overwrite_yes_button_control}
    END
    IF    not ${yes_clicked}
        ${yes_clicked}=    Run Keyword And Return Status
        ...    Control Click
        ...    [ACTIVE]
        ...    ${EMPTY}
        ...    ${stitch_save_overwrite_yes_button_control}
    END
    IF    not ${yes_clicked}
        ${yes_clicked}=    Run Keyword And Return Status
        ...    Control Click
        ...    [ACTIVE]
        ...    ${EMPTY}
        ...    ${stitch_save_overwrite_yes_button_fallback_control}
    END
    IF    not ${yes_clicked}
        ${yes_clicked}=    Run Keyword And Return Status
        ...    Control Click
        ...    [ACTIVE]
        ...    ${EMPTY}
        ...    ${stitch_save_overwrite_yes_button_instance_control}
    END
    IF    not ${yes_clicked}
        ${alt_y_sent}=    Run Keyword And Return Status    Send    !y
        Sleep    0.2s
        ${yes_clicked}=    Set Variable    ${alt_y_sent}
    END

    Should Be True    ${yes_clicked}    Stitch export overwrite warning was expected, but the Yes confirmation could not be completed.
    Sleep    0.2s

Get Stitch Save Format Details
    [Arguments]    ${save_format}
    [Documentation]    Return the Save-As dialog's 'Save as type' label and the file extension for the requested
    ...    format. The label has to match the dialog entry exactly, since it is selected by string.

    ${normalized_format}=    Evaluate    str($save_format).strip().lower()

    IF    '${normalized_format}' == 'png'
        RETURN    PNG (*.png)    png
    END
    IF    '${normalized_format}' == 'jpeg' or '${normalized_format}' == 'jpg'
        RETURN    JPEG (*.jpg)    jpg
    END
    # Not offered by the dialog yet — added ahead of the build that introduces it. The label follows the
    # pattern of the others and will need correcting if the real entry is worded differently.
    IF    '${normalized_format}' == 'dicom' or '${normalized_format}' == 'dcm'
        RETURN    DICOM (*.dcm)    dcm
    END
    IF    '${normalized_format}' == 'tiff' or '${normalized_format}' == 'tif'
        RETURN    TIFF (*.tiff)    tiff
    END
    IF    '${normalized_format}' == 'bmp' or '${normalized_format}' == 'bitmap'
        RETURN    BMP (*.bmp)    bmp
    END

    Fail    Unsupported stitch save format: ${save_format}. Use PNG, JPEG, TIFF, BMP or DICOM.

Get Stitch Slider Display Value
    [Arguments]    ${value_text_xpath}

    ${label_text}=    Get Name From Element    ${value_text_xpath}
    ${has_value}=    Evaluate    __import__('re').search(r'\\d+', $label_text) is not None
    Should Be True    ${has_value}    Could not extract a numeric value from: ${label_text}
    ${value}=    Evaluate    int(__import__('re').search(r'\\d+', $label_text).group())
    RETURN    ${value}

Set Stitch Slider Value
    [Arguments]    ${slider_xpath}    ${value}    ${value_text_xpath}    ${minimum}    ${maximum}
    [Documentation]    Set a stitch slider value by dragging its thumb and verifying the displayed label.

    ${value}=    Convert To Integer    ${value}
    ${minimum}=    Convert To Integer    ${minimum}
    ${maximum}=    Convert To Integer    ${maximum}
    Should Be True
    ...    ${minimum} <= ${value} <= ${maximum}
    ...    Slider value must be between ${minimum} and ${maximum}. Received: ${value}

    ${current}=    Get Stitch Slider Display Value    ${value_text_xpath}
    IF    ${current} == ${value}
        RETURN
    END

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
    ${target_ratio}=    Evaluate    (${value} - ${minimum}) / (${maximum} - ${minimum})
    ${target_x}=    Evaluate    int(${min_x} + ((${max_x} - ${min_x}) * ${target_ratio}))
    ${target_y}=    Evaluate    int(${slider_y} + (${slider_height} / 2))

    AutoItLibrary.Mouse Click Drag    left    ${start_x}    ${start_y}    ${target_x}    ${target_y}
    Sleep    0.1s

    ${current}=    Get Stitch Slider Display Value    ${value_text_xpath}
    ${pixels_per_unit}=    Evaluate    max(1.0, (${max_x} - ${min_x}) / (${maximum} - ${minimum}))

    FOR    ${attempt}    IN RANGE    60
        IF    ${current} == ${value}
            BREAK
        END
        ${delta}=    Evaluate    ${value} - ${current}
        ${abs_delta}=    Evaluate    abs(${delta})
        ${direction}=    Set Variable If    ${delta} > 0    1    -1
        ${coarse_step}=    Evaluate    int(max(1, round(${abs_delta} * ${pixels_per_unit} * 0.6)))
        ${step_pixels}=    Set Variable If    ${abs_delta} <= 1    1    ${coarse_step}
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
        Sleep    0.03s
        ${current}=    Get Stitch Slider Display Value    ${value_text_xpath}
    END

    Should Be Equal As Integers    ${current}    ${value}
    ...    Slider mismatch. Requested ${value}, but applied ${current}.

Scroll Stitch Configuration To Bottom
    [Documentation]    Scroll the Stitch configuration pane down so the Invert Image checkbox is visible.

    Focus    ${stitch_configuration_scrollviewer_xpath}
    ${invert_visible}=    Is Stitch Configuration Element Visible    ${stitch_invert_image_checkbox_xpath}
    IF    ${invert_visible}
        RETURN
    END

    FOR    ${index}    IN RANGE    10
        Scroll Down    ${stitch_configuration_scrollviewer_xpath}    1
        Sleep    0.05s
        ${invert_visible}=    Is Stitch Configuration Element Visible    ${stitch_invert_image_checkbox_xpath}
        IF    ${invert_visible}
            BREAK
        END
    END

    Should Be True    ${invert_visible}    Invert Image checkbox is not visible after scrolling the Stitch configuration pane.
    Sleep    0.1s

Is Stitch Configuration Element Visible
    [Arguments]    ${element_xpath}

    ${container_rect}=    Get Rectangle Bounding From Element    ${stitch_configuration_scrollviewer_xpath}    BoundingRectangle
    ${element_rect}=    Get Rectangle Bounding From Element    ${element_xpath}    BoundingRectangle

    ${container_x}=    Get From List    ${container_rect}    0
    ${container_y}=    Get From List    ${container_rect}    1
    ${container_width}=    Get From List    ${container_rect}    2
    ${container_height}=    Get From List    ${container_rect}    3

    ${element_x}=    Get From List    ${element_rect}    0
    ${element_y}=    Get From List    ${element_rect}    1
    ${element_width}=    Get From List    ${element_rect}    2
    ${element_height}=    Get From List    ${element_rect}    3

    ${container_right}=    Evaluate    int(${container_x} + ${container_width})
    ${container_bottom}=    Evaluate    int(${container_y} + ${container_height})
    ${element_right}=    Evaluate    int(${element_x} + ${element_width})
    ${element_bottom}=    Evaluate    int(${element_y} + ${element_height})

    ${is_visible}=    Evaluate
    ...    ${element_width} > 0 and ${element_height} > 0 and ${element_x} >= ${container_x} and ${element_y} >= ${container_y} and ${element_right} <= ${container_right} and ${element_bottom} <= ${container_bottom}
    RETURN    ${is_visible}

Take Stitch Image Screenshot
    [Arguments]    ${filename}

    ${screenshot_path}=    Take Screenshot    ${Stitch_IMAGE_VIEWER_XPATH}
    Log    Screenshot saved to (temporary): ${screenshot_path}

    ${dest}=    Set Variable    ${actual_image}${filename}
    Create Directory    ${actual_image}
    Move File    ${screenshot_path}    ${dest}

    Log    Screenshot moved to: ${dest}
    RETURN    ${dest}

Verify Stitch Window Is Closed
    Wait Until Element Does Not Exist    ${stitch_window_xpath}    5
    Sleep    0.5s

Open RT Simulator
    [Documentation]    Open RT Simulator window.

    Click    ${MAIN_WINDOW_XPATH}
    Sleep    0.2s
    Click    ${rt_simulator_button_xpath}
    Sleep    0.2s
    Wait Until Element Exist    ${rt_simulator_window_xpath}    5
    Sleep    1s

Verify RT Simulator Window Is Open
    [Documentation]    Verify RT Simulator Window Is Open

    Element Should Exist    ${rt_simulator_window_xpath}

Close RT Simulator
    Click    ${rt_simulator_window_close_button_xpath}
    Sleep    0.5s
    Wait Until Element Does Not Exist    ${rt_simulator_window_xpath}    5
    Sleep    0.5s

Verify RT Simulator Window Is Closed
    Wait Until Element Does Not Exist    ${rt_simulator_window_xpath}    5
    Sleep    0.5s

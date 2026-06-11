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
${stitch_file_dialog_input_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Image Stitching"]/Window/ComboBox[1]/Edit[@Name="File name:"]
${stitch_file_dialog_open_button_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Image Stitching"]/Window//*[@AutomationId="1" and @Name="Open"]
${stitch_configuration_scrollviewer_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Image Stitching"]/Pane[2]
${stitch_direction_combobox_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Image Stitching"]//ComboBox[@AutomationId="Stitching_Cmb_Direction"]
${stitch_overlap_slider_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Image Stitching"]//Slider[@AutomationId="Stitching_Sld_Overlap"]
${stitch_overlap_nud_input_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Image Stitching"]//Edit[@AutomationId="Stitching_Overlap_Num"]
${stitch_overlap_value_text_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Image Stitching"]//Text[contains(@Name,"Overlap")]
${stitch_blend_levels_slider_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Image Stitching"]//Slider[@AutomationId="Stitching_Sld_BlendLevels"]
${stitch_blend_levels_nud_input_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Image Stitching"]//Edit[@AutomationId="Stitching_BlendLevels_Num"]
${stitch_blend_levels_value_text_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Image Stitching"]//Text[contains(@Name,"Blend Levels:")]
${stitch_sub_pixel_checkbox_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Image Stitching"]//CheckBox[@AutomationId="Stitching_Chk_SubPixel"]
${stitch_min_confidence_slider_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Image Stitching"]//Slider[@AutomationId="Stitching_Sld_MinConfidence"]
${stitch_min_confidence_nud_input_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Image Stitching"]//Edit[@AutomationId="Stitching_MinConfidence_Num"]
${stitch_min_confidence_value_text_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Image Stitching"]//Text[contains(@Name,"Min Confidence:")]
${stitch_window_level_combobox_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Image Stitching"]//ComboBox[@AutomationId="Stitching_Cmb_WindowLevel"]
${stitch_invert_image_checkbox_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Image Stitching"]//CheckBox[@AutomationId="Stitching_Chk_InvertImage"]
${stitch_window_stitch_button_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Image Stitching"]//Button[@AutomationId="Stitching_Btn_Stitch"]
${stitch_export_button_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Image Stitching"]/Button[@AutomationId="Stitching_Btn_Export"]
${Stitch_IMAGE_VIEWER_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Image Stitching"]/Pane[3]/Image    
${stitch_export_dialog_title}    Export Stitched Image
${stitch_export_filename_control}    [CLASS:Edit; INSTANCE:1]
${stitch_export_filetype_control}    [CLASS:ComboBox; INSTANCE:2]
${stitch_export_save_button_control}    [CLASS:Button; INSTANCE:2]
${stitch_export_overwrite_dialog_title}    Confirm Save As
${stitch_export_overwrite_yes_button_control}    [TEXT:&Yes]
${stitch_export_overwrite_yes_button_fallback_control}    [TEXT:Yes]
${stitch_export_overwrite_yes_button_instance_control}    [CLASS:Button; INSTANCE:1]
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
    [Documentation]    Open Stitch Window
    
    Click    ${MAIN_WINDOW_XPATH}
    Sleep    0.2s
    Click    ${stitch_button_xpath}
    Sleep    0.2s
    Wait Until Element Exist    ${stitch_window_xpath}    5
    Sleep    1s
    Resize Stitch Window    100    100    1250    900
    Sleep    0.2s
    Resize FoxRT Application Window    10    10    1850    1000
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
    [Documentation]    Verify that each provided file is visible in the Stitch window.

    ${clean_file_paths}=    Evaluate    [str(p).strip() for p in $file_paths if str(p).strip()]
    ${path_count}=    Evaluate    len($clean_file_paths)
    Should Be True    ${path_count} > 0    Provide at least one file path to verify in Stitch window.

    Wait Until Element Exist    ${stitch_window_xpath}    5

    FOR    ${file_path}    IN    @{clean_file_paths}
        ${file_name}=    Evaluate    __import__('os').path.basename($file_path)
        ${exact_name_xpath}=    Set Variable    ${stitch_window_xpath}//*[@Name="${file_name}"]
        ${contains_name_xpath}=    Set Variable    ${stitch_window_xpath}//*[contains(@Name,"${file_name}")]

        ${found_exact}=    Run Keyword And Return Status
        ...    Wait Until Element Exist    ${exact_name_xpath}    2

        ${found_contains}=    Set Variable    ${False}
        IF    not ${found_exact}
            ${found_contains}=    Run Keyword And Return Status
            ...    Wait Until Element Exist    ${contains_name_xpath}    2
        END

        Should Be True
        ...    ${found_exact} or ${found_contains}
        ...    File not found in Stitch window: ${file_name}
    END

Clear All Files From Stitch Window
    [Documentation]    Remove all files from Stitch window.
    Wait Until Element Exist    ${stitch_window_xpath}    5
    Click    ${stitch_window_clearall_button_xpath}
    Sleep    0.5s

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
    [Arguments]    ${direction}=Horizontal    ${overlap}=30    ${blend_levels}=5
    ...    ${sub_pixel_refinement}=yes    ${min_confidence}=0.15
    ...    ${window_level}=Auto Best Contrast    ${invert_image}=no
    [Documentation]    Set Stitch options from arguments and then click Stitch.

    Wait Until Element Exist    ${stitch_window_xpath}    5
    Focus    ${stitch_window_xpath}
    Sleep    0.2s

    ${direction_options}=    Get All Names From Combobox    ${stitch_direction_combobox_xpath}
    ${direction_valid}=    Evaluate    $direction in $direction_options
    Should Be True
    ...    ${direction_valid}
    ...    Unsupported Direction: ${direction}. Available options: ${direction_options}

    ${window_level_options}=    Get All Names From Combobox    ${stitch_window_level_combobox_xpath}
    ${window_level_valid}=    Evaluate    $window_level in $window_level_options
    Should Be True
    ...    ${window_level_valid}
    ...    Unsupported Window Level: ${window_level}. Available options: ${window_level_options}

    Select Combobox Item By Name    ${stitch_direction_combobox_xpath}    ${direction}
    Sleep    0.2s
    Set Stitch Numeric Input Value    ${stitch_overlap_nud_input_xpath}    ${overlap}    5    80    Overlap
    Set Stitch Numeric Input Value    ${stitch_blend_levels_nud_input_xpath}    ${blend_levels}    1    8    Blend Levels

    ${sub_pixel_refinement_bool}=    Convert User Input To Boolean    ${sub_pixel_refinement}    Sub-pixel Refinement
    Set Checkbox State    ${stitch_sub_pixel_checkbox_xpath}    ${sub_pixel_refinement_bool}
    Sleep    0.2s

    Set Stitch Numeric Input Value    ${stitch_min_confidence_nud_input_xpath}    ${min_confidence}    0.05    0.50    Min Confidence
    Select Combobox Item By Name    ${stitch_window_level_combobox_xpath}    ${window_level}
    Sleep    0.2s

    Scroll Stitch Configuration To Bottom
    ${invert_image_bool}=    Convert User Input To Boolean    ${invert_image}    Invert Image
    Set Checkbox State    ${stitch_invert_image_checkbox_xpath}    ${invert_image_bool}
    Sleep    0.2s

    Click    ${stitch_window_stitch_button_xpath}
    Sleep    1s
    Wait Until Element Exist    ${stitch_export_button_xpath}    30
    Sleep    0.5s

Set Stitch Numeric Input Value
    [Arguments]    ${input_xpath}    ${value}    ${minimum}    ${maximum}    ${field_name}
    [Documentation]    Set a stitch numeric value through the NUD text input and verify the applied value.

    ${value}=    Convert To Number    ${value}
    ${minimum}=    Convert To Number    ${minimum}
    ${maximum}=    Convert To Number    ${maximum}
    Should Be True
    ...    ${minimum} <= ${value} <= ${maximum}
    ...    ${field_name} must be between ${minimum} and ${maximum}. Received: ${value}

    ${value_text}=    Evaluate    str($value).rstrip('0').rstrip('.') if '.' in str($value) else str($value)
    Wait Until Element Exist    ${input_xpath}    2
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

Export Stitch Images
    [Arguments]    ${output_folder}    ${export_format}=PNG    ${file_name}=${EMPTY}
    [Documentation]    Export the stitched image to the requested output folder and format.

    Wait Until Element Exist    ${stitch_window_xpath}    5
    Wait Until Element Exist    ${stitch_export_button_xpath}    5

    ${format_label}    ${file_extension}=    Get Stitch Export Format Details    ${export_format}

    Should Not Be Empty    ${output_folder}    Output folder is required for Stitch export.
    Create Directory    ${output_folder}

    IF    str($file_name).strip() == ''
        ${file_name}=    Evaluate    __import__('datetime').datetime.now().strftime('StitchExport_%Y%m%d_%H%M%S')
    ELSE
        ${file_name}=    Evaluate    __import__('os').path.splitext(str($file_name).strip())[0]
    END

    ${export_file_name}=    Set Variable    ${file_name}.${file_extension}
    ${export_file_path}=    Join Path    ${output_folder}    ${export_file_name}
    ${file_already_exists}=    Evaluate    __import__('os').path.exists($export_file_path)

    Click    ${stitch_export_button_xpath}
    Win Wait Active    ${stitch_export_dialog_title}    ${EMPTY}    5

    Control Command
    ...    ${stitch_export_dialog_title}
    ...    ${EMPTY}
    ...    ${stitch_export_filetype_control}
    ...    SelectString
    ...    ${format_label}
    ${selected_format}=    Control Command
    ...    ${stitch_export_dialog_title}
    ...    ${EMPTY}
    ...    ${stitch_export_filetype_control}
    ...    GetCurrentSelection
    ...    ${EMPTY}
    Should Be Equal As Strings
    ...    ${selected_format}
    ...    ${format_label}
    ...    Stitch export format was not applied. Requested ${format_label}, but dialog shows ${selected_format}.

    Control Set Text
    ...    ${stitch_export_dialog_title}
    ...    ${EMPTY}
    ...    ${stitch_export_filename_control}
    ...    ${export_file_path}
    Sleep    0.2s
    Control Click
    ...    ${stitch_export_dialog_title}
    ...    ${EMPTY}
    ...    ${stitch_export_save_button_control}
    Handle Stitch Export Overwrite Warning If Present    ${file_already_exists}
    Win Wait Close    ${stitch_export_dialog_title}    ${EMPTY}    10

    Wait Until Keyword Succeeds    30x    1s    File Should Exist    ${export_file_path}
    RETURN    ${export_file_path}

Handle Stitch Export Overwrite Warning If Present
    [Arguments]    ${overwrite_expected}=${False}
    [Documentation]    If an overwrite confirmation appears during Stitch export, confirm it by clicking Yes.

    IF    not ${overwrite_expected}
        RETURN
    END

    ${overwrite_visible}=    Run Keyword And Return Status
    ...    Win Wait Active    ${stitch_export_overwrite_dialog_title}    ${EMPTY}    2

    ${yes_clicked}=    Set Variable    ${False}
    IF    ${overwrite_visible}
        ${yes_clicked}=    Run Keyword And Return Status
        ...    Control Click
        ...    ${stitch_export_overwrite_dialog_title}
        ...    ${EMPTY}
        ...    ${stitch_export_overwrite_yes_button_control}
    END
    IF    not ${yes_clicked}
        ${yes_clicked}=    Run Keyword And Return Status
        ...    Control Click
        ...    [ACTIVE]
        ...    ${EMPTY}
        ...    ${stitch_export_overwrite_yes_button_control}
    END
    IF    not ${yes_clicked}
        ${yes_clicked}=    Run Keyword And Return Status
        ...    Control Click
        ...    [ACTIVE]
        ...    ${EMPTY}
        ...    ${stitch_export_overwrite_yes_button_fallback_control}
    END
    IF    not ${yes_clicked}
        ${yes_clicked}=    Run Keyword And Return Status
        ...    Control Click
        ...    [ACTIVE]
        ...    ${EMPTY}
        ...    ${stitch_export_overwrite_yes_button_instance_control}
    END
    IF    not ${yes_clicked}
        ${alt_y_sent}=    Run Keyword And Return Status    Send    !y
        Sleep    0.2s
        ${yes_clicked}=    Set Variable    ${alt_y_sent}
    END

    Should Be True    ${yes_clicked}    Stitch export overwrite warning was expected, but the Yes confirmation could not be completed.
    Sleep    0.2s

Get Stitch Export Format Details
    [Arguments]    ${export_format}
    [Documentation]    Return the native Save dialog label and file extension for the requested Stitch export format.

    ${normalized_format}=    Evaluate    str($export_format).strip().lower()

    IF    '${normalized_format}' == 'png'
        RETURN    PNG (*.png)    png
    END
    IF    '${normalized_format}' == 'jpeg' or '${normalized_format}' == 'jpg'
        RETURN    JPEG (*.jpg)    jpg
    END
    IF    '${normalized_format}' == 'tiff' or '${normalized_format}' == 'tif'
        RETURN    TIFF (*.tiff)    tiff
    END
    IF    '${normalized_format}' == 'bmp' or '${normalized_format}' == 'bitmap'
        RETURN    BMP (*.bmp)    bmp
    END

    Fail    Unsupported Stitch export format: ${export_format}. Use PNG, JPEG, TIFF, or BMP.

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

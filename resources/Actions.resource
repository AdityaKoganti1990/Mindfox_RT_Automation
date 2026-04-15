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
${batch_file_dialog_open_button_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Batch Processing"]/Window/Button[@Name="Open"]
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
${batch_report_include_image_checkbox_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Batch Processing"]//CheckBox[@AutomationId="Batch_Chk_IncludeImageInReport"]
${batch_report_output_folder_textbox_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Batch Processing"]//Edit[@AutomationId="Batch_Txt_ReportOutputFolder"]
${batch_report_output_folder_browse_button_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Batch Processing"]//Button[@AutomationId="Batch_Btn_BrowseReportFolder"]
${batch_output_folder_dialog_input_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]//Edit[@Name="Folder:" and @AutomationId="1152"]
${batch_output_folder_dialog_select_button_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]//Button[@Name="Select Folder" and @AutomationId="1"]   
${stitch_button_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Pane/Button[@AutomationId="Main_Btn_ImageStitching"]    
${stitch_window_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Image Stitching"]
${stitch_window_close_button_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Window[@Name="Image Stitching"]/Button[@AutomationId="Stitching_Btn_Close"]    

*** Keywords ***
Open Report Viewer
    [Documentation]    Open Report Viewer
    
    Click    ${MAIN_WINDOW_XPATH}
    Sleep    0.2s
    Click    ${REPORT_VIEWER_BUTTON_XPATH}
    Sleep    0.2s
    Wait Until Element Exist    ${REPORT_VIEWER_Close_BUTTON_XPATH}    5
    Sleep    1s
    Resize Report Viewer Window    0    0    1900    1025
    Sleep    1s
    Resize FoxRT Application Window    10    10    1850    1000
    Sleep    1s


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
    [Documentation]    Set Report Viewer Params without popup dialogs. Uses passed arguments or default values.
    
    Focus    ${REPORT_VIEWER_WINDOW_XPATH}
    Sleep    0.2s

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
    Sleep    1s
    Click    ${Report_close_report_button_XPATH}
    Sleep    1s

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
    Click    ${open_xpath}

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
        Click    ${open_xpath}
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
    Wait Until Element Exist    ${INPUT_FILE_DIALOG_XPATH}    2
    RETURN    ${INPUT_FILE_DIALOG_XPATH}    ${OPEN_BUTTON_XPATH}

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

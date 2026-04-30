*** Settings ***
Library           FlaUILibrary    screenshot_dir=${CURDIR}\\..\\Actual\\test.png
Library           Process
Library           ../lib/image_comparator.py
Library           ../lib/ironpy_remote_client.py
Library           AutoItLibrary
Resource          ../resources/imageviewer.resource

*** Variables ***
${Click_Next_Image_Button_XPATH}    ${MAIN_WINDOW_XPATH}//Button[@AutomationId="Main_Btn_NextFile"]
${Click_Previous_Image_Button_XPATH}    ${MAIN_WINDOW_XPATH}//Button[@AutomationId="Main_Btn_PreviousFile"]
${Zoom_Up_Button_XPATH}    ${MAIN_WINDOW_XPATH}//Button[@AutomationId="Main_Btn_ZoomIn"]
${Zoom_Down_Button_XPATH}    ${MAIN_WINDOW_XPATH}//Button[@AutomationId="Main_Btn_ZoomOut"]
${Zoom_Edit_Control_XPATH}    ${MAIN_WINDOW_XPATH}//Edit[@AutomationId="Main_Txt_Zoom"]
${Pan_Tool_Button_XPATH}    ${MAIN_WINDOW_XPATH}//Button[@AutomationId="Main_Tgl_Pan"]
${Scale_Toggle_Button_XPATH}    ${MAIN_WINDOW_XPATH}//Button[@AutomationId="Main_Tgl_Ruler"]
${Rotate_CW_Button_XPATH}    ${MAIN_WINDOW_XPATH}//Button[@AutomationId="Main_Btn_RotateCW"]
${Rotate_CCW_Button_XPATH}    ${MAIN_WINDOW_XPATH}//Button[@AutomationId="Main_Btn_RotateCCW"]
${Flip_Horizontal_Button_XPATH}    ${MAIN_WINDOW_XPATH}//Button[@AutomationId="Main_Tgl_FlipH"]
${Flip_Vertical_Button_XPATH}    ${MAIN_WINDOW_XPATH}//Button[@AutomationId="Main_Tgl_FlipV"]
${Invert_button_XPATH}    ${MAIN_WINDOW_XPATH}//Button[@AutomationId="Main_Tgl_Invert"]
${Units_Toggle_Button_XPATH}    ${MAIN_WINDOW_XPATH}//Button[@AutomationId="Main_Btn_MeasurementUnit"]
${Units_Toggle_Button_Text_XPATH}    ${MAIN_WINDOW_XPATH}//Button[@AutomationId="Main_Btn_MeasurementUnit"]/Text
${Units_Toggle_Statusbar_Button_XPATH}    ${MAIN_WINDOW_XPATH}//Button[@AutomationId="Main_Btn_StatusMeasurementUnit"]
${Units_Toggle_Statusbar_Button_Text_XPATH}    ${MAIN_WINDOW_XPATH}//Button[@AutomationId="Main_Btn_StatusMeasurementUnit"]/Text
${Zoom_Status_Bar_Text_XPATH}    ${MAIN_WINDOW_XPATH}/StatusBar/Text[contains(@Name,"Zoom:")]
${DPI_Status_Bar_Text_XPATH}    ${MAIN_WINDOW_XPATH}/StatusBar/Text[contains(@Name,"DPI:")]
${X_Coordinate_Status_Bar_Text_XPATH}    ${MAIN_WINDOW_XPATH}/StatusBar/Text[contains(@Name,"X:")]
${Y_Coordinate_Status_Bar_Text_XPATH}    ${MAIN_WINDOW_XPATH}/StatusBar/Text[contains(@Name,"Y:")]
${Intensity_Status_Bar_Text_XPATH}    ${MAIN_WINDOW_XPATH}/StatusBar/Text[contains(@Name,"Intensity:")]
${Annotation_Count_Status_Bar_Text_XPATH}    ${MAIN_WINDOW_XPATH}/StatusBar/Text[contains(@Name,"Annotations:")]
${SNR_Status_Bar_Text_XPATH}    ${MAIN_WINDOW_XPATH}/StatusBar/Text[contains(@Name,"SNR:")]
${Color_Table_Grayscale_Menu_Item_XPATH}    Window/Menu/MenuItem[@AutomationId="ImageViewer_Ctx_ColorTable_Grayscale"]
${Color_Table_HotIron_Menu_Item_XPATH}    Window/Menu/MenuItem[@AutomationId="ImageViewer_Ctx_ColorTable_HotIron"]
${Color_Table_Rainbow_Menu_Item_XPATH}    Window/Menu/MenuItem[@AutomationId="ImageViewer_Ctx_ColorTable_Rainbow"]
${Color_Table_CoolWarm_Menu_Item_XPATH}    Window/Menu/MenuItem[@AutomationId="ImageViewer_Ctx_ColorTable_CoolWarm"]
${Color_Table_Bone_Menu_Item_XPATH}    Window/Menu/MenuItem[@AutomationId="ImageViewer_Ctx_ColorTable_Bone"]
${Color_Table_Copper_Menu_Item_XPATH}    Window/Menu/MenuItem[@AutomationId="ImageViewer_Ctx_ColorTable_Copper"]
${Color_Table_Spectrum_Menu_Item_XPATH}    Window/Menu/MenuItem[@AutomationId="ImageViewer_Ctx_ColorTable_Spectrum"]
${Color_Table_HotMetalBlue_Menu_Item_XPATH}    Window/Menu/MenuItem[@AutomationId="ImageViewer_Ctx_ColorTable_HotMetalBlue"]
${LEFT_IMAGE_VIEWER_XPATH}     /Window/Custom[@AutomationId='PrimaryViewer']/Pane[@AutomationId='ImageScrollViewer']
${RIGHT_IMAGE_VIEWER_XPATH}    /Window/Custom[@AutomationId='SecondaryViewer']/Pane[@AutomationId='ImageScrollViewer']
${Dual_View_Toggle_Button_XPATH}    ${MAIN_WINDOW_XPATH}//Button[@AutomationId="Main_Tgl_DualView"]
${Dual_View_SyncWL_Toggle_Button_XPATH}    ${MAIN_WINDOW_XPATH}//Button[@AutomationId="Main_Tgl_SyncWL"]
${Dual_View_SyncZoom_Toggle_Button_XPATH}    ${MAIN_WINDOW_XPATH}//Button[@AutomationId="Main_Tgl_SyncZoom"]
${Dual_View_SyncPan_Toggle_Button_XPATH}    ${MAIN_WINDOW_XPATH}//Button[@AutomationId="Main_Tgl_SyncPan"]
${LEFT_IMAGE_VIEWER_WithScales_XPATH}     /Window[@AutomationId='FoxRTProMainWindow']/Custom[@AutomationId='PrimaryViewer']
${RIGHT_IMAGE_VIEWER_WithScales_XPATH}    /Window[@AutomationId='FoxRTProMainWindow']/Custom[@AutomationId='SecondaryViewer']
${Export_Image_Button_XPATH}              ${MAIN_WINDOW_XPATH}//Button[@AutomationId="Main_Btn_ExportImage"]
${Export_Image_Window_XPATH}              ${MAIN_WINDOW_XPATH}/Window[@Name="Export Image"]
${Export_Image_FileName_Textbox_XPATH}    ${Export_Image_Window_XPATH}//Edit[@AutomationId="ExportImg_Txt_FileName"]
${Export_Image_Browse_Button_XPATH}       ${Export_Image_Window_XPATH}//Button[@AutomationId="ExportImg_Btn_Browse"]
${Export_Image_Format_Combobox_XPATH}     ${Export_Image_Window_XPATH}//ComboBox[@AutomationId="ExportImg_Cmb_Format"]
${Export_Image_DicomTags_Checkbox_XPATH}    ${Export_Image_Window_XPATH}//CheckBox[@AutomationId="ExportImg_Chk_DicomTags"]
${Export_Image_Annotations_Checkbox_XPATH}    ${Export_Image_Window_XPATH}//CheckBox[@AutomationId="ExportImg_Chk_Annotations"]
${Export_Image_Measurements_Checkbox_XPATH}    ${Export_Image_Window_XPATH}//CheckBox[@AutomationId="ExportImg_Chk_Measurements"]
${Export_Image_IqiWire_Checkbox_XPATH}    ${Export_Image_Window_XPATH}//CheckBox[@AutomationId="ExportImg_Chk_IqiWire"]
${Export_Image_TagsInside_Radio_XPATH}    ${Export_Image_Window_XPATH}//RadioButton[@AutomationId="ExportImg_Rdo_TagsInside"]
${Export_Image_TagsOutside_Radio_XPATH}   ${Export_Image_Window_XPATH}//RadioButton[@AutomationId="ExportImg_Rdo_TagsOutside"]
${Export_Image_SaveDialog_FileName_XPATH}    ${Export_Image_Window_XPATH}/Window[@Name="Select export location"]/Pane[1]/ComboBox[1]/Edit
${Export_Image_SaveDialog_Save_Button_XPATH}    ${Export_Image_Window_XPATH}/Window/Button[1]
${Export_Image_Export_Button_XPATH}            ${Export_Image_Window_XPATH}//Button[@AutomationId="ExportImg_Btn_Export"]
${Export_Image_Confirmation_Ok_Button_XPATH}    ${MAIN_WINDOW_XPATH}/Window/Button[@Name="OK"]
${Export_Image_Overwrite_Yes_Button_XPATH}     ${Export_Image_Window_XPATH}/Window/Window/Button[@Name="Yes"]
${Export_Image_PostExport_Yes_Button_XPATH}    ${MAIN_WINDOW_XPATH}/Window/Button[@Name="Yes"]

# ─────────────────── Paths ───────────────────

${test_data}           ${CURDIR}\\..\\test_Images\\
${expected_image}      ${CURDIR}\\..\\Expected\\
${actual_image}        ${CURDIR}\\..\\Actual\\
${COMPARISON_IMAGE}    ${CURDIR}\\..\\Comparison\\
${Actual_Image_Exports}       ${CURDIR}\\..\\Exports\\Image Exports\\Actual\\
${Expected_Image_Exports}    ${CURDIR}\\..\\Exports\\Image Exports\\Expected\\

*** Keywords ***

Click Next/Previous Image Button
    [Arguments]    ${button_type}

    Focus    ${MAIN_WINDOW_XPATH}
    Sleep    0.1s
    Run Keyword If    '${button_type}'=='Next'    click    ${Click_Next_Image_Button_XPATH}
    ...    ELSE IF    '${button_type}'=='Previous'    click    ${Click_Previous_Image_Button_XPATH}
    Sleep    0.1s

Click Next/Previous Image using Keyboard Shortcuts
    [Arguments]    ${button_type}

    Focus    ${MAIN_WINDOW_XPATH}
    Sleep    0.1s
    Run Keyword If    '${button_type}'=='Next'    send    {Right}
    ...    ELSE IF    '${button_type}'=='Previous'    send    {Left}
    Sleep    0.1s

Zoom Image Viewer
    [Arguments]    ${zoom_type}    ${Zoom_Interaction}

    Focus    ${MAIN_WINDOW_XPATH}
    Sleep    0.1s
    FOR    ${i}    IN RANGE    ${Zoom_Interaction}
        Run Keyword If    '${zoom_type}'=='ZoomIn'    Click    ${Zoom_Up_Button_XPATH}    
        ...    ELSE IF    '${zoom_type}'=='ZoomOut'    Click    ${Zoom_Down_Button_XPATH}
        Sleep    0.1s
    END

Zoom Image Viewer Using Zoom Edit Control
    [Arguments]    ${zoom_value}

    Focus    ${MAIN_WINDOW_XPATH}
    Sleep    0.1s
    Set Text To Textbox    ${Zoom_Edit_Control_XPATH}    ${zoom_value}
    Sleep    0.1s
    Send    {ENTER}
    Sleep    0.1s
    Send    {TAB}
    Sleep    0.1s

Pan Image Viewer Using Pan Tool
    [Arguments]    ${start_x}    ${start_y}    ${end_x}    ${end_y}

    Focus    ${MAIN_WINDOW_XPATH}
    Sleep    0.1s
    Click    ${Pan_Tool_Button_XPATH}
    Sleep    0.1s
    AutoItLibrary.Mouse Click Drag    left    ${start_x}    ${start_y}    ${end_x}    ${end_y}
    Sleep    0.1s
    Click    ${Pan_Tool_Button_XPATH}
    Sleep    0.1s

Apply Scale To Image Viewer
    [Arguments]    ${show_scale}

    Focus    ${MAIN_WINDOW_XPATH}
    Sleep    0.1s
    ${show_scale}=    Evaluate    str($show_scale).strip().lower()
    ${target_state}=    Set Variable If    '${show_scale}' in ('true', '1', 'yes', 'on')    ON    OFF
    ${current_state}=    Get Toggle State    ${Scale_Toggle_Button_XPATH}
    Run Keyword If    '${current_state}' != '${target_state}'    Click    ${Scale_Toggle_Button_XPATH}
    Sleep    0.1s

Rotate Image Viewer
    [Arguments]    ${rotate_type}    ${count}=1

    Focus    ${MAIN_WINDOW_XPATH}
    Sleep    0.1s
    FOR    ${i}    IN RANGE    ${count}
        Run Keyword If    '${rotate_type}'=='Rotate CW'    Click    ${Rotate_CW_Button_XPATH}
        ...    ELSE IF    '${rotate_type}'=='Rotate CCW'    Click    ${Rotate_CCW_Button_XPATH}
        ...    ELSE    Fail    Invalid rotate type '${rotate_type}'. Use 'Rotate CW' or 'Rotate CCW'.
        Sleep    0.1s
    END

Flip Image Viewer
    [Arguments]    ${flip_type}

    Focus    ${MAIN_WINDOW_XPATH}
    Sleep    0.1s
    Run Keyword If    '${flip_type}'=='Horizontal'    Click    ${Flip_Horizontal_Button_XPATH}
    ...    ELSE IF    '${flip_type}'=='Vertical'    Click    ${Flip_Vertical_Button_XPATH}
    ...    ELSE    Fail    Invalid flip type '${flip_type}'. Use 'Horizontal' or 'Vertical'.
    Sleep    0.1s

Click Invert Button
    Focus    ${MAIN_WINDOW_XPATH}
    Sleep    0.1s
    Click    ${Invert_button_XPATH}
    Sleep    0.1s

Change Units Across Application
    [Arguments]    ${units}

    Should Match Regexp    ${units}    ^(mm|inch)$
    ...    Invalid units '${units}'. Use 'mm' or 'inch'.
    Focus    ${MAIN_WINDOW_XPATH}
    Sleep    0.1s
    ${units_norm}=    Evaluate    'inch' if str($units).strip().lower() in ('inch', 'in', 'inches') else 'mm'
    ${current_units}=    Get Name From Element    ${Units_Toggle_Button_Text_XPATH}
    Log    Units button text element name: '${current_units}'
    ${current_units_norm}=    Evaluate    'inch' if str($current_units).strip().lower() in ('inch', 'in', 'inches') else 'mm'
    IF    '${current_units_norm}' != '${units_norm}'
        Click    ${Units_Toggle_Button_XPATH}
    END
    Sleep    0.1s

Change Units Across Application from Status Bar
    [Arguments]    ${units}

    Should Match Regexp    ${units}    ^(mm|inch)$
    ...    Invalid units '${units}'. Use 'mm' or 'inch'.
    Focus    ${MAIN_WINDOW_XPATH}
    Sleep    0.1s
    ${units_norm}=    Evaluate    'inch' if str($units).strip().lower() in ('inch', 'in', 'inches') else 'mm'
    ${current_units}=    Get Name From Element    ${Units_Toggle_Statusbar_Button_Text_XPATH}
    Log    Units button text element name: '${current_units}'
    ${current_units_norm}=    Evaluate    'inch' if str($current_units).strip().lower() in ('inch', 'in', 'inches') else 'mm'
    IF    '${current_units_norm}' != '${units_norm}'
        Click    ${Units_Toggle_Statusbar_Button_XPATH}
    END
    Sleep    0.1s

Verify Zoom Value In Status Bar
    [Arguments]    ${expected_zoom}

    ${displayed_zoom}=    Get Name From Element    ${Zoom_Status_Bar_Text_XPATH}
    ${displayed_zoom_clean}=    Evaluate    str($displayed_zoom).strip().replace('%', '').split(':')[-1].strip()
    ${expected_zoom_clean}=    Evaluate    str($expected_zoom).strip().replace('%', '')
    Should Be Equal As Numbers    ${displayed_zoom_clean}    ${expected_zoom_clean}
    ...    Expected zoom ${expected_zoom_clean}% but status bar shows ${displayed_zoom_clean}%

Verify DPI value in status bar
    [Arguments]    ${expected_dpi}

    ${displayed_dpi}=    Get Name From Element    ${DPI_Status_Bar_Text_XPATH}
    ${displayed_dpi_clean}=    Evaluate    str($displayed_dpi).strip().split(':')[-1].strip()
    ${expected_dpi_clean}=    Evaluate    str($expected_dpi).strip()
    Should Be Equal As Numbers    ${displayed_dpi_clean}    ${expected_dpi_clean}
    ...    Expected DPI ${expected_dpi_clean} but status bar shows ${displayed_dpi_clean}

Hover Mouse Over Image Viewer
    [Arguments]    ${x}    ${y}

    Focus    ${MAIN_WINDOW_XPATH}
    Sleep    0.1s
    AutoItLibrary.Mouse Move    ${x}    ${y}
    Sleep    0.1s

Verify Coordinates Are Shown In Status Bar
    [Arguments]    ${expected_x}    ${expected_y}

    ${displayed_x}=    Get Name From Element    ${X_Coordinate_Status_Bar_Text_XPATH}
    ${displayed_y}=    Get Name From Element    ${Y_Coordinate_Status_Bar_Text_XPATH}
    ${displayed_x_clean}=    Evaluate    str($displayed_x).strip().split(':')[-1].strip()
    ${displayed_y_clean}=    Evaluate    str($displayed_y).strip().split(':')[-1].strip()
    ${expected_x_clean}=    Evaluate    str($expected_x).strip()
    ${expected_y_clean}=    Evaluate    str($expected_y).strip()
    Should Be Equal As Numbers    ${displayed_x_clean}    ${expected_x_clean}
    ...    Expected X=${expected_x_clean} but status bar shows X=${displayed_x_clean}
    Should Be Equal As Numbers    ${displayed_y_clean}    ${expected_y_clean}
    ...    Expected Y=${expected_y_clean} but status bar shows Y=${displayed_y_clean}

Verify Intensity Value Is Shown In Status Bar
    [Arguments]    ${expected_intensity}

    ${displayed_intensity}=    Get Name From Element    ${Intensity_Status_Bar_Text_XPATH}
    ${displayed_intensity_clean}=    Evaluate    str($displayed_intensity).strip().split(':')[-1].strip()
    ${expected_intensity_clean}=    Evaluate    str($expected_intensity).strip()
    Should Be Equal As Numbers    ${displayed_intensity_clean}    ${expected_intensity_clean}
    ...    Expected intensity ${expected_intensity_clean} but status bar shows ${displayed_intensity_clean}

Verify Annotation Count In Status Bar
    [Arguments]    ${expected_count}

    ${displayed_count}=    Get Name From Element    ${Annotation_Count_Status_Bar_Text_XPATH}
    ${displayed_count_clean}=    Evaluate    str($displayed_count).strip().split(':')[-1].strip()
    ${expected_count_clean}=    Evaluate    str($expected_count).strip()
    Should Be Equal As Numbers    ${displayed_count_clean}    ${expected_count_clean}
    ...    Expected annotation count ${expected_count_clean} but status bar shows ${displayed_count_clean}

Verify SNR value in status bar
    [Arguments]    ${expected_snr}    ${expected_noise}

    ${displayed_text}=    Get Name From Element    ${SNR_Status_Bar_Text_XPATH}
    ${snr_part}=      Evaluate    str($displayed_text).split('|')[0].strip()
    ${noise_part}=    Evaluate    str($displayed_text).split('|')[1].strip()
    ${displayed_snr}=      Evaluate    str($snr_part).split(':')[-1].strip().replace('dB','').replace('db','').strip()
    ${displayed_noise}=    Evaluate    str($noise_part).split(':')[-1].strip().replace('%','').strip()
    ${expected_snr_clean}=      Evaluate    str($expected_snr).strip().replace('dB','').replace('db','').strip()
    ${expected_noise_clean}=    Evaluate    str($expected_noise).strip().replace('%','').strip()
    Should Be Equal As Numbers    ${displayed_snr}    ${expected_snr_clean}
    ...    Expected SNR ${expected_snr_clean} dB but status bar shows ${displayed_snr} dB
    Should Be Equal As Numbers    ${displayed_noise}    ${expected_noise_clean}
    ...    Expected Noise ${expected_noise_clean}% but status bar shows ${displayed_noise}%

Apply Color Table To Image Viewer
    [Arguments]    ${color_name}
    [Documentation]    Apply the given color table to the image viewer by right-clicking on the viewer and clicking the matching AutomationId-based menu control.

    ${color_table_xpath}=    Resolve Color Table Menu Item XPath    ${color_name}
    Focus    ${MAIN_WINDOW_XPATH}
    Sleep    0.1s
    ${start_x}    ${start_y}    ${end_x}    ${end_y}=    Get Current Location Of Image Viewer
    AutoItLibrary.Mouse Click    right    ${start_x}    ${start_y}
    Sleep    0.1s
    Wait Until Element Exist    ${color_table_xpath}    5
    Click    ${color_table_xpath}
    Sleep    0.3s

Resolve Color Table Menu Item XPath
    [Arguments]    ${color_name}
    Should Not Be Empty    ${color_name}    Color table name cannot be empty.
    ${color_value}=    Evaluate    str($color_name).strip()
    Should Not Be Empty    ${color_value}    Color table name cannot be blank.
    ${is_xpath}=    Evaluate    str($color_value).startswith(('/', '('))
    IF    ${is_xpath}
        RETURN    ${color_value}
    END

    ${color_key}=    Evaluate    ''.join(ch.lower() for ch in str($color_name).strip() if ch.isalnum())
    IF    '${color_key}' == 'grayscale' or '${color_key}' == 'imageviewerctxcolortablegrayscale'
        RETURN    ${Color_Table_Grayscale_Menu_Item_XPATH}
    ELSE IF    '${color_key}' == 'hotiron' or '${color_key}' == 'imageviewerctxcolortablehotiron'
        RETURN    ${Color_Table_HotIron_Menu_Item_XPATH}
    ELSE IF    '${color_key}' == 'rainbow' or '${color_key}' == 'imageviewerctxcolortablerainbow'
        RETURN    ${Color_Table_Rainbow_Menu_Item_XPATH}
    ELSE IF    '${color_key}' == 'coolwarm' or '${color_key}' == 'imageviewerctxcolortablecoolwarm'
        RETURN    ${Color_Table_CoolWarm_Menu_Item_XPATH}
    ELSE IF    '${color_key}' == 'bone' or '${color_key}' == 'imageviewerctxcolortablebone'
        RETURN    ${Color_Table_Bone_Menu_Item_XPATH}
    ELSE IF    '${color_key}' == 'copper' or '${color_key}' == 'imageviewerctxcolortablecopper'
        RETURN    ${Color_Table_Copper_Menu_Item_XPATH}
    ELSE IF    '${color_key}' == 'spectrum' or '${color_key}' == 'imageviewerctxcolortablespectrum'
        RETURN    ${Color_Table_Spectrum_Menu_Item_XPATH}
    ELSE IF    '${color_key}' == 'hotmetalblue' or '${color_key}' == 'imageviewerctxcolortablehotmetalblue'
        RETURN    ${Color_Table_HotMetalBlue_Menu_Item_XPATH}
    END

    Fail    Unsupported color table '${color_name}'. Supported color tables: Grayscale, Hot Iron, Rainbow, Cool-Warm, Bone, Copper, Spectrum, Hot Metal Blue.

Take DualView Screenshot
    [Arguments]    ${view}    ${filename}
    [Documentation]    Capture a screenshot of either the Left (Primary) or Right (Secondary) image viewer in dual view mode.
    ...    ${view} accepts: Left | Primary | Right | Secondary.

    ${view_norm}=    Evaluate    str($view).strip().lower()
    IF    '${view_norm}' in ('left', 'primary')
        ${xpath}=    Set Variable    ${LEFT_IMAGE_VIEWER_XPATH}
    ELSE IF    '${view_norm}' in ('right', 'secondary')
        ${xpath}=    Set Variable    ${RIGHT_IMAGE_VIEWER_XPATH}
    ELSE
        Fail    Invalid view '${view}'. Use 'Left'/'Primary' or 'Right'/'Secondary'.
    END

    Sleep    0.2s    # Ensure any UI updates are rendered before taking screenshot
    ${screenshot_path}=    Take Screenshot    ${xpath}
    Log    Screenshot saved to (temporary): ${screenshot_path}

    ${dest}=    Set Variable    ${actual_image}${filename}
    Create Directory    ${actual_image}
    Move File    ${screenshot_path}    ${dest}

    Log    Screenshot moved to: ${dest}
    RETURN    ${dest}

Take DualView Screenshot with Scales
    [Arguments]    ${view}    ${filename}
    [Documentation]    Capture a screenshot of either the Left (Primary) or Right (Secondary) image viewer in dual view mode.
    ...    ${view} accepts: Left | Primary | Right | Secondary.

    ${view_norm}=    Evaluate    str($view).strip().lower()
    IF    '${view_norm}' in ('left', 'primary')
        ${xpath}=    Set Variable    ${LEFT_IMAGE_VIEWER_WithScales_XPATH}
    ELSE IF    '${view_norm}' in ('right', 'secondary')
        ${xpath}=    Set Variable    ${RIGHT_IMAGE_VIEWER_WithScales_XPATH}
    ELSE
        Fail    Invalid view '${view}'. Use 'Left'/'Primary' or 'Right'/'Secondary'.
    END

    Sleep    0.2s    # Ensure any UI updates are rendered before taking screenshot
    ${screenshot_path}=    Take Screenshot    ${xpath}
    Log    Screenshot saved to (temporary): ${screenshot_path}

    ${dest}=    Set Variable    ${actual_image}${filename}
    Create Directory    ${actual_image}
    Move File    ${screenshot_path}    ${dest}

    Log    Screenshot moved to: ${dest}
    RETURN    ${dest}

Select ImageViewer
    [Arguments]    ${view}
    [Documentation]    Click on either the Left (Primary) or Right (Secondary) image viewer in dual view mode to make it the active viewer.
    ...    ${view} accepts: Left | Primary | Right | Secondary.

    ${view_norm}=    Evaluate    str($view).strip().lower()
    IF    '${view_norm}' in ('left', 'primary')
        ${xpath}=    Set Variable    ${LEFT_IMAGE_VIEWER_XPATH}
    ELSE IF    '${view_norm}' in ('right', 'secondary')
        ${xpath}=    Set Variable    ${RIGHT_IMAGE_VIEWER_XPATH}
    ELSE
        Fail    Invalid view '${view}'. Use 'Left'/'Primary' or 'Right'/'Secondary'.
    END

    Focus    ${MAIN_WINDOW_XPATH}
    Sleep    0.1s
    Click    ${xpath}
    Sleep    0.1s

Open/Close Dual View Mode
    [Arguments]    ${enable}
    [Documentation]    Toggle the Dual View mode on or off.
    ...    ${enable} accepts truthy values (True/1/yes/on) to turn dual view ON, falsy values (False/0/no/off) to turn it OFF.

    Focus    ${MAIN_WINDOW_XPATH}
    Sleep    0.1s
    ${enable_norm}=    Evaluate    str($enable).strip().lower()
    ${target_state}=    Set Variable If    '${enable_norm}' in ('true', '1', 'yes', 'on')    ON    OFF
    ${current_state}=    Get Toggle State    ${Dual_View_Toggle_Button_XPATH}
    Run Keyword If    '${current_state}' != '${target_state}'    Click    ${Dual_View_Toggle_Button_XPATH}
    Sleep    0.1s

Toggle WL Sync Option in Dual View Mode
    [Arguments]    ${enable}
    [Documentation]    Toggle the Window/Level (WL) synchronization option in Dual View mode on or off.
    ...    ${enable} accepts truthy values (True/1/yes/on) to turn Sync WL ON, falsy values (False/0/no/off) to turn it OFF.

    Focus    ${MAIN_WINDOW_XPATH}
    Sleep    0.1s
    ${enable_norm}=    Evaluate    str($enable).strip().lower()
    ${target_state}=    Set Variable If    '${enable_norm}' in ('true', '1', 'yes', 'on')    ON    OFF
    ${current_state}=    Get Toggle State    ${Dual_View_SyncWL_Toggle_Button_XPATH}
    Run Keyword If    '${current_state}' != '${target_state}'    Click    ${Dual_View_SyncWL_Toggle_Button_XPATH}
    Sleep    0.1s

Toggle Zoom Sync Option in Dual View Mode
    [Arguments]    ${enable}
    [Documentation]    Toggle the Zoom synchronization option in Dual View mode on or off.
    ...    ${enable} accepts truthy values (True/1/yes/on) to turn Sync Zoom ON, falsy values (False/0/no/off) to turn it OFF.

    Focus    ${MAIN_WINDOW_XPATH}
    Sleep    0.1s
    ${enable_norm}=    Evaluate    str($enable).strip().lower()
    ${target_state}=    Set Variable If    '${enable_norm}' in ('true', '1', 'yes', 'on')    ON    OFF
    ${current_state}=    Get Toggle State    ${Dual_View_SyncZoom_Toggle_Button_XPATH}
    Run Keyword If    '${current_state}' != '${target_state}'    Click    ${Dual_View_SyncZoom_Toggle_Button_XPATH}
    Sleep    0.1s

Toggle Pan Sync Option in Dual View Mode
    [Arguments]    ${enable}
    [Documentation]    Toggle the Pan synchronization option in Dual View mode on or off.
    ...    ${enable} accepts truthy values (True/1/yes/on) to turn Sync Pan ON, falsy values (False/0/no/off) to turn it OFF.

    Focus    ${MAIN_WINDOW_XPATH}
    Sleep    0.1s
    ${enable_norm}=    Evaluate    str($enable).strip().lower()
    ${target_state}=    Set Variable If    '${enable_norm}' in ('true', '1', 'yes', 'on')    ON    OFF
    ${current_state}=    Get Toggle State    ${Dual_View_SyncPan_Toggle_Button_XPATH}
    Run Keyword If    '${current_state}' != '${target_state}'    Click    ${Dual_View_SyncPan_Toggle_Button_XPATH}
    Sleep    0.1s

Export Image
    [Arguments]    ${file_name}    ${folder_path}    ${save_as_type}=PNG
    ...    ${include_dicom_tags}=True    ${tags_position}=Outside
    ...    ${include_annotations}=True    ${include_measurements}=True
    ...    ${include_iqi_wire}=True
    [Documentation]    Open the Export Image dialog and export the currently active image.
    ...    ${file_name}: Name of the exported file (typed into the Export Image dialog's File Name field).
    ...    ${folder_path}: Full output path WITHOUT extension (e.g. C:\\Out\\Test1). The Save As dialog uses this as the file path and the Save as Type drives the extension. Parent directory is created if missing.
    ...    ${save_as_type}: File format short name. Accepted aliases (case/dot insensitive): PNG, JPEG/JPG, BMP, TIFF/TIF, DCM/DICOM/DICONDE. Each is resolved to the actual dropdown label ("PNG Image (*.png)", "JPEG Image (*.jpg)", "BMP Image (*.bmp)", "TIFF Image (*.tiff)", "DICONDE Image (*.dcm)"). The full label may also be passed directly.
    ...    ${include_dicom_tags}: Truthy/falsy — toggles the "Include DICOM tags" checkbox. Ignored when exporting as DICONDE/DCM (the checkbox is hidden in that mode).
    ...    ${tags_position}: 'Inside' or 'Outside' the image. Only honoured when ${include_dicom_tags} is truthy and the format is not DICONDE/DCM.
    ...    ${include_annotations}: Truthy/falsy — toggles the "Annotations" checkbox. Only present when annotations exist on the image; silently skipped otherwise. Defaults to True.
    ...    ${include_measurements}: Truthy/falsy — toggles the "Measurements" checkbox. Only present when annotations exist on the image; silently skipped otherwise. Defaults to True.
    ...    ${include_iqi_wire}: Truthy/falsy — toggles the "IQI Wire" checkbox. Only present when an IQI Wire phantom is detected on the image; silently skipped otherwise. Defaults to True.

    Click    ${Export_Image_Button_XPATH}
    Wait Until Element Exist    ${Export_Image_Window_XPATH}    5
    Sleep    0.7s

    Set Text To Textbox    ${Export_Image_FileName_Textbox_XPATH}    ${file_name}
    Sleep    0.3s
    ${type_key}=    Evaluate    str($save_as_type).strip().lstrip('.').upper()
    ${is_diconde_format}=    Set Variable If    '${type_key}' in ('DCM', 'DICOM', 'DICONDE')    ${True}    ${False}
    ${format_label_map}=    Evaluate    {'PNG': 'PNG Image (*.png)', 'JPEG': 'JPEG Image (*.jpg)', 'JPG': 'JPEG Image (*.jpg)', 'BMP': 'BMP Image (*.bmp)', 'TIFF': 'TIFF Image (*.tiff)', 'TIF': 'TIFF Image (*.tiff)', 'DCM': 'DICONDE Image (*.dcm)', 'DICOM': 'DICONDE Image (*.dcm)', 'DICONDE': 'DICONDE Image (*.dcm)'}
    ${save_as_type}=    Evaluate    $format_label_map.get($type_key, $save_as_type)
    Select Combobox Item By Name    ${Export_Image_Format_Combobox_XPATH}    ${save_as_type}
    Sleep    0.6s

    IF    not ${is_diconde_format}
        ${target_dicom_state}=    Evaluate    'ON' if str($include_dicom_tags).strip().lower() in ('true', '1', 'yes', 'on') else 'OFF'
        Sleep    0.2s
        ${current_dicom_state}=    Get Toggle State    ${Export_Image_DicomTags_Checkbox_XPATH}
        Run Keyword If    '${current_dicom_state}' != '${target_dicom_state}'    Click    ${Export_Image_DicomTags_Checkbox_XPATH}
        Sleep    0.4s

        IF    '${target_dicom_state}' == 'ON'
            ${tags_position_norm}=    Evaluate    str($tags_position).strip().lower()
            IF    '${tags_position_norm}' == 'inside'
                Click    ${Export_Image_TagsInside_Radio_XPATH}
            ELSE IF    '${tags_position_norm}' == 'outside'
                Click    ${Export_Image_TagsOutside_Radio_XPATH}
            ELSE
                Fail    Invalid tags_position '${tags_position}'. Use 'Inside' or 'Outside'.
            END
            Sleep    0.3s
        END
    END

    ${annotations_present}=    Run Keyword And Return Status
    ...    Wait Until Element Exist    ${Export_Image_Annotations_Checkbox_XPATH}    1
    IF    ${annotations_present}
        ${target_annotations_state}=    Evaluate    'ON' if str($include_annotations).strip().lower() in ('true', '1', 'yes', 'on') else 'OFF'
        ${current_annotations_state}=    Get Toggle State    ${Export_Image_Annotations_Checkbox_XPATH}
        Run Keyword If    '${current_annotations_state}' != '${target_annotations_state}'    Click    ${Export_Image_Annotations_Checkbox_XPATH}
        Sleep    0.3s
    END

    ${measurements_present}=    Run Keyword And Return Status
    ...    Wait Until Element Exist    ${Export_Image_Measurements_Checkbox_XPATH}    1
    IF    ${measurements_present}
        ${target_measurements_state}=    Evaluate    'ON' if str($include_measurements).strip().lower() in ('true', '1', 'yes', 'on') else 'OFF'
        ${current_measurements_state}=    Get Toggle State    ${Export_Image_Measurements_Checkbox_XPATH}
        Run Keyword If    '${current_measurements_state}' != '${target_measurements_state}'    Click    ${Export_Image_Measurements_Checkbox_XPATH}
        Sleep    0.3s
    END

    ${iqi_wire_present}=    Run Keyword And Return Status
    ...    Wait Until Element Exist    ${Export_Image_IqiWire_Checkbox_XPATH}    1
    IF    ${iqi_wire_present}
        ${target_iqi_wire_state}=    Evaluate    'ON' if str($include_iqi_wire).strip().lower() in ('true', '1', 'yes', 'on') else 'OFF'
        ${current_iqi_wire_state}=    Get Toggle State    ${Export_Image_IqiWire_Checkbox_XPATH}
        Run Keyword If    '${current_iqi_wire_state}' != '${target_iqi_wire_state}'    Click    ${Export_Image_IqiWire_Checkbox_XPATH}
        Sleep    0.3s
    END

    ${parent_folder}=    Evaluate    __import__('os').path.dirname(str($folder_path))
    Create Directory    ${parent_folder}

    Sleep    0.2s
    Click    ${Export_Image_Browse_Button_XPATH}
    Sleep    0.2s
    Wait Until Element Exist    ${Export_Image_SaveDialog_FileName_XPATH}    5
    Sleep    0.6s
    Set Text To Textbox    ${Export_Image_SaveDialog_FileName_XPATH}    ${folder_path}
    Sleep    0.5s
    Click    ${Export_Image_SaveDialog_Save_Button_XPATH}
    Sleep    0.5s
    ${overwrite_warning_present}=    Run Keyword And Return Status
    ...    Wait Until Element Exist    ${Export_Image_Overwrite_Yes_Button_XPATH}    2
    Run Keyword If    ${overwrite_warning_present}    Click    ${Export_Image_Overwrite_Yes_Button_XPATH}
    Sleep    0.5s

    Click    ${Export_Image_Export_Button_XPATH}
    Sleep    0.5s
    ${post_export_yes_present}=    Run Keyword And Return Status
    ...    Wait Until Element Exist    ${Export_Image_PostExport_Yes_Button_XPATH}    2
    Run Keyword If    ${post_export_yes_present}    Click    ${Export_Image_PostExport_Yes_Button_XPATH}
    Sleep    0.5s
    Wait Until Element Exist    ${Export_Image_Confirmation_Ok_Button_XPATH}    30
    Sleep    0.5s
    Click    ${Export_Image_Confirmation_Ok_Button_XPATH}
    Sleep    0.5s
    RETURN    ${folder_path}
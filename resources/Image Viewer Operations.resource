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

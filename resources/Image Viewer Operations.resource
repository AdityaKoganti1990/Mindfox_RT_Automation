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
${RGB_Status_Bar_Text_XPATH}    ${MAIN_WINDOW_XPATH}/StatusBar/Text[6]
${Annotation_Count_Status_Bar_Text_XPATH}    ${MAIN_WINDOW_XPATH}/StatusBar/Text[contains(@Name,"Annotations:")]
${SNR_Status_Bar_Text_XPATH}    ${MAIN_WINDOW_XPATH}/StatusBar/Text[contains(@Name,"SNR:")]
${Status_Bar_Message_XPATH}    ${MAIN_WINDOW_XPATH}/StatusBar/Text[1]/Text
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
${Export_Image_SaveIn_TextField_Xpath}    ${Export_Image_Window_XPATH}//Text[@AutomationId="FolderPathText"]
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
${Export_Image_Cancel_Button_XPATH}    ${Export_Image_Window_XPATH}//Button[@AutomationId="ExportImg_Btn_Cancel"]
${Export_Image_Confirmation_Ok_Button_XPATH}    ${MAIN_WINDOW_XPATH}/Window/Button[@Name="OK"]
${Export_Image_Overwrite_Yes_Button_XPATH}     ${Export_Image_Window_XPATH}/Window/Window/Button[@Name="Yes"]
${Export_Image_PostExport_Yes_Button_XPATH}    ${MAIN_WINDOW_XPATH}/Window/Button[@Name="Yes"]
${Fit_To_View_Button_XPATH}    ${MAIN_WINDOW_XPATH}/Button[@AutomationId="Main_Btn_FitToView"]
${Tags_Button_XPATH}    ${MAIN_WINDOW_XPATH}/Button[@AutomationId="Main_Btn_TagBrowser"]
${Overlay_Button_XPATH}    ${MAIN_WINDOW_XPATH}/Button[@AutomationId="Main_Btn_OverlayConfig"]
${Files_Tab_XPATH}    ${MAIN_WINDOW_XPATH}//TabItem[@AutomationId="Main_Tab_Files"]
${Filters_Tab_XPATH}    ${MAIN_WINDOW_XPATH}//TabItem[@AutomationId="Main_Tab_Filters"]
${Filters_Tab_Close_Button_XPATH}    ${MAIN_WINDOW_XPATH}//Button[@AutomationId="ImgFilters_Btn_Close"]

# ─────────────────── Paths ───────────────────

${test_data}           ${CURDIR}\\..\\Test_Data\\
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

Verify RGB Value Exists In Status Bar
    [Arguments]    ${expected_rgb}=${EMPTY}
    [Documentation]    Verify that an RGB value is displayed in the status bar (typically when the cursor is over a color image such as PNG/JPG/BMP/TIFF).
    ...
    ...    Without arguments: passes if the RGB status-bar text element is present and shows R:, G:, and B: components (e.g. "R:52 G:52 B:52").
    ...    With ${expected_rgb} as comma-separated values (e.g. "56,56,56"): also asserts each component matches the displayed value in R, G, B order.

    Set Retry Timeout    0
    ${rgb_exists}=    Run Keyword And Return Status    Element Should Exist    ${RGB_Status_Bar_Text_XPATH}
    Reset Retry Timeout
    Should Be True    ${rgb_exists}    Expected RGB value to be shown in status bar but it is not present.
    ${displayed_rgb}=    Get Name From Element    ${RGB_Status_Bar_Text_XPATH}
    Should Contain    ${displayed_rgb}    R:    Expected 'R:' component in status bar but got '${displayed_rgb}'.
    Should Contain    ${displayed_rgb}    G:    Expected 'G:' component in status bar but got '${displayed_rgb}'.
    Should Contain    ${displayed_rgb}    B:    Expected 'B:' component in status bar but got '${displayed_rgb}'.
    Log    RGB value '${displayed_rgb}' is displayed in the status bar as expected.

    IF    '${expected_rgb}' == '${EMPTY}'
        RETURN
    END
    ${displayed_parts}=    Evaluate    [p.split(':')[-1].strip() for p in str($displayed_rgb).split()]
    ${expected_parts}=    Evaluate    [p.strip() for p in str($expected_rgb).split(',')]
    Length Should Be    ${expected_parts}    3    Expected RGB triplet as 'R,G,B' (e.g. '56,56,56') but got '${expected_rgb}'.
    Length Should Be    ${displayed_parts}    3    Could not parse 3 components from displayed RGB '${displayed_rgb}'.
    Should Be Equal As Numbers    ${displayed_parts}[0]    ${expected_parts}[0]
    ...    Expected R=${expected_parts}[0] but status bar shows R=${displayed_parts}[0].
    Should Be Equal As Numbers    ${displayed_parts}[1]    ${expected_parts}[1]
    ...    Expected G=${expected_parts}[1] but status bar shows G=${displayed_parts}[1].
    Should Be Equal As Numbers    ${displayed_parts}[2]    ${expected_parts}[2]
    ...    Expected B=${expected_parts}[2] but status bar shows B=${displayed_parts}[2].

Verify Intensity Value Not Exists In Status Bar
    [Documentation]    Verify that no Intensity value is shown in the status bar (e.g. when the cursor is not over the image, or no image is loaded).
    ...    Passes if the Intensity status-bar text element is not present, or is present but contains no value after the "Intensity:" label.

    Set Retry Timeout    0
    ${intensity_exists}=    Run Keyword And Return Status    Element Should Exist    ${Intensity_Status_Bar_Text_XPATH}
    Reset Retry Timeout
    IF    not ${intensity_exists}
        Log    Intensity value is not displayed in the status bar as expected.
        RETURN
    END
    ${displayed_intensity}=    Get Name From Element    ${Intensity_Status_Bar_Text_XPATH}
    ${displayed_intensity_clean}=    Evaluate    str($displayed_intensity).strip().split(':')[-1].strip()
    Should Be Empty    ${displayed_intensity_clean}
    ...    Expected no intensity value in status bar but it shows '${displayed_intensity_clean}'.
    Log    Intensity value is not displayed in the status bar as expected.

Verify All Annotation Tools Are Disabled
    [Documentation]    Verify that all annotation tool buttons in the toolbar are disabled (typical state when no project is open).
    ...    Tools checked: Arrow, Ruler, Line, Rectangle, Circle, Freehand, Text, Point Intensity. Reports every mismatching tool (does not stop at the first failure).
    Verify All Annotation Tools State    disabled

Verify All Annotation Tools Are Enabled
    [Documentation]    Verify that all annotation tool buttons in the toolbar are enabled (typical state when a project is open).
    ...    Tools checked: Arrow, Ruler, Line, Rectangle, Circle, Freehand, Text, Point Intensity. Reports every mismatching tool (does not stop at the first failure).
    Verify All Annotation Tools State    enabled

Verify All Annotation Tools State
    [Arguments]    ${expected_state}
    [Documentation]    Internal helper for `Verify All Annotation Tools Are Disabled` / `Verify All Annotation Tools Are Enabled`.
    ...    Use those public keywords from tests; this exists only to share the per-tool loop.

    @{tool_names}=    Create List    Arrow    Ruler    Line    Rectangle    Circle    Freehand    Text    Point Intensity
    @{tool_xpaths}=    Create List
    ...    ${arrow_annotation_button_xpath}
    ...    ${ruler_annotation_button_xpath}
    ...    ${line_annotation_button_xpath}
    ...    ${rectangle_annotation_button_xpath}
    ...    ${circle_annotation_button_xpath}
    ...    ${freehand_annotation_button_xpath}
    ...    ${text_annotation_button_xpath}
    ...    ${point_intensity_annotation_button_xpath}
    Verify Tools In State    Annotation    ${expected_state}    ${tool_names}    ${tool_xpaths}

Verify All Analysis Tools Are Disabled
    [Documentation]    Verify that all analysis tool buttons in the toolbar are disabled (typical state when no project is open).
    ...    Tools checked: Line Profiler, ROI Statistics, Window Level, Pixel Intensity Histogram, Calibration, SNR Measurement, Surface Plot, Wall Thickness Measurement, CNR Measurement, MTF Measurement, IQI Wire Phantom, Defect Marking, Image Filter, Percentile Brightness/Contrast. Reports every mismatching tool (does not stop at the first failure).
    Verify All Analysis Tools State    disabled

Verify All Analysis Tools Are Enabled
    [Documentation]    Verify that all analysis tool buttons in the toolbar are enabled (typical state when a project is open).
    ...    Tools checked: Line Profiler, ROI Statistics, Window Level, Pixel Intensity Histogram, Calibration, SNR Measurement, Surface Plot, Wall Thickness Measurement, CNR Measurement, MTF Measurement, IQI Wire Phantom, Defect Marking, Image Filter, Percentile Brightness/Contrast. Reports every mismatching tool (does not stop at the first failure).
    Verify All Analysis Tools State    enabled

Verify All Analysis Tools State
    [Arguments]    ${expected_state}
    [Documentation]    Internal helper for `Verify All Analysis Tools Are Disabled` / `Verify All Analysis Tools Are Enabled`.
    ...    Use those public keywords from tests; this exists only to share the per-tool loop.

    @{tool_names}=    Create List    Line Profiler    ROI Statistics    Area Adjust    Window Level    Pixel Intensity Histogram    Calibration    SNR Measurement    Surface Plot    Wall Thickness Measurement    CNR Measurement    MTF Measurement    IQI Wire Phantom    Defect Marking    Filters    Auto BnC    Percentile BnC    Fox Bleach
    @{tool_xpaths}=    Create List
    ...    ${line_profiler_tool_button_xpath}
    ...    ${roi_statistics_tool_button_xpath}
    ...    ${window_level_tool_button_xpath}
    ...    ${window_Level_tool_panel_button_xpath}
    ...    ${pixel_intensity_histogram_button_xpath}
    ...    ${calibration_tool_button_xpath}
    ...    ${snr_measurement_tool_button_xpath}
    ...    ${surface_plot_tool_button_xpath}
    ...    ${wall_thickness_measurement_tool_button_xpath}
    ...    ${cnr_measurement_tool_button_xpath}
    ...    ${mtf_measurement_tool_button_xpath}
    ...    ${IQI_wire_phantom_tool_button_xpath}
    ...    ${defect_marking_tool_button_xpath}
    ...    ${Image_Filter_Tool_Button_XPATH}
    ...    ${autoBNC_menu_xpath}
    ...    ${percentile_brightness_contrast_filter_button_xpath}
    ...    ${fox_bleach_filter_button_xpath}
    Verify Tools In State    Analysis    ${expected_state}    ${tool_names}    ${tool_xpaths}

Verify All Image Operation Tools Are Disabled
    [Documentation]    Verify that all image operation tool buttons in the toolbar are disabled (typical state when no project is open).
    ...    Tools checked: Next Image, Previous Image, Zoom In, Zoom Out, Pan, Scale (Ruler), Rotate CW, Rotate CCW, Flip Horizontal, Flip Vertical, Invert, Dual View. Reports every mismatching tool (does not stop at the first failure).
    Verify All Image Operation Tools State    disabled

Verify All Image Operation Tools Are Enabled
    [Documentation]    Verify that all image operation tool buttons in the toolbar are enabled (typical state when a project is open).
    ...    Tools checked: Next Image, Previous Image, Zoom In, Zoom Out, Pan, Scale (Ruler), Rotate CW, Rotate CCW, Flip Horizontal, Flip Vertical, Invert, Dual View. Reports every mismatching tool (does not stop at the first failure).
    Verify All Image Operation Tools State    enabled

Verify All Image Operation Tools State
    [Arguments]    ${expected_state}
    [Documentation]    Internal helper for `Verify All Image Operation Tools Are Disabled` / `Verify All Image Operation Tools Are Enabled`.
    ...    Use those public keywords from tests; this exists only to share the per-tool loop.

    @{tool_names}=    Create List    Next Image    Previous Image    Zoom In    Zoom Out    Fit to View    Pan    Scale    Rotate CW    Rotate CCW    Flip Horizontal    Flip Vertical    Invert    Units    Delete All Annotations    Tags    Overlay    Dual View
    @{tool_xpaths}=    Create List
    ...    ${Click_Next_Image_Button_XPATH}
    ...    ${Click_Previous_Image_Button_XPATH}
    ...    ${Zoom_Up_Button_XPATH}
    ...    ${Zoom_Down_Button_XPATH}
    ...    ${Fit_To_View_Button_XPATH}
    ...    ${Pan_Tool_Button_XPATH}
    ...    ${Scale_Toggle_Button_XPATH}
    ...    ${Rotate_CW_Button_XPATH}
    ...    ${Rotate_CCW_Button_XPATH}
    ...    ${Flip_Horizontal_Button_XPATH}
    ...    ${Flip_Vertical_Button_XPATH}
    ...    ${Invert_button_XPATH}
    ...    ${Units_Toggle_Button_XPATH}
    ...    ${delete_annotation_button_xpath}
    ...    ${Tags_Button_XPATH}
    ...    ${Overlay_Button_XPATH}
    ...    ${Dual_View_Toggle_Button_XPATH}
    Verify Tools In State    Image Operation    ${expected_state}    ${tool_names}    ${tool_xpaths}

Verify Tools In State
    [Arguments]    ${group_label}    ${expected_state}    ${tool_names}    ${tool_xpaths}
    [Documentation]    Internal helper shared by all `Verify All <Group> Tools Are Enabled/Disabled` keywords.
    ...    Iterates the provided (names, xpaths) lists in matching order, asserts each control's state, and reports every mismatch (`Run Keyword And Continue On Failure`) rather than stopping at the first failure.
    ...    A tool that is not present in the UI tree is treated as 'disabled' (hidden == effectively unavailable). For expected_state=enabled, a missing tool still fails with a clear "not present" message.

    ${expected_state_norm}=    Evaluate    str($expected_state).strip().lower()
    Should Match Regexp    ${expected_state_norm}    ^(enabled|disabled)$
    ...    Invalid expected_state '${expected_state}'. Use 'enabled' or 'disabled'.

    ${names_count}=    Get Length    ${tool_names}
    ${xpaths_count}=    Get Length    ${tool_xpaths}
    Should Be Equal As Integers    ${names_count}    ${xpaths_count}
    ...    ${group_label} tool list mismatch: ${names_count} names vs ${xpaths_count} xpaths. Each xpath needs a matching name in the same position.

    Set Retry Timeout    0
    FOR    ${index}    ${xpath}    IN ENUMERATE    @{tool_xpaths}
        ${name}=    Set Variable    ${tool_names}[${index}]
        ${status}    ${is_enabled}=    Run Keyword And Ignore Error    Is Element Enabled    ${xpath}
        IF    '${status}' == 'FAIL'
            ${actual_state}=    Set Variable    not present
        ELSE
            ${actual_state}=    Set Variable If    ${is_enabled}    enabled    disabled
        END
        ${effective_actual}=    Set Variable    ${actual_state}
        IF    '${expected_state_norm}' == 'disabled' and '${actual_state}' == 'not present'
            ${effective_actual}=    Set Variable    disabled
            Log    ${group_label} tool '${name}' is not present in the UI; counting as disabled.
        END
        Run Keyword And Continue On Failure    Should Be Equal As Strings    ${effective_actual}    ${expected_state_norm}
        ...    ${group_label} tool '${name}' should be ${expected_state_norm} but is ${actual_state}.
    END
    Reset Retry Timeout
    Log    All ${group_label} tools verified for '${expected_state_norm}' state.

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

Verify Status Bar Message
    [Arguments]    ${expected_message}
    [Documentation]    Verify that the message currently displayed in the status bar's primary message slot matches the expected text exactly.
    ...    ${expected_message}: Full text to compare against (e.g. 'Loaded 6 file(s) from folder'). Match is case-sensitive and exact.

    Should Not Be Empty    ${expected_message}    Expected message cannot be empty.
    ${displayed_message}=    Get Name From Element    ${Status_Bar_Message_XPATH}
    Should Be Equal As Strings    ${displayed_message}    ${expected_message}
    ...    Expected status bar message '${expected_message}' but found '${displayed_message}'.

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

Select Tab In Right Panel
    [Arguments]    ${tab_name}
    [Documentation]    Click the named tab in the right panel of the main window.
    ...    ${tab_name} accepts: Files | Filters. A direct XPath (starting with '/' or '(') can also be passed for ad-hoc tabs that don't have a friendly name yet.

    ${tab_xpath}=    Resolve Right Panel Tab XPath    ${tab_name}
    Focus    ${MAIN_WINDOW_XPATH}
    Sleep    0.1s
    Click    ${tab_xpath}
    Sleep    0.1s

Resolve Right Panel Tab XPath
    [Arguments]    ${tab_name}
    [Documentation]    Translate a friendly right-panel tab name to its TabItem XPath. Pass-through if an XPath is already provided.
    Should Not Be Empty    ${tab_name}    Tab name cannot be empty.
    ${tab_value}=    Evaluate    str($tab_name).strip()
    Should Not Be Empty    ${tab_value}    Tab name cannot be blank.
    ${is_xpath}=    Evaluate    str($tab_value).startswith(('/', '('))
    IF    ${is_xpath}
        RETURN    ${tab_value}
    END

    ${tab_key}=    Evaluate    ''.join(ch.lower() for ch in str($tab_name).strip() if ch.isalnum())
    IF    '${tab_key}' == 'files' or '${tab_key}' == 'maintabfiles'
        RETURN    ${Files_Tab_XPATH}
    ELSE IF    '${tab_key}' == 'filters' or '${tab_key}' == 'maintabfilters'
        RETURN    ${Filters_Tab_XPATH}
    END

    Fail    Unsupported right panel tab '${tab_name}'. Supported tabs: Files, Filters.

Close Tab In Right Panel
    [Arguments]    ${tab_name}
    [Documentation]    Click the close (X) button on the named tab in the right panel.
    ...    ${tab_name} accepts: Filters. (Files tab has no close button.) A direct XPath (starting with '/' or '(') can also be passed.

    ${close_button_xpath}=    Resolve Right Panel Tab Close Button XPath    ${tab_name}
    Focus    ${MAIN_WINDOW_XPATH}
    Sleep    0.1s
    Click    ${close_button_xpath}
    Sleep    0.1s

Resolve Right Panel Tab Close Button XPath
    [Arguments]    ${tab_name}
    [Documentation]    Translate a friendly right-panel tab name to its close button XPath. Pass-through if an XPath is already provided.
    Should Not Be Empty    ${tab_name}    Tab name cannot be empty.
    ${tab_value}=    Evaluate    str($tab_name).strip()
    Should Not Be Empty    ${tab_value}    Tab name cannot be blank.
    ${is_xpath}=    Evaluate    str($tab_value).startswith(('/', '('))
    IF    ${is_xpath}
        RETURN    ${tab_value}
    END

    ${tab_key}=    Evaluate    ''.join(ch.lower() for ch in str($tab_name).strip() if ch.isalnum())
    IF    '${tab_key}' == 'filters' or '${tab_key}' == 'maintabfilters' or '${tab_key}' == 'imgfiltersbtnclose'
        RETURN    ${Filters_Tab_Close_Button_XPATH}
    END

    Fail    Unsupported right panel tab '${tab_name}' for close action. Supported tabs: Filters.

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
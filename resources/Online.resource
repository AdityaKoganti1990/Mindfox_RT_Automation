*** Settings ***
Library           FlaUILibrary    screenshot_dir=${CURDIR}\\..\\Actual\\test.png
Library           Collections
Library           Process
Library           ../lib/image_comparator.py
Library           ../lib/ironpy_remote_client.py
Library           AutoItLibrary
Resource          ../resources/imageviewer.resource

*** Variables ***
${ONLINE_MODE_TEXT_XPATH}    ${MAIN_WINDOW_XPATH}//Text[@Name="ONLINE"]
${OFFLINE_MODE_TEXT_XPATH}    ${MAIN_WINDOW_XPATH}//Text[@Name="OFFLINE"]
${ONLINE_MODE_TEXT_FALLBACK_XPATH}    ${MAIN_WINDOW_XPATH}//*[contains(@Name,"ONLINE")]
${OFFLINE_MODE_TEXT_FALLBACK_XPATH}    ${MAIN_WINDOW_XPATH}//*[contains(@Name,"OFFLINE")]
${ONLINE_READY_TEXT_XPATH}    ${MAIN_WINDOW_XPATH}//Text[@Name="Ready for acquisition"]
${ONLINE_READY_HINT_XPATH}    ${MAIN_WINDOW_XPATH}//Text[@Name="Connect a detector and start capture"]
${OFFLINE_READY_TEXT_XPATH}    ${MAIN_WINDOW_XPATH}//Text[@Name="Drop an image here"]
${OFFLINE_READY_HINT_XPATH}    ${MAIN_WINDOW_XPATH}//Text[@Name="or drag from the file list"]
${ONLINE_START_ACQUISITION_BUTTON_XPATH}    ${MAIN_WINDOW_XPATH}//Button[@AutomationId="Main_Btn_StartAcquisition"]
${ONLINE_STOP_ACQUISITION_BUTTON_XPATH}    ${MAIN_WINDOW_XPATH}//Button[@AutomationId="Main_Btn_StopAcquisition"]
${OFFLINE_OPEN_FILE_BUTTON_XPATH}    ${MAIN_WINDOW_XPATH}//Button[@AutomationId="Main_Btn_OpenFile"]
${Component_Create_Button_XPATH}    ${MAIN_WINDOW_XPATH}//Button[@AutomationId="Main_Btn_NewComponent"]
${Component_Resume_Button_XPATH}    ${MAIN_WINDOW_XPATH}//Button[@AutomationId="Main_Btn_ResumeComponent"]
${XRay_Controller_Button_XPATH}    ${MAIN_WINDOW_XPATH}//Button[@AutomationId="Main_Btn_XRayController"]
${MotionController_Button_XPATH}    ${MAIN_WINDOW_XPATH}//Button[@AutomationId="Main_Btn_MotionController"]
${DETECTOR_TAB_XPATH}    ${MAIN_WINDOW_XPATH}//TabItem[@AutomationId="Main_Tab_Detector"]
${DETECTOR_LIST_COMBOBOX_XPATH}    ${MAIN_WINDOW_XPATH}//ComboBox[@AutomationId="DetParams_Cmb_Detector"]
${BINNING_COMBOBOX_XPATH}    ${MAIN_WINDOW_XPATH}//ComboBox[@AutomationId="DetParams_Cmb_Binning"]
${ACQ_MODE_COMBOBOX_XPATH}    ${MAIN_WINDOW_XPATH}//ComboBox[@AutomationId="DetParams_Cmb_AcqMode"]
${VIDEO_FORMAT_COMBOBOX_XPATH}    ${MAIN_WINDOW_XPATH}//ComboBox[@AutomationId="DetParams_Cmb_VideoFormat"]
${ORIENTATION_COMBOBOX_XPATH}    ${MAIN_WINDOW_XPATH}//ComboBox[@AutomationId="DetParams_Cmb_DefaultOrientation"]
${ORIENTATION_COMBOBOX_FALLBACK_XPATH}    ${MAIN_WINDOW_XPATH}//Text[@Name="Orientation"]/following::ComboBox[1]
${ORIENTATION_FLIP_H_XPATH}    ${MAIN_WINDOW_XPATH}//*[@AutomationId="DetParams_Chk_FlipH"]
${ORIENTATION_FLIP_H_DETPARAMS_XPATH}    ${MAIN_WINDOW_XPATH}//*[contains(@AutomationId,"DetParams") and contains(@AutomationId,"FlipH")]
${ORIENTATION_FLIP_H_CHECKBOX_XPATH}    ${MAIN_WINDOW_XPATH}//CheckBox[contains(@Name,"Flip H")]
${ORIENTATION_FLIP_H_BUTTON_XPATH}    ${MAIN_WINDOW_XPATH}//Button[contains(@Name,"Flip H")]
${ORIENTATION_FLIP_H_LABEL_XPATH}    ${MAIN_WINDOW_XPATH}//Text[contains(@Name,"Flip H")]/following::CheckBox[1]
${ORIENTATION_FLIP_V_XPATH}    ${MAIN_WINDOW_XPATH}//*[@AutomationId="DetParams_Chk_FlipV"]
${ORIENTATION_FLIP_V_DETPARAMS_XPATH}    ${MAIN_WINDOW_XPATH}//*[contains(@AutomationId,"DetParams") and contains(@AutomationId,"FlipV")]
${ORIENTATION_FLIP_V_CHECKBOX_XPATH}    ${MAIN_WINDOW_XPATH}//CheckBox[contains(@Name,"Flip V")]
${ORIENTATION_FLIP_V_BUTTON_XPATH}    ${MAIN_WINDOW_XPATH}//Button[contains(@Name,"Flip V")]
${ORIENTATION_FLIP_V_LABEL_XPATH}    ${MAIN_WINDOW_XPATH}//Text[contains(@Name,"Flip V")]/following::CheckBox[1]
${EXPOSURE_TIME_SLIDER_XPATH}    ${MAIN_WINDOW_XPATH}//Slider[@AutomationId="DetParams_Sld_ExposureTime"]
${FRAME_RATE_SLIDER_XPATH}    ${MAIN_WINDOW_XPATH}//Slider[@AutomationId="DetParams_Sld_FrameRate"]
${GAIN_SLIDER_XPATH}    ${MAIN_WINDOW_XPATH}//Slider[@AutomationId="DetParams_Sld_Gain"]
${IMAGE_AVERAGING_SLIDER_XPATH}    ${MAIN_WINDOW_XPATH}//Slider[@AutomationId="DetParams_Sld_ImageAveraging"]
${SEQUENCE_FRAMES_SLIDER_XPATH}    ${MAIN_WINDOW_XPATH}//Slider[@AutomationId="DetParams_Sld_SequenceFrames"]
${XRay_Controller_Window_Tab_XPATH}    ${MAIN_WINDOW_XPATH}//TabItem[@AutomationId="Main_BottomTab_XRayController"]
${MOTION_CONTROLLER_WINDOW_XPATH}    ${MAIN_WINDOW_XPATH}//TabItem[@AutomationId="Main_BottomTab_MotionController"]
${COMPONENT_WINDOW_XPATH}    ${MAIN_WINDOW_XPATH}/Window[@Name="DICONDE Setup"]
${COMPONENT_WINDOW_Close_BUTTON_XPATH}    ${MAIN_WINDOW_XPATH}/Window/Button[@AutomationId="Diconde_Btn_CloseDialog"]
${RESUME_ACQUISITION_WINDOW_XPATH}    ${MAIN_WINDOW_XPATH}/Window[@Name="Resume Component"]
${RESUME_ACQUISITION_CANCEL_BUTTON_XPATH}    ${MAIN_WINDOW_XPATH}/Window[@Name="Resume Component"]/Button[@Name="Cancel"]
*** Keywords ***

Toggle Online Or Offline Mode
    [Arguments]    ${mode}
    ${target_mode}=    Normalize Online Or Offline Mode    ${mode}
    Wait Until Element Exist    ${MAIN_WINDOW_XPATH}    5
    Focus    ${MAIN_WINDOW_XPATH}
    ${current_mode}=    Get Current Online Or Offline Mode
    Log    Current mode: ${current_mode}. Requested mode: ${target_mode}.
    IF    '${current_mode}' == '${target_mode}'
        Log    Application is already in ${target_mode} mode.
        RETURN
    END
    Click Online Or Offline Toggle Control    ${current_mode}
    Wait Until Keyword Succeeds    10x    500ms    Application Mode Should Be    ${target_mode}
    Log    Application mode changed from ${current_mode} to ${target_mode}.

Verify Online Mode Is Enabled
    Application Mode Should Be    ONLINE

Verify Offline Mode Is Enabled
    Application Mode Should Be    OFFLINE

Normalize Online Or Offline Mode
    [Arguments]    ${mode}
    ${normalized_mode}=    Evaluate    str($mode).strip().upper()
    IF    '${normalized_mode}' == 'ON'
        ${normalized_mode}=    Set Variable    ONLINE
    ELSE IF    '${normalized_mode}' == 'OFF'
        ${normalized_mode}=    Set Variable    OFFLINE
    END
    Should Match Regexp    ${normalized_mode}    ^(ONLINE|OFFLINE)$
    ...    Unsupported mode: ${mode}. Use Online/Offline or On/Off.
    RETURN    ${normalized_mode}

Application Mode Should Be
    [Arguments]    ${mode}
    ${expected_mode}=    Normalize Online Or Offline Mode    ${mode}
    ${actual_mode}=    Get Current Online Or Offline Mode
    Should Be Equal As Strings
    ...    ${actual_mode}
    ...    ${expected_mode}
    ...    Expected application mode ${expected_mode}, but found ${actual_mode}.

Get Current Online Or Offline Mode
    Wait Until Element Exist    ${MAIN_WINDOW_XPATH}    5
    ${is_online}=    Is Visible Mode Indicator    ${ONLINE_MODE_TEXT_XPATH}
    IF    ${is_online}
        RETURN    ONLINE
    END
    ${is_offline}=    Is Visible Mode Indicator    ${OFFLINE_MODE_TEXT_XPATH}
    IF    ${is_offline}
        RETURN    OFFLINE
    END
    ${is_online}=    Is Visible Mode Indicator    ${ONLINE_READY_TEXT_XPATH}
    IF    ${is_online}
        RETURN    ONLINE
    END
    ${is_online}=    Is Visible Mode Indicator    ${ONLINE_READY_HINT_XPATH}
    IF    ${is_online}
        RETURN    ONLINE
    END
    ${is_offline}=    Is Visible Mode Indicator    ${OFFLINE_READY_TEXT_XPATH}
    IF    ${is_offline}
        RETURN    OFFLINE
    END
    ${is_offline}=    Is Visible Mode Indicator    ${OFFLINE_READY_HINT_XPATH}
    IF    ${is_offline}
        RETURN    OFFLINE
    END
    ${is_online}=    Is Visible Mode Indicator    ${ONLINE_START_ACQUISITION_BUTTON_XPATH}
    IF    ${is_online}
        RETURN    ONLINE
    END
    ${is_offline}=    Is Visible Mode Indicator    ${OFFLINE_OPEN_FILE_BUTTON_XPATH}
    IF    ${is_offline}
        RETURN    OFFLINE
    END
    ${is_online}=    Is Visible Mode Indicator    ${ONLINE_MODE_TEXT_FALLBACK_XPATH}
    IF    ${is_online}
        RETURN    ONLINE
    END
    ${is_offline}=    Is Visible Mode Indicator    ${OFFLINE_MODE_TEXT_FALLBACK_XPATH}
    IF    ${is_offline}
        RETURN    OFFLINE
    END
    Fail    Could not determine whether the application is in ONLINE or OFFLINE mode.

Click Online Or Offline Toggle Control
    [Arguments]    ${current_mode}=${EMPTY}
    Focus    ${MAIN_WINDOW_XPATH}
    ${clicked}=    Set Variable    ${False}
    IF    '${current_mode}' == 'ONLINE'
        ${clicked}=    Run Keyword And Return Status    Click    ${ONLINE_MODE_TEXT_XPATH}
        IF    not ${clicked}
            ${clicked}=    Run Keyword And Return Status    Click    ${ONLINE_MODE_TEXT_FALLBACK_XPATH}
        END
    ELSE IF    '${current_mode}' == 'OFFLINE'
        ${clicked}=    Run Keyword And Return Status    Click    ${OFFLINE_MODE_TEXT_XPATH}
        IF    not ${clicked}
            ${clicked}=    Run Keyword And Return Status    Click    ${OFFLINE_MODE_TEXT_FALLBACK_XPATH}
        END
    END
    IF    not ${clicked}
        ${clicked}=    Run Keyword And Return Status    Click    ${OFFLINE_MODE_TEXT_XPATH}
    END
    IF    not ${clicked}
        ${clicked}=    Run Keyword And Return Status    Click    ${ONLINE_MODE_TEXT_XPATH}
    END
    IF    not ${clicked}
        ${clicked}=    Run Keyword And Return Status    Click    ${OFFLINE_MODE_TEXT_FALLBACK_XPATH}
    END
    IF    not ${clicked}
        ${clicked}=    Run Keyword And Return Status    Click    ${ONLINE_MODE_TEXT_FALLBACK_XPATH}
    END
    Should Be True    ${clicked}    Could not locate or click the online/offline mode toggle.

Is Visible Mode Indicator
    [Arguments]    ${xpath}    ${timeout}=1
    ${exists}=    Run Keyword And Return Status    Wait Until Element Exist    ${xpath}    ${timeout}
    IF    not ${exists}
        RETURN    ${False}
    END
    ${offscreen_raw}=    Is Element Offscreen    ${xpath}
    ${is_offscreen}=    Evaluate    str($offscreen_raw).strip().lower() == 'true'
    RETURN    not ${is_offscreen}

VerifyControlState
    [Arguments]    ${control_name}=${EMPTY}    ${expected_state}=${EMPTY}    ${timeout}=2
    Should Not Be Empty    ${control_name}    Control name cannot be empty.
    ${control_xpath}=    Resolve Online Control XPath    ${control_name}
    ${normalized_expected_state}=    Set Variable    ${EMPTY}
    IF    '${expected_state}' != '${EMPTY}'
        ${normalized_expected_state}=    Normalize Control State    ${expected_state}
    END
    ${effective_timeout}=    Set Variable If    '${normalized_expected_state}' == 'not exists'    0.5    ${timeout}
    ${exists}=    Run Keyword And Return Status    Wait Until Element Exist    ${control_xpath}    ${effective_timeout}
    IF    not ${exists}
        ${actual_state}=    Set Variable    not exists
        Log    Control '${control_name}' does not exist.
    ELSE
        IF    '${normalized_expected_state}' == 'enabled'
            ${is_enabled}=    Run Keyword And Return Status    Wait Until Element Is Enabled    ${control_xpath}    ${timeout}
        ELSE
            ${is_enabled}=    Is Element Enabled    ${control_xpath}
        END
        ${actual_state}=    Set Variable If    ${is_enabled}    enabled    disabled
        Log    Control '${control_name}' is currently ${actual_state}.
    END
    IF    '${normalized_expected_state}' != '${EMPTY}'
        IF    '${normalized_expected_state}' == 'exists'
            Should Not Be Equal As Strings    ${actual_state}    not exists
            ...    Control '${control_name}' should exist, but it does not.
        ELSE
            Should Be Equal As Strings    ${actual_state}    ${normalized_expected_state}
            ...    Control '${control_name}' should be ${normalized_expected_state}, but it is ${actual_state}.
        END
    END
    RETURN    ${actual_state}

Resolve Online Control XPath
    [Arguments]    ${control_name}
    Should Not Be Empty    ${control_name}    Control name cannot be empty.
    ${control_value}=    Evaluate    str($control_name).strip()
    Should Not Be Empty    ${control_value}    Control name cannot be blank.
    ${is_xpath}=    Evaluate    str($control_value).startswith(('/', '('))
    IF    ${is_xpath}
        RETURN    ${control_value}
    END

    ${control_key}=    Evaluate    ''.join(ch.lower() for ch in str($control_name).strip() if ch.isalnum())
    IF    '${control_key}' == 'startacquisition' or '${control_key}' == 'onlinestartacquisition' or '${control_key}' == 'mainbtnstartacquisition'
        RETURN    ${ONLINE_START_ACQUISITION_BUTTON_XPATH}
    ELSE IF    '${control_key}' == 'openfile' or '${control_key}' == 'offlineopenfile' or '${control_key}' == 'mainbtnopenfile'
        RETURN    ${OFFLINE_OPEN_FILE_BUTTON_XPATH}
    END

    Fail    Unsupported control name '${control_name}'. Supported controls: Start Acquisition, Open File. You can also pass a direct XPath.

Normalize Control State
    [Arguments]    ${state}
    Should Not Be Empty    ${state}    Expected control state cannot be empty.
    ${normalized_state}=    Evaluate    str($state).strip().lower()
    IF    '${normalized_state}' in ('enable', 'enabled')
        RETURN    enabled
    ELSE IF    '${normalized_state}' in ('disable', 'disabled')
        RETURN    disabled
    ELSE IF    '${normalized_state}' in ('exist', 'exists', 'present', 'visible')
        RETURN    exists
    ELSE IF    '${normalized_state}' in ('not exist', 'not exists', 'notexist', 'notexists', 'not present', 'notpresent', 'hidden', 'absent')
        RETURN    not exists
    END
    Fail    Unsupported control state '${state}'. Use enabled, disabled, exists, or not exists.

Show or Hide XRay Controller
    [Arguments]    ${state}

    Focus    ${MAIN_WINDOW_XPATH}
    Sleep    0.1s
    ${state_norm}=    Evaluate    str($state).strip().lower()
    ${should_show}=    Evaluate    $state_norm in ('show', 'true', '1', 'on')
    ${should_hide}=    Evaluate    $state_norm in ('hide', 'false', '0', 'off')
    Should Be True    ${should_show} or ${should_hide}
    ...    Invalid state '${state}'. Use 'Show' or 'Hide'.
    ${tab_exists}=    Run Keyword And Return Status    Wait Until Element Exist    ${XRay_Controller_Window_Tab_XPATH}    2
    Log    XRay Controller tab exists in tree: ${tab_exists}
    IF    ${tab_exists}
        ${offscreen_raw}=    Is Element Offscreen    ${XRay_Controller_Window_Tab_XPATH}
        Log    XRay Controller tab Is Element Offscreen raw value: '${offscreen_raw}'
        ${is_offscreen}=    Evaluate    str($offscreen_raw).strip().lower() == 'true'
        ${currently_shown}=    Evaluate    not ${is_offscreen}
    ELSE
        ${currently_shown}=    Set Variable    ${False}
    END
    Log    X-Ray Controller currently shown: ${currently_shown}
    Log    should_show=${should_show}, should_hide=${should_hide}
    IF    ${should_show} and not ${currently_shown}
        Log    Clicking button to SHOW XRay Controller
        Click    ${XRay_Controller_Button_XPATH}
    ELSE IF    ${should_hide} and ${currently_shown}
        Log    Clicking button to HIDE XRay Controller
        Click    ${XRay_Controller_Button_XPATH}
    ELSE
        Log    XRay Controller already in requested state - no click needed
    END
    Sleep    0.5s

Open Component Window
    Focus    ${MAIN_WINDOW_XPATH}
    Click    ${Component_Create_Button_XPATH}
    Sleep    0.5s
    Wait Until Element Exist    ${COMPONENT_WINDOW_XPATH}    5

Close Component Window
    Focus    ${COMPONENT_WINDOW_XPATH}
    Click    ${COMPONENT_WINDOW_Close_BUTTON_XPATH}
    Sleep    0.5s
    Wait Until Element Does Not Exist    ${COMPONENT_WINDOW_XPATH}    5

Open Resume Acquisition Window
    Focus    ${MAIN_WINDOW_XPATH}
    Click    ${Component_Resume_Button_XPATH}
    Sleep    0.5s
    Wait Until Element Exist    ${RESUME_ACQUISITION_WINDOW_XPATH}    5

Close Resume Acquisition Window
    Focus    ${RESUME_ACQUISITION_WINDOW_XPATH}
    Click    ${RESUME_ACQUISITION_CANCEL_BUTTON_XPATH}
    Sleep    0.5s
    Wait Until Element Does Not Exist    ${RESUME_ACQUISITION_WINDOW_XPATH}    5

Verify Detectors List In Detector Tab
    [Arguments]    @{expected_detectors}
    [Documentation]    Verify that each detector in the provided list exists in the Detector dropdown.

    Should Not Be Empty    ${expected_detectors}    Expected detectors list cannot be empty.
    Focus    ${MAIN_WINDOW_XPATH}
    Sleep    0.1s
    Wait Until Element Exist    ${DETECTOR_LIST_COMBOBOX_XPATH}    5
    ${available_detectors}=    Get All Names From Combobox    ${DETECTOR_LIST_COMBOBOX_XPATH}
    Log    Available detectors: ${available_detectors}
    FOR    ${detector}    IN    @{expected_detectors}
        Combobox Should Contain    ${DETECTOR_LIST_COMBOBOX_XPATH}    ${detector}
        Log    Detector '${detector}' exists in the list as expected.
    END
    RETURN    ${available_detectors}

Verify Binning Options In Detector Tab
    [Arguments]    @{expected_binning_options}
    [Documentation]    Verify that each binning option in the provided list exists in the Binning dropdown.

    Should Not Be Empty    ${expected_binning_options}    Expected binning options list cannot be empty.
    Focus    ${MAIN_WINDOW_XPATH}
    Sleep    0.1s
    Wait Until Element Exist    ${BINNING_COMBOBOX_XPATH}    5
    ${available_options}=    Get All Names From Combobox    ${BINNING_COMBOBOX_XPATH}
    Log    Available binning options: ${available_options}
    FOR    ${option}    IN    @{expected_binning_options}
        Combobox Should Contain    ${BINNING_COMBOBOX_XPATH}    ${option}
        Log    Binning option '${option}' exists in the list as expected.
    END
    RETURN    ${available_options}

Verify Acq Mode Options In Detector Tab
    [Arguments]    @{expected_acq_modes}
    [Documentation]    Verify that each acquisition mode in the provided list exists in the Acq Mode dropdown.

    Should Not Be Empty    ${expected_acq_modes}    Expected acquisition mode list cannot be empty.
    Focus    ${MAIN_WINDOW_XPATH}
    Sleep    0.1s
    Wait Until Element Exist    ${ACQ_MODE_COMBOBOX_XPATH}    5
    ${available_modes}=    Get All Names From Combobox    ${ACQ_MODE_COMBOBOX_XPATH}
    Log    Available acquisition modes: ${available_modes}
    FOR    ${mode}    IN    @{expected_acq_modes}
        Combobox Should Contain    ${ACQ_MODE_COMBOBOX_XPATH}    ${mode}
        Log    Acquisition mode '${mode}' exists in the list as expected.
    END
    RETURN    ${available_modes}

Set Acq Mode
    [Arguments]    ${acq_mode}
    [Documentation]    Select the specified acquisition mode from the Acq Mode dropdown.

    Should Not Be Empty    ${acq_mode}    Acquisition mode cannot be empty.
    Focus    ${MAIN_WINDOW_XPATH}
    Sleep    0.1s
    Wait Until Element Exist    ${ACQ_MODE_COMBOBOX_XPATH}    5
    Select Combobox Item By Name    ${ACQ_MODE_COMBOBOX_XPATH}    ${acq_mode}
    Sleep    0.1s

Verify Video Format Options In Detector Tab
    [Arguments]    @{expected_video_formats}
    [Documentation]    Verify that each video format in the provided list exists in the Video Format dropdown.

    Should Not Be Empty    ${expected_video_formats}    Expected video format list cannot be empty.
    Focus    ${MAIN_WINDOW_XPATH}
    Sleep    0.1s
    Wait Until Element Exist    ${VIDEO_FORMAT_COMBOBOX_XPATH}    5
    ${available_formats}=    Get All Names From Combobox    ${VIDEO_FORMAT_COMBOBOX_XPATH}
    Log    Available video formats: ${available_formats}
    FOR    ${format}    IN    @{expected_video_formats}
        Combobox Should Contain    ${VIDEO_FORMAT_COMBOBOX_XPATH}    ${format}
        Log    Video format '${format}' exists in the list as expected.
    END
    RETURN    ${available_formats}

Verify Orientation Options
    [Arguments]    @{orientation_args}    &{flip_expectations}
    [Documentation]    Verify orientation dropdown options and Flip H/Flip V availability/state. Use Flip H=True and Flip V=False style arguments for expected flip state. Pass Flip H=NA (or Flip V=NA) to only verify the control exists and skip the availability/state check.

    ${expected_orientation_options}    ${expected_flip_states}=    Parse Orientation Verification Arguments
    ...    @{orientation_args}
    ...    &{flip_expectations}
    Should Not Be Empty    ${expected_orientation_options}    Expected orientation options list cannot be empty.
    Focus    ${MAIN_WINDOW_XPATH}
    Sleep    0.1s
    ${orientation_combobox_xpath}=    Set Variable    ${ORIENTATION_COMBOBOX_XPATH}
    ${exists}=    Run Keyword And Return Status    Wait Until Element Exist    ${orientation_combobox_xpath}    2
    IF    not ${exists}
        ${orientation_combobox_xpath}=    Set Variable    ${ORIENTATION_COMBOBOX_FALLBACK_XPATH}
    END
    Wait Until Element Exist    ${orientation_combobox_xpath}    5
    ${available_orientations}=    Get All Names From Combobox    ${orientation_combobox_xpath}
    Log    Available orientation options: ${available_orientations}
    FOR    ${orientation}    IN    @{expected_orientation_options}
        Combobox Should Contain    ${orientation_combobox_xpath}    ${orientation}
        Log    Orientation option '${orientation}' exists in the list as expected.
    END

    ${flip_h_expected}=    Evaluate    $expected_flip_states.get('fliph', '')
    ${flip_v_expected}=    Evaluate    $expected_flip_states.get('flipv', '')
    ${flip_h_state}=    Verify Orientation Flip Control    Flip H    ${flip_h_expected}
    ${flip_v_state}=    Verify Orientation Flip Control    Flip V    ${flip_v_expected}
    &{flip_states}=    Create Dictionary    Flip H=${flip_h_state}    Flip V=${flip_v_state}
    RETURN    ${available_orientations}    ${flip_states}

Parse Orientation Verification Arguments
    [Arguments]    @{orientation_args}    &{flip_expectations}

    @{expected_orientation_options}=    Create List
    &{expected_flip_states}=    Create Dictionary

    FOR    ${orientation_arg}    IN    @{orientation_args}
        ${separator_index}=    Evaluate    str($orientation_arg).find('=')
        IF    ${separator_index} > 0
            ${flip_name}=    Evaluate    str($orientation_arg)[:${separator_index}].strip()
            ${flip_value}=    Evaluate    str($orientation_arg)[${separator_index}+1:].strip()
            ${flip_key}=    Normalize Orientation Flip Control Name    ${flip_name}
            Set To Dictionary    ${expected_flip_states}    ${flip_key}=${flip_value}
        ELSE
            Append To List    ${expected_orientation_options}    ${orientation_arg}
        END
    END

    FOR    ${flip_name}    ${flip_value}    IN    &{flip_expectations}
        ${flip_key}=    Normalize Orientation Flip Control Name    ${flip_name}
        Set To Dictionary    ${expected_flip_states}    ${flip_key}=${flip_value}
    END

    RETURN    ${expected_orientation_options}    ${expected_flip_states}

Normalize Orientation Flip Control Name
    [Arguments]    ${control_name}

    Should Not Be Empty    ${control_name}    Flip control name cannot be empty.
    ${control_key}=    Evaluate    ''.join(ch.lower() for ch in str($control_name).strip() if ch.isalnum())
    IF    '${control_key}' in ('fliph', 'fliphorizontal', 'horizontal')
        RETURN    fliph
    ELSE IF    '${control_key}' in ('flipv', 'glipv', 'flipvertical', 'vertical')
        RETURN    flipv
    END
    Fail    Unsupported orientation flip control '${control_name}'. Use Flip H or Flip V.

Resolve Orientation Flip Control XPath
    [Arguments]    ${control_name}

    ${control_key}=    Normalize Orientation Flip Control Name    ${control_name}
    IF    '${control_key}' == 'fliph'
        @{candidate_xpaths}=    Create List
        ...    ${ORIENTATION_FLIP_H_XPATH}
        ...    ${ORIENTATION_FLIP_H_DETPARAMS_XPATH}
        ...    ${ORIENTATION_FLIP_H_CHECKBOX_XPATH}
        ...    ${ORIENTATION_FLIP_H_BUTTON_XPATH}
        ...    ${ORIENTATION_FLIP_H_LABEL_XPATH}
    ELSE
        @{candidate_xpaths}=    Create List
        ...    ${ORIENTATION_FLIP_V_XPATH}
        ...    ${ORIENTATION_FLIP_V_DETPARAMS_XPATH}
        ...    ${ORIENTATION_FLIP_V_CHECKBOX_XPATH}
        ...    ${ORIENTATION_FLIP_V_BUTTON_XPATH}
        ...    ${ORIENTATION_FLIP_V_LABEL_XPATH}
    END

    FOR    ${candidate_xpath}    IN    @{candidate_xpaths}
        ${exists}=    Run Keyword And Return Status    Wait Until Element Exist    ${candidate_xpath}    1
        IF    ${exists}
            RETURN    ${candidate_xpath}
        END
    END
    Fail    Could not find ${control_name} control in the detector orientation controls.

Verify Orientation Flip Control
    [Arguments]    ${control_name}    ${expected_state}=${EMPTY}

    ${control_xpath}=    Resolve Orientation Flip Control XPath    ${control_name}
    Wait Until Element Exist    ${control_xpath}    5
    ${normalized_expected}=    Evaluate    str($expected_state).strip().lower()
    IF    '${normalized_expected}' in ('na', 'n/a')
        Log    ${control_name} control exists. Skipping availability/state verification (NA).
        RETURN    ${None}
    END
    ${toggle_state}=    Get Toggle State    ${control_xpath}
    ${actual_checked}=    Normalize Orientation Flip Toggle State    ${toggle_state}    ${control_name}
    Log    ${control_name} control exists and is ${actual_checked}.
    IF    str($expected_state).strip() != ''
        ${expected_checked}=    Normalize Orientation Flip Expected State    ${expected_state}    ${control_name}
        Should Be Equal    ${actual_checked}    ${expected_checked}
        ...    ${control_name} expected checked state ${expected_checked}, but actual checked state is ${actual_checked}.
    END
    RETURN    ${actual_checked}

Normalize Orientation Flip Expected State
    [Arguments]    ${state}    ${control_name}=Flip control

    ${normalized}=    Evaluate    str($state).strip().lower()
    ${is_true}=    Evaluate    $normalized in ('true','1','yes','y','on','checked','check','selected')
    ${is_false}=    Evaluate    $normalized in ('false','0','no','n','off','unchecked','uncheck','notchecked','not selected','notselected')
    IF    ${is_true}
        RETURN    ${True}
    END
    IF    ${is_false}
        RETURN    ${False}
    END
    Fail    Invalid expected state for ${control_name}: ${state}. Use true/false, checked/unchecked, yes/no, or on/off.

Normalize Orientation Flip Toggle State
    [Arguments]    ${state}    ${control_name}=Flip control

    ${normalized}=    Evaluate    str($state).strip().lower()
    IF    '${normalized}' in ('on', 'true', '1', 'checked', 'selected')
        RETURN    ${True}
    ELSE IF    '${normalized}' in ('off', 'false', '0', 'unchecked', 'unselected')
        RETURN    ${False}
    END
    Fail    Could not read checked state for ${control_name}. Toggle state was: ${state}.

Toggle Motion Controller Window
    [Arguments]    ${state}

    Focus    ${MAIN_WINDOW_XPATH}
    Sleep    0.1s
    ${state_norm}=    Evaluate    str($state).strip().lower()
    ${should_show}=    Evaluate    $state_norm in ('show', 'true', '1', 'on', 'open')
    ${should_hide}=    Evaluate    $state_norm in ('hide', 'false', '0', 'off', 'close')
    Should Be True    ${should_show} or ${should_hide}
    ...    Invalid state '${state}'. Use 'Show'/'Hide', 'On'/'Off', or 'True'/'False'.
    ${tab_exists}=    Run Keyword And Return Status    Wait Until Element Exist    ${MOTION_CONTROLLER_WINDOW_XPATH}    2
    Log    Motion Controller tab exists in tree: ${tab_exists}
    IF    ${tab_exists}
        ${offscreen_raw}=    Is Element Offscreen    ${MOTION_CONTROLLER_WINDOW_XPATH}
        Log    Motion Controller tab Is Element Offscreen raw value: '${offscreen_raw}'
        ${is_offscreen}=    Evaluate    str($offscreen_raw).strip().lower() == 'true'
        ${currently_shown}=    Evaluate    not ${is_offscreen}
    ELSE
        ${currently_shown}=    Set Variable    ${False}
    END
    Log    Motion Controller currently shown: ${currently_shown}
    Log    should_show=${should_show}, should_hide=${should_hide}
    IF    ${should_show} and not ${currently_shown}
        Log    Clicking button to SHOW Motion Controller
        Click    ${MotionController_Button_XPATH}
    ELSE IF    ${should_hide} and ${currently_shown}
        Log    Clicking button to HIDE Motion Controller
        Click    ${MotionController_Button_XPATH}
    ELSE
        Log    Motion Controller already in requested state - no click needed
    END
    Sleep    0.5s

*** Settings ***
Library           FlaUILibrary    screenshot_dir=${CURDIR}\\..\\Actual\\test.png
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
${DETECTOR_TAB_XPATH}    ${MAIN_WINDOW_XPATH}//TabItem[@AutomationId="Main_Tab_Detector"]
${DETECTOR_LIST_COMBOBOX_XPATH}    ${MAIN_WINDOW_XPATH}//ComboBox[@AutomationId="DetParams_Cmb_Detector"]
${BINNING_COMBOBOX_XPATH}    ${MAIN_WINDOW_XPATH}//ComboBox[@AutomationId="DetParams_Cmb_Binning"]
${ACQ_MODE_COMBOBOX_XPATH}    ${MAIN_WINDOW_XPATH}//ComboBox[@AutomationId="DetParams_Cmb_AcqMode"]
${VIDEO_FORMAT_COMBOBOX_XPATH}    ${MAIN_WINDOW_XPATH}//ComboBox[@AutomationId="DetParams_Cmb_VideoFormat"]
${EXPOSURE_TIME_SLIDER_XPATH}    ${MAIN_WINDOW_XPATH}//Slider[@AutomationId="DetParams_Sld_ExposureTime"]
${FRAME_RATE_SLIDER_XPATH}    ${MAIN_WINDOW_XPATH}//Slider[@AutomationId="DetParams_Sld_FrameRate"]
${GAIN_SLIDER_XPATH}    ${MAIN_WINDOW_XPATH}//Slider[@AutomationId="DetParams_Sld_Gain"]
${IMAGE_AVERAGING_SLIDER_XPATH}    ${MAIN_WINDOW_XPATH}//Slider[@AutomationId="DetParams_Sld_ImageAveraging"]
${SEQUENCE_FRAMES_SLIDER_XPATH}    ${MAIN_WINDOW_XPATH}//Slider[@AutomationId="DetParams_Sld_SequenceFrames"]
${XRay_Controller_Window_Tab_XPATH}    ${MAIN_WINDOW_XPATH}//TabItem[@AutomationId="Main_BottomTab_XRayController"]
${COMPONENT_WINDOW_XPATH}    ${MAIN_WINDOW_XPATH}/Window[@Name="DICONDE Setup"]
${COMPONENT_WINDOW_Close_BUTTON_XPATH}    ${MAIN_WINDOW_XPATH}/Window/Button[@AutomationId="Diconde_Btn_CloseDialog"]
${RESUME_ACQUISITION_WINDOW_XPATH}    ${MAIN_WINDOW_XPATH}/Window[@Name="Resume Component"]
${RESUME_ACQUISITION_CANCEL_BUTTON_XPATH}    ${MAIN_WINDOW_XPATH}/Window[@Name="Resume Component"]/Button[@Name="Cancel"]
*** Keywords ***

Toggle Online/Offline Mode
    [Arguments]    ${mode}
    ${target_mode}=    Normalize Online/Offline Mode    ${mode}
    Wait Until Element Exist    ${MAIN_WINDOW_XPATH}    5
    Focus    ${MAIN_WINDOW_XPATH}
    ${current_mode}=    Get Current Online/Offline Mode
    Log    Current mode: ${current_mode}. Requested mode: ${target_mode}.
    IF    '${current_mode}' == '${target_mode}'
        Log    Application is already in ${target_mode} mode.
        RETURN
    END
    Click Online/Offline Toggle Control    ${current_mode}
    Wait Until Keyword Succeeds    10x    500ms    Application Mode Should Be    ${target_mode}
    Log    Application mode changed from ${current_mode} to ${target_mode}.

Verify Online Mode Is Enabled
    Application Mode Should Be    ONLINE

Verify Offline Mode Is Enabled
    Application Mode Should Be    OFFLINE

Normalize Online/Offline Mode
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
    ${expected_mode}=    Normalize Online/Offline Mode    ${mode}
    ${actual_mode}=    Get Current Online/Offline Mode
    Should Be Equal As Strings
    ...    ${actual_mode}
    ...    ${expected_mode}
    ...    Expected application mode ${expected_mode}, but found ${actual_mode}.

Get Current Online/Offline Mode
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

Click Online/Offline Toggle Control
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
    [Arguments]    ${control_name}=${EMPTY}    ${expected_state}=${EMPTY}    ${timeout}=5
    Should Not Be Empty    ${control_name}    Control name cannot be empty.
    ${control_xpath}=    Resolve Online Control XPath    ${control_name}
    ${normalized_expected_state}=    Set Variable    ${EMPTY}
    IF    '${expected_state}' != '${EMPTY}'
        ${normalized_expected_state}=    Normalize Control State    ${expected_state}
    END
    ${effective_timeout}=    Set Variable If    '${normalized_expected_state}' == 'not exists'    2    ${timeout}
    ${exists}=    Run Keyword And Return Status    Wait Until Element Exist    ${control_xpath}    ${effective_timeout}
    IF    not ${exists}
        ${actual_state}=    Set Variable    not exists
        Log    Control '${control_name}' does not exist.
    ELSE
        ${is_enabled}=    Run Keyword And Return Status    Wait Until Element Is Enabled    ${control_xpath}    1
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

Show/Hide XRay Controller
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


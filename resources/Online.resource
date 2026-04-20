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
    Wait Until Element Exist    ${control_xpath}    ${timeout}
    ${is_enabled}=    Run Keyword And Return Status    Wait Until Element Is Enabled    ${control_xpath}    1
    ${actual_state}=    Set Variable If    ${is_enabled}    enabled    disabled
    Log    Control '${control_name}' is currently ${actual_state}.
    IF    '${expected_state}' != '${EMPTY}'
        ${normalized_expected_state}=    Normalize Control State    ${expected_state}
        Should Be Equal As Strings
        ...    ${actual_state}
        ...    ${normalized_expected_state}
        ...    Control '${control_name}' should be ${normalized_expected_state}, but it is ${actual_state}.
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
    IF    '${normalized_state}' == 'enable'
        RETURN    enabled
    ELSE IF    '${normalized_state}' == 'enabled'
        RETURN    enabled
    ELSE IF    '${normalized_state}' == 'disable'
        RETURN    disabled
    ELSE IF    '${normalized_state}' == 'disabled'
        RETURN    disabled
    END
    Fail    Unsupported control state '${state}'. Use enabled or disabled.

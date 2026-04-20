*** Settings ***
Library           FlaUILibrary
Library           Process
Library           AutoItLibrary
Library           OperatingSystem
Resource          ../resources/login.resource
Resource          ../resources/General.resource
Resource          ../resources/imageviewer.resource
Resource          ../resources/Actions.resource
Resource          ../resources/Annotations.resource
Resource          ../resources/Tools.resource
Resource          ../resources/Online.resource

*** Variables ***

*** Test Cases ***

MFRTO1 - Verify whether able to open RT application in online mode.
    [Documentation]    Verify whether able to open RT application in online mode.
    [Tags]    MFRTO1

    Open FoxViewerDesktop Application
    Login To FoxViewerDesktop    Sri    Sri
    Toggle Online/Offline Mode    Online
    Verify Online Mode Is Enabled

MFRTO2 - Verify the default display when switched to Online mode.
    [Documentation]    Verify the default display when switched to Online mode.
    [Tags]    MFRTO2

    Toggle Online/Offline Mode    Online
    Run Keyword And Continue On Failure   VerifyControlState    control_name=${ONLINE_START_ACQUISITION_BUTTON_XPATH}    expected_state=enabled    timeout=5
    Run Keyword And Continue On Failure    VerifyControlState    control_name=${ONLINE_STOP_ACQUISITION_BUTTON_XPATH}    expected_state=disabled    timeout=5
    Run Keyword And Continue On Failure    VerifyControlState    control_name=${Component_Create_Button_XPATH}    expected_state=enabled    timeout=5
    Run Keyword And Continue On Failure    VerifyControlState    control_name=${Component_Resume_Button_XPATH}    expected_state=enabled    timeout=5
    Run Keyword And Continue On Failure    VerifyControlState    control_name=${XRay_Controller_Button_XPATH}    expected_state=enabled    timeout=5
    Run Keyword And Continue On Failure    VerifyControlState    control_name=${arrow_annotation_button_xpath}    expected_state=disabled    timeout=5
    Run Keyword And Continue On Failure    VerifyControlState    control_name=${line_profiler_tool_button_xpath}    expected_state=disabled    timeout=5
    Run Keyword And Continue On Failure    VerifyControlState    control_name=${line_profiler_tool_button_xpath}    expected_state=disabled    timeout=5

MFRT - Test
    [Documentation]    Test
    [Tags]    MFRT

    VerifyControlState    control_name=${ONLINE_START_ACQUISITION_BUTTON_XPATH}    expected_state=enabled    timeout=5



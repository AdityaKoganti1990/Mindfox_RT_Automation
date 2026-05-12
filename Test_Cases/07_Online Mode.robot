*** Settings ***
Documentation     Online Mode test suite. Total Test Cases: 15 (MFRTO01 - MFRTO15).
Library           FlaUILibrary
Library           Process
Library           AutoItLibrary
Library           OperatingSystem
Resource          ../resources/login.resource
Resource          ../resources/Online.resource

*** Variables ***
*** Test Cases ***
MFRTO01 - Verify whether able to open RT application in online mode.
    [Documentation]    Verify whether able to open RT application in online mode.
    [Tags]    MFRTO01

    Open FoxViewerDesktop Application
    Login To FoxViewerDesktop    admin    admin
    Toggle Online Or Offline Mode    Online
    Verify Online Mode Is Enabled
MFRTO02 - Verify the default display when switched to Online mode.
    [Documentation]    Verify the default display when switched to Online mode.
    [Tags]    MFRTO02

    Toggle Online Or Offline Mode    Online
    Run Keyword And Continue On Failure   VerifyControlState    control_name=${ONLINE_START_ACQUISITION_BUTTON_XPATH}    expected_state=enabled    timeout=5
    Run Keyword And Continue On Failure    VerifyControlState    control_name=${ONLINE_STOP_ACQUISITION_BUTTON_XPATH}    expected_state=disabled    timeout=5
    Run Keyword And Continue On Failure    VerifyControlState    control_name=${Component_Create_Button_XPATH}    expected_state=enabled    timeout=5
    Run Keyword And Continue On Failure    VerifyControlState    control_name=${Component_Resume_Button_XPATH}    expected_state=enabled    timeout=5
    Run Keyword And Continue On Failure    VerifyControlState    control_name=${XRay_Controller_Button_XPATH}    expected_state=enabled    timeout=5
    Run Keyword And Continue On Failure    VerifyControlState    control_name=${arrow_annotation_button_xpath}    expected_state=disabled    timeout=5
    Run Keyword And Continue On Failure    VerifyControlState    control_name=${line_profiler_tool_button_xpath}    expected_state=disabled    timeout=5
    Run Keyword And Continue On Failure    VerifyControlState    control_name=${line_profiler_tool_button_xpath}    expected_state=disabled    timeout=5
    Run Keyword And Continue On Failure    VerifyControlState    control_name=${MotionController_Button_XPATH}    expected_state=enabled    timeout=5
    Take Actual Screenshot    MFRTO02_1.png
    Run Keyword And Continue On Failure   Compare Result Images    MFRTO02_1.png    MFRTO02_1.png
MFRTO03 - Verify whether detector tab is opened when switched to online mode.
    [Documentation]    Verify whether detector tab is opened when switched to online mode.
    [Tags]    MFRTO03

    Toggle Online Or Offline Mode    Online
    Run Keyword And Continue On Failure   VerifyControlState    control_name=${DETECTOR_TAB_XPATH}    expected_state=enabled    timeout=1
MFRTO04 - Verify whether able to Hide the X - Ray controller in online mode.
    [Documentation]    Verify whether able to Hide the X - Ray controller in online mode.
    [Tags]    MFRTO04

    Toggle Online Or Offline Mode    Online
    Show or Hide XRay Controller    Hide
    Run Keyword And Continue On Failure    VerifyControlState    control_name=${XRay_Controller_Connection_Combobox_XPATH}    expected_state=not exists    timeout=1
    Run Keyword And Continue On Failure   VerifyControlState    control_name=${XRay_Controller_Window_Tab_XPATH}    expected_state=not exists    timeout=1
    Toggle Motion Controller Window    Hide
MFRTO05 - Verify whether able to open Components window in online mode.
    [Documentation]    Verify whether able to open Components window in online mode.
    [Tags]    MFRTO05

    Toggle Online Or Offline Mode    Online
    Open Component Window
    Run Keyword And Continue On Failure   VerifyControlState    control_name=${COMPONENT_WINDOW_XPATH}    expected_state=exists    timeout=1
MFRTO06 - Verify the component window can be closed in online mode.
    [Documentation]    Verify the component window can be closed in online mode.
    [Tags]    MFRTO06

    Close Component Window
    Run Keyword And Continue On Failure   VerifyControlState    control_name=${COMPONENT_WINDOW_XPATH}    expected_state=not exists    timeout=1
MFRTO07 - Verify whether Resume button opens the window to resume acquisition in online mode.
    [Documentation]    Verify whether Resume button opens the window to resume acquisition in online mode.
    [Tags]    MFRTO07

    Open Resume Acquisition Window
    Run Keyword And Continue On Failure   VerifyControlState    control_name=${RESUME_ACQUISITION_WINDOW_XPATH}    expected_state=exists    timeout=1
MFRTO08 - Verify whether Resume acquisition window can be closed in online mode.
    [Documentation]    Verify whether Resume acquisition window can be closed in online mode.
    [Tags]    MFRTO08

    Close Resume Acquisition Window
    Run Keyword And Continue On Failure   VerifyControlState    control_name=${RESUME_ACQUISITION_WINDOW_XPATH}    expected_state=not exists    timeout=1
MFRTO09 - Verify the detectors list in the detector tab when switched to online mode.
    [Documentation]    Verify the detectors list in the detector tab when switched to online mode.
    [Tags]    MFRTO09

    Verify Detectors List In Detector Tab    Simulator    DRTech    iRay 1717ME    XRD Detector    PaxScan 4343HE
MFRTO10 - Verify the Binning options in the detector tab when switched to online mode.
    [Documentation]    Verify the Binning options in the detector tab when switched to online mode.
    [Tags]    MFRTO10

    Verify Binning Options In Detector Tab    1x1    2x2    4x4
MFRTO11 - Verify the Acq Mode options in the detector tab when switched to online mode.
    [Documentation]    Verify the Acq Mode options in the detector tab when switched to online mode.
    [Tags]    MFRTO11

    Verify Acq Mode Options In Detector Tab    SingleShot    Sequence    Continuous
MFRTO12 - Verify the Video Formats options in the detector tab when switched to online mode.
    [Documentation]    Verify the Video Formats options in the detector tab when switched to online mode.
    [Tags]    MFRTO12

    Set Acq Mode    Continuous
    Run Keyword And Continue On Failure   VerifyControlState    control_name=${VIDEO_FORMAT_COMBOBOX_XPATH}    expected_state=not exists    timeout=1
    # Verify Video Format Options In Detector Tab    AVI (MJPEG)    MP4 (H.264)    AVI (Raw)
    Set Acq Mode    SingleShot
MFRTO13 - Verify whether Orientation options are shown in online mode.
    [Documentation]    Verify whether Orientation options are shown in online mode.
    [Tags]    MFRTO13

    Run Keyword And Continue On Failure   Verify Orientation Options    0°    90°    180°    270°    Flip H=NA    Flip V=NA    
MFRTO14 - Verify whether able to open Motion Controller window in online mode.
    [Documentation]    Verify whether able to open Motion Controller window in online mode.
    [Tags]    MFRTO14

    Toggle Online Or Offline Mode    Online
    Toggle Motion Controller Window    Show
    Run Keyword And Continue On Failure    VerifyControlState    control_name=${MOTION_CONTROLLER_Connection_Combobox_XPATH}    expected_state=exists    timeout=1
    Run Keyword And Continue On Failure   VerifyControlState    control_name=${MOTION_CONTROLLER_WINDOW_XPATH}    expected_state=exists    timeout=1
MFRTO15 - Verify whether able to hide the Motion Controller window in online mode.
    [Documentation]    Verify whether able to hide the Motion Controller window in online mode.
    [Tags]    MFRTO15

    Toggle Motion Controller Window    Hide
    Run Keyword And Continue On Failure    VerifyControlState    control_name=${MOTION_CONTROLLER_Connection_Combobox_XPATH}    expected_state=not exists    timeout=1
    Run Keyword And Continue On Failure   VerifyControlState    control_name=${MOTION_CONTROLLER_WINDOW_XPATH}    expected_state=not exists    timeout=1
    Close FoxRT Application Window

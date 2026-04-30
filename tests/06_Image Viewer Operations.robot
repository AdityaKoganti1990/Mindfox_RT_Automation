*** Settings ***
Documentation     Image Viewer Operations test suite. Total Test Cases: 65 (MFRTIV01 - MFRT).
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
Resource          ../resources/Image Viewer Operations.resource
*** Test Cases ***
MFRTIVO1 - Verify whether able to switch between images using Next/Previous buttons.

    [Documentation]    Verify whether able to switch between images using Next/Previous buttons.
    [Tags]    MFRTIVO1

    Open FoxViewerDesktop Application
    Login To FoxViewerDesktop    admin    admin
    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.dcm    
    ...    ${project_Directory_Path}MLE_6_0.280.dcm    
    ...    ${project_Directory_Path}MLE_8''0.322.dcm
    Sleep    0.1s
    Take Actual Screenshot    MFRTIV01_1.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV01_1.png    MFRTIV01_1.png
    Sleep    0.1s
    Click Next/Previous Image Button    Next
    Take Actual Screenshot    MFRTIV01_2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV01_2.png    MFRTIV01_2.png
    Sleep    0.1s
    Click Next/Previous Image Button    Next
    Take Actual Screenshot    MFRTIV01_3.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV01_3.png    MFRTIV01_3.png
    Sleep    0.1s
    Take Actual Screenshot    MFRTIV01_4.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV01_4.png    MFRTIV01_4.png
    Sleep    0.1s
    Click Next/Previous Image Button    Previous
    Take Actual Screenshot    MFRTIV01_5.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV01_5.png    MFRTIV01_5.png
    Sleep    0.1s
    Click Next/Previous Image Button    Previous
    Take Actual Screenshot    MFRTIV01_6.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV01_6.png    MFRTIV01_6.png
    Sleep    0.1s

MFRTIV02 - Verify whether able to switch between images using Keyboard Shortcuts.

    [Documentation]    Verify whether able to switch between images using Keyboard Shortcuts.
    [Tags]    MFRTIV02

    Take Actual Screenshot    MFRTIV02_1.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV02_1.png    MFRTIV02_1.png
    Sleep    0.1s
    Click Next/Previous Image using Keyboard Shortcuts    Next  
    Take Actual Screenshot    MFRTIV02_2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV02_2.png    MFRTIV02_2.png
    Sleep    0.1s
    Click Next/Previous Image using Keyboard Shortcuts    Next
    Take Actual Screenshot    MFRTIV02_3.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV02_3.png    MFRTIV02_3.png
    Sleep    0.1s
    Click Next/Previous Image using Keyboard Shortcuts    Previous
    Take Actual Screenshot    MFRTIV02_4.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV02_4.png    MFRTIV02_4.png
    Sleep    0.1s
    Click Next/Previous Image using Keyboard Shortcuts    Previous
    Take Actual Screenshot    MFRTIV02_5.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV02_5.png    MFRTIV02_5.png
    Sleep    0.1s
    Click Next/Previous Image using Keyboard Shortcuts    Previous
    Take Actual Screenshot    MFRTIV02_6.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV02_6.png    MFRTIV02_6.png
    Sleep    0.1s
    Close Project
    Sleep    0.1s

MFRTIVO3 - Verify whether able to Zoom Image viewer using zoom controls.
    [Documentation]    Verify whether able to Zoom Image viewer using zoom controls.
    [Tags]    MFRTIVO3

    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.dcm
    Sleep    0.1s
    Zoom Image Viewer    ZoomIn    5
    Sleep    0.1s
    Take Actual Screenshot    MFRTIV03_1.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV03_1.png    MFRTIV03_1.png
    Sleep    0.1s
    Zoom Image Viewer    ZoomOut    5
    Sleep    0.1s
    Take Actual Screenshot    MFRTIV03_2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV03_2.png    MFRTIV03_2.png
    Sleep    0.1s

MFRTIVO4 - Verify whether able to Zoom Image viewer using Zoom Edit Control.
    [Documentation]    Verify whether able to Zoom Image viewer using Zoom Edit Control.
    [Tags]    MFRTIVO4

    Zoom Image Viewer Using Zoom Edit Control    100
    Sleep    0.1s
    Take Actual Screenshot    MFRTIV04_1.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV04_1.png    MFRTIV04_1.png
    Sleep    0.1s
    Zoom Image Viewer Using Zoom Edit Control    41
    Sleep    0.1s
    Take Actual Screenshot    MFRTIV04_2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV04_2.png    MFRTIV04_2.png
    Sleep    0.1s

MFRTIVO5 - Verify whether able to Pan Image Viewer using Pan Tool.
    [Documentation]    Verify whether able to Pan Image Viewer using Pan Tool.
    [Tags]    MFRTIVO5

    Zoom Image Viewer    ZoomIn    3
    Sleep    0.1s
    Pan Image Viewer Using Pan Tool    800    870    805    415
    Sleep    0.1s
    Take Actual Screenshot    MFRTIV05.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV05.png    MFRTIV05.png
    Sleep    0.1s
MFRTIV06 - Verify whether able to Reset Image Viewer to default view after panning.
    [Documentation]    Verify whether able to Reset Image Viewer to default view after panning.
    [Tags]    MFRTIV06

    Reset View
    Apply Auto Best BNC
    Sleep    0.3s
    Take Actual Screenshot    MFRTIV06.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV06.png    MFRTIV06.png
    Sleep    0.1s
MFRTIV07 - Verify whether able to apply scales to image viewer.
    [Documentation]    Verify whether able to apply scales to image viewer.
    [Tags]    MFRTIV07

    Apply Scale To Image Viewer    True
    Sleep    0.1s
    Take Actual Screenshot    MFRTIV07.png    ${IMAGE_VIEWER_XPATH_WITH_SCALES}
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV07.png    MFRTIV07.png
    Sleep    0.1s

MFRTIV08 - Verify whether able to remove scales from image viewer.
    [Documentation]    Verify whether able to remove scales from image viewer.
    [Tags]    MFRTIV08

    Apply Scale To Image Viewer    False
    Sleep    0.1s
    Take Actual Screenshot    MFRTIV08.png    ${IMAGE_VIEWER_XPATH_WITH_SCALES}
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV08.png    MFRTIV08.png
    Sleep    0.1s

MFRTIV09 - Verify whether able Rotate Image Viewer using Rotate buttons.
    [Documentation]    Verify whether able Rotate Image Viewer using Rotate buttons.
    [Tags]    MFRTIV09

    Rotate Image Viewer    Rotate CCW    3
    Sleep    0.1s
    Take Actual Screenshot    MFRTIV09_1.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV09_1.png    MFRTIV09_1.png
    Sleep    0.1s
    Rotate Image Viewer    Rotate CW    2
    Sleep    0.1s
    Take Actual Screenshot    MFRTIV09_2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV09_2.png    MFRTIV09_2.png
    Reset View
    Apply Auto Best BNC
MFRTIV10 - Verify whether able Flip Image Viewer.
    [Documentation]    Verify whether able Flip Image Viewer.
    [Tags]    MFRTIV10

    Flip Image Viewer    Vertical
    Sleep    0.1s
    Take Actual Screenshot    MFRTIV10_1.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV10_1.png    MFRTIV10_1.png
    Sleep    0.1s
    Flip Image Viewer    Horizontal
    Sleep    0.1s
    Take Actual Screenshot    MFRTIV10_2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV10_2.png    MFRTIV10_2.png
    Sleep    0.1s
    Reset View
    Apply Auto Best BNC
MFRTIV11 - Verify whether able to apply Invert over the image viewer.
    [Documentation]    Verify whether able to apply Invert over the image viewer.
    [Tags]    MFRTIV11

    Click Invert Button
    Sleep    0.1s
    Take Actual Screenshot    MFRTIV11.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV11.png    MFRTIV11.png
    Sleep    0.1s
    Reset View
    Apply Auto Best BNC
MFRTIV12 - Verify whether able to change the units across the application.
    [Documentation]    Verify whether able to change the units across the application.
    [Tags]    MFRTIV12

    Change Units Across Application    inch
    Sleep    0.1s
    Apply Scale To Image Viewer    True
    Sleep    0.1s
    Take Actual Screenshot    MFRTIV12-1.png    ${IMAGE_VIEWER_XPATH_WITH_SCALES}
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV12-1.png    MFRTIV12-1.png
    Apply Scale To Image Viewer    False
    Sleep    0.1s
    Add Annotation    Ruler
    Sleep    0.1s
    Take Actual Screenshot    MFRTIV12-2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV12-2.png    MFRTIV12-2.png
    Sleep    0.1s
    Delete the annotation
    Sleep    0.1s
    Change Units Across Application    mm
    Sleep    0.1s

MFRTIV13 - Verify whether able to change the units across the application using change measurement units button in status bar.
    [Documentation]    Verify whether able to change the units across the application using change measurement units button in status bar.
    [Tags]    MFRTIV13

    Change Units Across Application from Status Bar    inch
    Sleep    0.1s
    Apply Scale To Image Viewer    True
    Sleep    0.1s
    Take Actual Screenshot    MFRTIV13-1.png    ${IMAGE_VIEWER_XPATH_WITH_SCALES}
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV13-1.png    MFRTIV13-1.png
    Apply Scale To Image Viewer    False
    Sleep    0.1s
    Add Annotation    Ruler
    Sleep    0.1s
    Take Actual Screenshot    MFRTIV13-2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV13-2.png    MFRTIV13-2.png
    Sleep    0.1s
    Delete the annotation
    Sleep    0.1s
    Change Units Across Application from Status Bar    mm
    Sleep    0.1s

MFRTIV14 - Verify whether applied Zoom value is shown in status bar.
    [Documentation]    Verify whether applied Zoom value is shown in status bar.
    [Tags]    MFRTIV14

    Zoom Image Viewer    ZoomIn    3
    Sleep    0.1s
    Verify Zoom Value In Status Bar    71
    Sleep    0.1s
    Zoom Image Viewer    ZoomOut    3
    Sleep    0.1s
    Verify Zoom Value In Status Bar    41

MFRTIV15 - Verify whether DPI value of the image is shown in status bar
    [Documentation]    Verify whether DPI value of the image is shown in status bar.
    [Tags]    MFRTIV15

    Verify DPI value in status bar    254.0
    Sleep    0.1s

MFRTIV16 - Verify whether DPI value is updating when different image with different DPI is opened
    [Documentation]    Verify whether DPI value is updating when different image with different DPI is opened.
    [Tags]    MFRTIV16

    Close Project
    Sleep    0.1s
    Open ProjectFile    ${project_Directory_Path}dp080922 .dcm
    Sleep    0.1s
    Verify DPI value in status bar    200.0
    Sleep    0.1s
    Close Project
    Sleep    0.1s
    Open ProjectFile    ${project_Directory_Path}DuplexPlate_With_RT.dcm
    Sleep    0.1s
    Verify DPI value in status bar    25.4
    Sleep    0.1s
    Close Project
    Sleep    0.1s
    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.dcm
    Sleep    0.1s
    Verify DPI value in status bar    254.0
    Sleep    0.1s

MFRTIV17 - Verify whether the X and Y coordinates are shown in status bar when mouse is hovered over the image viewer
    [Documentation]    Verify whether the X and Y coordinates are shown in status bar when mouse is hovered over the image viewer.
    [Tags]    MFRTIV17

    Hover Mouse Over Image Viewer    930    460
    Sleep    0.1s
    Verify Coordinates Are Shown In Status Bar    1147    877
    Sleep    0.1s
MFRTIV18 - Verify whether the Intensity value is shown in status bar when mouse is hovered over the image viewer
    [Documentation]    Verify whether the Intensity value is shown in status bar when mouse is hovered over the image viewer.
    [Tags]    MFRTIV18

    Hover Mouse Over Image Viewer    930    460
    Sleep    0.1s
    Verify Intensity Value Is Shown In Status Bar    29525
    Sleep    0.1s

MFRTIV19 - Verify whether annotations count is updated in status bar when annotation is added or deleted
    [Documentation]    Verify whether annotations count is updated in status bar when annotation is added or deleted.
    [Tags]    MFRTIV19

    Add Annotation    Arrow
    Sleep    0.1s
    Verify Annotation Count In Status Bar    1
    Sleep    0.1s
    Add Annotation at custom position    Ruler    855    200    1035    325        
    Sleep    0.1s
    Verify Annotation Count In Status Bar    2
    Sleep    0.1s
    Delete the annotation
    Sleep    0.1s
    Verify Annotation Count In Status Bar    0
    Sleep    0.1s

MFRTIV20 - Verify whether SNR value is shown in status bar when image with SNR metadata is opened.
    [Documentation]    Verify whether SNR value is shown in status bar when image with SNR metadata is opened.
    [Tags]    MFRTIV20

    Verify SNR value in status bar    51.2    0.28
    Close Project
    Open ProjectFile    ${project_Directory_Path}MLE_6_0.280.dcm
    Verify SNR value in status bar    52.9    0.23
    Close Project
    Open ProjectFile    ${project_Directory_Path}MLE_8''0.322.dcm
    Verify SNR value in status bar    97.5    0.00

MFRTIV21 - Verify whether able to apply color table over the image viewer.
    [Documentation]    Verify whether able to apply color table over the image viewer.
    [Tags]    MFRTIV21

    Apply Color Table To Image Viewer    Hot Iron
    Sleep    0.1s
    Take Actual Screenshot    MFRTIV21_1.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV21_1.png    MFRTIV21_1.png
    Sleep    0.1s
    Apply Color Table To Image Viewer    Grayscale
    Sleep    0.1s
    Take Actual Screenshot    MFRTIV21_2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV21_2.png    MFRTIV21_2.png

MFRTIV22 - Verify whether able to apply all available color tables over the image viewer.
    [Documentation]    Verify whether able to apply all available color tables over the image viewer.
    [Tags]    MFRTIV22

    Apply Color Table To Image Viewer    Hot Iron
    Sleep    0.1s
    Take Actual Screenshot    MFRTIV22_1.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV22_1.png    MFRTIV22_1.png
    Sleep    0.1s
    Apply Color Table To Image Viewer    Rainbow
    Sleep    0.1s
    Take Actual Screenshot    MFRTIV22_2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV22_2.png    MFRTIV22_2.png
    Sleep    0.1s
    Apply Color Table To Image Viewer    Cool-Warm
    Sleep    0.1s
    Take Actual Screenshot    MFRTIV22_3.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV22_3.png    MFRTIV22_3.png
    Sleep    0.1s
    Apply Color Table To Image Viewer    Bone
    Sleep    0.1s
    Take Actual Screenshot    MFRTIV22_4.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV22_4.png    MFRTIV22_4.png
    Sleep    0.1s
    Apply Color Table To Image Viewer    Copper
    Sleep    0.1s
    Take Actual Screenshot    MFRTIV22_5.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV22_5.png    MFRTIV22_5.png
    Sleep    0.1s
    Apply Color Table To Image Viewer    Spectrum
    Sleep    0.1s
    Take Actual Screenshot    MFRTIV22_6.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV22_6.png    MFRTIV22_6.png
    Sleep    0.1s
    Apply Color Table To Image Viewer    Hot Metal Blue
    Sleep    0.1s
    Take Actual Screenshot    MFRTIV22_7.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV22_7.png    MFRTIV22_7.png
    Sleep    0.1s
    Apply Color Table To Image Viewer    Grayscale
    Sleep    0.1s
    Take Actual Screenshot    MFRTIV22_8.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV22_8.png    MFRTIV22_8.png
    Sleep    0.1s
    Close Project
    Sleep    0.1s
MFRTIV23 - Verify whether able to open Dual View mode.
    [Documentation]    Verify whether able to open Dual View mode.
    [Tags]    MFRTIV23

    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.dcm
    Sleep    0.1s
    Open/Close Dual View Mode    True
    Sleep    0.1s
    Run Keyword And Continue On Failure   Verify Control Exists in Image Viewer    ${Dual_View_SyncPan_Toggle_Button_XPATH}
    Run Keyword And Continue On Failure   Verify Control Exists in Image Viewer    ${Dual_View_SyncZoom_Toggle_Button_XPATH}
    Run Keyword And Continue On Failure   Verify Control Exists in Image Viewer    ${Dual_View_SyncWL_Toggle_Button_XPATH}
    Take DualView Screenshot    Primary    MFRTIV23_Primary.png
    Take DualView Screenshot    Secondary    MFRTIV23_Secondary.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV23_Primary.png    MFRTIV23_Primary.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV23_Secondary.png    MFRTIV23_Secondary.png
MFRTIV24 - Verify whether able to open image in Secondary view in Dual View mode.
    [Documentation]    Verify whether able to open image in Secondary view in Dual View mode.
    [Tags]    MFRTIV24

    Open ProjectFile    ${project_Directory_Path}MLE_6_0.280.dcm
    Sleep    0.1s
    Select ImageViewer    Secondary
    Sleep    0.1s
    Select Files From Files Tab    MLE_6_0.280.dcm
    Sleep    0.1s
    Take DualView Screenshot    Secondary    MFRTIV24_Secondary.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV24_Secondary.png    MFRTIV24_Secondary.png  
MFRTIV25 - Verify whether able to apply window level in Primary view in Dual View mode with WLsync option enabled.
   [Documentation]    Verify whether able to apply window level in Primary view in Dual View mode with WLsync option enabled.
    [Tags]    MFRTIV25

    Select ImageViewer    Primary
    Sleep    0.1s
    Toggle WL Sync Option in Dual View Mode    True
    Sleep    0.1s
    Apply Window Level    1    400    450    540    540
    Sleep    0.1s
    Take DualView Screenshot    Primary    MFRTIV25_Primary.png
    Take DualView Screenshot    Secondary    MFRTIV25_Secondary.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV25_Primary.png    MFRTIV25_Primary.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV25_Secondary.png    MFRTIV25_Secondary.png
    Click    ${window_level_tool_button_xpath}
    Reset View
    Apply Auto Best BNC
MFRTIV26 - Verify whether able to apply window level in Secondary view in Dual View mode with WLsync option enabled.
    [Documentation]    Verify whether able to apply window level in Secondary view in Dual View mode with WLsync option enabled.
    [Tags]    MFRTIV26

    Select ImageViewer    Secondary
    Sleep    0.1s
    Toggle WL Sync Option in Dual View Mode    True
    Sleep    0.1s
    Apply Window Level    1    980    470    1090    525
    Sleep    0.1s
    Take DualView Screenshot    Primary    MFRTIV26_Primary.png
    Take DualView Screenshot    Secondary    MFRTIV26_Secondary.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV26_Primary.png    MFRTIV26_Primary.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV26_Secondary.png    MFRTIV26_Secondary.png
    Click    ${window_level_tool_button_xpath}
    Reset View
    Apply Auto Best BNC
MFRTIV27 - Verify whether able to apply window level in Primary view in Dual View mode with WLsync option dis-enabled.
    [Documentation]    Verify whether able to apply window level in Primary view in Dual View mode with WLsync option dis-enabled.
    [Tags]    MFRTIV27

    Toggle WL Sync Option in Dual View Mode    False
    Sleep    0.1s
    Select ImageViewer    Primary
    Sleep    0.1s
    Apply Window Level    1    400    450    540    540
    Sleep    0.1s
    Take DualView Screenshot    Primary    MFRTIV27_Primary.png
    Take DualView Screenshot    Secondary    MFRTIV27_Secondary.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV27_Primary.png    MFRTIV27_Primary.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV27_Secondary.png    MFRTIV27_Secondary.png
    Click    ${window_level_tool_button_xpath}
    Sleep    0.1s
    Toggle WL Sync Option in Dual View Mode    True
    Sleep    0.1s
    Reset View
    Apply Auto Best BNC
MFRTIV28 - Verify whether able to apply window level in Secondary view in Dual View mode with WLsync option dis-enabled.
    [Documentation]    Verify whether able to apply window level in Secondary view in Dual View mode with WLsync option dis-enabled.
    [Tags]    MFRTIV28

    Toggle WL Sync Option in Dual View Mode    False
    Sleep    0.1s
    Select ImageViewer    Secondary
    Sleep    0.1s
    Apply Window Level    1    980    470    1090    525
    Sleep    0.1s
    Take DualView Screenshot    Primary    MFRTIV28_Primary.png
    Take DualView Screenshot    Secondary    MFRTIV28_Secondary.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV28_Primary.png    MFRTIV28_Primary.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV28_Secondary.png    MFRTIV28_Secondary.png
    Click    ${window_level_tool_button_xpath}
    Sleep    0.1s
    Toggle WL Sync Option in Dual View Mode    True
    Sleep    0.1s
    Reset View
    Apply Auto Best BNC
MFRTIV29 - Verify whether able to apply zoom in Primary view in Dual View mode with Zoom sync option enabled.
    [Documentation]    Verify whether able to apply zoom in Primary view in Dual View mode with Zoom sync option enabled.
    [Tags]    MFRTIV29

    Toggle Zoom Sync Option in Dual View Mode    True
    Sleep    0.1s
    Select ImageViewer    Primary
    Sleep    0.1s
    Zoom Image Viewer    ZoomIn    3
    Sleep    0.1s
    Take DualView Screenshot    Primary    MFRTIV29_Primary.png
    Take DualView Screenshot    Secondary    MFRTIV29_Secondary.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV29_Primary.png    MFRTIV29_Primary.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV29_Secondary.png    MFRTIV29_Secondary.png
    Reset View
    Apply Auto Best BNC
MFRTIV30 - Verify whether able to apply zoom in Secondary view in Dual View mode with Zoom sync option enabled.
    [Documentation]    Verify whether able to apply zoom in Secondary view in Dual View mode with Zoom sync option enabled.
    [Tags]    MFRTIV30

    Toggle Zoom Sync Option in Dual View Mode    True
    Sleep    0.1s
    Select ImageViewer    Secondary
    Sleep    0.1s
    Zoom Image Viewer    ZoomIn    3
    Sleep    0.1s
    Take DualView Screenshot    Primary    MFRTIV30_Primary.png
    Take DualView Screenshot    Secondary    MFRTIV30_Secondary.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV30_Primary.png    MFRTIV30_Primary.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV30_Secondary.png    MFRTIV30_Secondary.png
    Reset View
    Apply Auto Best BNC
MFRTIV31 - Verify whether able to apply zoom in Primary view in Dual View mode with Zoom sync option dis-enabled.
    [Documentation]    Verify whether able to apply zoom in Primary view in Dual View mode with Zoom sync option dis-enabled.
    [Tags]    MFRTIV31

    Toggle Zoom Sync Option in Dual View Mode    False
    Sleep    0.1s
    Select ImageViewer    Primary
    Sleep    0.1s
    Zoom Image Viewer    ZoomIn    3
    Sleep    0.1s
    Take DualView Screenshot    Primary    MFRTIV31_Primary.png
    Take DualView Screenshot    Secondary    MFRTIV31_Secondary.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV31_Primary.png    MFRTIV31_Primary.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV31_Secondary.png    MFRTIV31_Secondary.png
    Toggle Zoom Sync Option in Dual View Mode    True
    Reset View
    Apply Auto Best BNC
MFRTIV32 - Verify whether able to apply zoom in Secondary view in Dual View mode with Zoom sync option dis-enabled.
    [Documentation]    Verify whether able to apply zoom in Secondary view in Dual View mode with Zoom sync option dis-enabled.
    [Tags]    MFRTIV32

    Toggle Zoom Sync Option in Dual View Mode    False
    Sleep    0.1s
    Select ImageViewer    Secondary
    Sleep    0.1s
    Zoom Image Viewer    ZoomIn    3
    Sleep    0.1s
    Take DualView Screenshot    Primary    MFRTIV32_Primary.png
    Take DualView Screenshot    Secondary    MFRTIV32_Secondary.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV32_Primary.png    MFRTIV32_Primary.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV32_Secondary.png    MFRTIV32_Secondary.png
    Toggle Zoom Sync Option in Dual View Mode    True
    Reset View
    Apply Auto Best BNC
MFRTIV33 - Verify whether able to apply pan in Primary view in Dual View mode with Pan sync option enabled.
    [Documentation]    Verify whether able to apply pan in Primary view in Dual View mode with Pan sync option enabled.
    [Tags]    MFRTIV33

    Toggle Pan Sync Option in Dual View Mode    True
    Select ImageViewer    Primary
    Zoom Image Viewer    ZoomIn    3
    Pan Image Viewer Using Pan Tool    625    935    625    410
    Take DualView Screenshot    Primary    MFRTIV33_Primary.png
    Take DualView Screenshot    Secondary    MFRTIV33_Secondary.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV33_Primary.png    MFRTIV33_Primary.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV33_Secondary.png    MFRTIV33_Secondary.png
    Reset View
    Apply Auto Best BNC
MFRTIV34 - Verify whether able to apply pan in Secondary view in Dual View mode with Pan sync option enabled.
    [Documentation]    Verify whether able to apply pan in Secondary view in Dual View mode with Pan sync option enabled.
    [Tags]    MFRTIV34

    Toggle Pan Sync Option in Dual View Mode    True
    Select ImageViewer    Secondary
    Zoom Image Viewer    ZoomIn    3
    Pan Image Viewer Using Pan Tool    1140    935    1140    410
    Take DualView Screenshot    Primary    MFRTIV34_Primary.png
    Take DualView Screenshot    Secondary    MFRTIV34_Secondary.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV34_Primary.png    MFRTIV34_Primary.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV34_Secondary.png    MFRTIV34_Secondary.png
    Reset View
    Apply Auto Best BNC
MFRTIV35 - Verify whether able to apply pan in Primary view in Dual View mode with Pan sync option dis-enabled.
    [Documentation]    Verify whether able to apply pan in Primary view in Dual View mode with Pan sync option dis-enabled.
    [Tags]    MFRTIV35

    Toggle Pan Sync Option in Dual View Mode    False
    Select ImageViewer    Primary
    Zoom Image Viewer    ZoomIn    3
    Pan Image Viewer Using Pan Tool    625    935    625    410
    Take DualView Screenshot    Primary    MFRTIV35_Primary.png
    Take DualView Screenshot    Secondary    MFRTIV35_Secondary.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV35_Primary.png    MFRTIV35_Primary.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV35_Secondary.png    MFRTIV35_Secondary.png
    Toggle Pan Sync Option in Dual View Mode    True
    Reset View
    Apply Auto Best BNC
MFRTIV36 - Verify whether able to apply pan in Secondary view in Dual View mode with Pan sync option dis-enabled.
    [Documentation]    Verify whether able to apply pan in Secondary view in Dual View mode with Pan sync option dis-enabled.
    [Tags]    MFRTIV36

    Toggle Pan Sync Option in Dual View Mode    False
    Select ImageViewer    Secondary
    Zoom Image Viewer    ZoomIn    3
    Pan Image Viewer Using Pan Tool    1140    935    1140    410
    Take DualView Screenshot    Primary    MFRTIV36_Primary.png
    Take DualView Screenshot    Secondary    MFRTIV36_Secondary.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV36_Primary.png    MFRTIV36_Primary.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV36_Secondary.png    MFRTIV36_Secondary.png
    Toggle Pan Sync Option in Dual View Mode    True
    Reset View
    Apply Auto Best BNC
MFRTIV37 - Verify whether able to reset view in both Primary and Secondary viewers in Dual View mode.
    [Documentation]    Verify whether able to reset view in both Primary and Secondary viewers in Dual View mode.
    [Tags]    MFRTIV37

    Toggle WL Sync Option in Dual View Mode    True
    Select ImageViewer    Primary
    Apply Window Level    1    400    450    540    540
    Take DualView Screenshot    Primary    MFRTIV37_Primary_WL.png
    Take DualView Screenshot    Secondary    MFRTIV37_Secondary_WL.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV37_Primary_WL.png    MFRTIV37_Primary_WL.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV37_Secondary_WL.png    MFRTIV37_Secondary_WL.png
    Click    ${window_level_tool_button_xpath}
    Reset View
    Take DualView Screenshot    Primary    MFRTIV37_Primary_Reset.png
    Take DualView Screenshot    Secondary    MFRTIV37_Secondary_Reset.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV37_Primary_Reset.png    MFRTIV37_Primary_Reset.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV37_Secondary_Reset.png    MFRTIV37_Secondary_Reset.png
    Apply Auto Best BNC
MFRTIV38 - Verify whether able to apply image operations when in dual mode.
    [Documentation]    Verify whether able to apply image operations when in dual mode.
    [Tags]    MFRTIV38

    Toggle WL Sync Option in Dual View Mode    True
    Select ImageViewer    Primary
    Rotate Image Viewer    Rotate CCW    3
    Take DualView Screenshot    Primary    MFRTIV38_Primary_Rotate.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV38_Primary_Rotate.png    MFRTIV38_Primary_Rotate.png
    Reset View
    Apply Auto Best BNC
    Select ImageViewer    Secondary
    Rotate Image Viewer    Rotate CW    3
    Take DualView Screenshot    Secondary    MFRTIV38_Secondary_Rotate.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV38_Secondary_Rotate.png    MFRTIV38_Secondary_Rotate.png
    Select ImageViewer    Secondary
    Reset View
    Apply Auto Best BNC
    Select ImageViewer    Primary
    Flip Image Viewer    Vertical
    Flip Image Viewer    Horizontal
    Take DualView Screenshot    Primary    MFRTIV38_Primary_Flip.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV38_Primary_Flip.png    MFRTIV38_Primary_Flip.png
    Select ImageViewer    Primary
    Reset View
    Apply Auto Best BNC
    Select ImageViewer    Secondary
    Flip Image Viewer    Vertical
    Flip Image Viewer    Horizontal
    Take DualView Screenshot    Secondary    MFRTIV38_Secondary_Flip.png    
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV38_Secondary_Flip.png    MFRTIV38_Secondary_Flip.png
    Select ImageViewer    Secondary
    Reset View
    Apply Auto Best BNC
    # Due to an bug below 2 lines ie: click horizontal and vertical flip buttons are clicked exlicitly.
    Click    ${Flip_Horizontal_Button_XPATH}
    Click    ${Flip_Vertical_Button_XPATH}
    Select ImageViewer    Primary
    Reset View
    Apply Auto Best BNC
    Select ImageViewer    Primary
    Click Invert Button
    Take DualView Screenshot    Primary    MFRTIV38_Primary_Invert.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV38_Primary_Invert.png    MFRTIV38_Primary_Invert.png
    Reset View
    Apply Auto Best BNC
    Select ImageViewer    Secondary
    Click Invert Button
    Take DualView Screenshot    Secondary    MFRTIV38_Secondary_Invert.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV38_Secondary_Invert.png    MFRTIV38_Secondary_Invert.png
    Select ImageViewer    Secondary
    Reset View
    Apply Auto Best BNC
    # Due to an bug below 1 line ie: click invert button is clicked exlicitly.
    Click    ${Invert_button_XPATH}
    Select ImageViewer    Primary
    Reset View
    Apply Auto Best BNC
MFRTIV39 - Verify whether Scales can be applied in both the views in dual viewer mode.
    [Documentation]    Verify whether Scales can be applied in both the views in dual viewer mode.
    [Tags]    MFRTIV39
    Toggle WL Sync Option in Dual View Mode    True
    Sleep    0.1s
    Apply Scale To Image Viewer    True
    Sleep    0.1s
    Take DualView Screenshot with Scales    Primary    MFRTIV39_Primary_Scales.png
    Take DualView Screenshot with Scales    Secondary    MFRTIV39_Secondary_Scales.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV39_Primary_Scales.png    MFRTIV39_Primary_Scales.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV39_Secondary_Scales.png    MFRTIV39_Secondary_Scales.png
    Sleep    0.1s
    Apply Scale To Image Viewer    False
    Sleep    0.1s
MFRTIV40 - Verify whether able to apply filters in dual view mode.
    [Documentation]    Verify whether able to apply filters in dual view mode.
    [Tags]    MFRTIV40

    Toggle WL Sync Option in Dual View Mode    True
    Click Image Filter Tool
    Apply Image Filter    Fox Bleach     
    Take DualView Screenshot    Primary    MFRTIV40_Primary_Filter.png
    Take DualView Screenshot    Secondary    MFRTIV40_Secondary_Filter.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV40_Primary_Filter.png    MFRTIV40_Primary_Filter.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV40_Secondary_Filter.png    MFRTIV40_Secondary_Filter.png
MFRTIV41 - Verify whether able to reset filters in dual view mode.
    [Documentation]    Verify whether able to reset filters in dual view mode.
    [Tags]    MFRTIV41

    Reset Image Filter
    Take DualView Screenshot    Primary    MFRTIV41_Primary_Filter_Reset.png
    Take DualView Screenshot    Secondary    MFRTIV41_Secondary_Filter_Reset.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV41_Primary_Filter_Reset.png    MFRTIV41_Primary_Filter_Reset.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV41_Secondary_Filter_Reset.png    MFRTIV41_Secondary_Filter_Reset.png
    Click    ${Image_Filter_Tool_Button_XPATH}
    Reset View
    Apply Auto Best BNC
MFRTIV42 - Verify whether able to apply annotations in dual view mode.
    [Documentation]    Verify whether able to apply annotations in dual view mode.
    [Tags]    MFRTIV42

    Toggle WL Sync Option in Dual View Mode    True
    Select ImageViewer    Primary
    Add Annotation at custom position    Rectangle    365    550    455    690
    Take DualView Screenshot    Primary    MFRTIV42_Primary_Annotation.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV42_Primary_Annotation.png    MFRTIV42_Primary_Annotation.png
    Delete the annotation
    Select ImageViewer    Secondary
    Add Annotation at custom position    Rectangle    920    535    1105    705
    Take DualView Screenshot    Secondary    MFRTIV42_Secondary_Annotation.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV42_Secondary_Annotation.png    MFRTIV42_Secondary_Annotation.png
    Delete the annotation
MFRTIV43 - Verify whether able to export images in dual view mode.
    [Documentation]    Verify whether able to export images in dual view mode.
    [Tags]    MFRTIV43

    Toggle WL Sync Option in Dual View Mode    True
    Select ImageViewer    Primary
    Export Image    MFRTIV43_Primary    ${Actual_Image_Exports}MFRTIV43_Primary    PNG    True    Outside
    Run Keyword And Continue On Failure    Compare Result Images    ${Actual_Image_Exports}MFRTIV43_Primary.png    ${Expected_Image_Exports}MFRTIV43_Primary.png
    Select ImageViewer    Secondary
    Export Image    MFRTIV43_Secondary    ${Actual_Image_Exports}MFRTIV43_Secondary    PNG    True    Outside
    Run Keyword And Continue On Failure    Compare Result Images    ${Actual_Image_Exports}MFRTIV43_Secondary.png    ${Expected_Image_Exports}MFRTIV43_Secondary.png
MFRTIV44 - Verify whether able to apply annotations and export the image in dual view mode.
    [Documentation]    Verify whether able to apply annotations and export the image in dual view mode.
    [Tags]    MFRTIV44

    Toggle WL Sync Option in Dual View Mode    True
    Select ImageViewer    Primary
    Add Annotation at custom position    Rectangle    365    550    455    690
    Export Image    MFRTIV44_Primary    ${Actual_Image_Exports}MFRTIV44_Primary    PNG    True    Outside
    Run Keyword And Continue On Failure    Compare Result Images    ${Actual_Image_Exports}MFRTIV44_Primary.png    ${Expected_Image_Exports}MFRTIV44_Primary.png
    Delete the annotation
    Select ImageViewer    Secondary
    Add Annotation at custom position    Rectangle    920    535    1105    705
    Export Image    MFRTIV44_Secondary    ${Actual_Image_Exports}MFRTIV44_Secondary   PNG     True   Outside
    Run Keyword And Continue On Failure    Compare Result Images   ${Actual_Image_Exports}MFRTIV44_Secondary.png   ${Expected_Image_Exports}MFRTIV44_Secondary.png
    Delete the annotation
MFRTIV45 - Verify whether able to apply filters and export the image in dual view mode.
    [Documentation]    Verify whether able to apply filters and export the image in dual view mode.
    [Tags]    MFRTIV45

    Toggle WL Sync Option in Dual View Mode    True
    Select ImageViewer    Primary
    Click Image Filter Tool
    Apply Image Filter    Fox Bleach     
    Export Image    MFRTIV45_Primary_Filtered    ${Actual_Image_Exports}MFRTIV45_Primary_Filtered   PNG     True   Outside
    Run Keyword And Continue On Failure    Compare Result Images   ${Actual_Image_Exports}MFRTIV45_Primary_Filtered.png   ${Expected_Image_Exports}MFRTIV45_Primary_Filtered.png
    Reset Image Filter
    Click    ${Image_Filter_Tool_Button_XPATH}
    Reset View
    Apply Auto Best BNC
    Select ImageViewer    Secondary
    Click Image Filter Tool
    Apply Image Filter    Fox Bleach     
    Export Image    MFRTIV45_Secondary_Filtered    ${Actual_Image_Exports}MFRTIV45_Secondary_Filtered   PNG     True   Outside
    Run Keyword And Continue On Failure    Compare Result Images   ${Actual_Image_Exports}MFRTIV45_Secondary_Filtered.png   ${Expected_Image_Exports}MFRTIV45_Secondary_Filtered.png
    Reset Image Filter
    Click    ${Image_Filter_Tool_Button_XPATH}
    Reset View
    Apply Auto Best BNC
MFRTIV46 - Verify whether able to apply color table on Dual View mode.
    [Documentation]    Verify whether able to apply color table on Dual View mode.
    [Tags]    MFRTIV46

    Toggle WL Sync Option in Dual View Mode    True
    Apply Color Table To Image Viewer    Hot Iron
    Take DualView Screenshot    Primary    MFRTIV46_Primary_HotIron.png
    Take DualView Screenshot    Secondary    MFRTIV46_Secondary_HotIron.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV46_Primary_HotIron.png    MFRTIV46_Primary_HotIron.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV46_Secondary_HotIron.png    MFRTIV46_Secondary_HotIron.png
    Apply Color Table To Image Viewer    Grayscale
    Take DualView Screenshot    Primary    MFRTIV46_Primary_Grayscale.png
    Take DualView Screenshot    Secondary    MFRTIV46_Secondary_Grayscale.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV46_Primary_Grayscale.png    MFRTIV46_Primary_Grayscale.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV46_Secondary_Grayscale.png    MFRTIV46_Secondary_Grayscale.png
MFRTIV47 - Verify whether able to apply color table and export the image in dual view mode.
    [Documentation]    Verify whether able to apply color table and export the image in dual view mode.
    [Tags]    MFRTIV47

    Toggle WL Sync Option in Dual View Mode    True
    Select ImageViewer    Primary
    Apply Color Table To Image Viewer    Hot Iron
    Export Image    MFRTIV47_Primary_HotIron    ${Actual_Image_Exports}MFRTIV47_Primary_HotIron   PNG     True   Outside
    Run Keyword And Continue On Failure    Compare Result Images   ${Actual_Image_Exports}MFRTIV47_Primary_HotIron.png   ${Expected_Image_Exports}MFRTIV47_Primary_HotIron.png
    Select ImageViewer    Secondary
    Export Image    MFRTIV47_Secondary_HotIron    ${Actual_Image_Exports}MFRTIV47_Secondary_HotIron   PNG     True   Outside
    Run Keyword And Continue On Failure    Compare Result Images   ${Actual_Image_Exports}MFRTIV47_Secondary_HotIron.png   ${Expected_Image_Exports}MFRTIV47_Secondary_HotIron.png
    Apply Color Table To Image Viewer    Grayscale
    Select ImageViewer    Primary
    Export Image    MFRTIV47_Primary_Grayscale    ${Actual_Image_Exports}MFRTIV47_Primary_Grayscale   PNG     True   Outside
    Run Keyword And Continue On Failure    Compare Result Images   ${Actual_Image_Exports}MFRTIV47_Primary_Grayscale.png   ${Expected_Image_Exports}MFRTIV47_Primary_Grayscale.png
    Select ImageViewer    Secondary
    Export Image    MFRTIV47_Secondary_Grayscale    ${Actual_Image_Exports}MFRTIV47_Secondary_Grayscale   PNG     True   Outside
    Run Keyword And Continue On Failure    Compare Result Images   ${Actual_Image_Exports}MFRTIV47_Secondary_Grayscale.png   ${Expected_Image_Exports}MFRTIV47_Secondary_Grayscale.png
MFRTIV48 - Verify whether able to close Dual View mode.
    [Documentation]    Verify whether able to close Dual View mode.
    [Tags]    MFRTIV48

    Open/Close Dual View Mode    False
    Sleep    0.1s
    Run Keyword And Continue On Failure   VerifyControlState    ${Dual_View_SyncPan_Toggle_Button_XPATH}    not exists        
    Run Keyword And Continue On Failure   VerifyControlState    ${Dual_View_SyncZoom_Toggle_Button_XPATH}    not exists        
    Run Keyword And Continue On Failure   VerifyControlState    ${Dual_View_SyncWL_Toggle_Button_XPATH}    not exists
    Run Keyword And Continue On Failure    VerifyControlState    ${Dual_View_SyncPan_Toggle_Button_XPATH}    not exists
    Close Project
MFRTIV49 - Verify whether able to export image in .dcm format.
    [Documentation]    Verify whether able to export image in .dcm format.
    [Tags]    MFRTIV49

    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.dcm
    Export Image    MFRTIV49_Image    ${Actual_Image_Exports}MFRTIV49_Image    DCM
    Run Keyword And Continue On Failure    Compare Result Images    ${Actual_Image_Exports}MFRTIV49_Image.dcm    ${Expected_Image_Exports}MFRTIV49_Image.dcm
MFRTIV50 - Verify whether able to export image in .png format with tags disabled.
    [Documentation]    Verify whether able to export image in .png format with tags disabled.
    [Tags]    MFRTIV50

    Export Image    MFRTIV50_Image    ${Actual_Image_Exports}MFRTIV50_Image    PNG     False
    Run Keyword And Continue On Failure    Compare Result Images   ${Actual_Image_Exports}MFRTIV50_Image.png   ${Expected_Image_Exports}MFRTIV50_Image.png
MFRTIV51 - Verify whether able to export image in .png format with tags enabled & inside image.
    [Documentation]    Verify whether able to export image in .png format with tags enabled & inside image.
    [Tags]    MFRTIV51

    Export Image    MFRTIV51_Image    ${Actual_Image_Exports}MFRTIV51_Image    PNG     True    Inside
    Run Keyword And Continue On Failure    Compare Result Images   ${Actual_Image_Exports}MFRTIV51_Image.png   ${Expected_Image_Exports}MFRTIV51_Image.png
MFRTIV52 - Verify whether able to export image in .png format with tags enabled & outside image.
    [Documentation]    Verify whether able to export image in .png format with tags enabled & outside image.
    [Tags]    MFRTIV52

    Export Image    MFRTIV52_Image    ${Actual_Image_Exports}MFRTIV52_Image    PNG     True    Outside
    Run Keyword And Continue On Failure    Compare Result Images   ${Actual_Image_Exports}MFRTIV52_Image.png   ${Expected_Image_Exports}MFRTIV52_Image.png

MFRTIV53 - Verify whether able to export image in .jpg format with tags disabled.
    [Documentation]    Verify whether able to export image in .jpg format with tags disabled.
    [Tags]    MFRTIV53

    Export Image    MFRTIV53_Image    ${Actual_Image_Exports}MFRTIV53_Image    JPG     False
    Run Keyword And Continue On Failure    Compare Result Images   ${Actual_Image_Exports}MFRTIV53_Image.jpg   ${Expected_Image_Exports}MFRTIV53_Image.jpg
MFRTIV54 - Verify whether able to export image in .jpg format with tags enabled & inside image.
    [Documentation]    Verify whether able to export image in .jpg format with tags enabled & inside image.
    [Tags]    MFRTIV54

    Export Image    MFRTIV54_Image    ${Actual_Image_Exports}MFRTIV54_Image    JPG     True    Inside
    Run Keyword And Continue On Failure    Compare Result Images   ${Actual_Image_Exports}MFRTIV54_Image.jpg   ${Expected_Image_Exports}MFRTIV54_Image.jpg
MFRTIV55 - Verify whether able to export image in .jpg format with tags enabled & outside image.
    [Documentation]    Verify whether able to export image in .jpg format with tags enabled & outside image.
    [Tags]    MFRTIV55

    Export Image    MFRTIV55_Image    ${Actual_Image_Exports}MFRTIV55_Image    JPG     True    Outside
    Run Keyword And Continue On Failure    Compare Result Images   ${Actual_Image_Exports}MFRTIV55_Image.jpg   ${Expected_Image_Exports}MFRTIV55_Image.jpg
MFRTIV56 - Verify whether able to export image in .bmp format with tags disabled.
    [Documentation]    Verify whether able to export image in .bmp format with tags disabled.
    [Tags]    MFRTIV56

    Export Image    MFRTIV56_Image    ${Actual_Image_Exports}MFRTIV56_Image    BMP     False
    Run Keyword And Continue On Failure    Compare Result Images   ${Actual_Image_Exports}MFRTIV56_Image.bmp   ${Expected_Image_Exports}MFRTIV56_Image.bmp
MFRTIV57 - Verify whether able to export image in .bmp format with tags enabled & inside image.
    [Documentation]    Verify whether able to export image in .bmp format with tags enabled & inside image.
    [Tags]    MFRTIV57

    Export Image    MFRTIV57_Image    ${Actual_Image_Exports}MFRTIV57_Image    BMP     True    Inside
    Run Keyword And Continue On Failure    Compare Result Images   ${Actual_Image_Exports}MFRTIV57_Image.bmp   ${Expected_Image_Exports}MFRTIV57_Image.bmp
MFRTIV58 - Verify whether able to export image in .bmp format with tags enabled & outside image.
    [Documentation]    Verify whether able to export image in .bmp format with tags enabled & outside image.
    [Tags]    MFRTIV58

    Export Image    MFRTIV58_Image    ${Actual_Image_Exports}MFRTIV58_Image    BMP     True    Outside
    Run Keyword And Continue On Failure    Compare Result Images   ${Actual_Image_Exports}MFRTIV58_Image.bmp   ${Expected_Image_Exports}MFRTIV58_Image.bmp
MFRTIV59 - Verify whether able to export image in .tiff format with tags disabled.
    [Documentation]    Verify whether able to export image in .tiff format with tags disabled.
    [Tags]    MFRTIV59

    Export Image    MFRTIV59_Image    ${Actual_Image_Exports}MFRTIV59_Image    TIFF     False
    Run Keyword And Continue On Failure    Compare Result Images   ${Actual_Image_Exports}MFRTIV59_Image.tiff   ${Expected_Image_Exports}MFRTIV59_Image.tiff
MFRTIV60 - Verify whether able to export image in .tiff format with tags enabled & inside image.
    [Documentation]    Verify whether able to export image in .tiff format with tags enabled & inside image.
    [Tags]    MFRTIV60

    Export Image    MFRTIV60_Image    ${Actual_Image_Exports}MFRTIV60_Image    TIFF     True    Inside
    Run Keyword And Continue On Failure    Compare Result Images   ${Actual_Image_Exports}MFRTIV60_Image.tiff   ${Expected_Image_Exports}MFRTIV60_Image.tiff
MFRTIV61 - Verify whether able to export image in .tiff format with tags enabled & outside image.
    [Documentation]    Verify whether able to export image in .tiff format with tags enabled & outside image.
    [Tags]    MFRTIV61

    Export Image    MFRTIV61_Image    ${Actual_Image_Exports}MFRTIV61_Image    TIFF     True    Outside
    Run Keyword And Continue On Failure    Compare Result Images   ${Actual_Image_Exports}MFRTIV61_Image.tiff   ${Expected_Image_Exports}MFRTIV61_Image.tiff

MFRTIV62 - Verify whether able to export image after adding annotations in image viewer.
    [Documentation]    Verify whether able to export image after adding annotations in image viewer.
    [Tags]    MFRTIV62

    Add Annotation    Rectangle
    Add Annotation at custom position    Ruler    845    470    1050    570    
    Export Image    MFRTIV62_Annotation    ${Actual_Image_Exports}MFRTIV62_Annotation   PNG     True   Inside    True    True
    Run Keyword And Continue On Failure    Compare Result Images   ${Actual_Image_Exports}MFRTIV62_Annotation.png   ${Expected_Image_Exports}MFRTIV62_Annotation.png
    Delete the annotation
MFRTIV63 - Verify whether able to export image after applying filters in image viewer.
    [Documentation]    Verify whether able to export image after applying filters in image viewer.
    [Tags]    MFRTIV63

    Click Image Filter Tool
    Apply Image Filter    Fox Bleach     
    Export Image    MFRTIV63_Filtered    ${Actual_Image_Exports}MFRTIV63_Filtered   PNG     True   Inside
    Run Keyword And Continue On Failure    Compare Result Images   ${Actual_Image_Exports}MFRTIV63_Filtered.png   ${Expected_Image_Exports}MFRTIV63_Filtered.png
    Click    ${Image_Filter_Tool_Button_XPATH}
    Reset View
    Apply Auto Best BNC
MFRTIV64 - Verify whether able to export image after applying color table in image viewer.
    [Documentation]    Verify whether able to export image after applying color table in image viewer.
    [Tags]    MFRTIV64

    Apply Color Table To Image Viewer    Hot Iron
    Export Image    MFRTIV64_HotIron    ${Actual_Image_Exports}MFRTIV64_HotIron   PNG     True   Inside
    Run Keyword And Continue On Failure    Compare Result Images   ${Actual_Image_Exports}MFRTIV64_HotIron.png   ${Expected_Image_Exports}MFRTIV64_HotIron.png
    Apply Color Table To Image Viewer    Grayscale

MFRTIV65 - Verify whether able to export image after analyzing the image in image viewer.
    [Documentation]    Verify whether able to export image after analyzing the image in image viewer.
    [Tags]    MFRTIV65

    Close Project
    Open ProjectFile    ${project_Directory_Path}DuplexPlate_With_RT.dcm
    Apply Window Level    2    845    470    1050    570
    Detect IQI Wire Phantom Tool
    Export Image    MFRTIV65_Analyzed    ${Actual_Image_Exports}MFRTIV65_Analyzed   PNG     True   Inside
    Run Keyword And Continue On Failure    Compare Result Images   ${Actual_Image_Exports}MFRTIV65_Analyzed.png   ${Expected_Image_Exports}MFRTIV65_Analyzed.png
    Click    ${window_level_tool_button_xpath}
    Reset View
    Apply Auto Best BNC
    Close Project
    Close FoxRT Application Window


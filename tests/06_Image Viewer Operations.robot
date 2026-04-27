*** Settings ***
Library           FlaUILibrary
Library           Process
Library           AutoItLibrary
Library           OperatingSystem
Resource          ../resources/login.resource
Resource          ../resources/General.resource
Resource          ../resources/Actions.resource
Resource          ../resources/Annotations.resource
Resource          ../resources/Tools.resource
Resource          ../resources/Online.resource
Resource          ../resources/Image Viewer Operations.resource
*** Variables ***

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
    Close FoxRT Application Window
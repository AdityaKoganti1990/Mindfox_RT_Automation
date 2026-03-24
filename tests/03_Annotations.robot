*** Settings ***
Library           FlaUILibrary
Library           Process
Library           AutoItLibrary
Resource          ../resources/login.resource
Resource          ../resources/General.resource
Resource          ../resources/imageviewer.resource
Resource          ../resources/Annotations.resource

*** Variables ***

*** Test Cases ***

MFRTIV01 - Verify whether able to add arrow annotation in image viewer
    [Documentation]    Verify whether able to add arrow annotation in image viewer
    [Tags]    smoke    annotations
    
    Open FoxViewerDesktop Application
    Login To FoxViewerDesktop    Sri    Sri
    Main Window Should Be Open
    Focus    ${MAIN_WINDOW_XPATH}
    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.dcm
    Sleep    1s
    Apply Auto Best BNC
    Sleep    1s
    Add Annotation    Arrow
    Sleep    1s
    Take Actual Screenshot    MFRTIV01.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV01.png    MFRTIV01.png
    Delete the annotation

MFRTIV02 - Verify whether able to add ruler annotation in image viewer
    [Documentation]    Verify whether able to add ruler annotation in image viewer
    [Tags]    smoke    annotations
    
    Sleep    1s
    Add Annotation    Ruler
    Sleep    1s
    Take Actual Screenshot    MFRTIV02.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV02.png    MFRTIV02.png
    Delete the annotation


MFRTIV03 - Verify whether able to add line annotation in image viewer
    [Documentation]    Verify whether able to add line annotation in image viewer
    [Tags]    smoke    annotations
    
    Sleep    1s
    Add Annotation    Line
    Sleep    1s
    Take Actual Screenshot    MFRTIV03.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV03.png    MFRTIV03.png
    Delete the annotation

MFRTIV04 - Verify whether able to add rectangle annotation in image viewer
    [Documentation]    Verify whether able to add rectangle annotation in image viewer
    [Tags]    smoke    annotations
    Sleep    1s
    Add Annotation    Rectangle
    Sleep    1s
    Take Actual Screenshot    MFRTIV04.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV04.png    MFRTIV04.png
    Delete the annotation

MFRTIV05 - Verify whether able to add circle annotation in image viewer
    [Documentation]    Verify whether able to add circle annotation in image viewer
    [Tags]    smoke    annotations
    Sleep    1s
    Add Annotation    Circle
    Sleep    1s
    Take Actual Screenshot    MFRTIV05.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV05.png    MFRTIV05.png
    Delete the annotation

MFRTIV06 - Verify whether able to add an freehand annotation in image viewer
    [Documentation]    Verify whether able to add freehand annotation in image viewer
    [Tags]    smoke    annotations
    Sleep    1s
    Add Freehand Annotation
    Sleep    1s
    Take Actual Screenshot    MFRTIV06.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV06.png    MFRTIV06.png
    Delete the annotation

MFRTIV07 - Verify whether able to add a Text annotation.
    [Documentation]    Verify whether able to add a Text annotation.
    [Tags]    smoke    annotations
    Sleep    1s
    Add Text Annotation    This is a text annotation
    Sleep    1s
    Take Actual Screenshot    MFRTIV07.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV07.png    MFRTIV07.png
    Delete the annotation

MFRTIV08 - Verify whether able to add multiple annotations of same type in image viewer
    [Documentation]    Verify whether able to add multiple annotations of the same type in image viewer
    [Tags]    smoke    annotations
    Sleep    1s
    Add Multiple Annotations Of Same Type    Arrow    3
    Sleep    1s
    Take Actual Screenshot    MFRTIV08.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV08.png    MFRTIV08.png
    Delete the annotation

MFRTIV09 - Verify whether able to add multiple ruler annotations in image viewer
    [Documentation]    Verify whether able to add multiple ruler annotations of the same type in image viewer
    [Tags]    smoke    annotations
    Sleep    1s
    Add Multiple Annotations Of Same Type    Ruler    3
    Sleep    1s
    Take Actual Screenshot    MFRTIV09.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV09.png    MFRTIV09.png
    Delete the annotation

MFRTIV10 - Verify whether able to add multiple line annotations in image viewer
    [Documentation]    Verify whether able to add multiple line annotations of the same type in image viewer
    [Tags]    smoke    annotations
    Sleep    1s
    Add Multiple Annotations Of Same Type    Line    3
    Sleep    1s
    Take Actual Screenshot    MFRTIV10.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV10.png    MFRTIV10.png
    Delete the annotation

MFRTIV11 - Verify whether able to add multiple rectangle annotations in image viewer
    [Documentation]    Verify whether able to add multiple rectangle annotations of the same type in image viewer
    [Tags]    smoke    annotations
    Sleep    1s
    Add Multiple Annotations Of Same Type    Rectangle    3
    Sleep    1s
    Take Actual Screenshot    MFRTIV11.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV11.png    MFRTIV11.png
    Delete the annotation

MFRTIV12 - Verify whether able to add multiple circle annotations in image viewer
    [Documentation]    Verify whether able to add multiple circle annotations of the same type in image viewer
    [Tags]    smoke    annotations
    Sleep    1s
    Add Multiple Annotations Of Same Type    Circle    3
    Sleep    1s
    Take Actual Screenshot    MFRTIV12.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV12.png    MFRTIV12.png
    Delete the annotation

MFRTIV13 - Verify whether able to add multiple freehand annotations in image viewer
    [Documentation]    Verify whether able to add multiple freehand annotations in image viewer
    [Tags]    smoke    annotations
    Sleep    1s
    Add Multiple Freehand Annotations    3
    Sleep    1s
    Take Actual Screenshot    MFRTIV13.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV13.png    MFRTIV13.png
    Delete the annotation

MFRTIV14 - Verify whether able to add multiple text annotations in image viewer
    [Documentation]    Verify whether able to add multiple text annotations in image viewer
    [Tags]    smoke    annotations
    Sleep    1s
    Add Multiple Text Annotations    3    Text Annotation
    Sleep    1s
    Take Actual Screenshot    MFRTIV14.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTIV14.png    MFRTIV14.png
    Delete the annotation
    Close FoxRT Application Window    

    
    

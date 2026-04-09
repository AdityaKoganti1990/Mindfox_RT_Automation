*** Settings ***
Library           FlaUILibrary
Library           Process
Library           AutoItLibrary
Resource          ../resources/login.resource
Resource          ../resources/General.resource
Resource          ../resources/imageviewer.resource
Resource          ../resources/annotations.resource
*** Test Cases ***
MFRTANN01 - Verify whether able to add arrow annotation in image viewer
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
    Take Actual Screenshot    MFRTANN01.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTANN01.png    MFRTANN01.png
    Delete the annotation

MFRTANN02 - Verify whether able to add ruler annotation in image viewer
    [Documentation]    Verify whether able to add ruler annotation in image viewer
    [Tags]    smoke    annotations
    
    Sleep    1s
    Add Annotation    Ruler
    Sleep    1s
    Take Actual Screenshot    MFRTANN02.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTANN02.png    MFRTANN02.png
    Delete the annotation


MFRTANN03 - Verify whether able to add line annotation in image viewer
    [Documentation]    Verify whether able to add line annotation in image viewer
    [Tags]    smoke    annotations
    
    Sleep    1s
    Add Annotation    Line
    Sleep    1s
    Take Actual Screenshot    MFRTANN03.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTANN03.png    MFRTANN03.png
    Delete the annotation

MFRTANN04 - Verify whether able to add rectangle annotation in image viewer
    [Documentation]    Verify whether able to add rectangle annotation in image viewer
    [Tags]    smoke    annotations
    Sleep    1s
    Add Annotation    Rectangle
    Sleep    1s
    Take Actual Screenshot    MFRTANN04.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTANN04.png    MFRTANN04.png
    Delete the annotation

MFRTANN05 - Verify whether able to add circle annotation in image viewer
    [Documentation]    Verify whether able to add circle annotation in image viewer
    [Tags]    smoke    annotations
    Sleep    1s
    Add Annotation    Circle
    Sleep    1s
    Take Actual Screenshot    MFRTANN05.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTANN05.png    MFRTANN05.png
    Delete the annotation

MFRTANN06 - Verify whether able to add an freehand annotation in image viewer
    [Documentation]    Verify whether able to add freehand annotation in image viewer
    [Tags]    smoke    annotations
    Sleep    1s
    Add Freehand Annotation
    Sleep    1s
    Take Actual Screenshot    MFRTANN06.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTANN06.png    MFRTANN06.png
    Delete the annotation

MFRTANN07 - Verify whether able to add a Text annotation.
    [Documentation]    Verify whether able to add a Text annotation.
    [Tags]    smoke    annotations
    Sleep    1s
    Add Text Annotation    This is a text annotation
    Sleep    1s
    Take Actual Screenshot    MFRTANN07.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTANN07.png    MFRTANN07.png
    Delete the annotation

MFRTANN08 - Verify whether able to add multiple annotations of same type in image viewer
    [Documentation]    Verify whether able to add multiple annotations of the same type in image viewer
    [Tags]    smoke    annotations
    Sleep    1s
    Add Multiple Annotations Of Same Type    Arrow    3
    Sleep    1s
    Take Actual Screenshot    MFRTANN08.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTANN08.png    MFRTANN08.png
    Delete the annotation

MFRTANN09 - Verify whether able to add multiple ruler annotations in image viewer
    [Documentation]    Verify whether able to add multiple ruler annotations of the same type in image viewer
    [Tags]    smoke    annotations
    Sleep    1s
    Add Multiple Annotations Of Same Type    Ruler    3
    Sleep    1s
    Take Actual Screenshot    MFRTANN09.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTANN09.png    MFRTANN09.png
    Delete the annotation

MFRTANN10 - Verify whether able to add multiple line annotations in image viewer
    [Documentation]    Verify whether able to add multiple line annotations of the same type in image viewer
    [Tags]    smoke    annotations
    Sleep    1s
    Add Multiple Annotations Of Same Type    Line    3
    Sleep    1s
    Take Actual Screenshot    MFRTANN10.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTANN10.png    MFRTANN10.png
    Delete the annotation

MFRTANN11 - Verify whether able to add multiple rectangle annotations in image viewer
    [Documentation]    Verify whether able to add multiple rectangle annotations of the same type in image viewer
    [Tags]    smoke    annotations
    Sleep    1s
    Add Multiple Annotations Of Same Type    Rectangle    3
    Sleep    1s
    Take Actual Screenshot    MFRTANN11.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTANN11.png    MFRTANN11.png
    Delete the annotation

MFRTANN12 - Verify whether able to add multiple circle annotations in image viewer
    [Documentation]    Verify whether able to add multiple circle annotations of the same type in image viewer
    [Tags]    smoke    annotations
    Sleep    1s
    Add Multiple Annotations Of Same Type    Circle    3
    Sleep    1s
    Take Actual Screenshot    MFRTANN12.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTANN12.png    MFRTANN12.png
    Delete the annotation

MFRTANN13 - Verify whether able to add multiple freehand annotations in image viewer
    [Documentation]    Verify whether able to add multiple freehand annotations in image viewer
    [Tags]    smoke    annotations
    Sleep    1s
    Add Multiple Freehand Annotations    3
    Sleep    1s
    Take Actual Screenshot    MFRTANN13.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTANN13.png    MFRTANN13.png
    Delete the annotation

MFRTANN14 - Verify whether able to add multiple text annotations in image viewer
    [Documentation]    Verify whether able to add multiple text annotations in image viewer
    [Tags]    smoke    annotations
    Sleep    1s
    Add Multiple Text Annotations    3    Text Annotation
    Sleep    1s
    Take Actual Screenshot    MFRTANN14.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTANN14.png    MFRTANN14.png
    Delete the annotation

MFRTANN15 - Verify whether able to add Arrow annotation at custom positions.
    [Documentation]    Verify whether able to add an annotation using start and end positions supplied by the user.
    [Tags]    annotations    user-input
    Sleep    1s
    Add Annotation at custom position    Arrow    845    470    1050    570
    Sleep    1s
    Take Actual Screenshot    MFRTANN15.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTANN15.png    MFRTANN15.png
    Delete the annotation
MFRTANN16 - Verify whether able to add Ruler annotation at custom positions.
    [Documentation]    Verify whether able to add a ruler annotation using start and end positions supplied by the user.
    [Tags]    annotations    user-input
    Sleep    1s
    Add Annotation at custom position    Ruler    845    470    1050    570
    Sleep    1s
    Take Actual Screenshot    MFRTANN16.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTANN16.png    MFRTANN16.png
    Delete the annotation

MFRTANN17 - Verify whether able to add Line annotation at custom positions.
    [Documentation]    Verify whether able to add a line annotation using start and end positions supplied by the user.
    [Tags]    annotations    user-input
    Sleep    1s
    Add Annotation at custom position    Line    845    470    1050    570
    Sleep    1s
    Take Actual Screenshot    MFRTANN17.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTANN17.png    MFRTANN17.png
    Delete the annotation

MFRTANN18 - Verify whether able to add Rectangle annotation at custom positions.
    [Documentation]    Verify whether able to add a rectangle annotation using start and end positions supplied by the user.
    [Tags]    annotations    user-input
    Sleep    1s
    Add Annotation at custom position    Rectangle    845    470    1050    570
    Sleep    1s
    Take Actual Screenshot    MFRTANN18.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTANN18.png    MFRTANN18.png
    Delete the annotation

MFRTANN19 - Verify whether able to add Circle annotation at custom positions.
    [Documentation]    Verify whether able to add a circle annotation using start and end positions supplied by the user.
    [Tags]    annotations    user-input
    Sleep    1s
    Add Annotation at custom position    Circle    845    470    1050    570
    Sleep    1s
    Take Actual Screenshot    MFRTANN19.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTANN19.png    MFRTANN19.png
    Delete the annotation

MFRTANN20 - Verify whether able to add Freehand annotation at custom positions.
    [Documentation]    Verify whether able to add a freehand annotation using start and end positions supplied by the user.
    [Tags]    annotations    user-input
    Sleep    1s
    Add Freehand Annotation at custom position    845    220    960    125    1030    290    905    395    845    220
    Sleep    1s
    Take Actual Screenshot    MFRTANN20.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTANN20.png    MFRTANN20.png
    Delete the annotation

MFRTANN21 - Verify whether able to delete arrow annotation using context menu delete button
    [Documentation]    Verify whether able to delete an arrow annotation by right-clicking it and selecting Delete from the context menu.
    [Tags]    smoke    annotations
    Sleep    1s
    Add Annotation at custom position    Arrow    845    470    1050    570
    Sleep    1s
    Delete Annotation From Context Menu    947    520
    Sleep    1s
    Take Actual Screenshot    MFRTANN21.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTANN21.png    MFRTANN21.png

MFRTANN22 - Verify whether able to delete ruler annotation using context menu delete button
    [Documentation]    Verify whether able to delete a ruler annotation by right-clicking it and selecting Delete from the context menu.
    [Tags]    smoke    annotations
    Sleep    1s
    Add Annotation at custom position    Ruler    845    470    1050    570
    Sleep    1s
    Delete Annotation From Context Menu    947    520
    Sleep    1s
    Take Actual Screenshot    MFRTANN22.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTANN22.png    MFRTANN22.png

MFRTANN23 - Verify whether able to delete line annotation using context menu delete button
    [Documentation]    Verify whether able to delete a line annotation by right-clicking it and selecting Delete from the context menu.
    [Tags]    smoke    annotations
    Sleep    1s
    Add Annotation at custom position    Line    845    470    1050    570
    Sleep    1s
    Delete Annotation From Context Menu    947    520
    Sleep    1s
    Take Actual Screenshot    MFRTANN23.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTANN23.png    MFRTANN23.png

MFRTANN24 - Verify whether able to delete rectangle annotation using context menu delete button
    [Documentation]    Verify whether able to delete a rectangle annotation by right-clicking it and selecting Delete from the context menu.
    [Tags]    smoke    annotations
    Sleep    1s
    Add Annotation at custom position    Rectangle    845    470    1050    570
    Sleep    1s
    Delete Annotation From Context Menu    947    520
    Sleep    1s
    Take Actual Screenshot    MFRTANN24.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTANN24.png    MFRTANN24.png

MFRTANN25 - Verify whether able to delete circle annotation using context menu delete button
    [Documentation]    Verify whether able to delete a circle annotation by right-clicking it and selecting Delete from the context menu.
    [Tags]    smoke    annotations
    Sleep    1s
    Add Annotation at custom position    Circle    845    470    1050    570
    Sleep    1s
    Delete Annotation From Context Menu    947    520
    Sleep    1s
    Take Actual Screenshot    MFRTANN25.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTANN25.png    MFRTANN25.png

MFRTANN26 - Verify whether able to delete freehand annotation using context menu delete button
    [Documentation]    Verify whether able to delete a freehand annotation by right-clicking it and selecting Delete from the context menu.
    [Tags]    smoke    annotations
    Sleep    1s
    Add Freehand Annotation at custom position    845    220    960    125    1030    290    905    395    845    220
    Sleep    1s
    Delete Annotation From Context Menu    905    395
    Sleep    1s
    Take Actual Screenshot    MFRTANN26.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTANN26.png    MFRTANN26.png

MFRTANN27 - Verify whether able to delete text annotation using context menu delete button
    [Documentation]    Verify whether able to delete a text annotation by right-clicking it and selecting Delete from the context menu.
    [Tags]    smoke    annotations
    Sleep    1s
    Add Text Annotation    This is a text annotation
    Sleep    1s
    Delete Annotation From Context Menu    958    603
    Sleep    1s
    Take Actual Screenshot    MFRTANN27.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTANN27.png    MFRTANN27.png

MFRTANN28 - Verify whether able to add point(intensity) annotation in image viewer
    [Documentation]    Verify whether able to add point(intensity) annotation in image viewer
    [Tags]    smoke    annotations
    
    Sleep    1s
    Add Point Intensity Annotation
    Sleep    1s
    Take Actual Screenshot    MFRTANN28.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTANN28.png    MFRTANN28.png
    Delete the annotation

MFRTANN29 - Verify whether able to add point(intensity) annotation at custom position in image viewer
    [Documentation]    Verify whether able to add point(intensity) annotation at custom position in image viewer
    [Tags]    smoke    annotations    user-input

    Sleep    1s
    Add Point Intensity Annotation at custom position    930    385    1
    Sleep    1s
    Take Actual Screenshot    MFRTANN29.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTANN29.png    MFRTANN29.png
MFRTANN30 - Verify whether able to delete point(intensity) annotation using context menu delete button
    [Documentation]    Verify whether able to delete a point(intensity) annotation by right-clicking it and selecting Delete from the context menu.
    [Tags]    smoke    annotations
    Sleep    1s
    Delete Annotation From Context Menu    930    385
    Sleep    1s
    Take Actual Screenshot    MFRTANN30.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTANN30.png    MFRTANN30.png

MFRTANN31 - Verify whether able to add multiple point(intensity) annotations at custom positions in image viewer
    [Documentation]    Verify whether able to add multiple point(intensity) annotations at custom positions in image viewer
    [Tags]    smoke    annotations    user-input

    Sleep    1s
    Add Point Intensity Annotation at custom position    930    385    3
    Sleep    1s
    Take Actual Screenshot    MFRTANN31.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTANN31.png    MFRTANN31.png
    Delete the annotation
    Close FoxRT Application Window
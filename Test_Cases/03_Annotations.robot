*** Settings ***
Documentation     Annotations test suite. Total Test Cases: 50 (MFRTANN01 - MFRTANN50).
Library           FlaUILibrary
Library           Process
Library           AutoItLibrary
Resource          ../resources/login.resource
Resource          ../resources/annotations.resource
Resource          ../resources/Online.resource
*** Test Cases ***
MFRTANN01 - Verify whether able to add arrow annotation in image viewer
    [Documentation]    Verify whether able to add arrow annotation in image viewer
    [Tags]    smoke    annotations
    
    Open FoxViewerDesktop Application
    Login To FoxViewerDesktop    admin    admin
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
MFRTANN32 - Verify whether able to move annotation labels over the image in image viewer.
    [Documentation]    This test case is to verify whether able to move annotation labels over the image in image viewer.

    Add Annotation    annotation_type=Ruler
    Take Actual Screenshot    MFRTANN32_Actual1.png
    Move annotation Label    886    606    844    515
    Take Actual Screenshot    MFRTANN32_Actual2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTANN32_Actual2.png    MFRTANN32_Actual2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTANN32_Actual1.png    MFRTANN32_Actual2.png    100    False
    Delete the annotation
MFRTANN33 - Verify whether shortcut key Esc clears all the annotation selection.
    [Documentation]    This test case is to verify whether shortcut key Esc clears all the annotation selection.

    Click    ${arrow_annotation_button_xpath}
    Press Shortcut Keys    Esc
    Run Keyword And Continue On Failure    VerifyControlState    ${arrow_annotation_button_xpath}    de-selected
    Click    ${ruler_annotation_button_xpath}
    Press Shortcut Keys    Esc
    Run Keyword And Continue On Failure    VerifyControlState    ${ruler_annotation_button_xpath}    de-selected
    Click    ${line_annotation_button_xpath}
    Press Shortcut Keys    Esc
    Run Keyword And Continue On Failure    VerifyControlState    ${line_annotation_button_xpath}    de-selected
    Click    ${rectangle_annotation_button_xpath}
    Press Shortcut Keys    Esc
    Run Keyword And Continue On Failure    VerifyControlState    ${rectangle_annotation_button_xpath}    de-selected
    Click    ${circle_annotation_button_xpath}
    Press Shortcut Keys    Esc
    Run Keyword And Continue On Failure    VerifyControlState    ${circle_annotation_button_xpath}    de-selected
    Click    ${freehand_annotation_button_xpath}
    Press Shortcut Keys    Esc
    Run Keyword And Continue On Failure    VerifyControlState    ${freehand_annotation_button_xpath}    de-selected
    Click    ${text_annotation_button_xpath}
    Press Shortcut Keys    Esc
    Sleep    0.2s
    ${ann_props_visible}=    Run Keyword And Return Status    Wait Until Element Exist    /Window/Window[@Name="Annotation Properties"]    1
    IF    ${ann_props_visible}
        Click    /Window/Window[@Name="Annotation Properties"]/Button[@AutomationId="AnnProps_Btn_Cancel"]
        Sleep    0.2s
    END
    Run Keyword And Continue On Failure    VerifyControlState    ${text_annotation_button_xpath}    de-selected
    Click    ${point_intensity_annotation_button_xpath}
    Press Shortcut Keys    Esc
    Run Keyword And Continue On Failure    VerifyControlState    ${point_intensity_annotation_button_xpath}    de-selected
    Delete the annotation
    Close Project
MFRTANN34 - Verify whether added annotations are persisted after switching between images.
    [Documentation]    This test case is to verify whether added annotations are persisted after switching between images.
    [Tags]    annotations

    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.dcm    
    ...    ${project_Directory_Path}MLE_6_0.280.dcm    
    ...    ${project_Directory_Path}MLE_8''0.322.dcm
    Add Annotation    annotation_type=Rectangle
    Take Actual Screenshot    MFRTANN34_Actual1.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTANN34_Actual1.png    MFRTANN34_Actual1.png
    Select Files From Files Tab    MLE_6_0.280.dcm
    Select Files From Files Tab    MLE_4_0.237.dcm
    Take Actual Screenshot    MFRTANN34_Actual2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTANN34_Actual2.png    MFRTANN34_Actual2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTANN34_Actual1.png    MFRTANN34_Actual2.png
    Delete the annotation
    Close Project
# ---------------------------------------------------------------------------
# Move & Resize annotation tests (MFRTANN35 - MFRTANN50) - scaffolds for manual review.
# Positions are intentionally left blank (${EMPTY}); fill in real image-viewer coordinates before running.
# NOTE: 'Add Annotation at custom position' currently supports Arrow, Ruler, Line, Rectangle and Circle only.
# For ROI, Text and Point Cursor, extend that keyword (add the matching tool-button click) or the annotation will not be drawn.
# ---------------------------------------------------------------------------
MFRTANN35 - Verify whether able to move Arrow annotation over the image in image viewer.
    [Documentation]    This test case is to verify whether able to move Arrow annotation over the image in image viewer.
    [Tags]    annotations    move

    Focus    ${MAIN_WINDOW_XPATH}
    Open ProjectFile    ${project_Directory_Path}MLE_4_0.237.dcm
    Add Annotation at custom position    Arrow    700    385    900    330
    Take Actual Screenshot    MFRTANN35_Actual1.png
    Move Annotation    900    330    900    205
    Take Actual Screenshot    MFRTANN35_Actual2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTANN35_Actual2.png    MFRTANN35_Actual2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTANN35_Actual1.png    MFRTANN35_Actual2.png    100    False
    Delete the annotation
MFRTANN36 - Verify whether able to move Ruler annotation over the image in image viewer.
    [Documentation]    This test case is to verify whether able to move Ruler annotation over the image in image viewer.
    [Tags]    annotations    move

    Add Annotation at custom position    Ruler    700    385    900    330
    Take Actual Screenshot    MFRTANN36_Actual1.png
    Move Annotation    900    330    900    205
    Take Actual Screenshot    MFRTANN36_Actual2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTANN36_Actual2.png    MFRTANN36_Actual2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTANN36_Actual1.png    MFRTANN36_Actual2.png    100    False
    Delete the annotation
MFRTANN37 - Verify whether able to move Line annotation over the image in image viewer.
    [Documentation]    This test case is to verify whether able to move Line annotation over the image in image viewer.
    [Tags]    annotations    move

    Add Annotation at custom position    Line    700    385    900    330
    Take Actual Screenshot    MFRTANN37_Actual1.png
    Move Annotation    900    330    900    205
    Take Actual Screenshot    MFRTANN37_Actual2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTANN37_Actual2.png    MFRTANN37_Actual2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTANN37_Actual1.png    MFRTANN37_Actual2.png    100    False
    Delete the annotation
MFRTANN38 - Verify whether able to move Rectangle annotation over the image in image viewer.
    [Documentation]    This test case is to verify whether able to move Rectangle annotation over the image in image viewer.
    [Tags]    annotations    move

    Add Annotation at custom position    Rectangle    790    310    1070    370
    Take Actual Screenshot    MFRTANN38_Actual1.png
    Move Annotation    1070    370    1070    920
    Take Actual Screenshot    MFRTANN38_Actual2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTANN38_Actual2.png    MFRTANN38_Actual2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTANN38_Actual1.png    MFRTANN38_Actual2.png    100    False
    Delete the annotation
MFRTANN39 - Verify whether able to move Circle annotation over the image in image viewer.
    [Documentation]    This test case is to verify whether able to move Circle annotation over the image in image viewer.
    [Tags]    annotations    move

    Add Annotation at custom position    Circle    790    310    1070    370
    Take Actual Screenshot    MFRTANN39_Actual1.png
    Move Annotation    930    370    940    945
    Take Actual Screenshot    MFRTANN39_Actual2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTANN39_Actual2.png    MFRTANN39_Actual2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTANN39_Actual1.png    MFRTANN39_Actual2.png    100    False
    Delete the annotation
MFRTANN40 - Verify whether able to move ROI annotation over the image in image viewer.
    [Documentation]    This test case is to verify whether able to move ROI annotation over the image in image viewer.
    [Tags]    annotations    move

    Add Freehand Annotation at custom position    845    220    960    125    1030    290    905    395    845    220
    Take Actual Screenshot    MFRTANN40_Actual1.png
    Move Annotation    975    340    1030    705
    Take Actual Screenshot    MFRTANN40_Actual2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTANN40_Actual2.png    MFRTANN40_Actual2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTANN40_Actual1.png    MFRTANN40_Actual2.png    100    False
    Delete the annotation
MFRTANN41 - Verify whether able to move Text annotation over the image in image viewer.
    [Documentation]    This test case is to verify whether able to move Text annotation over the image in image viewer.
    [Tags]    annotations    move

    Add Text Annotation    This is a text annotation
    Take Actual Screenshot    MFRTANN41_Actual1.png
    Move Annotation    900    595    910    280
    Take Actual Screenshot    MFRTANN41_Actual2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTANN41_Actual2.png    MFRTANN41_Actual2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTANN41_Actual1.png    MFRTANN41_Actual2.png    100    False
    Delete the annotation
MFRTANN42 - Verify whether able to move Point Cursor annotation over the image in image viewer.
    [Documentation]    This test case is to verify whether able to move Point Cursor annotation over the image in image viewer.
    [Tags]    annotations    move

    Add Point Intensity Annotation at custom position    930    385    1
    Take Actual Screenshot    MFRTANN42_Actual1.png
    Move Annotation    930    385    935    890
    Take Actual Screenshot    MFRTANN42_Actual2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTANN42_Actual2.png    MFRTANN42_Actual2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTANN42_Actual1.png    MFRTANN42_Actual2.png    100    False
    Delete the annotation
MFRTANN43 - Verify whether able to resize Arrow annotation in image viewer.
    [Documentation]    This test case is to verify whether able to resize Arrow annotation in image viewer.
    [Tags]    annotations    resize

    Add Annotation at custom position    Arrow    700    385    900    330
    Take Actual Screenshot    MFRTANN43_Actual1.png
    Resize Annotation    900    330    1045    285
    Take Actual Screenshot    MFRTANN43_Actual2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTANN43_Actual2.png    MFRTANN43_Actual2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTANN43_Actual1.png    MFRTANN43_Actual2.png    100    False
    Delete the annotation
MFRTANN44 - Verify whether able to resize Ruler annotation in image viewer.
    [Documentation]    This test case is to verify whether able to resize Ruler annotation in image viewer.
    [Tags]    annotations    resize

    Add Annotation at custom position    Ruler    700    385    900    330
    Take Actual Screenshot    MFRTANN44_Actual1.png
    Resize Annotation    900    330    1045    285
    Take Actual Screenshot    MFRTANN44_Actual2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTANN44_Actual2.png    MFRTANN44_Actual2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTANN44_Actual1.png    MFRTANN44_Actual2.png    100    False
    Delete the annotation
MFRTANN45 - Verify whether able to resize Line annotation in image viewer.
    [Documentation]    This test case is to verify whether able to resize Line annotation in image viewer.
    [Tags]    annotations    resize

    Add Annotation at custom position    Line    700    385    900    330
    Take Actual Screenshot    MFRTANN45_Actual1.png
    Resize Annotation    900    330    1045    285
    Take Actual Screenshot    MFRTANN45_Actual2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTANN45_Actual2.png    MFRTANN45_Actual2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTANN45_Actual1.png    MFRTANN45_Actual2.png    100    False
    Delete the annotation
MFRTANN46 - Verify whether able to resize Rectangle annotation in image viewer.
    [Documentation]    This test case is to verify whether able to resize Rectangle annotation in image viewer.
    [Tags]    annotations    resize

    Add Annotation at custom position    Rectangle    790    310    1070    370
    Take Actual Screenshot    MFRTANN46_Actual1.png
    Resize Annotation    790    310    990    310
    Take Actual Screenshot    MFRTANN46_Actual2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTANN46_Actual2.png    MFRTANN46_Actual2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTANN46_Actual1.png    MFRTANN46_Actual2.png    100    False
    Delete the annotation
MFRTANN47 - Verify whether able to resize Circle annotation in image viewer.
    [Documentation]    This test case is to verify whether able to resize Circle annotation in image viewer.
    [Tags]    annotations    resize

    Add Annotation at custom position    Circle    790    310    1070    370
    Take Actual Screenshot    MFRTANN47_Actual1.png
    Select Annotation    915    310
    Resize Annotation    790    310    995    310
    Take Actual Screenshot    MFRTANN47_Actual2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTANN47_Actual2.png    MFRTANN47_Actual2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTANN47_Actual1.png    MFRTANN47_Actual2.png    100    False
    Delete the annotation
MFRTANN48 - Verify whether able to resize ROI annotation in image viewer.
    [Documentation]    This test case is to verify whether able to resize ROI annotation in image viewer.
    [Tags]    annotations    resize

    Add Freehand Annotation at custom position    845    220    960    125    1030    290    905    395    845    220
    Take Actual Screenshot    MFRTANN48_Actual1.png
    Resize Annotation    905    395    905    550
    Take Actual Screenshot    MFRTANN48_Actual2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTANN48_Actual2.png    MFRTANN48_Actual2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTANN48_Actual1.png    MFRTANN48_Actual2.png    100    False
    Delete the annotation
MFRTANN49 - Verify whether able to resize Text annotation in image viewer.
    [Documentation]    This test case is to verify whether able to resize Text annotation in image viewer.
    [Tags]    annotations    resize

    Add Text Annotation    This is a text annotation
    Take Actual Screenshot    MFRTANN49_Actual1.png
    Resize Annotation    900    595    910    280
    Take Actual Screenshot    MFRTANN49_Actual2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTANN49_Actual2.png    MFRTANN49_Actual2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTANN49_Actual1.png    MFRTANN49_Actual2.png    100    False
    Delete the annotation
MFRTANN50 - Verify whether able to resize Point Cursor annotation in image viewer.
    [Documentation]    This test case is to verify whether able to resize Point Cursor annotation in image viewer.
    [Tags]    annotations    resize

    Add Point Intensity Annotation at custom position    930    385    1
    Take Actual Screenshot    MFRTANN50_Actual1.png
    Resize Annotation    930    385    935    890
    Take Actual Screenshot    MFRTANN50_Actual2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTANN50_Actual2.png    MFRTANN50_Actual2.png
    Run Keyword And Continue On Failure    Compare Result Images    MFRTANN50_Actual1.png    MFRTANN50_Actual2.png    100    False
    Delete the annotation
    Close Project
    Close FoxRT Application Window






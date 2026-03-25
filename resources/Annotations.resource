*** Settings ***
Library           FlaUILibrary    screenshot_dir=${CURDIR}\\..\\Actual\\test.png
Library           Process
Library           ../lib/image_comparator.py
Library           ../lib/ironpy_remote_client.py
Library           AutoItLibrary
Resource          ../resources/login.resource
Resource          ../resources/General.resource
Resource          ../resources/imageviewer.resource

*** Variables ***
${arrow_annotation_button_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Pane/Button[@AutomationId="Main_Tgl_AnnotArrow"]
${delete_annotation_button_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Button[@AutomationId="Main_Btn_ClearAnnotations"]
${ruler_annotation_button_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Pane/Button[@AutomationId="Main_Tgl_AnnotRuler"]
${line_annotation_button_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Pane/Button[@AutomationId="Main_Tgl_AnnotLine"]
${rectangle_annotation_button_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Pane/Button[@AutomationId="Main_Tgl_AnnotRectangle"]
${circle_annotation_button_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Pane/Button[@AutomationId="Main_Tgl_AnnotCircle"]
${freehand_annotation_button_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Pane/Button[@AutomationId="Main_Tgl_AnnotRoi"]
${text_annotation_button_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Pane/Button[@AutomationId="Main_Tgl_AnnotText"]
${delete_context_menu_item_xpath}    //*[@Name="Delete"]

*** Keywords ***

Get Image Viewer Rectangle
    ${rectangle_str}=    Get Rectangle Bounding From Element    ${IMAGE_VIEWER_XPATH}    BoundingRectangle
    ${x}=        Get From List    ${rectangle_str}    0
    ${y}=        Get From List    ${rectangle_str}    1
    ${width}=    Get From List    ${rectangle_str}    2
    ${height}=   Get From List    ${rectangle_str}    3
    RETURN    ${x}    ${y}    ${width}    ${height}

Calculate Polygon Points
    ${x}    ${y}    ${width}    ${height}    Get Image Viewer Rectangle

    ${start_x}=    Evaluate    int(${x} + ${width} / 2)
    ${start_y}=    Evaluate    int(${y} + ${height} / 2)

    ${end_x}=      Evaluate    int(${start_x} + 100)
    ${end_y}=      Evaluate    int(${start_y} + 100)

    ${start_x1}=   Evaluate    int(${end_x} + 100)
    ${start_y1}=   Evaluate    int(${end_y} - 80)

    ${end_x1}=     Evaluate    int(${start_x1} - 50)
    ${end_y1}=     Evaluate    int(${start_y1} - 100)

    RETURN    ${start_x}    ${start_y}    ${end_x}    ${end_y}    ${start_x1}    ${start_y1}    ${end_x1}    ${end_y1}


Get Current Location Of Image Viewer Polygon
    ${start_x}    ${start_y}    ${end_x}    ${end_y}    ${start_x1}    ${start_y1}    ${end_x1}    ${end_y1}    Calculate Polygon Points
    RETURN    ${start_x}    ${start_y}    ${end_x}    ${end_y}    ${start_x1}    ${start_y1}    ${end_x1}    ${end_y1}


Drag And Drop In Image Viewer
    [Documentation]    Drag and drop within the image viewer using AutoItLibrary mouse control
    ${start_x}    ${start_y}    ${end_x}    ${end_y}    ${start_x1}    ${start_y1}    ${end_x1}    ${end_y1}    Get Current Location Of Image Viewer Polygon
    AutoItLibrary.Mouse Click Drag    left    ${start_x}    ${start_y}    ${end_x}    ${end_y}
    ${line_size}=    Evaluate    ((((${end_x}-${start_x})**2)+(( ${end_y}-${start_y})**2))**0.5)
    Log    SIZE: ${line_size}

Drag And Drop In Image Viewer With Offset
    [Arguments]    ${x_offset}=0    ${y_offset}=0
    [Documentation]    Drag and drop within the image viewer using an offset so repeated annotations do not overlap.
    ${start_x}    ${start_y}    ${end_x}    ${end_y}    ${start_x1}    ${start_y1}    ${end_x1}    ${end_y1}    Get Current Location Of Image Viewer Polygon
    ${start_x}=    Evaluate    int(${start_x} + ${x_offset})
    ${start_y}=    Evaluate    int(${start_y} + ${y_offset})
    ${end_x}=      Evaluate    int(${end_x} + ${x_offset})
    ${end_y}=      Evaluate    int(${end_y} + ${y_offset})
    AutoItLibrary.Mouse Click Drag    left    ${start_x}    ${start_y}    ${end_x}    ${end_y}
    ${line_size}=    Evaluate    ((((${end_x}-${start_x})**2)+(( ${end_y}-${start_y})**2))**0.5)
    Log    SIZE: ${line_size}

Get Annotation Offsets
    [Arguments]    ${index}
    [Documentation]    Return distinct offsets so repeated annotations are placed in different areas of the image viewer.
    IF    ${index} == 0
        ${x_offset}=    Set Variable    -140
        ${y_offset}=    Set Variable    -90
    ELSE IF    ${index} == 1
        ${x_offset}=    Set Variable    130
        ${y_offset}=    Set Variable    -70
    ELSE IF    ${index} == 2
        ${x_offset}=    Set Variable    -110
        ${y_offset}=    Set Variable    110
    ELSE IF    ${index} == 3
        ${x_offset}=    Set Variable    140
        ${y_offset}=    Set Variable    95
    ELSE
        ${x_offset}=    Evaluate    -140 + ((${index} % 4) * 90)
        ${y_offset}=    Evaluate    -90 + (int(${index} / 4) * 70)
    END
    RETURN    ${x_offset}    ${y_offset}


Find Center point
    ${start_x}    ${start_y}    ${end_x}    ${end_y}    ${start_x1}    ${start_y1}    ${end_x1}    ${end_y1}    Get Current Location Of Image Viewer Polygon
    ${center_x}=    Evaluate    int((${start_x} + ${end_x}) / 2)
    ${center_y}=    Evaluate    int((${start_y} + ${end_y}) / 2)
    RETURN    ${center_x}    ${center_y}


Find Center Point Polygon
    ${start_x}    ${start_y}    ${end_x}    ${end_y}    
    ...    ${start_x1}    ${start_y1}    ${end_x1}    ${end_y1}    Get Current Location Of Image Viewer Polygon

    ${min_x}=    Evaluate    min(${start_x}, ${end_x}, ${start_x1}, ${end_x1})
    ${max_x}=    Evaluate    max(${start_x}, ${end_x}, ${start_x1}, ${end_x1})

    ${min_y}=    Evaluate    min(${start_y}, ${end_y}, ${start_y1}, ${end_y1})
    ${max_y}=    Evaluate    max(${start_y}, ${end_y}, ${start_y1}, ${end_y1})

    ${center_x}=    Evaluate    int((${min_x} + ${max_x}) / 2)
    ${center_y}=    Evaluate    int((${min_y} + ${max_y}) / 2)

    RETURN    ${center_x}    ${center_y}


Find Center Point Curved Object
    ${center_x}    ${center_y}    Find Center Point Polygon
    RETURN    ${center_x}    ${center_y}


Delete the annotation
    [Documentation]    Delete/Clear the annotations.
    Focus    ${window_XPATH}
    Sleep    1s
    Click    ${delete_annotation_button_xpath}
    Sleep    1s
    ${result}=    Win Exists    FoXpert    strText=${EMPTY}
    Run Keyword If    '${result}'=='1'    Click    /Window/Window/Button[@Name="Yes"]
    Sleep    1s

    
Draw Polygon On Image
    [Documentation]    Draw a polygon on the image viewer
    ${start_x}    ${start_y}    ${end_x}    ${end_y}    
    ...    ${start_x1}    ${start_y1}    ${end_x1}    ${end_y1}    Get Current Location Of Image Viewer Polygon

    AutoItLibrary.Mouse Click    left    ${start_x}    ${start_y}
    Sleep    0.5
    AutoItLibrary.Mouse Click    left    ${end_x}    ${end_y}
    Sleep    0.5
    AutoItLibrary.Mouse Click    left    ${start_x1}    ${start_y1}
    Sleep    0.5
    AutoItLibrary.Mouse Click    left    ${end_x1}    ${end_y1}
    Sleep    0.5
    AutoItLibrary.Mouse Click    left    ${start_x}    ${start_y}    2
    Sleep    0.5


Draw Freehand On Image
    [Documentation]    Draw freehand shape
    ${start_x}    ${start_y}    ${end_x}    ${end_y}    
    ...    ${start_x1}    ${start_y1}    ${end_x1}    ${end_y1}    Get Current Location Of Image Viewer Polygon

    AutoItLibrary.Mouse Move    ${start_x}    ${start_y}
    Sleep    0.2
    AutoItLibrary.Mouse Down    left
    AutoItLibrary.Mouse Move    ${end_x}    ${end_y}    4
    AutoItLibrary.Mouse Move    ${start_x1}    ${start_y1}    4

    ${jx}=    Evaluate    ${start_x1} + 15
    ${jy}=    Evaluate    ${start_y1} - 10
    AutoItLibrary.Mouse Move    ${jx}    ${jy}    3

    ${jx2}=   Evaluate    ${jx} + 10
    ${jy2}=   Evaluate    ${jy} + 8
    AutoItLibrary.Mouse Move    ${jx2}    ${jy2}    3

    AutoItLibrary.Mouse Up    left
    Sleep    0.5


Draw Curved Object On Image
    ${start_x}    ${start_y}    ${end_x}    ${end_y}    
    ...    ${start_x1}    ${start_y1}    ${end_x1}    ${end_y1}    Get Current Location Of Image Viewer Polygon

    AutoItLibrary.Mouse Click    left    ${start_x}    ${start_y}
    Sleep    0.5
    AutoItLibrary.Mouse Click    left    ${end_x}    ${end_y}
    Sleep    0.5
    AutoItLibrary.Mouse Click    left    ${start_x1}    ${start_y1}
    Sleep    0.5
    AutoItLibrary.Mouse Click    left    ${end_x1}    ${end_y1}
    Sleep    0.5
    AutoItLibrary.Mouse Click    left    ${start_x}    ${start_y}    2
    Sleep    0.5


Draw Angle On Image
    ${start_x}    ${start_y}    ${end_x}    ${end_y}
    ...    ${start_x1}    ${start_y1}    ${end_x1}    ${end_y1}    Get Current Location Of Image Viewer Polygon

    AutoItLibrary.Mouse Click Drag    left    ${start_x}    ${start_y}    ${end_x}    ${end_y}
    Sleep    0.5

    AutoItLibrary.Mouse Click Drag    left    ${end_x}    ${end_y}    ${start_x1}    ${start_y1}
    Sleep    0.5

    AutoItLibrary.Mouse Click    left    ${start_x}    ${start_y}    2
    Sleep    0.5

Add Annotation
    [Arguments]    ${annotation_type}    ${x_offset}=0    ${y_offset}=0
    [Documentation]    Add annotation of specified type to the image viewer. Supported types: Arrow, Ruler, Line, Rectangle & Circle

    sleep    1s
    Run Keyword If    '${annotation_type}'=='Arrow'    Click    ${arrow_annotation_button_xpath}
    Run Keyword If    '${annotation_type}'=='Ruler'    Click    ${ruler_annotation_button_xpath}
    Run Keyword If    '${annotation_type}'=='Line'    Click    ${line_annotation_button_xpath}
    Run Keyword If    '${annotation_type}'=='Rectangle'    Click    ${rectangle_annotation_button_xpath}
    Run Keyword If    '${annotation_type}'=='Circle'    Click    ${circle_annotation_button_xpath}
    Sleep    1s
    Drag And Drop In Image Viewer With Offset    ${x_offset}    ${y_offset}
    Sleep    1s
    Run Keyword If    '${annotation_type}'=='Arrow'    Click    ${arrow_annotation_button_xpath}
    Run Keyword If    '${annotation_type}'=='Ruler'    Click    ${ruler_annotation_button_xpath}
    Run Keyword If    '${annotation_type}'=='Line'    Click    ${line_annotation_button_xpath}
    Run Keyword If    '${annotation_type}'=='Rectangle'    Click    ${rectangle_annotation_button_xpath}
    Run Keyword If    '${annotation_type}'=='Circle'    Click    ${circle_annotation_button_xpath}
    Sleep    1s

Add Annotation at custom position
    [Arguments]    ${annotation_type}    ${x1}    ${y1}    ${x2}    ${y2}
    [Documentation]    Add annotation of specified type using user-provided start and end positions relative to the image viewer's top-left corner. Supported types: Arrow, Ruler, Line

    sleep    1s
    Run Keyword If    '${annotation_type}'=='Arrow'    Click    ${arrow_annotation_button_xpath}
    Run Keyword If    '${annotation_type}'=='Ruler'    Click    ${ruler_annotation_button_xpath}
    Run Keyword If    '${annotation_type}'=='Line'    Click    ${line_annotation_button_xpath}
    Run Keyword If    '${annotation_type}'=='Rectangle'    Click    ${rectangle_annotation_button_xpath}
    Run Keyword If    '${annotation_type}'=='Circle'    Click    ${circle_annotation_button_xpath}

    Sleep    1s
    AutoItLibrary.Mouse Click Drag    left    ${x1}    ${y1}    ${x2}    ${y2}
    Sleep    1s
    Run Keyword If    '${annotation_type}'=='Arrow'    Click    ${arrow_annotation_button_xpath}
    Run Keyword If    '${annotation_type}'=='Ruler'    Click    ${ruler_annotation_button_xpath}
    Run Keyword If    '${annotation_type}'=='Line'    Click    ${line_annotation_button_xpath}
    Run Keyword If    '${annotation_type}'=='Rectangle'    Click    ${rectangle_annotation_button_xpath}
    Run Keyword If    '${annotation_type}'=='Circle'    Click    ${circle_annotation_button_xpath}
    Sleep    1s

Delete Annotation From Context Menu
    [Arguments]    ${start_x}    ${start_y}
    [Documentation]    Delete annotation using context menu option.

    Focus    ${window_XPATH}
    Sleep    1s
    AutoItLibrary.Mouse Click    right    ${start_x}    ${start_y}
    Sleep    0.5
    Click    ${delete_context_menu_item_xpath}
    Sleep    1s

Add Freehand Annotation at custom position
    [Arguments]    ${x1}    ${y1}    ${x2}    ${y2}    ${x3}    ${y3}    ${x4}    ${y4}    ${x5}    ${y5}
    [Documentation]    Add freehand annotation using user-provided start and end positions relative to the image viewer's top-left corner.
    Sleep    1s
    Click    ${freehand_annotation_button_xpath}
    Sleep    1s
    AutoItLibrary.Mouse Move    ${x1}    ${y1}
    Sleep    0.2
    AutoItLibrary.Mouse Down    left
    AutoItLibrary.Mouse Move    ${x2}    ${y2}    4
    AutoItLibrary.Mouse Move    ${x3}    ${y3}    4
    AutoItLibrary.Mouse Move    ${x4}    ${y4}    4
    AutoItLibrary.Mouse Move    ${x5}    ${y5}    4
    AutoItLibrary.Mouse Up    left
    Sleep    1s
    Click    ${freehand_annotation_button_xpath}
    Sleep    1s


Add Multiple Annotations Of Same Type
    [Arguments]    ${annotation_type}    ${count}=3
    [Documentation]    Add the same annotation type multiple times at distinct locations in the image viewer.

    FOR    ${index}    IN RANGE    ${count}
        ${x_offset}    ${y_offset}    Get Annotation Offsets    ${index}
        Add Annotation    ${annotation_type}    ${x_offset}    ${y_offset}
    END

Add Text To Image
    [Arguments]    ${x_offset}=0    ${y_offset}=0
    ${center_x}    ${center_y}    Find Center point
    ${center_x}=    Evaluate    int(${center_x} + ${x_offset})
    ${center_y}=    Evaluate    int(${center_y} + ${y_offset})
    AutoItLibrary.Mouse Click    left    ${center_x}    ${center_y}
    Sleep    0.5
    Send    This is a text annotation
    Sleep    0.5

Add Freehand Annotation
    [Arguments]    ${x_offset}=0    ${y_offset}=0
    Sleep    1s
    Click    ${freehand_annotation_button_xpath}
    Sleep    1s
    ${start_x}    ${start_y}    ${end_x}    ${end_y}    
    ...    ${start_x1}    ${start_y1}    ${end_x1}    ${end_y1}    Get Current Location Of Image Viewer Polygon
    ${start_x}=    Evaluate    int(${start_x} + ${x_offset})
    ${start_y}=    Evaluate    int(${start_y} + ${y_offset})
    ${end_x}=      Evaluate    int(${end_x} + ${x_offset})
    ${end_y}=      Evaluate    int(${end_y} + ${y_offset})
    ${start_x1}=   Evaluate    int(${start_x1} + ${x_offset})
    ${start_y1}=   Evaluate    int(${start_y1} + ${y_offset})
    ${end_x1}=     Evaluate    int(${end_x1} + ${x_offset})
    ${end_y1}=     Evaluate    int(${end_y1} + ${y_offset})
    AutoItLibrary.Mouse Move    ${start_x}    ${start_y}
    Sleep    0.2
    AutoItLibrary.Mouse Down    left
    AutoItLibrary.Mouse Move    ${end_x}    ${end_y}    4
    AutoItLibrary.Mouse Move    ${start_x1}    ${start_y1}    4

    ${jx}=    Evaluate    ${start_x1} + 15
    ${jy}=    Evaluate    ${start_y1} - 10
    AutoItLibrary.Mouse Move    ${jx}    ${jy}    3

    ${jx2}=   Evaluate    ${jx} + 10
    ${jy2}=   Evaluate    ${jy} + 8
    AutoItLibrary.Mouse Move    ${jx2}    ${jy2}    3

    AutoItLibrary.Mouse Up    left
    Sleep    1s
    Click    ${freehand_annotation_button_xpath}
    Sleep    1s

Add Text Annotation
    [Arguments]    ${text_annotation_message}    ${x_offset}=0    ${y_offset}=0

    Sleep    1s
    Click    ${text_annotation_button_xpath}
    Sleep    1s
    Add Text To Image    ${x_offset}    ${y_offset}
    Sleep    1s
    ${result}=    Win Exists    Annotation Properties    ${EMPTY}
    Run Keyword If    '${result}'=='1'    set text to textbox    //*[@AutomationId="AnnProps_Txt_TextContent"]    ${text_annotation_message}
    Run Keyword If    '${result}'=='1'    Click    //*[@AutomationId="AnnProps_Btn_Apply"]
    Sleep    1s

Add Multiple Freehand Annotations
    [Arguments]    ${count}=3
    [Documentation]    Add multiple freehand annotations at distinct locations in the image viewer.
    FOR    ${index}    IN RANGE    ${count}
        ${x_offset}    ${y_offset}    Get Annotation Offsets    ${index}
        Add Freehand Annotation    ${x_offset}    ${y_offset}
    END

Add Multiple Text Annotations
    [Arguments]    ${count}=3    ${text_prefix}=Text Annotation
    [Documentation]    Add multiple text annotations at distinct locations in the image viewer.
    FOR    ${index}    IN RANGE    ${count}
        ${x_offset}    ${y_offset}    Get Annotation Offsets    ${index}
        ${item_number}=    Evaluate    ${index} + 1
        Add Text Annotation    ${text_prefix} ${item_number}    ${x_offset}    ${y_offset}
    END

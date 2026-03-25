*** Settings ***
Library           FlaUILibrary
Library           ../lib/image_comparator.py
Library           ../lib/ironpy_remote_client.py
Library           OperatingSystem
Library           String
Library           Collections
Library           AutoItLibrary
Resource          ../resources/login.resource
Resource          ../resources/General.resource
Resource          ../resources/Annotations.resource

*** Variables ***
# ─────────────────── Import / Export ───────────────────

${INPUT_FILE_DIALOG_XPATH}              /Window/Window/ComboBox[1]/Edit

# ─────────────────── Image Viewer Core ───────────────────

${window_XPATH}                    /Window[@AutomationId="FoxRTProMainWindow"]
${IMAGE_VIEWER_XPATH}    /Window/Custom/Pane[@AutomationId="ImageScrollViewer"]    
${IMAGE_NAME_XPATH}
${CLOSE_IMAGEVIEWER_BUTTON_XPATH}
${autoBNC_menu_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Pane/Button[@AutomationId="Main_Btn_AutoBnC"]
${RESET_VIEW_BUTTON_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Button[@AutomationId="Main_Btn_ResetView"]

# ─────────────────── Paths ───────────────────

${test_data}           ${CURDIR}\\..\\test_Images\\
${expected_image}      ${CURDIR}\\..\\Expected\\
${actual_image}        ${CURDIR}\\..\\Actual\\
${COMPARISON_IMAGE}    ${CURDIR}\\..\\Comparison\\
*** Keywords ***

#─────────────────── Image Viewer Filters ───────────────────

Apply Auto Best BNC
    Focus    ${window_XPATH}
    Click    ${autoBNC_menu_xpath}

# ─────────────────── Image Viewer coordinates ───────────────────

Get Current Location Of Image Viewer
    ${rectangle_str}=    Get Rectangle Bounding From Element    ${IMAGE_VIEWER_XPATH}    BoundingRectangle
    Log    Element BoundingRectangle: ${rectangle_str}

    ${x}=        Get From List    ${rectangle_str}    0
    ${y}=        Get From List    ${rectangle_str}    1
    ${width}=    Get From List    ${rectangle_str}    2
    ${height}=   Get From List    ${rectangle_str}    3

    Log    X coordinate: ${x}
    Log    Y coordinate: ${y}
    Log    Width: ${width}
    Log    Height: ${height}

    ${start_x}=    Evaluate    int(${x} + ${width} / 2)
    ${start_y}=    Evaluate    int(${y} + ${height} / 2)
    ${end_x}=      Evaluate    ${start_x} + 100
    ${end_y}=      Evaluate    ${start_y} + 100

    RETURN    ${start_x}    ${start_y}    ${end_x}    ${end_y}

# ───────────────────ScreenShot and Image Comparison ───────────────────

Take window Screenshot
    [Arguments]    ${filename}

    ${screenshot_path}=    Take Screenshot    ${window_XPATH}
    Log    Screenshot saved to (temporary): ${screenshot_path}

    ${dest}=    Set Variable    ${actual_image}${filename}
    Create Directory    ${actual_image}
    Move File    ${screenshot_path}    ${dest}

    Log    Screenshot moved to: ${dest}
    RETURN    ${dest}

Take Actual Screenshot
    [Arguments]    ${filename}

    ${screenshot_path}=    Take Screenshot    ${IMAGE_VIEWER_XPATH}
    Log    Screenshot saved to (temporary): ${screenshot_path}

    ${dest}=    Set Variable    ${actual_image}${filename}
    Create Directory    ${actual_image}
    Move File    ${screenshot_path}    ${dest}

    Log    Screenshot moved to: ${dest}
    RETURN    ${dest}

Compare Result Images
    [Arguments]    ${expected_image_path}    ${actual_image_path}

    ${expected_full}=    Set Variable    ${expected_image}${expected_image_path}
    ${actual_full}=      Set Variable    ${actual_image}${actual_image_path}

    Log    Comparing ${expected_full} with ${actual_full}

    ${result}=    Compare Images    ${expected_full}    ${actual_full}
    Should Be True    ${result}
    ...    Images do not match: ${expected_full} and ${actual_full}

Take WindowScreenshot for Comparison
    [Arguments]    ${filename}

    ${screenshot_path}=    Take Screenshot    ${window_XPATH}
    ${dest}=    Set Variable    ${actual_image}${filename}

    Create Directory    ${actual_image}
    Move File    ${screenshot_path}    ${dest}

Take Screenshot for Comparison
    [Arguments]    ${filename}

    ${screenshot_path}=    Take Screenshot    ${IMAGE_VIEWER_XPATH}
    ${dest}=    Set Variable    ${actual_image}${filename}

    Create Directory    ${actual_image}
    Move File    ${screenshot_path}    ${dest}

Compare Result Images for Comparison
    [Arguments]    ${expected_image_path}    ${actual_image_path}

    ${expected_full}=    Set Variable    ${expected_image}${expected_image_path}
    ${actual_full}=      Set Variable    ${actual_image}${actual_image_path}

    ${result}=    Compare Images    ${expected_full}    ${actual_full}
    Should Be True    ${result}

Compare Result Images for Comparison as False
    [Arguments]    ${expected_image_path}    ${actual_image_path}

    ${expected_full}=    Set Variable    ${expected_image}${expected_image_path}
    ${actual_full}=      Set Variable    ${actual_image}${actual_image_path}

    ${result}=    Compare Images    ${expected_full}    ${actual_full}
    Should Not Be True   ${result}

#─────────────────── Viewer Validation ───────────────────

Verify Image Viewer Is Empty
    Element Should Be Enabled    ${IMAGE_NAME_XPATH}
    Log    Image Viewer is empty as expected.

Verify Image Viewer Is Not Empty
    Element Should Be Disabled    ${IMAGE_NAME_XPATH}
    Log    Image Viewer is not empty as expected.

Close Image Viewer
    Wait Until Element Is Enabled    ${CLOSE_IMAGEVIEWER_BUTTON_XPATH}
    Click    ${CLOSE_IMAGEVIEWER_BUTTON_XPATH}

#─────────────────── Viewer Operations ───────────────────


Crop Image
    [Arguments]    ${X}    ${Y}    ${w}    ${H}

    Set Text To Textbox    ${X_XPATH}    ${X}
    Set Text To Textbox    ${Y_XPATH}    ${Y}
    Set Text To Textbox    ${WIDTH_XPATH}    ${w}
    Set Text To Textbox    ${HEIGHT_XPATH}    ${H}

    Click    ${CROP_OK_BUTTON_XPATH}
    Sleep    1


Click Calibrate Button
    [Arguments]    ${calibrate_value}    ${measurementsUnits}

    ${start_x}    ${start_y}    ${end_x}    ${end_y}    ${start_x1}    ${start_y1}    ${end_x1}    ${end_y1}    Get Current Location Of Image Viewer Polygon

    Mouse Click    Right    ${start_x}    ${start_y}
    Sleep    1
    Click    ${CALIBRATE_TOOL_XPATH}
    Sleep    1
    Click    ${CALIBRATE_EDIT_XPATH}
    Sleep    1
    Send    {DELETE}
    Sleep    1
    Send    ${calibrate_value}
    Sleep    1

    Select Combobox Item By Name    /Window/ComboBox[@AutomationId="cmbMeasurementUnits"]    ${measurementsUnits}

    Sleep    1
    Click    ${CALIBRATE_OK_BUTTON_XPATH}
    Sleep    1

Reset View
    Click    ${window_XPATH}
    Sleep    0.2s
    Click    ${RESET_VIEW_BUTTON_XPATH}
    Sleep    0.2s

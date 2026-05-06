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
*** Variables ***
# ─────────────────── Import / Export ───────────────────

${INPUT_FILE_DIALOG_XPATH}              /Window/Window/ComboBox[1]/Edit

# ─────────────────── Image Viewer Core ───────────────────

${window_XPATH}                    /Window[@AutomationId="FoxRTProMainWindow"]
${IMAGE_VIEWER_XPATH}    /Window/Custom/Pane[@AutomationId="ImageScrollViewer"]
${IMAGE_VIEWER_XPATH_WITH_SCALES}    /Window[@AutomationId="FoxRTProMainWindow"]/Custom[@AutomationId="PrimaryViewer"]
${IMAGE_NAME_XPATH}
${CLOSE_IMAGEVIEWER_BUTTON_XPATH}
${autoBNC_menu_xpath}    /Window[@AutomationId="FoxRTProMainWindow"]/Pane/Button[@AutomationId="Main_Btn_AutoBnC"]
${RESET_VIEW_BUTTON_XPATH}    /Window[@AutomationId="FoxRTProMainWindow"]/Button[@AutomationId="Main_Btn_ResetView"]

# ─────────────────── Paths ───────────────────

${test_data}           ${CURDIR}\\..\\Test_Data\\
${expected_image}      ${CURDIR}\\..\\Expected\\
${actual_image}        ${CURDIR}\\..\\Actual\\
${COMPARISON_IMAGE}    ${CURDIR}\\..\\Comparison\\
${Actual_Image_Exports}       ${CURDIR}\\..\\Exports\\Image Exports\\Actual\\
${Expected_Image_Exports}    ${CURDIR}\\..\\Exports\\Image Exports\\Expected\\
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
    [Arguments]    ${filename}    ${xpath}=${IMAGE_VIEWER_XPATH}

    Sleep    0.2s    # Ensure any UI updates are rendered before taking screenshot
    ${screenshot_path}=    Take Screenshot    ${xpath}
    Log    Screenshot saved to (temporary): ${screenshot_path}

    ${dest}=    Set Variable    ${actual_image}${filename}
    Create Directory    ${actual_image}
    Move File    ${screenshot_path}    ${dest}

    Log    Screenshot moved to: ${dest}
    RETURN    ${dest}

Compare Result Images
    [Arguments]    ${expected_image_path}    ${actual_image_path}    ${required_match_percentage}=98    ${should_match}=True
    [Documentation]    Compare two images.
    ...    When ${should_match}=True (default), pass if match percentage is >= required percentage.
    ...    When ${should_match}=False, pass if match percentage is < required percentage (images must NOT match).

    ${required_match_percentage}=    Convert To Number    ${required_match_percentage}
    Should Be True
    ...    0 <= ${required_match_percentage} <= 100
    ...    Required match percentage must be between 0 and 100. Received: ${required_match_percentage}

    ${expected_full}=    Resolve Compare File Path    ${expected_image}    ${expected_image_path}
    ${actual_full}=      Resolve Compare File Path    ${actual_image}    ${actual_image_path}

    File Should Exist    ${expected_full}
    File Should Exist    ${actual_full}
    Log    Comparing ${expected_full} with ${actual_full}

    ${match_percentage}=    File Match Percentage    ${expected_full}    ${actual_full}
    ${match_percentage}=    Evaluate    round(float($match_percentage), 4)
    Log    Image match percentage: ${match_percentage}%

    IF    ${should_match}
        Should Be True
        ...    ${match_percentage} >= ${required_match_percentage}
        ...    Match percentage ${match_percentage}% is below required ${required_match_percentage}% for images: ${expected_full} vs ${actual_full}
    ELSE
        Should Be True
        ...    ${match_percentage} < ${required_match_percentage}
        ...    Match percentage ${match_percentage}% is at/above ${required_match_percentage}% but images were expected NOT to match: ${expected_full} vs ${actual_full}
    END
    RETURN    ${match_percentage}

Compare Result Files
    [Arguments]    ${expected_file_path}    ${actual_file_path}    ${required_match_percentage}=100
    [Documentation]    Compare two files and pass if match percentage is >= required percentage.

    ${required_match_percentage}=    Convert To Number    ${required_match_percentage}
    Should Be True
    ...    0 <= ${required_match_percentage} <= 100
    ...    Required match percentage must be between 0 and 100. Received: ${required_match_percentage}

    ${expected_full}=    Resolve Compare File Path    ${expected_image}    ${expected_file_path}
    ${actual_full}=      Resolve Compare File Path    ${actual_image}    ${actual_file_path}

    File Should Exist    ${expected_full}
    File Should Exist    ${actual_full}
    Log    Comparing ${expected_full} with ${actual_full}

    ${match_percentage}=    File Match Percentage    ${expected_full}    ${actual_full}
    ${match_percentage}=    Evaluate    round(float($match_percentage), 4)
    Log    File match percentage: ${match_percentage}%

    Should Be True
    ...    ${match_percentage} >= ${required_match_percentage}
    ...    Match percentage ${match_percentage}% is below required ${required_match_percentage}% for files: ${expected_full} vs ${actual_full}
    RETURN    ${match_percentage}

Resolve Compare File Path
    [Arguments]    ${base_dir}    ${file_path}
    ${resolved}=    Evaluate    __import__('os').path.normpath($file_path if __import__('os').path.isabs($file_path) else __import__('os').path.join($base_dir, $file_path))
    RETURN    ${resolved}

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

Verify Control Exists in Image Viewer
    [Arguments]    ${control_xpath}    ${timeout}=1
    ${result}=    Run Keyword And Return Status
    ...    Wait Until Element Exist    ${control_xpath}    ${timeout}
    Should Be True    ${result}    Control should exist in Image Viewer: ${control_xpath}
    Log    Control exists in Image Viewer as expected.
    RETURN    ${result}

Verify Control Not Exists in Image Viewer
    [Arguments]    ${control_xpath}    ${timeout}=1

    ${result}=    Run Keyword And Return Status
    ...    Wait Until Element Exist    ${control_xpath}    ${timeout}
    Should Not Be True    ${result}    Control should not exist in Image Viewer: ${control_xpath}
    Log    Control does not exist in Image Viewer as expected.
    RETURN    ${result}

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

Reset View
    Focus    ${window_XPATH}
    Sleep    0.2s
    Click    ${RESET_VIEW_BUTTON_XPATH}
    Sleep    0.2s

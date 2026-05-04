*** Settings ***
Library           FlaUILibrary    screenshot_dir=${CURDIR}\\..\\Actual\\test.png
Library           Process
Library           ../lib/image_comparator.py
Library           ../lib/ironpy_remote_client.py
Library           AutoItLibrary
Variables         ../lib/app_version.py
*** Variables ***

# ─────────────────── Application Info ───────────────────
# ${APP_PATH}, ${APPLICATION_VERSION} and ${APPLICATION_VERSION_in_loginscreen}
# are resolved at suite load by lib/app_version.py from the installed EXE's
# FileVersion — no manual update needed after a build upgrade.
${APPLICATION_NAME}              FoXpert
${TECH_SUPPORT_EMAIL}            support@mindfox.in
${INVALID_WARNING_TEXT}          Invalid username or password

# ─────────────────── Login Window ───────────────────
${LOGIN_WINDOW_XPATH}            /Window[@Name="FoXpert RT - Login"]
${LOGIN_CLOSE_BUTTON_XPATH}      /Window[@Name="FoXpert RT - Login"]/Button[@AutomationId="Login_Btn_Close"]
${USER_NAME_XPATH}               /Window/Edit[@AutomationId="Login_Txt_Username"]
${PASSWORD_XPATH}                /Window/Edit[@AutomationId="Login_Pwd_Password"]
${LOGIN_BUTTON_XPATH}            /Window[@Name="FoXpert RT - Login"]/Button[@AutomationId="Login_Btn_Login"]
${INVALID_LOGIN_WARNING_XPATH}   /Window[@Name="FoXpert RT - Login"]/Text[@Name="Invalid username or password"]
${APP_VERSION_TEXT_XPATH}        //*[@AutomationId="VersionText"]
${APP_VERSION_loginscreen_TEXT_XPATH}    /Window/Text[@AutomationId="VersionText"]
${User_Name_LABEL_XPATH}         /Window[@Name="FoXpert RT - Login"]/Text[@Name="USERNAME"]
${Sales_Id_TEXT_XPATH}           //*[@Name="Sales: sales@mindfox.in"]
${WebSite_TEXT_XPATH}            //*[@Name="Web: www.mindfox.in"]

# ─────────────────── Main Window ───────────────────
${MAIN_WINDOW_XPATH}             /Window[@AutomationId="FoxRTProMainWindow"]
${MAIN_CLOSE_BTN_XPATH}          /Window[@AutomationId="FoxRTProMainWindow"]/Button[@AutomationId="Main_Btn_Close"]
${MAIN_MINIMIZE_BTN_XPATH}       /Window[@AutomationId="FoxRTProMainWindow"]/Button[@AutomationId="Main_Btn_Minimize"]
${MAIN_RESTORE_BTN_XPATH}        /Window[@AutomationId="FoxRTProMainWindow"]/Button[@AutomationId="Main_Btn_MaximizeRestore"]
${MAIN_MAXIMIZE_BTN_XPATH}       /Window[@AutomationId="FoxRTProMainWindow"]/Button[@AutomationId="Main_Btn_MaximizeRestore"]
${About_close_btn_XPATH}         //*[@AutomationId="About_Btn_CloseAbout"]
${ALREADY_RUNNING_WARNING_XPATH}    //Text[contains(@Name,"FoXpert RT is already running.")]
${ALREADY_RUNNING_WARNING_OK_BUTTON_XPATH}    //Window[@Name="FoXpert RT"]/Button[@Name="OK"]
${ALREADY_RUNNING_WARNING_OK_BUTTON_FALLBACK_XPATH}    //Window/Button[@Name="OK"]
${APP_PID}                       NONE

*** Keywords ***

# ─────────────────── Application Startup ───────────────────

Open FoxViewerDesktop Application
    ${pid}=    Launch Application    ${APP_PATH}
    Attach Application By Pid        ${pid}
    Set Suite Variable    ${APP_PID}    ${pid}
    Wait Until Element Is Enabled    ${LOGIN_BUTTON_XPATH}    5
    Sleep    1s
    ${result}=    Win Exists    FoXpert RT    OK
    Run Keyword If    ${result}==1    Click    ${ALREADY_RUNNING_WARNING_OK_BUTTON_XPATH}
    Sleep    0.2s       
    RETURN    ${pid}
    
    
Close FoxViewerDesktop Application
    [Arguments]    ${pid}
    Close Application    ${pid}

# ─────────────────── Login Actions ───────────────────
Login To FoxViewerDesktop
    [Arguments]    ${username}    ${password}
    Wait Until Element Exist          ${LOGIN_WINDOW_XPATH}    5
    Set Text To Textbox    ${USER_NAME_XPATH}    ${username}
    Set Text To Textbox    ${PASSWORD_XPATH}     ${password}
    Click                 ${LOGIN_BUTTON_XPATH}
    ${main_window_exists}=    Run Keyword And Return Status
    ...    Wait Until Element Exist    ${MAIN_WINDOW_XPATH}    5
    IF    ${main_window_exists}
        Focus    ${MAIN_WINDOW_XPATH}
        Resize FoxRT Application Window    10    10    1850    1000
    END

Verify Invalid Warning Text
    ${warning}=    Get Name From Element    ${INVALID_LOGIN_WARNING_XPATH}
    Should Be Equal As Strings    ${warning}    ${INVALID_WARNING_TEXT}

Click Login Close Button
    Wait Until Element Exist    ${LOGIN_WINDOW_XPATH}    2
    Wait Until Element Exist    ${LOGIN_CLOSE_BUTTON_XPATH}    2
    Invoke Button    ${LOGIN_CLOSE_BUTTON_XPATH} 

Login Window Should Be Closed
    ${closed}=    Run Keyword And Return Status    Wait Until Element Does Not Exist    ${LOGIN_WINDOW_XPATH}    5
    Should Be True    ${closed}    Login window should be closed after clicking CLOSE

# ─────────────────── Version Verification ───────────────────

App Version Text Should Present in login screen
    Wait Until Element Exist    ${LOGIN_WINDOW_XPATH}    2
    Wait Until Element Is Enabled    ${LOGIN_WINDOW_XPATH}    2 
    ${version}=    Get Name From Element    ${APP_VERSION_loginscreen_TEXT_XPATH}
    Should Be Equal As Strings    ${version}    ${APPLICATION_VERSION_in_loginscreen}

App Version Text Should Present
    Wait Until Element Exist    ${About_close_btn_XPATH}    2              
    Wait Until Element Is Enabled    ${About_close_btn_XPATH}    2
    ${version}=    Get Name From Element    ${APP_VERSION_TEXT_XPATH}
    Should Be Equal As Strings    ${version}    ${APPLICATION_VERSION}

Assert the Version
    ${version}=    Get Name From Element    ${APP_VERSION_TEXT_XPATH}
    Log    Found version: ${version}
    Should Be Equal As Strings    ${version}    ${APPLICATION_VERSION}

Sales Id Text Should Present
    Wait Until Element Exist    ${About_close_btn_XPATH}    2              
    Wait Until Element Is Enabled    ${About_close_btn_XPATH}    2
    ${version}=    Get Name From Element    ${Sales_Id_TEXT_XPATH}
    Should Contain    ${version}    sales@mindfox.in

WebSite Text Should Present
    Wait Until Element Exist    ${About_close_btn_XPATH}    2              
    Wait Until Element Is Enabled    ${About_close_btn_XPATH}    2
    ${version}=    Get Name From Element    ${WebSite_TEXT_XPATH}
    Should Contain    ${version}    www.mindfox.in

# ─────────────────── Main Window Verification ───────────────────

Main Window Should Be Open
    Wait Until Keyword Succeeds    10x    1s    Element Should Exist    ${MAIN_WINDOW_XPATH}

Main Window Should Be Closed
    Wait Until Element Does Not Exist    ${MAIN_WINDOW_XPATH}    5

Click Main Window Close Button
    Invoke Button    ${MAIN_CLOSE_BTN_XPATH}
    Sleep    1
    Invoke Button    /Window[contains(@Name, '— Expert in RT Analysis')]/Window[contains(@Name, 'FoXpert')]/Button[@Name="Yes"]

# ─────────────────── Window State Validation ───────────────────

Verify Window Is Maximized
    ${is_maximized}=    Run Keyword And Return Status
    ...    Wait Until Element Exist    ${MAIN_RESTORE_BTN_XPATH}    2
    RETURN    ${is_maximized}

Verify Window Is Minimized
    ${is_minimized}=    Run Keyword And Return Status
    ...    Wait Until Element Exist    ${MAIN_WINDOW_XPATH}    2
    RETURN    ${is_minimized}

Verify Application Is Closed
    [Arguments]    ${timeout}=5s
    ${closed}=    Run Keyword And Return Status    
    ...    Wait Until Element Does Not Exist    ${MAIN_WINDOW_XPATH}    ${timeout}
    RETURN    ${closed}

Assert Window Is Minimized
    ${is_minimized}=    Verify Window Is Minimized
    Should Be True    ${is_minimized}    Window should be minimized but it's not.

Assert Window Is Maximized
    ${is_maximized}=    Verify Window Is Maximized
    Should Be True    ${is_maximized}    Window should be maximized but it's not.

Assert Window Is Not Maximized
    ${is_maximized}=    Verify Window Is Maximized
    Should Not Be True    ${is_maximized}    Window should not be maximized but it is.

Assert Application Is Closed
    ${is_visible}=    Verify Application Is Closed
    Should Not Be True    ${is_visible}    Application window is still visible after close.

Restore FoxRT Window
    ${is_maximized}=    Verify Window Is Maximized
    IF    ${is_maximized}
        Invoke Button    ${MAIN_RESTORE_BTN_XPATH}
    END

Maximize FoxRT Window
    ${is_maximized}=    Verify Window Is Maximized
    IF    not ${is_maximized}
        ${has_maximize}=    Run Keyword And Return Status
        ...    Wait Until Element Exist    ${MAIN_MAXIMIZE_BTN_XPATH}    2
        IF    ${has_maximize}
            Invoke Button    ${MAIN_MAXIMIZE_BTN_XPATH}
        ELSE
            Focus    ${MAIN_WINDOW_XPATH}
            Press Keys    ${MAIN_WINDOW_XPATH}    WIN+UP

        END
    END
    
Minimize FoxRTWindow
    ${has_minimize}=    Run Keyword And Return Status
    ...    Wait Until Element Exist    ${MAIN_MINIMIZE_BTN_XPATH}    2
    IF    ${has_minimize}
        Invoke Button    ${MAIN_MINIMIZE_BTN_XPATH}
    ELSE
        Focus    ${MAIN_WINDOW_XPATH}
        Press Keys    ${MAIN_WINDOW_XPATH}    WIN+DOWN
    END

Resize FoxRT Application Window
    [Arguments]    ${x}=0    ${y}=0    ${width}=1280    ${height}=800
    Restore FoxRT Window
    Focus    ${MAIN_WINDOW_XPATH}
    Win Move    [ACTIVE]    ${EMPTY}    ${x}    ${y}    ${width}    ${height}
    Sleep    1s

Close FoxRT Application Window
    ${has_close}=    Run Keyword And Return Status
    ...    Wait Until Element Exist    ${MAIN_CLOSE_BTN_XPATH}    3
    Should Be True    ${has_close}    Close button not found.
    Invoke Button    ${MAIN_CLOSE_BTN_XPATH}
    Sleep    1s
    Invoke Button    /Window/Window/Button[@Name="Yes"]



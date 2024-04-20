@echo off
SETLOCAL EnableDelayedExpansion

REM Check if Playwright is installed
python -m pip list | findstr /C:"playwright" > nul
IF %ERRORLEVEL% EQU 0 (
    echo Playwright is already installed.
) ELSE (
    echo Installing Playwright...
    pip install --trusted-host pypi.org --trusted-host files.pythonhosted.org playwright
)

REM Check if Chromium is installed by attempting to run it with playwright
python -m playwright run --browser=chromium "echo Chromium is installed." > nul 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo Chromium is already installed.
) ELSE (
    echo Installing Chromium...
    python -m playwright install chromium
)

echo Installation checks completed!

REM Launching Playwright Codegen with Chromium
echo Launching Playwright Codegen with Chromium...
python -m playwright codegen --browser=chromium
echo Codegen is running...

pause
ENDLOCAL

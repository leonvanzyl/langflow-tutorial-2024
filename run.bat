@echo off
REM Check if the venv folder exists
IF NOT EXIST "venv\Scripts\activate" (
    echo Creating virtual environment...
    python -m venv venv
)

REM Activate the virtual environment
call venv\Scripts\activate

REM Check if langflow is installed
pip show langflow >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo Installing langflow...
    python -m pip install langflow --pre
) ELSE (
    echo Updating langflow...
    python -m pip install langflow --pre --upgrade
)

REM Start langflow
langflow run

REM Keep the window open
pause

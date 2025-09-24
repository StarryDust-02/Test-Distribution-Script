@echo off
echo Checking Python installation...

REM Check for Python 3
python --version >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    python3 --version >nul 2>&1
    if %ERRORLEVEL% NEQ 0 (
        echo Python 3 is not installed. Please install Python 3.
        pause
        exit /b 1
    ) else (
        set PYTHON=python3
    )
) else (
    set PYTHON=python
)

REM Check if virtual environment exists
if not exist "venv\Scripts\activate.bat" (
    echo Creating virtual environment...
    %PYTHON% -m venv venv
)

REM Activate virtual environment
call venv\Scripts\activate.bat

echo Running distribute.py...
python distribute.py

pause

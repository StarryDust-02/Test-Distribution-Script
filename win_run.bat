@echo off
echo Checking Python 3 installation...

REM Check for Python 3 using version info
python --version 2>nul | findstr "Python 3" >nul
if %errorlevel% neq 0 (
    python3 --version 2>nul | findstr "Python 3" >nul
    if %errorlevel% neq 0 (
        echo Python 3 not found. Please install Python 3.
        pause
        exit /b
    ) else (
        set PYTHON=python3
    )
) else (
    set PYTHON=python
)

echo Running test distribution...
%PYTHON% distribute.py

pause

@echo off

echo Checking Python installation...
python --version
if %errorlevel% neq 0 (
    echo Python not found. Please install Python from the Microsoft Store.
    pause
    exit /b
)

echo Running test distribution...
python distribute.py

pause

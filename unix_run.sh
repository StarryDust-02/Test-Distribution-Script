#!/bin/bash
# Shell script to run distribute.py safely with Python 3

echo "Checking Python installation..."

# Try python3 first
if command -v python3 &>/dev/null; then
    PYTHON=python3
# Fallback: check if python points to Python 3
elif command -v python &>/dev/null && python -V 2>&1 | grep -q "Python 3"; then
    PYTHON=python
else
    echo "Error: Python 3 is not installed on this system."
    echo "Please install Python 3 from https://www.python.org/downloads/"
    exit 1
fi

echo "Running test distribution with $PYTHON ..."
$PYTHON distribute.py

#!/bin/bash
# Shell script to run distributor.py in a virtual environment

echo "Checking Python installation..."

# Try python3 first
if command -v python3 &>/dev/null; then
    PYTHON=python3
# Fallback: check if python points to Python 3
elif command -v python &>/dev/null && python -V 2>&1 | grep -q "Python 3"; then
    PYTHON=python
else
    echo "Error: Python 3 is not installed."
    echo "Please install Python 3 from https://www.python.org/downloads/"
    exit 1
fi

# Check if virtual environment exists
if [ ! -d "venv" ]; then
    echo "Creating virtual environment..."
    $PYTHON -m venv venv
fi

# Activate virtual environment
source venv/bin/activate

echo "Running distribute.py..."
python distribute.py

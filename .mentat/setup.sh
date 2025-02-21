#!/bin/bash

# Try to create virtual environment
echo "Creating virtual environment..."
if ! python3 -m venv .venv; then
    echo "Error: Failed to create virtual environment. Please ensure python3-venv is installed:"
    echo "  On Debian/Ubuntu: apt-get install python3-venv"
    echo "  On RHEL/CentOS: yum install python3-venv"
    echo "  On macOS: brew install python3"
    exit 1
fi

# Verify virtual environment was created
if [ ! -f ".venv/bin/activate" ]; then
    echo "Error: Virtual environment creation failed"
    exit 1
fi

# Activate virtual environment
echo "Activating virtual environment..."
source .venv/bin/activate

# Verify activation worked
if [ -z "$VIRTUAL_ENV" ]; then
    echo "Error: Virtual environment activation failed"
    exit 1
fi

echo "Installing packages..."

# Upgrade pip
python3 -m pip install --upgrade pip

# Install dependencies if requirements.txt exists
if [ -f "requirements.txt" ]; then
    python3 -m pip install -r requirements.txt
fi

# Install dev dependencies if dev-requirements.txt exists
if [ -f "dev-requirements.txt" ]; then
    python3 -m pip install -r dev-requirements.txt
fi

# Install common development tools
python3 -m pip install black ruff mypy isort pytest

echo "Setup completed successfully!"

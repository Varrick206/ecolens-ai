#!/bin/bash

# Check if we can create a virtual environment
if ! python3 -m venv --help &> /dev/null; then
    echo "Error: python3-venv is not installed. Please install it with:"
    echo "  On Debian/Ubuntu: apt-get install python3-venv"
    echo "  On RHEL/CentOS: yum install python3-venv"
    echo "  On macOS: brew install python3"
    exit 1
fi

# Create virtual environment if it doesn't exist
if [ ! -d ".venv" ]; then
    python3 -m venv .venv
fi

# Activate virtual environment
source .venv/bin/activate

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

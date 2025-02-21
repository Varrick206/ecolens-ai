#!/bin/bash

# Create virtual environment if it doesn't exist
python3 -m venv .venv

# Activate virtual environment
source .venv/bin/activate

# Upgrade pip
pip install --upgrade pip

# Install dependencies if requirements.txt exists
if [ -f "requirements.txt" ]; then
    pip install -r requirements.txt
fi

# Install dev dependencies if dev-requirements.txt exists
if [ -f "dev-requirements.txt" ]; then
    pip install -r dev-requirements.txt
fi

# Install common development tools
pip install black ruff mypy isort pytest

#!/bin/bash

# Add local bin to PATH
export PATH="$HOME/.local/bin:$PATH"

# Check if there are any Python files
if ! find . -name "*.py" -not -path "./.venv/*" | grep -q .; then
    echo "No Python files found. Skipping checks."
    exit 0
fi

# Format code
python3 -m black .
python3 -m isort .

# Run linting with auto-fix
python3 -m ruff check --fix .

# Type checking
python3 -m mypy .

#!/bin/bash

# Activate virtual environment
source .venv/bin/activate

# Format code
black .
isort .

# Run linting with auto-fix
ruff check --fix .

# Type checking
mypy .

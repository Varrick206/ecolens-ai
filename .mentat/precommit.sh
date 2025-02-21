#!/bin/bash

# Format code
python3 -m black .
python3 -m isort .

# Run linting with auto-fix
python3 -m ruff check --fix .

# Type checking
python3 -m mypy .

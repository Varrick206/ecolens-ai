#!/bin/bash

# Add local bin to PATH
export PATH="$HOME/.local/bin:$PATH"

echo "Installing packages..."

# Upgrade pip
python3 -m pip install --upgrade pip --user

# Install dependencies if requirements.txt exists
if [ -f "requirements.txt" ]; then
    python3 -m pip install -r requirements.txt --user
fi

# Install dev dependencies if dev-requirements.txt exists
if [ -f "dev-requirements.txt" ]; then
    python3 -m pip install -r dev-requirements.txt --user
fi

# Install common development tools
python3 -m pip install black ruff mypy isort pytest --user

echo "Setup completed successfully!"

echo "Note: For local development, it's recommended to use a virtual environment:"
echo "  python3 -m venv .venv"
echo "  source .venv/bin/activate  # On Unix/macOS"
echo "  .venv\Scripts\activate     # On Windows"

# Create an example Python file to verify tools work
cat > example.py << 'EOF'
def hello():
    print("Hello, World!")
EOF

#!/bin/bash

# Check if the venv folder exists
if [ ! -d "venv" ]; then
    echo "Creating virtual environment..."
    python3 -m venv venv
fi

# Activate the virtual environment
source venv/bin/activate

# Check if langflow is installed
if ! pip show langflow > /dev/null 2>&1; then
    echo "Installing langflow..."
    python -m pip install langflow
else
    echo "Updating langflow..."
    python -m pip install langflow --upgrade
fi

# Start langflow
langflow run

# Keep the terminal open (only needed if running from a double-clickable script)
exec $SHELL

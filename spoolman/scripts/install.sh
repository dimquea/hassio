#!/bin/sh

# ANSI color codes
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
NC='\033[0m' # No Color

# CD to project root if we're in the scripts dir
current_dir=$(pwd)
if [ "$(basename "$current_dir")" = "scripts" ]; then
    cd ..
fi

#
# Install uv if not installed
#
local_uv_dir="$(pwd)/uv"
local_uv_bin="$local_uv_dir/uv"

if command -v uv &> /dev/null; then
    echo "uv found in PATH. Using system uv."
else
    if [ -x "$local_uv_bin" ]; then
        if "$local_uv_bin" --version &> /dev/null; then
            echo "Using local uv from $local_uv_dir"
            export PATH="$local_uv_dir:$PATH"
        else
            echo "Local uv found but failed to run. Installing temporary uv..."
            curl -LsSf https://astral.sh/uv/install.sh | env UV_UNMANAGED_INSTALL="$local_uv_dir" sh
            export PATH="$local_uv_dir:$PATH"
        fi
    else
        echo "Installing temporary uv..."
        curl -LsSf https://astral.sh/uv/install.sh | env UV_UNMANAGED_INSTALL="$local_uv_dir" sh
        export PATH="$local_uv_dir:$PATH"
    fi
fi

#
# Install Spoolman
#

# Install dependencies
echo -e "${GREEN}Installing Spoolman backend and its dependencies...${NC}"

uv sync --no-dev

#
# Initialize the .env file if it doesn't exist
#
if [ ! -f ".env" ]; then
    echo -e "${ORANGE}.env file not found. Creating it...${NC}"
    cp .env.example .env
fi

#
# Add execute permissions of all files in scripts dir
#
echo -e "${GREEN}Adding execute permissions to all files in scripts dir...${NC}"
chmod +x scripts/*.sh

echo -e "${GREEN}Spoolman has been installed successfully!${NC}"
echo -e "${GREEN}If you want to connect to an external database, you can edit the .env file and restart the service.${NC}"
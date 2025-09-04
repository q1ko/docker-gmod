#!/bin/bash
set -e

# Check mode (default to ttt)
MODE="${1:-ttt}"
if [[ "$MODE" != "ttt" && "$MODE" != "murder" ]]; then
    echo "Error: invalid mode. Use 'ttt' or 'murder'."
    exit 1
fi

# Temporary folder to clone repo
TMP="/tmp/docker-gmod"
rm -rf "$TMP"

# Clone repo
echo "=== Cloning repo ==="
git clone --depth 1 https://github.com/q1ko/docker-gmod.git "$TMP"

# Move into selected mode folder
cd "$TMP/$MODE" || { echo "Error: folder '$MODE' not found in repo"; exit 1; }

# Build Docker image
docker build . -t img

# Remove old container if exists
docker rm -f srv 2>/dev/null || true

# Run container
docker run -it -p 27015:27015/udp -p 27015:27015/tcp img --name srv

echo "=== $MODE server is running in container srv ==="

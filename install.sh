#!/bin/bash
# -----------------------------------------------------------------------------
# Author: Ryo Nakagami
# Revised: 2025-12-10
# Script: install.sh
# Description:
#   Installs Byobu configuration files from the repository into the user's
#   ~/.byobu directory. Ensures source and destination directories exist,
#   then copies all configuration files.
#
#   Steps:
#     1. Determine the repository root using git.
#     2. Set source and destination directories.
#     3. Print paths for user confirmation.
#     4. Check that the source directory exists.
#     5. Check that the destination directory exists.
#     6. Copy all configuration files from source to destination.
#
# Usage:
#     bash ./install.sh
#     # Installs Byobu configuration files to ~/.byobu
#
# Notes:
#   - Requires git installed.
#   - Requires cp (coreutils) installed.
#   - Requires an existing ~/.byobu directory.
# -----------------------------------------------------------------------------

# Git repository root
REPO_ROOT="$(git rev-parse --show-toplevel)"
SRC_DIR="${REPO_ROOT}/byobu_config"
DEST_DIR="${HOME}/.byobu"

echo "Repository root: ${REPO_ROOT}"
echo "Source: ${SRC_DIR}"
echo "Destination: ${DEST_DIR}"

# Source directory existence check
if [[ ! -d "$SRC_DIR" ]]; then
    echo "Error: Source directory not found: $SRC_DIR" >&2
    exit 1
fi

# check destination directory exists
if [[ ! -d "$DEST_DIR" ]]; then
    echo "Destination directory not found. Creating: $DEST_DIR"
    exit 1
fi

# Copying files/directories
echo "Copying byobu configuration..."
cp -rv "${SRC_DIR}/." "$DEST_DIR"/

echo "Done."
echo "Byobu configuration installed successfully."

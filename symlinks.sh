#!/bin/bash

# Create symlink for .agents directory
# This script creates a symlink at $HOME/.agents pointing to the .agents directory in this repo

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_DIR="$SCRIPT_DIR/.agents"
TARGET_LINK="$HOME/.agents"

# Check if .agents directory exists in repo
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Creating .agents directory in repo..."
    mkdir -p "$SOURCE_DIR"
fi

# Remove existing symlink or directory if it exists
if [ -L "$TARGET_LINK" ]; then
    echo "Removing existing symlink at $TARGET_LINK"
    rm "$TARGET_LINK"
elif [ -d "$TARGET_LINK" ]; then
    echo "Warning: $TARGET_LINK exists as a directory. Please back it up and remove it manually."
    exit 1
elif [ -f "$TARGET_LINK" ]; then
    echo "Warning: $TARGET_LINK exists as a file. Please back it up and remove it manually."
    exit 1
fi

# Create the symlink
ln -s "$SOURCE_DIR" "$TARGET_LINK"

if [ -L "$TARGET_LINK" ]; then
    echo "Successfully created symlink: $TARGET_LINK -> $SOURCE_DIR"
else
    echo "Failed to create symlink"
    exit 1
fi

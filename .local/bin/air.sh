#!/bin/bash

# Directory with the desktop files
APPLICATION_DIR="$HOME/.local/share/applications"

# Iterate through each .desktop file
for file in "$APPLICATION_DIR"/*.desktop; do
  # Make sure it's a file
  [ -f "$file" ] || continue

  # Process the file: use a temporary file for safety
  awk '{
    # If we find the section header, set a flag and skip this line
    if ($0 ~ /^\[Desktop Action Remove\]/) { inSection=1; next }
    # If currently skipping and the line starts with "[", it signals a new section,
    # so turn off the flag (and let this line be printed)
    if (inSection && $0 ~ /^\[/) { inSection=0 }
    # Only print lines when not in the section to remove
    if (!inSection) print
  }' "$file" > "$file.tmp" && mv "$file.tmp" "$file"
done

echo "Removed `Remove` sections from each AppImage desktop file."

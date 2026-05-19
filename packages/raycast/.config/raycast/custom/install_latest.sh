#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Install Latest Download
# @raycast.mode fullOutput

# Optional parameters:
# @raycast.icon 📦
# @raycast.argument1 { "type": "text", "placeholder": "-z, -k, or FILE", "optional": true }
# @raycast.argument2 { "type": "text", "placeholder": " ", "optional": true }
# @raycast.argument3 { "type": "text", "placeholder": " ", "optional": true }

# ---------------------------------------------------------------------------- #
#  Helpers
# ---------------------------------------------------------------------------- #

KEEP=false
USE_ZIP=false
FILEPATH=""

log() { echo "▸ $*"; }
ok() { echo "✅ $*"; }
warn() { echo "⚠️  $*"; }
die() {
    echo "❌ $*"
    exit 1
}

# ---------------------------------------------------------------------------- #
#  Argument parsing  (positional args Raycast passes as $1 $2 $3)
# ---------------------------------------------------------------------------- #

for arg in "$1" "$2" "$3"; do
    case "$arg" in
    -z | --zip) USE_ZIP=true ;;
    -k | --keep) KEEP=true ;;
    "") ;; # skip empty Raycast placeholders
    *)
        # Treat as a filepath if it looks like one
        if [[ "$arg" == /* || "$arg" == ~* || "$arg" == ./* ]]; then
            FILEPATH="${arg/#\~/$HOME}"
        else
            warn "Unknown argument '$arg' — ignoring."
        fi
        ;;
    esac
done

# ---------------------------------------------------------------------------- #
#  Resolve the target file
# ---------------------------------------------------------------------------- #

DOWNLOADS="$HOME/Downloads"

if [[ -n "$FILEPATH" ]]; then
    # Explicit path provided
    TARGET="$FILEPATH"
    [[ -f "$TARGET" ]] || die "File not found: $TARGET"

elif $USE_ZIP; then
    # Find newest ZIP in Downloads
    TARGET=$(find "$DOWNLOADS" -maxdepth 1 -iname "*.zip" -type f \
        -exec stat -f "%m %N" {} \; | sort -rn | head -1 | cut -d' ' -f2-)
    [[ -n "$TARGET" ]] || die "No ZIP files found in $DOWNLOADS"

else
    # Find newest DMG or ZIP in Downloads
    TARGET=$(find "$DOWNLOADS" -maxdepth 1 \( -iname "*.dmg" -o -iname "*.zip" \) -type f \
        -exec stat -f "%m %N" {} \; | sort -rn | head -1 | cut -d' ' -f2-)
    [[ -n "$TARGET" ]] || die "No DMG or ZIP files found in $DOWNLOADS"
fi

log "Target file: $TARGET"
EXT="${TARGET##*.}"
EXT="${EXT,,}" # lowercase

# ---------------------------------------------------------------------------- #
#  Install helpers
# ---------------------------------------------------------------------------- #

install_app() {
    local src="$1"
    if [[ -d "$src" ]]; then
        log "Installing $src → /Applications/"
        cp -R "$src" /Applications/ && ok "Installed $(basename "$src")"
    else
        warn "Not an .app bundle, skipping: $src"
    fi
}

install_pkg() {
    local src="$1"
    log "Running installer for $(basename "$src") …"
    sudo installer -pkg "$src" -target / && ok "Package installed: $(basename "$src")"
}

# ---------------------------------------------------------------------------- #
#  Handle DMG
# ---------------------------------------------------------------------------- #

handle_dmg() {
    local dmg="$1"
    log "Mounting $dmg …"

    MOUNT_OUTPUT=$(hdiutil attach "$dmg" -nobrowse -noautoopen 2>&1)
    MOUNT_POINT=$(echo "$MOUNT_OUTPUT" | grep -oE '/Volumes/[^\n]+' | tail -1 | sed 's/[[:space:]]*$//')

    [[ -n "$MOUNT_POINT" && -d "$MOUNT_POINT" ]] || die "Failed to mount DMG. Output:\n$MOUNT_OUTPUT"
    log "Mounted at: $MOUNT_POINT"

    INSTALLED=false

    # Look for .app bundles first
    while IFS= read -r -d '' app; do
        install_app "$app"
        INSTALLED=true
    done < <(find "$MOUNT_POINT" -maxdepth 2 -name "*.app" -type d -print0)

    # Then look for .pkg installers
    while IFS= read -r -d '' pkg; do
        install_pkg "$pkg"
        INSTALLED=true
    done < <(find "$MOUNT_POINT" -maxdepth 2 -name "*.pkg" -type f -print0)

    $INSTALLED || warn "Nothing installable (.app or .pkg) found inside the DMG."

    log "Ejecting $MOUNT_POINT …"
    hdiutil detach "$MOUNT_POINT" -quiet && log "Ejected."

    if ! $KEEP; then
        rm -f "$dmg" && log "Deleted $dmg"
    else
        log "--keep set, leaving $dmg in place."
    fi
}

# ---------------------------------------------------------------------------- #
#  Handle ZIP
# ---------------------------------------------------------------------------- #

handle_zip() {
    local zip="$1"
    TMPDIR=$(mktemp -d)
    log "Extracting $zip → $TMPDIR …"
    unzip -q "$zip" -d "$TMPDIR" || die "Failed to extract $zip"

    INSTALLED=false

    # Install any .app bundles found
    while IFS= read -r -d '' app; do
        install_app "$app"
        INSTALLED=true
    done < <(find "$TMPDIR" -name "*.app" -type d -print0)

    # Install any .pkg files found
    while IFS= read -r -d '' pkg; do
        install_pkg "$pkg"
        INSTALLED=true
    done < <(find "$TMPDIR" -name "*.pkg" -type f -print0)

    $INSTALLED || warn "Nothing installable (.app or .pkg) found inside the ZIP."

    rm -rf "$TMPDIR"

    if ! $KEEP; then
        rm -f "$zip" && log "Deleted $zip"
    else
        log "--keep set, leaving $zip in place."
    fi
}

# ---------------------------------------------------------------------------- #
#  Dispatch
# ---------------------------------------------------------------------------- #

case "$EXT" in
dmg) handle_dmg "$TARGET" ;;
zip) handle_zip "$TARGET" ;;
*) die "Unsupported file type: .$EXT (expected .dmg or .zip)" ;;
esac

ok "Done!"

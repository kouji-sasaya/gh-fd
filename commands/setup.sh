#!/usr/bin/env bash
set -euo pipefail

LINK_DIR="${HOME}/.local/bin"

if ! command -v fd >/dev/null 2>&1 && ! command -v fdfind >/dev/null 2>&1; then
  echo "Installing fd..."
  if command -v brew >/dev/null 2>&1; then
    brew install fd
  elif command -v apt-get >/dev/null 2>&1; then
    sudo apt-get install -y fd-find
  elif command -v dnf >/dev/null 2>&1; then
    sudo dnf install -y fd-find
  elif command -v pacman >/dev/null 2>&1; then
    sudo pacman -S --noconfirm fd
  elif command -v cargo >/dev/null 2>&1; then
    cargo install fd-find
  else
    echo "No supported package manager found." >&2
    exit 1
  fi
fi

# Debian/Ubuntu ship the binary as 'fdfind'; add an 'fd' symlink.
if ! command -v fd >/dev/null 2>&1 && command -v fdfind >/dev/null 2>&1; then
  mkdir -p "$LINK_DIR"
  ln -sf "$(command -v fdfind)" "$LINK_DIR/fd"
  echo "Created symlink: $LINK_DIR/fd -> $(command -v fdfind)"
  case ":$PATH:" in
    *":$LINK_DIR:"*) ;;
    *) echo "Note: add $LINK_DIR to your PATH." ;;
  esac
fi

echo "Setup complete."

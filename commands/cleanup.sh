#!/usr/bin/env bash
set -euo pipefail

# Only removes the symlink created by 'gh fd setup'; the fd package itself is left installed.
LINK="${HOME}/.local/bin/fd"

if [ -L "$LINK" ]; then
  rm "$LINK"
  echo "Removed symlink: $LINK"
else
  echo "Nothing to clean up."
fi

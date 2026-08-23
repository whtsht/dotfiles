#!/bin/sh
# Pick an entry from the cliphist history with fuzzel and copy it back to the clipboard.
set -eu

cliphist list | fuzzel --dmenu --prompt "clipboard> " | cliphist decode | wl-copy

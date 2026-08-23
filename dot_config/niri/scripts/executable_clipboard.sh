#!/bin/sh
# Pick an entry from the cliphist history with wofi and copy it back to the clipboard.
set -eu

cliphist list | wofi --dmenu --prompt "Clipboard" | cliphist decode | wl-copy

#!/bin/sh
# Set the name of the current workspace from input typed into wofi.
# An empty input clears the name.
#
# wofi is started with no entries on stdin. Its no_custom_entry option defaults
# to false, so the content of the search box is returned as the result.
set -eu

name=$(printf '' | wofi --dmenu --prompt "Workspace name") || exit 0

if [ -z "$name" ]; then
    niri msg action unset-workspace-name
else
    niri msg action set-workspace-name "$name"
fi

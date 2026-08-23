#!/bin/sh
# Set the name of the current workspace from input typed into fuzzel.
# An empty input clears the name.
set -eu

name=$(printf '' | fuzzel --dmenu --prompt "workspace name> ") || exit 0

if [ -z "$name" ]; then
    niri msg action unset-workspace-name
else
    niri msg action set-workspace-name "$name"
fi

#!/bin/sh
# Print the currently playing media as "artist - title".
# Called from a hyprlock label. Prints nothing when no player is running.
#
# The --format option of playerctl uses {{ }}, but hyprlang parses {{ }} in a
# configuration file as an expression and reports a syntax error. The command is
# therefore kept in this script instead of being written in hyprlock.conf.
set -eu

artist=$(playerctl metadata xesam:artist 2>/dev/null || true)
title=$(playerctl metadata xesam:title 2>/dev/null || true)

[ -z "$title" ] && exit 0

if [ -n "$artist" ]; then
    printf '%s - %s' "$artist" "$title"
else
    printf '%s' "$title"
fi

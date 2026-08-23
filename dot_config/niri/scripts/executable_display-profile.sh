#!/bin/sh
# Cycle through the kanshi profiles.
# The name of the current profile is kept in a state file.
set -eu

PROFILES="docked laptop external"
STATE="${XDG_STATE_HOME:-$HOME/.local/state}/display-profile"

current=""
[ -f "$STATE" ] && current=$(cat "$STATE")

# Take the entry after current in the list. Fall back to the first entry when
# current is unset or unknown.
next=""
found=0
for p in $PROFILES; do
    if [ "$found" = 1 ]; then
        next="$p"
        break
    fi
    [ "$p" = "$current" ] && found=1
done
[ -z "$next" ] && next=$(printf '%s\n' $PROFILES | head -n1)

if kanshictl switch "$next"; then
    mkdir -p "$(dirname "$STATE")"
    printf '%s' "$next" > "$STATE"
    notify-send "display profile" "Switched to $next"
else
    notify-send -u critical "display profile" "Failed to switch to $next"
    exit 1
fi

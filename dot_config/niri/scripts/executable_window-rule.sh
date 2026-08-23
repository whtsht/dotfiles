#!/bin/sh
# Pick a window with the mouse and build a niri window-rule template from its
# app-id and title. The result is printed to stdout, copied to the clipboard and
# shown as a notification.
set -eu

json=$(niri msg -j pick-window) || exit 0

app_id=$(printf '%s' "$json" | jq -r '.app_id // ""')
title=$(printf '%s' "$json" | jq -r '.title // ""')

if [ -z "$app_id" ] && [ -z "$title" ]; then
    notify-send "window-rule" "Could not read either app-id or title"
    exit 1
fi

rule=$(printf 'window-rule {\n    match app-id=r#"^%s$"# title=r#"^%s$"#\n}\n' \
    "$(printf '%s' "$app_id" | sed 's/[].[^$\\*+?(){}|]/\\&/g')" \
    "$(printf '%s' "$title"  | sed 's/[].[^$\\*+?(){}|]/\\&/g')")

printf '%s\n' "$rule"
printf '%s' "$rule" | wl-copy
notify-send "window-rule" "app-id: $app_id
title: $title
Copied to the clipboard"

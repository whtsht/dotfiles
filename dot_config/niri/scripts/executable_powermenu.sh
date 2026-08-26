#!/bin/sh
# Pick a power action with wofi and run it.
set -eu

choice=$(printf '%s\n' \
    "lock" \
    "logout" \
    "suspend" \
    "reboot" \
    "poweroff" \
    | wofi --dmenu --prompt "Power")

case "$choice" in
    lock)     loginctl lock-session ;;
    logout)   niri msg action quit --skip-confirmation ;;
    suspend)  systemctl suspend ;;
    reboot)   systemctl reboot ;;
    poweroff) systemctl poweroff ;;
    *)        exit 0 ;;
esac

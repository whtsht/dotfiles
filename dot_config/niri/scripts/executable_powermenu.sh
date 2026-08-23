#!/bin/sh
# 電源操作を fuzzel で選択して実行する。
set -eu

choice=$(printf '%s\n' \
    "lock" \
    "logout" \
    "suspend" \
    "reboot" \
    "poweroff" \
    | fuzzel --dmenu --prompt "power> ")

case "$choice" in
    lock)     hyprlock ;;
    logout)   niri msg action quit --skip-confirmation ;;
    suspend)  systemctl suspend ;;
    reboot)   systemctl reboot ;;
    poweroff) systemctl poweroff ;;
    *)        exit 0 ;;
esac

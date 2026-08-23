#!/bin/sh
# Notify when the battery charge drops below a threshold. Run periodically by a
# systemd user timer. The last threshold notified is kept in a state file so the
# same threshold does not produce repeated notifications.
set -eu

BAT=/sys/class/power_supply/BAT0
STATE="${XDG_RUNTIME_DIR:-/tmp}/battery-notify.state"

[ -d "$BAT" ] || exit 0

capacity=$(cat "$BAT/capacity")
status=$(cat "$BAT/status")

# While charging, do not notify and clear the recorded threshold.
case "$status" in
    Charging|Full)
        rm -f "$STATE"
        exit 0
        ;;
esac

if   [ "$capacity" -le 5  ]; then level=5;  urgency=critical
elif [ "$capacity" -le 10 ]; then level=10; urgency=critical
elif [ "$capacity" -le 20 ]; then level=20; urgency=normal
else
    rm -f "$STATE"
    exit 0
fi

last=""
[ -f "$STATE" ] && last=$(cat "$STATE")
[ "$last" = "$level" ] && exit 0

notify-send -u "$urgency" "Battery at ${capacity}%" "Connect the charger"
printf '%s' "$level" > "$STATE"

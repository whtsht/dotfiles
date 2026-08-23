#!/bin/sh
# バッテリ残量がしきい値を下回った際に通知する。systemd user timer から定期実行する。
# 同じしきい値で繰り返し通知しないよう、最後に通知したしきい値を状態ファイルへ記録する。
set -eu

BAT=/sys/class/power_supply/BAT0
STATE="${XDG_RUNTIME_DIR:-/tmp}/battery-notify.state"

[ -d "$BAT" ] || exit 0

capacity=$(cat "$BAT/capacity")
status=$(cat "$BAT/status")

# 充電中は通知せず、記録も解除する。
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

notify-send -u "$urgency" "バッテリ残量 ${capacity}%" "電源に接続してください"
printf '%s' "$level" > "$STATE"

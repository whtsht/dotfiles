#!/bin/sh
# kanshi のプロファイルを順に切り替える。
# 現在のプロファイル名は状態ファイルに保持する。
set -eu

PROFILES="docked laptop external"
STATE="${XDG_STATE_HOME:-$HOME/.local/state}/display-profile"

current=""
[ -f "$STATE" ] && current=$(cat "$STATE")

# 一覧の中から current の次を選ぶ。current が未設定または不明なら先頭を選ぶ。
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
    notify-send "display profile" "$next へ切り替えました"
else
    notify-send -u critical "display profile" "$next への切り替えに失敗しました"
    exit 1
fi

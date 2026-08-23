#!/bin/sh
# 再生中のメディアを「アーティスト - タイトル」の形式で出力する。
# hyprlock の label から呼び出す。再生中のプレイヤーがない場合は何も出力しない。
#
# playerctl の --format は {{ }} を使うが、hyprlang は設定ファイル中の
# {{ }} を式として解釈して構文エラーになる。そのため hyprlock.conf に
# 直接書かず、このスクリプトへ切り出している。
set -eu

artist=$(playerctl metadata xesam:artist 2>/dev/null || true)
title=$(playerctl metadata xesam:title 2>/dev/null || true)

[ -z "$title" ] && exit 0

if [ -n "$artist" ]; then
    printf '%s - %s' "$artist" "$title"
else
    printf '%s' "$title"
fi

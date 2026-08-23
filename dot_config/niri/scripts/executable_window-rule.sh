#!/bin/sh
# マウスでウィンドウを選択し、その app-id と title から niri の window-rule の雛形を生成する。
# 生成した内容は標準出力へ表示し、クリップボードへ格納したうえで通知する。
set -eu

json=$(niri msg -j pick-window) || exit 0

app_id=$(printf '%s' "$json" | jq -r '.app_id // ""')
title=$(printf '%s' "$json" | jq -r '.title // ""')

if [ -z "$app_id" ] && [ -z "$title" ]; then
    notify-send "window-rule" "app-id と title のいずれも取得できませんでした"
    exit 1
fi

rule=$(printf 'window-rule {\n    match app-id=r#"^%s$"# title=r#"^%s$"#\n}\n' \
    "$(printf '%s' "$app_id" | sed 's/[].[^$\\*+?(){}|]/\\&/g')" \
    "$(printf '%s' "$title"  | sed 's/[].[^$\\*+?(){}|]/\\&/g')")

printf '%s\n' "$rule"
printf '%s' "$rule" | wl-copy
notify-send "window-rule" "app-id: $app_id
title: $title
クリップボードへ格納しました"

#!/bin/sh
# 現在のワークスペース名を fuzzel で入力して設定する。
# 空文字を入力した場合は名前を解除する。
set -eu

name=$(printf '' | fuzzel --dmenu --prompt "workspace name> ") || exit 0

if [ -z "$name" ]; then
    niri msg action unset-workspace-name
else
    niri msg action set-workspace-name "$name"
fi

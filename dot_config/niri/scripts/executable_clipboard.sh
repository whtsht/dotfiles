#!/bin/sh
# cliphist の履歴を fuzzel で選択し、選んだ項目をクリップボードへ書き戻す。
set -eu

cliphist list | fuzzel --dmenu --prompt "clipboard> " | cliphist decode | wl-copy

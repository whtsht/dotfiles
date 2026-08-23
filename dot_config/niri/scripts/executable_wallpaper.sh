#!/bin/sh
# 壁紙を fuzzel で選択し、awww で設定したうえで matugen で配色を再生成する。
# 選択した画像のパスは状態ファイルへ記録し、hyprlock などが参照できるようにする。
set -eu

DIRS="$HOME/Pictures $HOME/Downloads"
STATE="${XDG_STATE_HOME:-$HOME/.local/state}/wallpaper"

existing=""
for d in $DIRS; do
    [ -d "$d" ] && existing="$existing $d"
done
if [ -z "$existing" ]; then
    notify-send -u critical "wallpaper" "画像ディレクトリが見つかりません"
    exit 1
fi

# shellcheck disable=SC2086
selected=$(find $existing -maxdepth 2 -type f \
    \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.webp' \) \
    | sort | fuzzel --dmenu --prompt "wallpaper> ") || exit 0

[ -z "$selected" ] && exit 0
[ -f "$selected" ] || { notify-send -u critical "wallpaper" "存在しないパスです: $selected"; exit 1; }

awww img "$selected" --transition-type fade --transition-duration 1

# --prefer saturation: 画像から複数の候補色が得られた場合に彩度の高いものを選ぶ。
# 指定しない場合、非対話環境では matugen が候補を決められず終了する。
matugen image "$selected" --prefer saturation

mkdir -p "$(dirname "$STATE")"
printf '%s' "$selected" > "$STATE"

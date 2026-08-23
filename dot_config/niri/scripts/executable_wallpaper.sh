#!/bin/sh
# Pick a wallpaper with wofi, set it with awww, then regenerate the color
# scheme with matugen. The path of the selected image is written to a state file
# so that other tools such as hyprlock can read it.
set -eu

DIRS="$HOME/Pictures $HOME/Downloads"
STATE="${XDG_STATE_HOME:-$HOME/.local/state}/wallpaper"

existing=""
for d in $DIRS; do
    [ -d "$d" ] && existing="$existing $d"
done
if [ -z "$existing" ]; then
    notify-send -u critical "wallpaper" "No image directory found"
    exit 1
fi

# shellcheck disable=SC2086
selected=$(find $existing -maxdepth 2 -type f \
    \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.webp' \) \
    | sort | wofi --dmenu --prompt "Wallpaper") || exit 0

[ -z "$selected" ] && exit 0
[ -f "$selected" ] || { notify-send -u critical "wallpaper" "No such path: $selected"; exit 1; }

awww img "$selected" --transition-type fade --transition-duration 1

# --prefer saturation: when the image yields several candidate colors, take the
# most saturated one. Without it matugen cannot pick a candidate and exits with
# an error in a non-interactive environment.
matugen image "$selected" --prefer saturation

mkdir -p "$(dirname "$STATE")"
printf '%s' "$selected" > "$STATE"

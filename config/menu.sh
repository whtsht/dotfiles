#!/bin/sh
if (ps -a | grep wofi >/dev/null); then
    killall -q wofi
else
	case $(printf "%s\n" "󰐥 Power Off" "󰑐 Restart" "󰖔 Suspend" "󰑻 Hibernate" "󰌾 Lock" "󰗽 Log Out" | wofi --show=dmenu --hide-scroll --allow-markup --define=hide_search --width=600 --height=200) in
		"󰐥 Power Off")
			systemctl poweroff
			;;
		"󰑐 Restart")
			systemctl reboot
			;;
		"󰖔 Suspend")
			systemctl suspend
			;;
		"󰑻 Hibernate")
			systemctl hibernate
			;;
		"󰌾 Lock")
			swaylock
			;;
		"󰗽 Log Out")
            hyprctl dispatch exit 1
			;;
	esac
fi

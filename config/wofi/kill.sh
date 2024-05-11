#!/bin/sh
if (ps -a | grep wofi >/dev/null); then
    killall -q wofi
fi

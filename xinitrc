#!/bin/bash

[[ -z "$DBUS_SESSION_BUS_ADDRESS" ]] && eval "$(dbus-launch --sh-syntax --exit-with-session 2>/dev/null)"

xsetroot -cursor_name left_ptr
[[ -s "$HOME/.Xresources" ]] && xrdb "$HOME/.Xresources"
[[ -s "$HOME/.wallpaper" ]] && hsetroot -fill "$(cat $HOME/.wallpaper)"

xss-lock -- i3lock -c 000000 -nd &
compton -b &
notificathor &
start-pulseaudio-x11 &

exec startbspwm

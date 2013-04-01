#!/bin/bash

[[ -z "$DBUS_SESSION_BUS_ADDRESS" ]] && eval "$(dbus-launch 2>/dev/null --sh-syntax --exit-with-session)"

export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export LD_LIBRARY_PATH='/usr/lib/jvm/java-6-openjdk/jre/lib/amd64'
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'
export _JAVA_AWT_WM_NONREPARENTING=1

export BSPWM_SOCKET='/tmp/bspwm-socket'
export BSPWM_STATUS_FIFO='/tmp/bspwm-fifo'

xsetroot -cursor_name left_ptr
[[ -f ~/.Xresources ]] && xrdb ~/.Xresources
[[ -s ~/.wallpaper ]] && . ~/.wallpaper && hsetroot -fill "$WALLPAPER"

urxvtd -q -f -o &
sxhkd &

[[ -e "$BSPWM_STATUS_FIFO" ]] && rm "$BSPWM_STATUS_FIFO"
mkfifo "$BSPWM_STATUS_FIFO"
exec bspwm -s "$BSPWM_STATUS_FIFO"

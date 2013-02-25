#!/bin/bash

[[ -z "$DBUS_SESSION_BUS_ADDRESS" ]] && eval "$(dbus-launch 2>/dev/null --sh-syntax --exit-with-session)"

export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export _JAVA_AWT_WM_NONREPARENTING=1
export LD_LIBRARY_PATH='/usr/lib/jvm/java-6-openjdk/jre/lib/amd64'
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'

xsetroot -cursor_name left_ptr
[[ -f ~/.Xresources ]] && xrdb ~/.Xresources
[[ -s ~/.wallpaper ]] && . ~/.wallpaper && hsetroot -fill "$WALLPAPER"

urxvtd -q -f -o &
compton --vsync opengl --dbe --sw-opti -b &
xflux -z 32608 &

exec i3

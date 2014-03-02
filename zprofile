export GOPATH="$HOME/code/go"
export PATH="$HOME/.bin:$GOPATH/bin:$PATH"
export LD_LIBRARY_PATH="/usr/lib/jvm/java-7-openjdk/jre/lib/amd64:$LD_LIBRARY_PATH"

export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'
export _JAVA_AWT_WM_NONREPARENTING=1

export SCREENSHOTS="$HOME/images/screenshots/auto"

export EDITOR='vim'
export BROWSER='chromium'
export PAGER='less'
export LESSOPEN='| /usr/bin/src-hilite-lesspipe.sh %s'

export PANEL_FIFO='/tmp/panel-fifo'
export BSPWM_TREE='/tmp/bspwm.tree'
export BSPWM_HISTORY='/tmp/bspwm.history'
export BSPWM_STACK='/tmp/bspwm.stack'

export GREP_OPTIONS='--color=auto'
export GREP_COLOR='40;32'

[[ -s "$HOME/.dircolors" ]] && eval "$(dircolors $HOME/.dircolors)"

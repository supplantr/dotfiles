alias timesh='time zsh -i -c exit'

alias ls='ls --group-directories-first --color=auto'
alias l='ls'
alias la='l -A'
alias lr='l -R'
alias ll='l -lh'
alias lla='ll -A'
alias llr='ll -R'
alias llx='ll -X'
alias llk='ll -S'

alias mkdir='mkdir -p -v'

alias ..='cd ..'
alias bd='. bd -s'

alias diff='colordiff'

alias sudo='sudo '
alias open='xdg-open'
alias extract='aunpack'
alias rm='safe-rm'
alias hardrm='/usr/bin/rm'

alias pacman='sudo pacman'
alias psmem='sudo ps_mem'
alias suspend-usb='sudo suspend-usb-device'
alias update-fonts='fc-cache -fv; xset fp rehash'
alias ssh='eval "$(keychain --eval --agents ssh -Q -q $HOME/.ssh/id_rsa)" && ssh'

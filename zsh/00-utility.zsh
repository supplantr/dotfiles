unsetopt correct_all
setopt interactive_comments

export GREP_OPTIONS='--color=auto'
export GREP_COLOR='40;32'

source "${0:h}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

alias shelltime='time zsh -i -c exit'

alias ls='ls --group-directories-first --color=auto'
alias lsa='ls -A'
alias l='ls -1A'
alias ll='ls -lh'
alias lr='ll -R'
alias la='ll -A'
alias lx='ll -XB'
alias lk='ll -S'

alias diff='colordiff'

alias rm='safe-rm'
alias hardrm='/usr/bin/rm'

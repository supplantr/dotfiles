[[ -n "$DISPLAY" ]] && precmd() { print -Pn '\e]2;%n@%M:%~\a' }

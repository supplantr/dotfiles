export PATH="$HOME/bin:$HOME/.luarocks/bin:$HOME/.cabal/bin:$PATH"

[[ -s "$HOME/.dircolors" ]] && eval "$(dircolors $HOME/.dircolors)"

[[ -z "$DISPLAY" && "$XDG_VTNR" -eq 1 ]] && exec startx

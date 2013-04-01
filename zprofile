export PATH="$HOME/.bin:$HOME/.luarocks/bin:$HOME/.cabal/bin:$PATH"
export PYTHONPATH='/usr/lib/python3.3/site-packages'

[[ -s "$HOME/.dircolors" ]] && eval "$(dircolors $HOME/.dircolors)"

[[ -z "$DISPLAY" && "$XDG_VTNR" -eq 1 ]] && exec startx

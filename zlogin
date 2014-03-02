{
	zcompdump="$HOME/.zcompdump"
	if [[ -s "$zcompdump" && (! -s "$zcompdump.zwc" || "$zcompdump" -nt "$zcompdump.zwc") ]]; then
		zcompile "$zcompdump"
	fi
} &!

[[ -z "$DISPLAY" && "$XDG_VTNR" -eq 1 ]] && exec startx

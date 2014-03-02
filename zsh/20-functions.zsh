chpwd() { [[ "$PWD" -ef "$HOME" ]] || Z -a "$PWD" }

j() {
	local dir=$(Z "$@" | head -n 1)
	pushd "$dir" > /dev/null 2>&1 || Z -d "$dir"
}

backup() { for i ("$@") cp "$i"{,.backup} }

backup() {
    for i in "$@"; do
        cp "$i"{,.backup}
    done
}

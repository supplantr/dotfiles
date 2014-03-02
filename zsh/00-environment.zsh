autoload -U url-quote-magic
zle -N self-insert url-quote-magic

unsetopt bg_nice
unsetopt hup
unsetopt check_jobs
unsetopt mail_warning
setopt long_list_jobs
setopt auto_resume
setopt notify
setopt brace_ccl
setopt rc_quotes

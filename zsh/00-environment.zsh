autoload -U url-quote-magic
zle -N self-insert url-quote-magic

setopt long_list_jobs
setopt auto_resume
setopt notify
unsetopt bg_nice
unsetopt hup
unsetopt check_jobs

setopt brace_ccl
setopt rc_quotes
unsetopt mail_warning

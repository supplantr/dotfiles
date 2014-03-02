autoload -U colors && colors

setopt prompt_subst

git_prompt_info() {
	ref=$(git symbolic-ref HEAD 2> /dev/null) || return
	echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

parse_git_dirty() {
	local SUBMODULE_SYNTAX=''
	if [[ $POST_1_7_2_GIT -gt 0 ]]; then
		SUBMODULE_SYNTAX="--ignore-submodules=dirty"
	fi
	if [[ -n $(git status -s ${SUBMODULE_SYNTAX}  2> /dev/null) ]]; then
		echo "$ZSH_THEME_GIT_PROMPT_DIRTY"
	else
		echo "$ZSH_THEME_GIT_PROMPT_CLEAN"
	fi
}

git_prompt_ahead() {
	if $(echo "$(git log origin/$(current_branch)..HEAD 2> /dev/null)" | grep '^commit' &> /dev/null); then
		echo "$ZSH_THEME_GIT_PROMPT_AHEAD"
	fi
}

git_prompt_short_sha() {
	SHA=$(git rev-parse --short HEAD 2> /dev/null) && echo "$ZSH_THEME_GIT_PROMPT_SHA_BEFORE$SHA$ZSH_THEME_GIT_PROMPT_SHA_AFTER"
}

git_prompt_long_sha() {
	SHA=$(git rev-parse HEAD 2> /dev/null) && echo "$ZSH_THEME_GIT_PROMPT_SHA_BEFORE$SHA$ZSH_THEME_GIT_PROMPT_SHA_AFTER"
}

git_prompt_status() {
	INDEX=$(git status --porcelain 2> /dev/null)
	STATUS=""
	if $(echo "$INDEX" | grep '^?? ' &> /dev/null); then
		STATUS="$ZSH_THEME_GIT_PROMPT_UNTRACKED$STATUS"
	fi
	if $(echo "$INDEX" | grep '^A  ' &> /dev/null); then
		STATUS="$ZSH_THEME_GIT_PROMPT_ADDED$STATUS"
	elif $(echo "$INDEX" | grep '^M  ' &> /dev/null); then
		STATUS="$ZSH_THEME_GIT_PROMPT_ADDED$STATUS"
	fi
	if $(echo "$INDEX" | grep '^ M ' &> /dev/null); then
		STATUS="$ZSH_THEME_GIT_PROMPT_MODIFIED$STATUS"
	elif $(echo "$INDEX" | grep '^AM ' &> /dev/null); then
		STATUS="$ZSH_THEME_GIT_PROMPT_MODIFIED$STATUS"
	elif $(echo "$INDEX" | grep '^ T ' &> /dev/null); then
		STATUS="$ZSH_THEME_GIT_PROMPT_MODIFIED$STATUS"
	fi
	if $(echo "$INDEX" | grep '^R  ' &> /dev/null); then
		STATUS="$ZSH_THEME_GIT_PROMPT_RENAMED$STATUS"
	fi
	if $(echo "$INDEX" | grep '^ D ' &> /dev/null); then
		STATUS="$ZSH_THEME_GIT_PROMPT_DELETED$STATUS"
	elif $(echo "$INDEX" | grep '^AD ' &> /dev/null); then
		STATUS="$ZSH_THEME_GIT_PROMPT_DELETED$STATUS"
	fi
	if $(echo "$INDEX" | grep '^UU ' &> /dev/null); then
		STATUS="$ZSH_THEME_GIT_PROMPT_UNMERGED$STATUS"
	fi
	echo $STATUS
}

PROMPT='[%{$fg[red]%}%n%{$reset_color%}@%{$fg[magenta]%}%m%{$reset_color%}:%{$fg[blue]%}%~%{$reset_color%}$(git_prompt_info)]
%# '

ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""

return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

RPROMPT='${return_code}$(git_prompt_status)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%} ✚"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%} ✹"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✖"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%} ➜"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%} ═"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%} ✭"

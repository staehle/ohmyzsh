ZSH_THEME="staehle"

ENABLE_CORRECTION="true"

COMPLETION_WAITING_DOTS="true"

plugins=(
	git
	alias-finder
	common-aliases
	emacs
	emoji
	history-substring-search
	tmux
)

if [[ "$OSTYPE" = darwin* ]]; then
	plugins+=(
		osx
		brew
		iterm2
	)
else
	if [[ "$OSTYPE" = linux* ]]; then
		plugins+=(
			ubuntu
			systemd
		)
	#else
	#	plugins+=(
	#		windows
	#	)
	fi
fi

#for plugin ($plugins); do
#	echo "Got plugin: $plugin"
#done

export LANG=en_US.UTF-8
export LC_ALL=${LANG}
export EDITOR="emacs"



bindkey '\e[1~' beginning-of-line
bindkey '\e[4~' end-of-line

# gitk is family-friendly fun
alias gka='gitk --all &'
# often fudge this
alias gti='git'



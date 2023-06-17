# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

##########################################
# Load other files
##########################################

# Aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Completions
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

##########################################
# History Control
##########################################
HISTCONTROL=ignoreboth
HISTSIZE=100000
HISTFILESIZE=200000

shopt -s histappend
shopt -s checkwinsize
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"

##########################################
# PATH Setup
##########################################
export PATH=$PATH:$HOME/.local/bin:$HOME/.arkade/bin/:/home/linuxbrew/.linuxbrew/bin


##########################################
# Start starship
##########################################
eval "$(starship init bash)"
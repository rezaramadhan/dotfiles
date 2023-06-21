##########################################
# Color stuff
##########################################
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

##########################################
# ls
##########################################
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'


##########################################
# CLI Tools
##########################################
alias k='kubectl'
alias kn='kubens'
alias tf='terraform'
alias tg='terragrunt'
alias vi='vim'
alias lg='lazygit'

##########################################
# Misc
##########################################
alias poweroff='wsl.exe --terminate Ubuntu22.04'

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    export PATH="$HOME/bin:$PATH"
fi

#Set variables
export EDITOR="vim"
export PYTHONSTARTUP="$HOME/.pyrc"
export GOPATH=/home/reazem/go

# Enable bash completion
if [ -f /etc/bash_completion ]; then
 . /etc/bash_completion
fi

# Personnal Aliases
alias lock='xscreensaver ; xscreensaver-command -lock &'
alias docker='sudo docker'

# quilt
alias dquilt="quilt --quiltrc=${HOME}/.quiltrc-dpkg"
complete -F _quilt_completion $_quilt_complete_opt dquilt

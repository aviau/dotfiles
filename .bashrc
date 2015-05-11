# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    export PATH="$HOME/bin:$PATH"
fi

#Set variables
export EDITOR="vim"
export PYTHONSTARTUP="$HOME/.pyrc"
export GOPATH=/home/reazem/go
export SURVEIL_API_URL=http://localhost:8080/v2
export SURVEIL_AUTH_URL=http://localhost:8080/v2/auth

# Enable bash completion
if [ -f /etc/bash_completion ]; then
 . /etc/bash_completion
fi

# Personnal Aliases
alias lock='xscreensaver ; xscreensaver-command -lock &'
alias docker='sudo docker'
alias fig='sudo docker-compose'
alias fig-krb='sudo docker-compose kill && sudo docker-compose rm --force && sudo docker-compose build'

# quilt
alias dquilt="quilt --quiltrc=${HOME}/.quiltrc-dpkg"
complete -F _quilt_completion $_quilt_complete_opt dquilt

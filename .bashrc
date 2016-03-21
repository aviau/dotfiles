# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    export PATH="$HOME/bin:$PATH"
fi

# set PATH to include golang stuff
if [ -d "$HOME/go/bin" ] ; then
    export PATH="$HOME/go/bin:$PATH"
fi

#Set variables
export EDITOR="vim"
export PYTHONSTARTUP="$HOME/.pyrc"
export GOPATH=/home/reazem/go
export SURVEIL_API_URL=http://localhost:5311/v2
export SURVEIL_AUTH_URL=http://localhost:5311/v2/auth
export VAGRANT_DEFAULT_PROVIDER=virtualbox
export DEBEMAIL=aviau@debian.org
export DEBSIGN_KEYID=3ccc3a3a
export EMAIL=alexandre@alexandreviau.net
export USCAN_SYMLINK=rename

# Enable bash completion
if [ -f /etc/bash_completion ]; then
 . /etc/bash_completion
fi

# Personnal Aliases
alias lock='xscreensaver ; xscreensaver-command -lock &'
alias docker='sudo docker'
alias fig='sudo docker-compose'
alias fig-krb='sudo docker-compose kill && sudo docker-compose rm --force && sudo docker-compose build'
alias swapescape="setxkbmap -option 'caps:swapescape'"
alias bts="bts --mutt"
alias lintian='lintian -IEcv --pedantic --color auto'
alias patchedit="patchedit -f -o"
alias shrug="echo  '¯\_(ツ)_/¯'"

# quilt
alias dquilt="quilt --quiltrc=${HOME}/.quiltrc-dpkg"

complete -F _quilt_completion $_quilt_complete_opt dquilt

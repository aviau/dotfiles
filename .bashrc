#Set variables
export EDITOR="vim"
export PYTHONSTARTUP="$HOME/.pyrc"
export GOPATH=$HOME/go
export VAGRANT_DEFAULT_PROVIDER=virtualbox
export DEBEMAIL=aviau@debian.org
export DEBSIGN_KEYID=3ccc3a3a
export EMAIL=alexandre@alexandreviau.net
export USCAN_SYMLINK=rename
export NVIM_HOME=$HOME/viau.alexandre@gmail.com/notes
export DEBSIGN_PROGRAM=gpg2
export SSH_AUTH_SOCK=/run/user/$( id -u)/gnupg/S.gpg-agent.ssh

# set PATH to include golang stuff
if [ -d "$GOPATH/bin" ] ; then
    export PATH="$GOPATH/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    export PATH="$HOME/bin:$PATH"
fi

# Enable bash completion
if [ -f /etc/bash_completion ]; then
 . /etc/bash_completion
fi

# Personnal Aliases
alias pacman='apt'

# Allow for using aliases when using sudo
# http://askubuntu.com/questions/22037/aliases-not-available-when-using-sudo
# The first word of each simple command, if unquoted, is checked to see if it
# has an alias If the last character of the alias value is a space or tab
# character, then the next command word following the alias is also checked
# for alias expansion.
alias sudo='sudo '

alias docker='sudo docker'
alias swapescape="setxkbmap -option 'caps:swapescape'"
alias bts="bts --mutt"
alias lintian='lintian -IEcv --pedantic --color auto'
alias patchedit="patchedit -f -o"
alias shrug="echo  '¯\_(ツ)_/¯'"
alias uscan="uscan --overwrite-download"
alias nautilus='nautilus --no-desktop'
alias gpg='gpg2'
alias bat0='upower -i /org/freedesktop/UPower/devices/battery_BAT0| grep -E "state|to\ full|percentage"'
alias bat1='upower -i /org/freedesktop/UPower/devices/battery_BAT1| grep -E "state|to\ full|percentage"'
alias bat="bat0 && bat1"
alias pass="gopass"

# quilt
alias dquilt="quilt --quiltrc=${HOME}/.quiltrc-dpkg"

complete -F _quilt_completion $_quilt_complete_opt dquilt

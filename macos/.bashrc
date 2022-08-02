#Set variables
export EDITOR="vim"
export GOPATH=$HOME/go
export GPG_TTY=$(tty)
export PINENTRY_USER_DATA="USE_TTY=1"

# Enable completion
eval $(/opt/homebrew/bin/brew shellenv)
if [[ -f ${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh ]]; then
    . ${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh
fi

# GPG+SSH Agent
export SSH_AUTH_SOCK=${HOME}/.gnupg/S.gpg-agent.ssh
if [[ ! -S ${HOME}/.gnupg/S.gpg-agent ]]; then
    gpg-agent --daemon --quiet > /dev/null
fi

# set PATH to include golang stuff
if [ -d "$GOPATH/bin" ] ; then
    export PATH="$GOPATH/bin:$PATH"
fi

# set path to include flare stuff
if [ -d "$HOME/git/flare/flare-tools/bin" ] ; then
    export PATH="$HOME/git/flare/flare-tools/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    export PATH="$HOME/bin:$PATH"
fi

PROMPT_COMMAND=set_prompt
set_prompt() {
  # Capture exit code of last command
  local ex=$?

  #----------------------------------------------------------------------------#
  # Bash text colour specification:  \e[<STYLE>;<COLOUR>m
  # (Note: \e = \033 (oct) = \x1b (hex) = 27 (dec) = "Escape")
  # Styles:  0=normal, 1=bold, 2=dimmed, 4=underlined, 7=highlighted
  # Colours: 31=red, 32=green, 33=yellow, 34=blue, 35=purple, 36=cyan, 37=white
  #----------------------------------------------------------------------------#
  local default='\e[1;0m'
  local red='\e[1;31m'
  local reset='\e[0m'

  # Set prompt content
  PS1="\u@\h:\w$\[$reset\] "
  # If exit code of last command is non-zero, prepend this code to the prompt
  [[ "$ex" -ne 0 ]] && PS1="$red$ex$reset|$PS1"
  # Set colour of prompt
  PS1="\[$color\]$PS1"
}
export -f set_prompt

# pyenv
if [ -d "$HOME/.pyenv" ]; then
    eval "$(pyenv init --path)"
    eval "$(pyenv init -)"
fi

function title {
	echo -ne "\033]0;"$*"\007"
}

# direnv
eval "$(direnv hook bash)"

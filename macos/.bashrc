#Set variables
export EDITOR="vim"
export GOPATH=$HOME/go

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

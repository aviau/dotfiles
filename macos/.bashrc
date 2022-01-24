#Set variables
export EDITOR="vim"

# set path to include flare stuff
if [ -d "$HOME/git/flare/flare-tools/bin" ] ; then
    export PATH="$HOME/git/flare/flare-tools/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    export PATH="$HOME/bin:$PATH"
fi

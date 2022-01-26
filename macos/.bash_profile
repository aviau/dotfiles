export BASH_SILENCE_DEPRECATION_WARNING=1

BREW_PREFIX=$(brew --prefix)

if [[ -f ${BREW_PREFIX}/etc/bash_completion ]]; then
    export BASH_COMPLETION_COMPAT_DIR="${BREW_PREFIX}/etc/bash_completion.d"
    . /usr/local/etc/bash_completion
fi

export SSH_AUTH_SOCK="${HOME}/.ssh-agent.sock"
if [[ ! -S ${SSH_AUTH_SOCK} ]]; then
    eval $(ssh-agent -s -a ${SSH_AUTH_SOCK})
fi

if [[ -f ~/.bashrc ]]; then
    source ~/.bashrc
fi

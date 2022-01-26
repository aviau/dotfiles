export BASH_SILENCE_DEPRECATION_WARNING=1

if [[ -f ~/.bashrc ]]; then
    source ~/.bashrc
fi

if [[ -f /usr/local/etc/bash_completion ]]; then
    . /usr/local/etc/bash_completion
fi

#!/usr/bin/env bash

# This scripts is complementary to lnmaker.sh.
# It installs secret files that should not be
# in the public dotfiles repository.

set -e

pass cgm.alexandreviau.net_readonly > ~/.config/nightscout_readonly_key

# mutt
pass dotfiles/muttrc > ~/.muttrc

# ssh
pass dotfiles/ssh/config > ~/.ssh/config

# perkeep
mkdir -p ~/.config/perkeep
pass dotfiles/perkeep/server-config.json > ~/.config/perkeep/server-config.json
chmod 600 ~/.config/perkeep/server-config.json

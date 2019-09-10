#!/usr/bin/env bash

# This scripts is complementary to lnmaker.sh.
# It installs secret files that should not be
# in the public dotfiles repository.

pass cgm.alexandreviau.net_readonly > ~/.config/nightscout_readonly_key

pass dotfiles/muttrc > ~/.muttrc

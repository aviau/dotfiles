#!/usr/bin/env zsh

set -eo pipefail

# Find hotkeys with: 'defaults find NSUserKeyEquivalents'

echo "Restoring keyboard shortcuts..."

defaults write com.google.Chrome NSUserKeyEquivalents ' {
    Back = "^\U2190";
    Forward = "^\U2192";
}'

# This fails :(
# defaults write com.apple.universalaccess "com.apple.custommenu.apps" -array-add "<string>com.googlecode.iterm2</string>"

defaults write "com.googlecode.iterm2" NSUserKeyEquivalents '{
    Copy = "@$c";
    Paste = "@$v";
}'

#killall Finder
#killall cfprefsd

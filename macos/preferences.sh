#!/usr/bin/env zsh

set -eo pipefail

echo "Restoring system preferences..."

#####################
## Mission Control ##
#####################

# Speed up Mission Control animations
defaults write com.apple.dock expose-animation-duration -float 0.1

########################
## Keyboard Shortcuts ##
########################

echo "Restoring keyboard shortcuts..."

# Disable entering accents by holding a character. This would interfere
# with workflows like holding  down the 'j' key to scroll down multiple
# lines in vscode.
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Find hotkeys with: 'defaults find NSUserKeyEquivalents'

# Until the following command works, restoring the shortcuts
# requires adding at least one shortcut per app manually in the
# preferences settings.
#
# defaults write com.apple.universalaccess "com.apple.custommenu.apps" -array-add "<string>com.googlecode.iterm2</string>"

defaults write "Apple Global Domain" NSUserKeyEquivalents ' {
    "Enter Full Screen" = "~f";
    "Exit Full Screen" = "~f";
    "Toggle Full Screen" = "~f";
    "Close Window" = "@q";
}'

defaults write "com.apple.finder" NSUserKeyEquivalents ' {
        Back = "^\U2190";
        Forward = "^\U2192";
        "Enclosing Folder" = "^\U2191";
}'

defaults write com.google.Chrome NSUserKeyEquivalents ' {
    Back = "^\U2190";
    Forward = "^\U2192";
    "Reload This Page" = "\Uf708";
    "Force Reload This Page" = "@\Uf708";
}'

defaults write "com.googlecode.iterm2" NSUserKeyEquivalents '{
    Copy = "@$c";
    Paste = "@$v";
}'


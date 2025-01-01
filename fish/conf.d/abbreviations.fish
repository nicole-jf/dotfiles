#!/bin/fish
abbr --add update "sudo apt update && apt list --upgradable && sudo apt upgrade && flatpak update"

# History expansion
#abbr --add ! -r "^\!(-?\d+:?(-?\d+\.\.-?\d+|\.\.-?\d+|-?\d+\.\.|-?\d+)?|\!:?(-?\d+\.\.-?\d+|\.\.-?\d+|-?\d+\.\.|-?\d+?)?|:?(-?\d+\.\.-?\d+|\.\.-?\d+|-?\d+\.\.|-?\d+)?)" --position anywhere --function history_expansion
# abbr --add ! -r "\!-?(\d+|\!)((:-?\d+)(\.\.)?(-?\d+)?)?" --position anywhere --function history_expansion
abbr --add ! -r "^\!(-?\d+(:(-?\d+\.\.-?\d+|\.\.-?\d+|-?\d+\.\.|-?\d+)?)?|\!(:(-?\d+\.\.-?\d+|\.\.-?\d+|-?\d+\.\.|-?\d+?)?)?|:(-?\d+\.\.-?\d+|\.\.-?\d+|-?\d+\.\.|-?\d+)?)" --position anywhere --function history_expansion
# abbr --add !! --position anywhere --function history_expansion
# ~/.config/fish/functions/history_expansion.fish

# ... to ../..
abbr --add .. --regex '^\.\.+$' --position command --function multicd


# Abbreviation to activate python virtual enviroment
abbr --add pyactivate --position command "source ./*/bin/activate.fish"

# Just some shortcuts
abbr --add py --position command "python3"
abbr --add ed --position command "editor"

# Tethering
abbr --add tether "sudo ifconfig -a | grep -P -o -- 'enx[[:xdigit:]]*(?=:)' | sudo dhclient"

# zoxide
abbr -a za 'zoxide add'
abbr -a zq 'zoxide query'
abbr -a zqi 'zoxide query -i'

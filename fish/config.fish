#!/bin/fish
if status is-interactive
    fish_add_path ~/.local/bin/
    # Commands to run in interactive sessions can go here

    # Source aliases
    source $__fish_config_dir/aliases.fish
    # $HOME/.config/fish/aliases.fish

    # Source interactive variables
    source $__fish_config_dir/interactive_variables.fish
    # $HOME/.config/fish/interactive_variables.fish

    # Source abbreviations
    source $__fish_config_dir/abbreviations.fish
    # $HOME/.config/fish/abbreviations.fish

    # Check if tmux is availible and if not already in tmux
    #    if test -z "$TMUX"
    #        and type -q "tmux"
    #        # Attach session 0 if it exists, else create it
    #        command tmux new-session -A -s 1
    #    end
    #if test -n "$SWAYSOCK"
    #    set -x XDG_CURRENT_DESKTOP sway
    #end
end

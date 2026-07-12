#!/bin/fish
if status is-interactive
    set -x SHELL /usr/bin/fish
    #    fish_add_path ~/.local/bin/
    # Commands to run in interactive sessions can go here
    #    fish_add_path  ~/.config/emacs/bin/

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
    if test -z "$TMUX"
        and test -z "$VIM"
        and test -z "$INSIDE_EMACS"
        and test -z "$ZELLIJ"
        and test -z "$NVIM"
        and type -q tmux
        and not test screen = "$TERM"
        # Attach session 0 if it exists, else create it
        command tmux new-session -A -s 0
    end

    if test -d "$HOME/.local/bin"
        and not contains "$HOME/.local/bin" $PATH
        fish_add_path --path --append "$HOME/.local/bin"
    end

    if test -d "$HOME/.cargo/bin"
        and not contains "$HOME/.cargo/bin" $PATH
        fish_add_path --path --append "$HOME/.cargo/bin"
    end

    # Extra padding because I like to use less with line numbers as my pager
    function _update_manwidth --on-variable COLUMNS
        set MANWIDTH $(math $COLUMNS -7)
    end

end

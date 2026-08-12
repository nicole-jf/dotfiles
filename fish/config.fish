#!/usr/bin/fish

# Run regard less of interactive or not

# Set XDG env vars if they are unset
if test -z "$XDG_CONFIG_HOME"
    set -x XDG_CONFIG_HOME "$HOME/.config"
end
if test -z "$XDG_CACHE_HOME"
    set -x XDG_CACHE_HOME "$HOME/.cache"
end
if test -z "$XDG_DATA_HOME"
    set -x XDG_DATA_HOME "$HOME/.local/share"
end

if status is-interactive
    # Commands to run in interactive sessions can go here

    # Set it as my default shell
    set -x SHELL /usr/bin/fish

    set -x my_fish_ppid (ps --format ppid $fish_pid | tr -d "[:space:][:alpha:]")
    set -x my_fish_parent_command (cat /proc/$my_fish_ppid/comm)

    # Source aliases
    source "$__fish_config_dir/aliases.fish"

    # Source interactive variables
    source "$__fish_config_dir/interactive_variables.fish"

    # Source abbreviations
    source "$__fish_config_dir/abbreviations.fish"

    if test -d "$HOME/.local/bin"
        and not contains "$HOME/.local/bin" $PATH
        fish_add_path --path --append "$HOME/.local/bin"
    end

    if test -d "$HOME/.cargo/bin"
        and not contains "$HOME/.cargo/bin" $PATH
        fish_add_path --path --append "$HOME/.cargo/bin"
    end

    if test -d "$HOME/.local/share/pipx/venvs"
        and not contains "$HOME/.local/share/pipx/venvs"
        fish_add_path --path --append "$HOME/.local/share/venvs"
    end

    # Extra padding because I like to use less with line numbers as my pager
    function _update_manwidth --on-variable COLUMNS
        set MANWIDTH $(math $COLUMNS -7)
    end

    # Check if tmux is availible and if not already in tmux or an other multiplexers
    if test -z "$TMUX" # tmux
        and test -z "$VIM" # vim
        and test -z "$INSIDE_EMACS" # emacs
        and test -z "$ZELLIJ" # zellij
        and test -z "$NVIM" # neovim
        and type -q tmux # is tmux and avalible?
        and not test screen = "$TERM" # check if not in screen
        # Attach session 0 if it exists, else create it
        command tmux new-session -A -s 0
    end

end

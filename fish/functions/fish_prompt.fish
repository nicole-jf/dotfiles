#!/bin/fish

# Prompt config
function fish_prompt -d "Write out the prompt"
    set -l last_pipestatus $pipestatus
    set -lx __fish_last_status $status # Export for __fish_print_pipestatus.
    set -l normal (set_color normal)
    
    # Write pipestatus
    # If the status was carried over (if no command is issued or if `set` leaves the status untouched), don't bold it.
    # In other words, make status number bold if it was caused by the last command
    set -l bold_flag --bold
    set -q __fish_prompt_status_generation; or set -g __fish_prompt_status_generation $status_generation
    if test $__fish_prompt_status_generation = $status_generation
        set bold_flag
    end
    set __fish_prompt_status_generation $status_generation
    set -l status_bold_color (set_color $bold_flag $fish_color_status)

    set -l status_color (set_color $fish_color_status)
    set -l prompt_status (__fish_print_pipestatus " " "" "|" "$status_color" "$status_bold_color" $last_pipestatus)

    # This is a simple prompt. It looks like
    # alfa@nobby /path/to/dir $
    # with the path shortened and colored
    # and a "#" instead of a "$" when run as root.
    set -l symbol '> '
    set -l color_cwd $fish_color_cwd
    if functions -q fish_is_root_user; and fish_is_root_user # Checks if user is root
        set symbol '# '
        if set -q fish_color_cwd_root
           set color_cwd $fish_color_cwd_root
        end
    end

    string join '' -- (prompt_login) " " (set_color $color_cwd) (prompt_pwd) (set_color normal) (fish_vcs_prompt) $prompt_status (set_color normal) $symbol
end

#!/bin/fish
# Vi mode indicator
function fish_mode_prompt
    if test $fish_show_mode_prompt = 1
        switch $fish_bind_mode
            case default
                set_color --bold red
                echo -sn 'N'
            case insert
                set_color --bold green
                echo -sn 'I'
            case replace
                set_color --bold green
                echo -sn 'R'
            case replace_one
                set_color --bold green
                echo -sn 'r'
            case visual
                set_color --bold brmagenta
                echo -sn 'V'
        end
        set_color normal
        echo -sn ' '
    end
end

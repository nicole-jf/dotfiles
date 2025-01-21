#!/bin/fish

function fish_right_prompt
        string join '' -- $CMD_DURATION "ms" # (date '+%H:%M %d/%m/%Y')
end

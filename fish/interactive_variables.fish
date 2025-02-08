#!/bin/fish

set -x __fish_git_prompt_show_informative_status 1
set -x ___fish_git_prompt_char_dirtystate "+"
# Set editor
if type -q editor
   set -x EDITOR editor
   set -x VISUAL editor
end

# Set pager
if type -q pager
   set -x PAGER pager
   set -x MANPAGER pager
end

set -x LESS "--mouse --use-color --wheel-lines=3"

# Set hybrid key bindings
set -x fish_key_bindings fish_hybrid_key_bindings

# $PWD shortner, 0 disables it
set fish_prompt_pwd_dir_length 0

# My own variable to toggle mode prompt indicator
set -x fish_show_mode_prompt 0

set fish_escape_delay_ms 10

# Cursor setttings
# Emulates nvim's cursor shape behavior
# Set the normal and visual mode cursors to a block
set fish_cursor_default block blink
# Set the insert mode cursor to a line
set fish_cursor_insert line blink
# Set the replace mode cursors to an underscore
set fish_cursor_replace_one underscore blink
set fish_cursor_replace underscore blink
# Set the external cursor to a line. The external cursor appears when a command is started.
# The cursor shape takes the value of fish_cursor_default when fish_cursor_external is not specified.
set fish_cursor_external line blink
# The following variable can be used to configure cursor shape in
# visual mode, takes the value of fish_cursor_default when not specified
set fish_cursor_visual underscore blink


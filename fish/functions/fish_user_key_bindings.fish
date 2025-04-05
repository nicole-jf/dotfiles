#!/bin/fish
function fish_user_key_bindings
    #fish_hybrid_key_bindings # /usr/share/fish/functions/fish_hybrid_key_bindings.fish
    # Hybrid key bindings set in ~/.config/fish/conf.d/variables.fish
    # default mode is normal mode

    # Insert key to toggle between insert and replace mode
    bind -M insert -m replace insert repaint-mode
    bind -M replace -m insert insert repaint-mode
    bind -M replace_one -m insert insert repaint-mode
    # Insert key to start insert mode from normal mode
    bind -M default -m insert -k ic repaint-mode
    
    # Some keybinds seem to be missing of replace and replace_one mode
    bind -M replace left backward-char # <Left arrow> to move cursor left
    bind -M replace right forward-char # <Right arrow> to move cursor right
    bind -M replace ctrl-left backward-word # <Left arrow>-<Control> to move cursor one word left
    bind -M replace alt-b backward-word
    bind -M replace ctrl-right forward-word # <Right arrow>-<Control> to move cursor one word right
    bind -M replace alt-f forward-word
    bind -M replace end end-of-line
    bind -M replace home beginning-of-line
    bind -M replace ctrl-delete kill-word
    bind -M replace ctrl-backspace backward-kill-word

    bind -M replace_one left backward-char # <Left arrow> to move cursor left
    bind -M replace_one right forward-char # <Right arrow> to move cursor right
    bind -M replace_one ctrl-left backward-word # <Left arrow>-<Control> to move cursor one word left
    bind -M replace_one alt-b backward-word
    bind -M replace_one ctrl-right forward-word # <Right arrow>-<Control> to move cursor one word right
    bind -M replace_one alt-f forward-word
    bind -M replace_one end end-of-line
    bind -M replace_one home beginning-of-line
    bind -M replace_one ctrl-delete kill-word
    bind -M replace_one ctrl-backspace backward-kill-word

    # These are presented in bash's readline and are trivial to add
    # Control - ]   <char>
    bind -M default ctrl-] forward-jump # Jump to <char> works like f in vi
    # Control - Meta - ]    <char>
    bind -M default ctrl-alt-] backward-jump # Same but jump backwards
    # For the other modes too
    bind -M visual ctrl-] forward-jump
    bind -M visual ctrl-alt-] backward-jump
    bind -M insert ctrl-] forward-jump
    bind -M insert ctrl-alt-] backward-jump
    bind -M replace ctrl-] forward-jump
    bind -M replace ctrl-alt-] backward-jump
    bind -M replace_one ctrl-] forward-jump
    bind -M replace_one ctrl-alt-] backward-jump
end

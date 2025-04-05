#!/bin/fish
function fish_user_key_bindings
    #fish_hybrid_key_bindings # /usr/share/fish/functions/fish_hybrid_key_bindings.fish
    # Hybrid key bindings set in ~/.config/fish/conf.d/variables.fish
    # default mode is normal mode

    # Insert key to toggle between insert and replace mode
    bind -M insert -m replace insert repaint-mode
    bind -M replace -m insert insert repaint-mode
    bind -M replace-one -m insert insert repaint-mode
    # Insert key to start insert mode from normal mode
    bind -M default -m insert -k ic repaint-mode
    
    # Some keybinds seem to be missing of replace and replace-one mode
    bind -M replace left backward-char # <Left arrow> to move cursor left
    bind -M replace right forward-char # <Right arrow> to move cursor right
    bind -M replace control-left backward-word # <Left arrow>+<Control> to move cursor one word left
    bind -M replace alt+b backward-word
    bind -M replace control-right forward-word # <Right arrow>+<Control> to move cursor one word right
    bind -M replace alt+f forward-word
    bind -M replace end end-of-line
    bind -M replace home beginning-of-line
    bind -M replace control+delete kill-word
    bind -M replace control+backspace backward-kill-word

    bind -M replace-one left backward-char # <Left arrow> to move cursor left
    bind -M replace-one right forward-char # <Right arrow> to move cursor right
    bind -M replace-one control-left backward-word # <Left arrow>+<Control> to move cursor one word left
    bind -M replace-one alt+b backward-word
    bind -M replace-one control-right forward-word # <Right arrow>+<Control> to move cursor one word right
    bind -M replace-one alt+f forward-word
    bind -M replace-one end end-of-line
    bind -M replace-one home beginning-of-line
    bind -M replace-one control+delete kill-word
    bind -M replace-one control+backspace backward-kill-word

    # These are presented in bash's readline and are trivial to add
    # Control + ]   <char>
    bind -M default control+] forward-jump # Jump to <char> works like f in vi
    # Control + Meta + ]    <char>
    bind -M default control+alt+] backward-jump # Same but jump backwards
    # For the other modes too
    bind -M visual control+] forward-jump
    bind -M visual control+alt+] backward-jump
    bind -M insert control+] forward-jump
    bind -M insert control+alt+] backward-jump
    bind -M replace control+] forward-jump
    bind -M replace control+alt+] backward-jump
    bind -M replace-one control+] forward-jump
    bind -M replace-one control+alt+] backward-jump
end

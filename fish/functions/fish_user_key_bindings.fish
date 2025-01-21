#!/bin/fish
function fish_user_key_bindings
    #fish_hybrid_key_bindings # /usr/share/fish/functions/fish_hybrid_key_bindings.fish
    # Hybrid key bindings set in ~/.config/fish/conf.d/variables.fish
    # default mode is normal mode

    # <Control>+<Delete> deletes word
    bind -M default \e\[3\;5~ kill-word
    bind -M insert \e\[3\;5~ kill-word
    bind -M replace \e\[3\;5~ kill-word
    bind -M replace-one \e\[3\;5~ kill-word

    # <Control>+<Backspace> deletes backward word (this also binds Control+H)
    bind -M default \cH backward-kill-word
    bind -M insert \cH backward-kill-word
    bind -M replace \cH backward-kill-word
    bind -M replace-one \cH backward-kill-word

    # Insert key to toggle between insert and replace mode
    bind -M insert -m replace -k ic repaint-mode
    bind -M replace -m insert -k ic repaint-mode
    bind -M replace-one -m insert -k ic repaint-mode
    bind -M replace-one -m insert -k ic replace-one
    # Insert key to start insert mode from normal mode
    bind -M default -m insert -k ic repaint-mode
    
    # Some keybinds seem to be missing of replace and replace-one mode
    bind -M replace \e\[D backward-char # <Left arrow> to move cursor left
    bind -M replace \e\[C forward-char # <Right arrow> to move cursor right
    bind -M replace \e\[1\;5D backward-word # <Left arrow>+<Control> to move cursor one word left
    bind -M replace \e\[1\;5C forward-word # <Right arrow>+<Control> to move cursor one word right
    bind -M replace -k end end-of-line
    bind -M replace -k home beginning-of-line

    # Fix Delete key
    bind --erase --preset -k dc
    bind -M default -k dc delete-char
    bind -M insert -k dc delete-char
    bind -M visual -k dc delete-char

    # These are presented in bash's readline and are trivial to add
    # Control + ]   <char>
    bind -M default \c] forward-jump # Jump to <char> works like f in vi
    # Control + Meta + ]    <char>
    bind -M default \e\c] backward-jump # Same but jump backwards
    bind -M visual \c] forward-jump
    bind -M visual \e\c] backward-jump
    bind -M insert \c] forward-jump
    bind -M insert \e\c] backward-jump
    bind -M replace \c] forward-jump
    bind -M replace \e\c] backward-jump
    bind -M replace-one \c] forward-jump
    bind -M replace-one \e\c] backward-jump

    # My custom rebind
    #    bind --erase --preset -M insert \cv
    #    bind --erase --preset -M visual \cv
    #    bind -M insert \cV 'echo; fish_key_reader -V; commandline -f repaint'
end

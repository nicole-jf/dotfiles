#!/bin/fish

# Aliases
alias less="less -r --use-color --mouse"
alias vi="nvim"

# Enable color support of ls and also add handy aliases
if type -q eza
   alias la='eza -aF --icons'
   alias ls='eza -F --icons'
   alias ll='eza -lF --time-style=long-iso --group --color-scale  --header --icons'
   alias lla='eza -lF --all --time-style=long-iso --group --color-scale  --header --icons'
else if type -q exa
   alias la='exa -aF --icons'
   alias ls='exa -F --icons'
   alias ll='exa -lF --time-style=long-iso --group --color-scale  --header --icons'
   alias lla='exa -lF --all --time-style=long-iso --group --color-scale  --header --icons'
else
    alias la='ls -aF --color=auto'
    alias ls='ls -aF --color=auto'
    alias ll='ls -lF --color=auto'
    alias lla='ls -alF --color=auto'
end

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# bat
if type -q batcat
   alias bat="batcat -pP --theme=ansi"
else
   alias bat="bat -pP --theme=ansi"
end

if type -q fdfind
   alias fd="fdfind"
end


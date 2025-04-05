#!/usr/bin/env fish

# Aliases
# alias less="less -r --use-color --mouse"
if type -q nvim
    alias vi="nvim"
end

# Enable color support of ls and also add handy aliases
if type -q eza
   alias la='eza -aF'
   alias ls='eza -F'
   alias ll='eza -lF --time-style=long-iso --group --color-scale  --header'
   alias lla='eza -lF --all --time-style=long-iso --group --color-scale  --header'
else if type -q exa
   alias la='exa -aF --icons'
   alias ls='exa -F --icons'
   alias ll='exa -lF --time-style=long-iso --group --color-scale  --header'
   alias lla='exa -lF --all --time-style=long-iso --group --color-scale  --header'
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
else if type -q bat
   alias bat="bat -pP --theme=ansi"
end

if type -q fdfind
   alias fd="fdfind"
end


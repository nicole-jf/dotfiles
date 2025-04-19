#!/usr/bin/env fish

alias man="MANWIDTH=(math '$COLUMNS - 7') command man"
# Aliases
# alias less="less -r --use-color --mouse"
if type -q nvim
    alias vi="nvim"
end

# Enable color support of ls and also add handy aliases
if type -q eza
   alias la='eza -aF'
   alias ls='eza -F'
   alias ll='eza -blF --time-style=long-iso --group --color-scale --git --header'
   alias lla='eza -blF --all --time-style=long-iso --group --color-scale --git --header'
else if type -q exa
   alias la='exa -aF'
   alias ls='exa -F'
   alias ll='exa -lF --time-style=long-iso --group --color-scale --git --header'
   alias lla='exa -lF --all --time-style=long-iso --group --color-scale --git --header'
else
    alias la='ls -aF --color=auto'
    alias ls='ls -aF --color=auto'
    alias ll='ls -hlF --color=auto'
    alias lla='ls -halF --color=auto'
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


#!/bin/sh
stow -d ~/src/dotfiles -t ~/.config .
stow -d ~/src/dotfiles/home -t ~/ .
# stow-local-ignore

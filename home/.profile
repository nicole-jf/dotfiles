#!/bin/sh
# ~/.profile: executed by the command interpreter for login shells.
# I believe the above line to be wrong, it is sourced by all interactive sh sessions it seems, and probably non interactive on too
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# Keep this file POSIX compliant as sh (dash or ash) may source it
# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
# set PATG so it includes cargo's binaries if they exist
if [ -d "$HOME/.cargo/bin" ] ; then
    PATH="$HOME/.cargo/bin:$PATH"
fi
if [ -d "$HOME/.cargo/env" ] ; then
    . "$HOME/.cargo/env"
fi

# if shell is sh (probably dash or ash) export .shrc as ENV, ENV gets sourced by login shells only (shells started at the VT or manually specified with -l)
#if [ $(ps -p $$ -o comm=) = "sh" ]; then
#    ENV=$HOME/.shrc; export ENV
#fi

# Fix GTK apps not using my font for whatever reason
gsettings set org.gnome.desktop.interface font-name 'Terminus 11' &
gsettings set org.gnome.desktop.interface documet-font-name 'Terminus 11' &
gsettings set org.gnome.desktop.interface monospace-font-name 'Terminus 11' &

# If shell is interactive do this
case $- in
    # Check if it is already in a multiplexer or some place where starting a multiplexer would be unwanted
    *i*) if [ -z "$ZELLIJ" ] && [ -z "$TMUX" ] && [ -z "$VIM" ] && [ -z "$INSIDE_EMACS" ] && [ -z "$NVIM" ] && [ "$TERM" != screen ]; then
            exec zellij
        else
            exec fish
        fi
    ;;
esac


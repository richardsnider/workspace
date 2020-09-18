#!/bin/bash

TERMINAL_COLOR_RESET="\[\033[0m\]"
TERMINAL_WHITE_BACKGROUND="\[\033[47m\]"
TERMINAL_BLACK_TEXT="\[\033[30m\]"
PS1="$TERMINAL_WHITE_BACKGROUND$TERMINAL_BLACK_TEXT[\D{%m-%d %T}]$TERMINAL_COLOR_RESET\W$ "

source set-aliases.sh
eval $($HOME/.linuxbrew/bin/brew shellenv)

#!/bin/bash

# Bail out early if non-interactive
case $- in
  *i*) ;;
    *) return;;
esac

full_path=$HOME/.bash-theme

type_exists() {
  [ "$(type -P "$1")" ]
}

# add gpg tty
export GPG_TTY=$(tty)

# Load colors first so they can be use in base theme
source "${full_path}/themes/colours.theme.sh"
source "${full_path}/themes/base.theme.sh"
source "${full_path}/themes/purity.theme.sh"

if [[ $PROMPT ]]; then
    export PS1="\["$PROMPT"\]"
fi

if ! type_exists '__git_ps1' ; then
  source "$full_path/git-prompt.sh"
fi

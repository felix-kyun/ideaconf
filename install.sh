#!/usr/bin/env bash

set -e

# check if running as root
uid=$(id -u)
if (( uid != 0 )); then
    echo "This script must be run as root."
    exec sudo "$0" "$@"
fi

if [ -n "$BASH_VERSION" ]; then
    # ensure bash_completions is installed to support completion installation
    echo "Installing ideapad-cli completion for bash..."
    install -Dm644 _ideapad-cli /usr/share/bash-completion/completions/ideapad-cli
    echo "ok"
elif [ -n "$ZSH_VERSION" ]; then
    echo "Installing ideapad-cli completion for zsh..."
    install -Dm644 _ideapad-cli /usr/share/zsh/site-functions/_ideapad-cli
    echo "ok"
else
    echo "Shell not detected or not supported for completion installation."
fi

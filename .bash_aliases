#!/bin/bash

# some directory info
alias la="ls -a"
alias ls='ls -CF --color=auto --ignore="NTUSER.*" --ignore="*.pyc" --ignore="ntuser.*"'
alias sl=ls
alias l=ls

# python and similar
alias py="python"
alias enter='fakeroot fakechroot chroot ~/root/'
alias ..='cd ..'
alias yummy='sh ~/dotfiles/yummy.sh'

# ssh things
alias attu='ssh tyoverby@attu.cs.washington.edu'

# jumping magic!
alias s='pwd > $HOME/.jump_dir'
alias j='cd `cat $HOME/.jump_dir`'
alias hai=~/hai/hai

# coreutils from homebrew
alias ls='gls --color'
alias ll='ls -l'
alias la='ls -a'

# git from homebrew
. /usr/local/etc/bash_completion.d/git-completion.bash

export PS1='\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w \[\033[00m\]$(__git_ps1 "(%s) ")\$ '

[[ -s "/Users/nick/.rvm/scripts/rvm" ]] && source "/Users/nick/.rvm/scripts/rvm"

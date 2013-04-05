# coreutils from homebrew
alias ls='gls --color'
alias ll='ls -l'
alias la='ls -a'

# rebuilds the Launch Services database and getS rid of duplicates in the Open With submen.
alias rebuild-openwith='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user'

# homebrew bash completion data
. `brew --prefix`/etc/bash_completion
. `brew --prefix`/etc/bash_completion.d/git-completion.bash

export PS1='\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w \[\033[00m\]$(__git_ps1 "(%s) ")\$ '

export PATH="`brew --prefix`/bin:`brew --prefix`/sbin:$PATH"

[[ -s "/Users/nick/.rvm/scripts/rvm" ]] && source "/Users/nick/.rvm/scripts/rvm"

# coreutils from homebrew
alias ls='gls --color'
alias ll='ls -l'
alias la='ls -a'
alias env='env | sort'
alias grep='grep --color=auto'

export EDITOR=vim

# rebuilds the Launch Services database and getS rid of duplicates in the Open With submen.
alias rebuild-openwith='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user'

# ldd isn't around on os x...
if [[ `uname` == 'Darwin' ]]; then
  alias ldd='otool -L'
fi

# homebrew bash completion data
. `brew --prefix`/etc/bash_completion

export PS1='\n\[\e[32;1m\](\[\e[37;1m\]\u@\h\[\e[32;1m\])-(\[\e[37;1m\]\w\[\e[32;1m\])$(__git_ps1 "-\[\e[32;1m\](\[\e[37;1m\]%s\[\e[32;1m\])")\n(\[\[\e[37;1m\]\!\[\e[32;1m\])⚡️ \[\e[0m\]'

export PATH="`brew --prefix`/bin:`brew --prefix`/sbin:$PATH"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

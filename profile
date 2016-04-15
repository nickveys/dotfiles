
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

[[ -s "$HOME/.asdf/asdf.sh" ]] && source "$HOME/.asdf/asdf.sh"
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

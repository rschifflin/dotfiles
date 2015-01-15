source ~/.bash_aliases
export CLICOLOR=1
export PATH=$HOME/.shell_scripts:$PATH # Custom utils
export PATH=/user/local/bin:$PATH
export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export PATH=$PATH:./node_modules/.bin # Add RVM to PATH for scripting

GIT_PS1_SHOWDIRTYSTATE=true
if command -v brew > /dev/null 2>&1; then
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi
fi

PS1='[\W$(__git_ps1 " (%s)")]'
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


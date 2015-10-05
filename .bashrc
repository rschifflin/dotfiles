export CLICOLOR=1

export PATH=/usr/local/bin:$PATH
export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export PATH=$PATH:./node_modules/.bin # Add base node modules to PATH

function cdl() {
 cd "$1" && ls -la
}

function grep_filetype() {
  find . -name "$1" -print0 | xargs -0 grep -rli "$2"
}

function flatten() {
  find "$1" -maxdepth 0 -type d -exec sh -c 'mv $0/* .;' {} \;
  rm -d "$1"
}

gcd() { cd $(git root); }

GIT_PS1_SHOWDIRTYSTATE=true
if command -v brew > /dev/null 2>&1; then
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi
fi

COLOR_PROMPT='\e[0;33m'
COLOR_GIT='\e[0;31m'
COLOR_OFF='\e[0m'
PS1='\['"$COLOR_PROMPT"'\][\W\['"$COLOR_GIT"'\]$(__git_ps1 " (%s)")\['"$COLOR_PROMPT"'\]]\['"$COLOR_OFF"'\] '
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

#Load git-prompt if present
test -r ~/.git-prompt && source ~/.git-prompt

#Load bash aliases if present
test -r ~/.bash_aliases && source ~/.bash_aliases

#Load a local bashrc if present
test -r ~/.bashrc.local && source ~/.bashrc.local

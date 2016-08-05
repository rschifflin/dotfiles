export CLICOLOR=3

export PATH=/usr/local/bin:$PATH
export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export PATH=$PATH:./node_modules/.bin # Add base node modules to PATH
export PATH=$PATH:$HOME/.cargo/bin # Add Rustup to PATH

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

#Load bash aliases if present
test -r ~/.bash_aliases && source ~/.bash_aliases

if command -v brew > /dev/null 2>&1; then
  if [ -f /usr/local/etc/bash_completion ]; then
    source /usr/local/etc/bash_completion
  fi
fi

PS1='[\W$(__git_ps1 " (%s)")]'
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

#Load a local bashrc if present
test -r ~/.bashrc.local && source ~/.bashrc.local

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Prefer Chrome
export BROWSER=chrome

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Enable Powerline
source /usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh
export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/share/python:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/local/sbin:/usr/local/share/python"

# Ensure that the homebrew directory is at the top of the path
export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/share/python::$PATH"

export PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"

# Configure Golang Workspace
export GOPATH=$HOME/workspace/go
export PATH=$GOPATH/bin:$PATH

# Set the Python Path environment variables
# export PYTHONPATH=$(brew --prefix)/lib/python2.7/site-packages:$PYTHONPATH

# Enable color terminal markup
alias ls='ls -G'
export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad

# VIM is the editor of choice
export EDITOR=vim

# Require that pip uses venv
export PIP_REQUIRE_VIRTUALENV=true

# Workaround for venv requirement defined above
syspip(){
   PIP_REQUIRE_VIRTUALENV="" pip "$@"
}

# Vi shortcuts in the terminal
set -o vi

# Reverse search
bindkey -v
bindkey '^R' history-incremental-search-backward

function activate {
  . vendor/python/bin/activate
}

function rm-filetype {
  find . -name \*.$@ -delete
}

export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init -)"

source /usr/local/opt/nvm/nvm.sh

export NVM_DIR="$HOME/.nvm"

export PATH=/Applications/Postgres.app/Contents/Versions/9.4/bin/:$PATH

[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Iterm2 integration
source ~/.iterm2_shell_integration.`basename $SHELL`

function cdgo {
  cd $GOPATH
}

function cdav {
  cd $GOPATH/src/github.com/spothero/availability
}

function cdsh {
  cd $GOPATH/src/github.com/spothero
}

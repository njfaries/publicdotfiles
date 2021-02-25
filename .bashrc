# Nathaniel's dotfiles.
# Beware all ye who enter here
# You can comment out or remove sourcing statements for things you don't want or need

# Dotfile root folder path
export DOTFILES=$HOME/.dotfiles

# Editor
export EDITOR='vim'

# Cow pasture
export COWPATH=$DOTFILES/bin/cows

# Prompt
if [ -e "$DOTFILES/prompt" ]; 
then
    source $DOTFILES/prompt
fi

# Go

if [ -e "$DOTFILES/go" ];
then
    source $DOTFILES/go
fi

# Path

function path_add()
{
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]];
    then
        PATH="${PATH:+"$PATH:"}$1"
    fi
}

export PATH=''

# TODO make this nicer
path_add "$DOTFILES/bin"
path_add "/Applications/MAMP/bin/php/php7.2.20/bin"
path_add "/usr/local/bin"
path_add "/usr/bin"
path_add "/bin"
path_add "/usr/sbin"
path_add "/sbin"
path_add "$HOME/arcanist_install/arcanist/bin"
path_add "$GOPATH/bin"

# Variables
if [ -e "$DOTFILES/variables" ]
then
    source $DOTFILES/variables
fi

# Kube
if [ -e "$DOTFILES/kube" ]
then
    source $DOTFILES/kube
fi


# Legacy
# Things from .bash_profile that were there and I don't fully understand
export NVM_DIR=$HOME/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash" # no idea what this does

#export JAVA_HOME=$(/usr/libexec/java_home -v 1.8) #This has never really worked. Doesn't seem like I've needed it though.

# Aliases

if [ -e "$DOTFILES/aliases" ];
then
    source $DOTFILES/aliases
fi

# Functions

if [ -e "$DOTFILES/functions" ];
then
    source $DOTFILES/functions
fi

# Use this in this file, can't outsource it.
show_cow()
{
    R=$(($RANDOM%3))
    
    case $R in 
        0)
            cat $COWPATH/aperture.txt
            ;;
        1)
            cat $COWPATH/companion.txt
            ;;
        2)
            cat $COWPATH/cake.txt
            ;;
    esac
}

# Utilities
# Git branch auto-complete
if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi

# Startup text
# this breaks trying to do things over SSH

# show_cow

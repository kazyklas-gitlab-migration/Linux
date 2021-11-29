# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/tklas/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="steeef"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting dirhistory sudo)

source $ZSH/oh-my-zsh.sh

# setup correction
setopt correct

#. "/home/tklas/.acme.sh/acme.sh.env"

##########################################################################
#       ALIASES
##########################################################################

alias genpasswd="strings /dev/urandom | grep -o '[[:alnum:]]' | head -n 30 | tr -d '\n'; echo"

# Git aliases
alias gclone="git clone"
alias gpush="git push"
alias gpull="git pull"

# Docker aliases
alias dpsa="docker ps -a"
alias drun="docker run"
alias dlogs="docker logs --follow --timestamps"
alias dpull="docker pull"

# Listing aliases
alias ll='ls -alF --color=auto'
alias la='ls -A --color=auto'
alias l='ls -CF --color=auto'

# K8s aliases
alias kga='kubectl get all'
alias kgn='kubectl get nodes'

# Create script
alias create-script='cp /home/tklas/Documents/script-template $(date +%Y%m%d)_script.sh'

##########################################################################
#      HISTORY manipulation 
##########################################################################

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000000
HISTFILESIZE=500000


##########################################################################
#       FUNCTIONS
##########################################################################

# This function will take the file and based on the 
# extension will use the correct algorithm to untar an archive
extract() { 
    if [ -f $1 ] ; then 
    case $1 in 
        *.tar.bz2)   nice -n 10 ionice -c 3 tar xjf $1     ;; 
        *.tar.gz)    nice -n 10 ionice -c 3 tar xzf $1     ;; 
        *.bz2)       nice -n 10 ionice -c 3 bunzip2 $1     ;; 
        *.rar)       nice -n 10 ionice -c 3 unrar e $1     ;; 
        *.gz)        nice -n 10 ionice -c 3 gunzip $1      ;; 
        *.tar)       nice -n 10 ionice -c 3 tar xf $1      ;; 
        *.tbz2)      nice -n 10 ionice -c 3 tar xjf $1     ;; 
        *.tgz)       nice -n 10 ionice -c 3 tar xzf $1     ;; 
        *.zip)       nice -n 10 ionice -c 3 unzip $1       ;; 
        *.Z)         nice -n 10 ionice -c 3 uncompress $1  ;; 
        *.7z)        nice -n 10 ionice -c 3 7z x $1        ;; 
        *)     echo "'$1' cannot be extracted via extract()" ;; 
    esac 
    else 
        echo "'$1' is not a valid file" 
    fi 
} 


PATH=$PATH:/home/ubuntu/Documents/linux/scripts 
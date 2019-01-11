export PATH=$PATH
export LS_COLORS="fi=00:di=34:ow=34;40:ln=35:pi=30;44:so=35;44:do=35;44:bd=33;44:cd=37;44:or=05;37;41:mi=05;37;41:ex=01;31"

DOTFILES=$HOME/.dotfiles
ZSH=$DOTFILES/zsh

source $ZSH/config.zsh


# autoload -U compinit && compinit

# zsh plugin manager
source $ZSH/antigen.zsh

# alias
alias ls='ls --color=auto -h'
alias l='ls -Al'
alias cp='cp -v'
alias rm='rm -v'
alias mv='mv -v'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

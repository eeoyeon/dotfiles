export PATH=$HOME/.local/bin:$PATH
export LS_COLORS="fi=00:di=34:ow=34;40:ln=35:pi=30;44:so=35;44:do=35;44:bd=33;44:cd=37;44:or=05;37;41:mi=05;37;41:ex=01;31"

export DOTFILES=$HOME/.dotfiles
export ZSH=$DOTFILES/zsh
fpath=($ZSH/completions $fpath)
source $ZSH/config.zsh

[[ -e /etc/zsh_command_not_found ]] && source /etc/zsh_command_not_found

ZCOMPDUMP="$HOME/.zcompdump-${ZSH_VERSION}"

# Load antibody
[ ! -f $ZSH/plugins.sh ] && antibody bundle < $ZSH/plugins.txt > $ZSH/plugins.sh
source $ZSH/plugins.sh

autoload -Uz compinit
for dump in $ZCOMPDUMP(N.mh+6); do
  compinit -d $ZCOMPDUMP
done
compinit -C -d $ZCOMPDUMP

unset ZCOMPDUMP

# alias
alias ls='ls --color=auto'
alias l='ls -Ahl'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

set -gx EDITOR vim

alias ls='ls --color=auto'
alias l='ls -Ahl'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# THEME PURE #
set fish_function_path /home/mmazzz/.config/fish/functions/theme-pure/functions/ $fish_function_path
source /home/mmazzz/.config/fish/functions/theme-pure/conf.d/pure.fish

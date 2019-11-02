### options
setopt AUTO_CD
setopt COMPLETE_IN_WORD
unsetopt LIST_BEEP
unsetopt BEEP
## history
HISTFILE=$HOME/.history
HISTSIZE=1000
SAVEHIST=1000

setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_VERIFY
## completion
zstyle ':completion:*' menu select
# case insenstive
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'

zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# kill
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;32=0=0'
zstyle ':completion:*:*:*:*:processes' command 'ps -u $USER -o pid,user,comm'

# ssh/scp/rsync
zstyle ':completion:*:(ssh|scp|rsync):*' tag-order 'hosts:-host:host hosts:-domain:domain hosts:-ipaddr:ip\ address *'
zstyle ':completion:*:(scp|rsync):*' group-order users files all-files hosts-domain hosts-host hosts-ipaddr
zstyle ':completion:*:ssh:*' group-order users hosts-domain hosts-host users hosts-ipaddr
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-host' ignored-patterns '*(.|:)*' loopback ip6-loopback localhost ip6-localhost broadcasthost
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-domain' ignored-patterns '<->.<->.<->.<->' '^[-[:alnum:]]##(.[-[:alnum:]]##)##' '*@*'
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-ipaddr' ignored-patterns '^(<->.<->.<->.<->|(|::)([[:xdigit:].]##:(#c,2))##(|%*))' '127.0.0.<->' '255.255.255.255' '::1' 'fe80::*'


zstyle ':completion::complete:*' use-cache true
zstyle ':completion::complete:*' cache-path "$HOME/.cache/zcompcache"

zstyle ':completion:*:*:*:users' ignored-patterns \
        adm amanda apache at avahi avahi-autoipd beaglidx bin cacti canna \
        clamav daemon dbus distcache dnsmasq dovecot fax ftp games gdm \
        gkrellmd gopher hacluster haldaemon halt hsqldb ident junkbust kdm \
        ldap lp mail mailman mailnull man messagebus  mldonkey mysql nagios \
        named netdump news nfsnobody nobody nscd ntp nut nx obsrun openvpn \
        operator pcap polkitd postfix postgres privoxy pulse pvm quagga radvd \
        rpc rpcuser rpm rtkit scard shutdown squid sshd statd svn sync tftp \
        usbmux uucp vcsa wwwrun xfs '_*'

# bindkey
autoload -U up-line-or-beginning-search && zle -N up-line-or-beginning-search
autoload -U down-line-or-beginning-search && zle -N down-line-or-beginning-search

bindkey -e  # default emasc keybinding
bindkey "$terminfo[kcuu1]" up-line-or-beginning-search # ["↑"]
bindkey "$terminfo[kcud1]" down-line-or-beginning-search # ["↓"]
bindkey '^[[1;5D' backward-word # ["ctrl+←"]
bindkey '^[[1;5C' forward-word  # ["ctrl+→"]
bindkey '^[[3;5~' delete-word   # ["ctrl+delete"]
# bindkey "^H" backward-delete-word # ["ctrl+backspace" or "ctrl+H"] ="^W"
bindkey ' ' magic-space         # ["space"] Perform history expansion and insert a space into the buffer. This is intended to be bound to space.
bindkey '^[m' copy-prev-shell-word # ["alt+m"]
bindkey '^[[OM' accept-line # ["numberpad[enter]"]

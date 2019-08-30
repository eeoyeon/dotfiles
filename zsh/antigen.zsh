# zsh plugins manager
source $DOTFILES/antigen/antigen.zsh
# ADOTDIR=$HOME/.antigen

antigen bundles <<EOBUNDLES
  $ZSH/plugins --no-local-clone
  zsh-users/zsh-completions
  zsh-users/zsh-autosuggestions
  zsh-users/zsh-syntax-highlighting

  ## theme
  mafredri/zsh-async
  sindresorhus/pure
EOBUNDLES
# antigen cleanup
antigen apply

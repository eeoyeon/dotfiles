#!/usr/bin/env fish
set BASEDIR (realpath (dirname (status -f)))
set DOTFILES $HOME/.dotfiles

ln -sfnv $BASEDIR $DOTFILES
ln -sfnv $DOTFILES/git/gitconfig ~/.gitconfig

if test -e "$HOME/.config/fish" 
  rm -rf $HOME/.config/fish.old
  mv -f $HOME/.config/fish{,.old}
end

ln -sfnv $DOTFILES/fish ~/.config/fish

set fisher_path $__fish_config_dir/plugins
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
fisher update

echo "reload fish"

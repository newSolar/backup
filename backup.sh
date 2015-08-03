#!/usr/bin/env sh

#emacs backup
rsync -av --exclude "elpa" ~/.emacs.d ~/backup/emacs.backup
cp ~/.spacemacs ~/backup/emacs.backup

#vim backup
cp -r ~/.vim/ ~/backup/vim.backup
cp ~/.vimrc ~/backup/vim.backup

#tint2 backup
cp ~/.config/tint2/aself.tint2rc ~/backup/tint2.backup

#openbox backup
cp ~/.config/openbox/* ~/backup/openbox.backup

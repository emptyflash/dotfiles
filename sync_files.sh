git pull
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/vimrc ~/init.vim
ln -s ~/dotfiles/init.el ~/.emacs.d/init.el
vim +PluginInstall +qall

git pull
ln -s ~/dotfiles/vimrc ~/.vimrc
mkdir -p ~/.config/nvim
ln -s ~/dotfiles/bash_profile ~/.bash_profile
ln -s ~/dotfiles/vimrc ~/.config/nvim/init.vim
ln -s ~/dotfiles/init.el ~/.emacs.d/init.el
vim +PluginInstall +qall

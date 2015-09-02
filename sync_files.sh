git pull
ln -s ~/dotfiles/vimrc ~/.vimrc
vim +PluginInstall +qall
mkdir ~/.vim/colors
cp ~/.vim/bundle/*/colors/* ~/.vim/colors

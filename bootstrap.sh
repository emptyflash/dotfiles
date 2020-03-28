# Install Vundle
OS=$(lsb_release -d | awk '{ print $2; }' || uname)
if [ "$OS" == "Ubuntu" ]; then
    sudo add-apt-repository ppa:neovim-ppa/stable
    sudo apt-get update
    sudo apt-get install vim neovim python3-dev python3-pip
    sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
fi
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
sudo pip3 install websocket-client sexpdata neovim
mkdir -p ~/tmp

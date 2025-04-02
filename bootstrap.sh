# Install Vundle
OS=$(lsb_release -d | awk '{ print $2; }' || uname)
if [ "$OS" == "Ubuntu" ]; then
    sudo add-apt-repository ppa:neovim-ppa/stable
    sudo apt-get update
    sudo apt-get install vim neovim python3-dev python3-pip
    sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
    curl -LO https://github.com/neovim/neovim/releases/download/v0.11.0/nvim-linux-x86_64.appimage
    chmod +x nvim-linux-x86_64.appimage
    sudo mv nvim-linux-x86_64.appimage /usr/bin/nvmim
fi
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
sudo pip3 install websocket-client sexpdata neovim
mkdir -p ~/tmp

#  RR TODO: move all ~/app files to ~/.local/bin
# Script to be ran after provision.sh + after initializing dotbot

# Install latest nvim
wget https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz -P ~/.dots/local/nvim
cd ~/.dots/local/nvim
tar xzvf nvim-linux64.tar.gz

# Install Plug for neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'


# rust-analyzer LSP for nvim
curl -LO https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz
gunzip rust-analyzer-x86_64-unknown-linux-gnu.gz
chmod +x rust-analyzer-x86_64-unknown-linux-gnu
sudo mv rust-analyzer-x86_64-unknown-linux-gnu /usr/local/bin/rust-analyzer

# Return to dots dir
cd ~/.dots

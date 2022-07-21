# Script to be ran after provision.sh + after initializing dotbot

# Install latest nvim
wget https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz -P ~/.dots/app/nvim
cd ~/.dots/app/nvim
tar xzvf nvim-linux64.tar.gz

# Script to be ran after provision.sh + after initializing dotbot

# Install latest nvim
wget https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz -P ~/.local/bin/nvim
cd ~/.local/bin/nvim
tar xzvf nvim-linux64.tar.gz

# Install Plug for neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Install rust-analyzer for neovim support
wget https://github.com/rust-lang/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz -P ~/.local/bin/rust-analyzer
cd ~/.local/bin/rust-analyzer
gzip rust-analyzer-x86_64-unknown-linux-gnu.gz -d
mv rust-analyzer-x86_64-unknown-linux-gnu rust-analyzer
chmod +x ~/.local/bin/rust-analyzer/rust-analyzer

# Install go
mkdir -p ~/.local/bin/go
cd ~/.local/bin/go
curl -OL https://golang.org/dl/go1.16.7.linux-amd64.tar.gz
sudo tar -C /usr/local -xvf go1.16.7.linux-amd64.tar.gz

# Return to dots dir
cd ~/.dots

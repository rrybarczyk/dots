#  RR TODO: move all ~/app files to ~/.local/bin
# Script to be ran after provision.sh + after initializing dotbot

# Install latest nvim
wget https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz -P ~/.dots/app/nvim
cd ~/.dots/app/nvim
tar xzvf nvim-linux64.tar.gz

# Install Plug for neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Install rust-analyzer
wget https://github.com/rust-lang/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz -P ~/.dots/app/rust-analyzer
cd ~/.dots/app/rust-analyzer
gzip rust-analyzer-x86_64-unknown-linux-gnu.gz -d
mv rust-analyzer-x86_64-unknown-linux-gnu rust-analyzer
chmod +x ~/.dots/app/rust-analyzer/rust-analyzer

# #  RR TODO: move all ~/app files to ~/.local/bin
# # Install rust-analyzer for neovim rust LSP support
# # https://rust-analyzer.github.io/manual.html#rust-analyzer-language-server-binary
# curl -L https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz | gunzip -c - > ~/.local/bin/rust-analyzer
# chmod +x ~/.local/bin/rust-analyzer

# Download Headless Chrome
# Must have ran following (executed in 1-provision.sh)
#   sudo apt install -y libappindicator1 fonts-liberation
#   sudo apt install -f
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -P ~/.dots/app/google-chrome-stable
sudo dpkg -i ~/.dots/app/google-chrome-stable/google-chrome*.deb

# # Headless Chrome Run Instructions:
# google-chrome-stable -version
# google-chrome-stable --headless --disable-gpu --print-to-pdf https://gf.dev/

# Return to dots dir
cd ~/.dots

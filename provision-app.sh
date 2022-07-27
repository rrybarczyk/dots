# Script to be ran after provision.sh + after initializing dotbot

# Install latest nvim
wget https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz -P ~/.dots/app/nvim
cd ~/.dots/app/nvim
tar xzvf nvim-linux64.tar.gz

# Install rust-analyzer
wget https://github.com/rust-lang/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz -P ~/.dots/app/rust-analyzer
cd ~/.dots/app/rust-analyzer
gzip rust-analyzer-x86_64-unknown-linux-gnu.gz -d
mv rust-analyzer-x86_64-unknown-linux-gnu rust-analyzer
chmod +x ~/.dots/app/rust-analyzer/rust-analyzer

# Return to dots dir
cd ~/.dots

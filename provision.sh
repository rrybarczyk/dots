# For MacOSx
# Exit script upon fail, error if variable undefined, print each command
set -euxo pipefail

# Set git credentials
git config --global user.name "Rachel Rybarczyk"
git config --global user.email "rachel.rybarczyk@gmail.com"

## Install brew package manger
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
export PATH=/opt/homebrew/bin:$PATH
export PATH=$PATH:/Users/rachel/.local/bin/nvim-macos/bin
brew install zsh lspconfig tmux wget htop tree lolcat watchexec tmux-mem-cpu-load
# brew install imagemagick gnu-time gnupg2 git-lfs
# brew install rust-analyzer
# brew cask install mactex-no-gui
# brew cask install ngrok
# brew cask install wireshark

## Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

### Install 3rd Party Binaries
mkdir -p ~/.local/bin

## Install neovim
wget https://github.com/neovim/neovim/releases/download/v0.9.5/nvim-macos.tar.gz -P ~/.local/bin
xattr -c ~/.local/bin/nvim-macos.tar.gz
tar xzvf ~/.local/bin/nvim-macos.tar.gz -C ~/.local/bin
rm -rf ~/.local/bin/nvim-macos.tar.gz

## Install Rust
curl -sSf https://sh.rustup.rs | sh
source ~/.profile
rustup install nightly
rustup component add rustfmt
rustup component add clippy

bat               - a colorful cat
exa               - a colorful ls
fd-find           - a better find
hexyl             - hex dump
just              - a better make <3
qc                - an advanced RPN cli calculator
ripgrep           - a better grep
xsv               - fast csv cli toolkit
cargo-check       - checks for rust code errors
cargo-edit        - add, remove, upgrade dependencies from cli
flamegraph  - generate flamegraphs and profiling data
cargo-outdated    - indicates when Rust dependencies are out of date
cargo-watch       - reload cargo commands on file save
cargo install just fd-find ripgrep qc
# cargo install bat exa hexyl xsv cargo-check cargo-edit cargo-outdated cargo-watch

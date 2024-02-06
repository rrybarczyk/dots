# For MacOSx
# Exit script upon fail, error if variable undefined, print each command
set -euxo pipefail

# # Set git credentials
git config --global user.name "Rachel Rybarczyk"
git config --global user.email "rachel.rybarczyk@gmail.com"

## Install brew package manger + add to path
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# # For Intel Macs
# export PATH=/opt/homebrew/bin:$PATH
# For Apple Silicon Macs
export PATH="/opt/homebrew/bin:$PATH"

brew install neovim tmux wget htop tree lolcat watchexec tmux-mem-cpu-load
brew install imagemagick gnu-time gnupg2 git-lfs
brew install rust-analyzer
brew cask install mactex-no-gui
brew cask install ngrok
brew cask install wireshark

## Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# Install zsh-syntax-highlighting in oh-my-zsh plugins directory
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting


## Install Plug for neovim
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


## Install Rust
curl -sSf https://sh.rustup.rs | sh
source ~/.profile
rustup install nightly
rustup component add rustfmt
rustup component add clippy
#
# bat               - a colorful cat
# exa               - a colorful ls
# fd-find           - a better find
# hexyl             - hex dump
# just              - a better make <3
# qc                - an advanced RPN cli calculator
# ripgrep           - a better grep
# xsv               - fast csv cli toolkit
# cargo-check       - checks for rust code errors
# cargo-edit        - add, remove, upgrade dependencies from cli
# flamegraph  - generate flamegraphs and profiling data
# cargo-outdated    - indicates when Rust dependencies are out of date
# cargo-watch       - reload cargo commands on file save
cargo install just fd-find ripgrep qc
cargo install bat exa hexyl
cargo install cargo-check cargo-edit cargo-outdated cargo-watch

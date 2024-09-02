# For MacOSx
# Exit script upon fail, error if variable undefined, print each command
set -euxo pipefail

# # Set git credentials
git config --global user.name "RJ Rybarczyk"
git config --global user.email "rj@rybar.tech"

## Install brew package manger + add to path
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# # For Intel Macs
# export PATH=/opt/homebrew/bin:$PATH
# For Apple Silicon Macs
export PATH="/opt/homebrew/bin:$PATH"

brew install neovim tmux wget htop tree lolcat watchexec tmux-mem-cpu-load fzf
# brew install imagemagick gnu-time gnupg2 git-lfs
brew install rust-analyzer
# brew cask install mactex-no-gui
# brew cask install ngrok
# brew cask install wireshark

## Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

## Install Plug for neovim
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
. "$HOME/.cargo/env"

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
# cargo install bat exa hexyl
# cargo install cargo-check cargo-edit cargo-outdated cargo-watch

# Force symlink bash scripts
ln -sf ~/.dots/etc/zshrc ~/.zshrc
ln -sf ~/.dots/etc/zshenv ~/.zshenv

git remote remove origin
git remote add origin git@github.com:rrybarczyk/dots.git

#  Error if variable undefined, print each command
# set -euf -o pipefile

sudo apt install zsh
chsh -s /usr/bin/zsh

sudo apt install cmake pkg-config libssl-dev libglib2.0-dev gcc-multilib libmysqlclient-dev

# To get diesel_cli working for mysql
sudo apt-get install libmysqlclient-dev libpq-dev libmariadbclient-dev-compat libsqlite3-dev


# XCB Library for Interoperability with Xlib
sudo apt install libxcb-shape0-dev libxcb-xfixes0-dev

# Bitcoin build
sudo apt install autoconf libboost-all-dev libevent-dev
sudo apt-get install libdb++-dev

# Install python
sudo apt install software-properties-common
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update
sudo apt install python3-pip
sudo apt-get install python3-venv 

# Install neovim
sudo apt install libtool automake libncurses5-dev g++
sudo apt install neovim

# nvim-lspconfig dependency
sudo npm i -g pyright

# Niceities
sudo apt install tldr wget -y

sudo apt install fzf
# Better search to supplement fzf vim plugin
sudo apt install silversearcher-ag

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# Source cargo
. "$HOME/.cargo/env"

# Install useful rustup tools and global crates
rustup install nightly
rustup component add rustfmt
rustup component add clippy
rustup component add rust-src

# bat               - a colorful cat
# exa               - a colorful ls
# fd-find           - a better find
# just              - a better make <3
# qc                - an advanced RPN cli calculator
# quick-calc        - an advanced RPN cli calculator that has more features
# ripgrep           - a better grep
# xsv               - fast csv cli toolkit
# cargo-check       - checks for rust code errors
# cargo-edit        - add, remove, upgrade dependencies from cli
# cargo-flamegraph  - generate flamegraphs and profiling data
# cargo-outdated    - indicates when Rust dependencies are out of date
# cargo-watch       - reload cargo commands on file save
# watchexec-cli     - reload any commands on file save
# cargo-add         - quickly add dependencies to Rust projects
# diesel_cli        - database tool
# Main cargo packages
cargo install bat exa fd-find just qc quick-calc ripgrep cargo-check cargo-edit cargo-add cargo-outdated cargo-watch watchexec-cli
# Extra cargo pacakges
cargo install xsv cargo-flamegraph diesel_cli

# Install rust-analyzer for neovim rust LSP support
# https://rust-analyzer.github.io/manual.html#rust-analyzer-language-server-binary
curl -L https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz | gunzip -c - > ~/.local/bin/rust-analyzer
chmod +x ~/.local/bin/rust-analyzer

# Install Plug for neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# DotBot Setup
git submodule update --init --recursive .
./dotbot/bin/dotbot -c install.conf.yaml

# Force symlink bash scripts
# ln -sf ~/.dots/etc/bashrc ~/.bashrc
# ln -sf ~/.dots/etc/bash_profile ~/.bash_profile
# ln -sf ~/.dots/etc/profile ~/.profile
source ~/.zshrc

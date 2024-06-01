#  Error if variable undefined, print each command
# set -euf -o pipefile

sudo apt update -y
sudo apt upgrade -y

sudo apt install cmake pkg-config libssl-dev libglib2.0-dev gcc-multilib -y

# # Headless Chrome Dependencies
# sudo apt install -y libappindicator1 fonts-liberation
# sudo apt install -f

# Bitcoin build
# sudo apt install autoconf libboost-all-dev libevent-dev -y
# sudo apt-get install libdb++-dev -y

# # # Install python
# # sudo apt install software-properties-common
# # sudo add-apt-repository ppa:deadsnakes/ppa
# # sudo apt update -y
# sudo apt install python3-pip -y
# sudo apt install flake8 -y
# sudo apt install python3.8-venv -y
# pip install pyright  # nvim-lspconfig dependency
# 
# # Poetry env install: https://python-poetry.org/docs/#installing-with-the-official-installer
# curl -sSL https://install.python-poetry.org | python3 -

# Install neovim - neovim is installed in 1-provision-env.sh as `sudo apt install neovim` installs
# old version
sudo apt install libtool automake libncurses5-dev g++ -y

# Niceities
sudo apt install tldr wget -y
# Better search to supplement fzf vim plugin
sudo apt install fzf silversearcher-ag -y

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# Source cargo
. "$HOME/.cargo/env"

## Install useful rustup tools and global crates
#rustup install nightly
#rustup component add rustfmt
#rustup component add clippy
#rustup component add rust-src
#
## bat               - a colorful cat
## exa               - a colorful ls
## fd-find           - a better find
## just              - a better make <3
## qc                - an advanced RPN cli calculator
## quick-calc        - an advanced RPN cli calculator that has more features
## ripgrep           - a better grep
## xsv               - fast csv cli toolkit
## cargo-check       - checks for rust code errors
## cargo-edit        - add, remove, upgrade dependencies from cli (includes cargo-add)
## cargo-add         - quickly add dependencies to Rust projects (INSTALLED WITH cargo-edit)
## cargo-flamegraph  - generate flamegraphs and profiling data
## cargo-outdated    - indicates when Rust dependencies are out of date
## cargo-watch       - reload cargo commands on file save
## watchexec-cli     - reload any commands on file save
## diesel_cli        - database tool
## Main cargo packages
#cargo install bat exa fd-find just qc quick-calc ripgrep cargo-check cargo-edit cargo-outdated cargo-watch watchexec-cli
## Extra cargo pacakges
## cargo install xsv cargo-flamegraph diesel_cli
## To get diesel_cli working for mysql
## sudo apt-get install libmysqlclient-dev libpq-dev libmariadbclient-dev-compat libsqlite3-dev libmysqlclient-dev -y
## cargo install diesel_cli

# Set global git username + email
git config --global user.name "Rachel Rybarczyk"
git config --global user.email "EMAIL"

# Force symlink bash scripts
 ln -sf ~/.dots/etc/bashrc ~/.bashrc
 ln -sf ~/.dots/etc/bash_profile ~/.bash_profile
 ln -sf ~/.dots/etc/profile ~/.profile
 ln -sf ~/.dots/etc/zshrc ~/.zshrc
 ln -sf ~/.dots/etc/zshenv ~/.zshenv

# DotBot Setup
git submodule update --init --recursive .
./dotbot/bin/dotbot -c install.conf.yaml

source ~/.bashrc

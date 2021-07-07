#  Error if variable undefined, print each command
# set -euf -o pipefile

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

# Install Jupyter Notebook
pip3 install jupyter-console

# Install neovim
sudo apt install libtool automake libncurses5-dev g++
sudo apt install neovim

# Install useful rustup tools and global crates
rustup install nightly
rustup component add rustfmt
rustup component add clippy

# bat               - a colorful cat
# exa               - a colorful ls
# fd-find           - a better find
# just              - a better make <3
# qc                - an advanced RPN cli calculator
# ripgrep           - a better grep
# xsv               - fast csv cli toolkit
# cargo-check       - checks for rust code errors
# cargo-edit        - add, remove, upgrade dependencies from cli
# cargo-flamegraph  - generate flamegraphs and profiling data
# cargo-outdated    - indicates when Rust dependencies are out of date
# cargo-watch       - reload cargo commands on file save
cargo install bat exa fd-find just qc ripgrep xsv cargo-check cargo-edit cargo-add cargo-flamegraph cargo-outdated cargo-watch diesel_cli

# DotBot Setup
git submodule update --init --recursive .
./submodules/dotbot/bin/dotbot -c default.yaml

# Force symlink bash scripts
# ln -sf ~/.dots/etc/bashrc ~/.bashrc
# ln -sf ~/.dots/etc/bash_profile ~/.bash_profile
# ln -sf ~/.dots/etc/profile ~/.profile
source ~/.bashrc


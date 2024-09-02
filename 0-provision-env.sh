#  Error if variable undefined, print each command
# set -euf -o pipefile

sudo apt update -y
sudo apt upgrade -y

sudo apt install libssl-dev libglib2.0-dev gcc-multilib -y

# Install neovim
sudo apt install libtool automake libncurses5-dev g++ -y

# Bitcoin build
sudo apt-get install build-essential cmake pkg-config python3 -y
sudo apt-get install libevent-dev libboost-dev -y
sudo apt install libsqlite3-dev -y
sudo apt install libminiupnpc-dev libnatpmp-dev -y
sudo apt-get install libzmq3-dev -y
sudo apt install systemtap-sdt-dev -y

# Niceities
sudo apt install ripgrep fd-find tldr just wget -y
sudo apt install fzf -y
# Better search to supplement fzf vim plugin
sudo apt install silversearcher-ag -y

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
. "$HOME/.cargo/env"

rustup component add rustfmt
rustup component add clippy
rustup component add rust-src # Used by rust-analyzer
rustup update

# Set global git username + email
git config --global user.name "RJ Rybarczyk"
git config --global user.email "rj@rybar.tech"

ln -s $(which fdfind) ~/.local/bin/fd

# Force symlink bash scripts
ln -sf ~/.dots/etc/bashrc ~/.bashrc
ln -sf ~/.dots/etc/bash_profile ~/.bash_profile

git remote remove origin
git remote add origin git@github.com:rrybarczyk/dots.git

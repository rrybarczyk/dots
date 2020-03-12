#  Error if variable undefined, print each command
# set -euf -o pipefile

# Update installed packages
sudo apt -y update
sudo apt -y full-upgrade

# Install packages if they do not already exist, default "y"

# General Enviornment Dev Tools
sudo apt install -y build-essential llvm libssl-dev pkg-config python3 python-pip3 ruby-full 
sudo apt install -y tmux git tree ngrep

# Niceities
sudo apt install -y lolcat 

# Install Rust
curl -sSf https://sh.rustup.rs | sh | sh -s -- -y
source $HOME/.cargo/bin

# Install useful rustup tools and global crates
rustup install nightly
rustup component add rustfmt
rustup component add clippy

cargo install ripgrep fd-find just bat exa qc cargo-watch cargo-check cargo-outdated cargo-edit

# DotBot Setup
git submodule update --init --recursive .
./submodules/dotbot/bin/dotbot -c default.yaml

# Force symlink bash scripts
# ln -sf ~/.dots/etc/bashrc ~/.bashrc
# ln -sf ~/.dots/etc/bash_profile ~/.bash_profile
# ln -sf ~/.dots/etc/profile ~/.profile
source ~/.bashrc


#  Error if variable undefined, print each command
# set -euf -o pipefile

# Update installed packages
sudo apt -y update
sudo apt -y full-upgrade

# Install packages if they do not already exist, default "y"

# General Enviornment Dev Tools
sudo apt install -y build-essential llvm libssl-dev pkg-config python3 python-pip3 ruby-full 
sudo apt install -y tmux git tree ngrep zlib1g bgpdump

# Niceities
sudo apt install -y lolcat 

# Install Rust
curl -sSf https://sh.rustup.rs | sh | sh -s -- -y
source $HOME/.cargo/bin
rustup install nightly
rustup component add rustfmt
rustup component add clippy

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
cargo install bat exa fd-find just qc ripgrep xsv cargo-check cargo-edit cargo-flamegraph cargo-outdated cargo-watch

# DotBot Setup
git submodule update --init --recursive .
./submodules/dotbot/bin/dotbot -c default.yaml

# Force symlink bash scripts
# ln -sf ~/.dots/etc/bashrc ~/.bashrc
# ln -sf ~/.dots/etc/bash_profile ~/.bash_profile
# ln -sf ~/.dots/etc/profile ~/.profile
source ~/.bashrc


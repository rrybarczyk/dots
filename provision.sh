#  Error if variable undefined, print each command
# set -euf -o pipefile

# Update installed packages
sudo apt -y update
sudo apt -y full-upgrade

# Install packages if they do not already exist, default "y"

# General Enviornment Dev Tools
sudo apt install -y build-essential llvm libssl-dev pkg-config cmake python python3 python-pip3 ruby-full
sudo apt install -y tmux git tree ngrep 

### Begin Bitcoin Build Packages
sudo apt install -y build-essential libtool autotools-dev automake pkg-config bsdmainutils python3
sudo apt install -y libevent-dev libboost-dev libboost-system-dev libboost-filesystem-dev libboost-test-dev
# SQLite is requited for descriptor wallet
sudo apt install -y libsqlite3-dev
# ZMQ dependencies (provides ZMQ API)
sudo apt -y install libzmq3-dev
### End Bitcoin Build Packages

mv ~/.bashrc ~/.bashrc.bk
mv ~/.profile ~/.profile.bk
mv ~/.bash_profile ~/.bash_profile.bk

# DotBot Setup
git submodule update --init --recursive .
./submodules/dotbot/bin/dotbot -c default.yaml

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env
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
# cargo-check       - checks for rust code errors
# cargo-edit        - add, remove, upgrade dependencies from cli
# cargo-outdated    - indicates when Rust dependencies are out of date
# cargo-watch       - reload cargo commands on file save
cargo install bat exa fd-find just qc ripgrep cargo-check cargo-edit cargo-outdated cargo-watch watchexec
source ~/.bashrc

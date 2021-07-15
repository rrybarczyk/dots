#  Error if variable undefined, print each command
# set -euf -o pipefile

sudo apt update

# Setup dotbot and link files
git submodule update --init --recursive .
SHELL=sh ./submodules/dotbot/bin/dotbot -c default.yaml


# Install shell to zsh
sudo apt install zsh

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo apt install cmake pkg-config libssl-dev

# Install latest neovim
sudo apt install libtool automake libncurses5-dev g++
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim


# Better search to supplement fzf vim plugin
sudo apt install silversearcher-ag

# Python linting
sudo apt install flake8

# Install vim-plug package manager
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
	       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'


# Install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

source ~/.zshrc

# Install useful rustup tools and global crates
rustup install nightly
rustup component add rustfmt
rustup component add clippy
rustup component add rust-src

# fd-find           - a better find
# just              - a better make <3
# qc                - an advanced RPN cli calculator
# ripgrep           - a better grep
# cargo-check       - checks for rust code errors
# cargo-watch       - reload cargo commands on file save
cargo install fd-find just qc ripgrep cargo-check cargo-add cargo-watch

# Install rust-analyzer for neovim rust LSP support
# https://rust-analyzer.github.io/manual.html#rust-analyzer-language-server-binary
curl -L https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz | gunzip -c - > ~/.local/bin/rust-analyzer
chmod +x ~/.local/bin/rust-analyzer

# DotBot Setup
git submodule update --init --recursive .
./submodules/dotbot/bin/dotbot -c default.yaml

# Force symlink bash scripts
# ln -sf ~/.dots/etc/bashrc ~/.bashrc
# ln -sf ~/.dots/etc/bash_profile ~/.bash_profile
# ln -sf ~/.dots/etc/profile ~/.profile
source ~/.zshrc



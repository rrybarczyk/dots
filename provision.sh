# For MacOSx
# Exit script upon fail, error if variable undefined, print each command
set -euxo pipefail

## Change default shell from zsh to bash (change back with `$ chsh -s /bin/zsh`)
## chsh -s /bin/bash
#
## Install brew package manger
#/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
#
#brew install tmux wget imagemagick htop tree lolcat lastpass-cli watchexec gnu-time gnupg2 git-lfs tmux-mem-cpu-load
#brew cask install mactex-no-gui
#brew cask install ngrok
#brew cask install wireshark

# Install Rust
curl -sSf https://sh.rustup.rs | sh
source ~/.profile
rustup install nightly
rustup component add rustfmt
rustup component add clippy

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
cargo install just
cargo install bat exa fd-find hexyl qc ripgrep xsv cargo-check cargo-edit cargo-outdated cargo-watch

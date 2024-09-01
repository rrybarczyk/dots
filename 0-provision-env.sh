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
sudo apt install ripgrep fd-find fswatch tldr just wget -y
sudo apt install fzf -y
# Better search to supplement fzf vim plugin
sudo apt install silversearcher-ag -y


# Set global git username + email
git config --global user.name "RJ Rybarczyk"
git config --global user.email "rj@rybar.tech"

ln -s $(which fdfind) ~/.local/bin/fd

# Force symlink bash scripts
ln -sf ~/.dots/etc/bashrc ~/.bashrc
ln -sf ~/.dots/etc/bash_profile ~/.bash_profile

git remote remove origin
git remote add origin git@github.com:rrybarczyk/dots.git

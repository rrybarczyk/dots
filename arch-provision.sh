# exit script upon fail, error if variable undefined, print each command
set -euxo pipefail

#
# Add useful things to .bash_profile
#
echo 'export XDG_DATA_HOME="$HOME"/.local/share' >> ~/.bash_profile
echo 'export XDG_CONFIG_HOME="$HOME"/.config' >> ~/.bash_profile
echo 'export XDG_CACHE_HOME="$HOME"/.cache' >> ~/.bash_profile
echo 'export XDG_DATA_DIRS=/usr/local/share:/usr/share' >> ~/.bash_profile
echo 'export XDG_CONFIG_DIRS=/etc/xdg' >> ~/.bash_profile

# Auto sign git commits
echo 'export GPG_TTY=$(tty)' >> ~/.bash_profile

# 
# Install packages
#
pacman -S --noconfirm sudo 

# Update installed packages
sudo pacman -Syu --noconfirm

# Install packages if they do not already exist, default "y"
sudo pacman -S --noconfirm --needed vim tmux git bash dhcpcd networkmanager netctl less tree make gnu-netcat ngrep openssl make gcc cmake ufw  pkg-config 

# Enviornment
sudo pacman -S --noconfirm --needed dmenu i3status i3-gaps intelucode slock terminus-font xclip wget xorg-server unzip clang socat feh

# To enable audio
sudo pacman -S --noconfirm --needed alsa-utils

# Fun sounds
sudo pacman -S --noconfirm --needed soundfont-fluid fluidsynth vmpk

# GPU Computing
# sudo pacman -S --noconfirm --needed nvidia cuda
# echo 'export PATH=/opt/cuda/bin:$PATH' >> ~/.bash_profile

# Embedded systems cross compilation
sudo pacman -S --noconfirm --needed qemu qemu-arch-extra arm-none-eabi-gdb openocd

# Docker 
sudo pacman -S --noconfirm --needed docker docker-compose

# Other
sudo pacman -S --noconfirm --needed nodejs npm

# Install rust
curl https://sh.rustup.rs -sSf | sh
source ~/.bash_profile

# Install global rust crates
cargo install just ripgrep fd-find exa xargo strs bat cargo-watch cargo-binutils quick-calc cargo-generate cargo-xbuild

# Install pip for python2
mkdir tmppiptools
cd tmppiptools
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py 
sudo python2 get-pip.py
cd ..
rm -rf tmppiptools
sudo pip install --upgrade pip

# Install aws cli
sudo pip install awscli
sudo pip install awscli --upgrade

#
# Add useful things to .bashrc
#
echo 'set -o vi' >> ~/.bashrc
echo 'alias ls="exa -FG --color-scale --color=always --group-directories-first"' >> ~/.bashrc
echo 'alias ll="exa -laFG --color-scale --color=always --group-directories-first"' >> ~/.bashrc
echo 'alias cat="bat --theme=GitHub --color=always"' >> ~/.bashrc
echo 'alias pbcopy="xclip -sel clip"' >> ~/.bashrc
source ~/.bashrc

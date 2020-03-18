# For Arch OS with Sway windows manager
# Exit script upon fail, error if variable undefined, print each command
set -euxo pipefail

# Update installed packages
sudo pacman -Syu --noconfirm

# Install packages if they do not already exist, default "y"
sudo pacman -S --noconfirm --needed tmux git dhcpcd networkmanager tree ngrep openssl ufw pkg-config base-devel openssh netcat mkpkg

# Wayland Enviornment
sudo pacman -S wayland wayland-protocols meson xorg-server-xwayland egl-wayland libdrm gbm libinput xkbcommon pixman

# Sway Windows Manager Enviornment
sudo pacman -S --noconfirm --needed sway swayidle swaylock rofi slurp grim

# General Enviornment Tools
sudo pacman -S --noconfirm --needed unzip clang feh firefox okular alacritty lolcat alsa-utils lastpass-cli watchexec

sudo pacman -S --noconfirm --needed dbus bluez bluez-utils pulseaudio-bluetooth alsa-plugins pulseaudio pulseaudio-alsa ponymix

# LaTeX Development
sudo pacman -S --noconfirm --needed texlive-most biber r

# Install Rust
curl -sSf https://sh.rustup.rs | sh
source ~/.profile
rustup install nightly
rustup component add rustfmt
rustup component add clippy

# DotBot Setup
git clone https://github.com/rrybarczyk/dots.git ~/.dots
cd ~/.dots && git submodule update --init --recursive .
$(SHELL)=sh ./submodules/dotbot/bin/dotbot -c default.yaml

# Force symlink bash scripts
ln -sf ~/.dots/etc/bashrc ~/.bashrc
ln -sf ~/.dots/etc/bash_profile ~/.bash_profile
ln -sf ~/.dots/etc/profile ~/.profile
source ~/.bashrc

# Install yay package manager
cd ~/aur && git clone https://aur.archlinux.org/yay.git
cd ~/aur/yay && makepkg -sic
cd ~

# Install aur packages
yay -S --needed --noconfirm signal-desktop-bin

yay -Syu

# For Arch OS with Sway windows manager
# Exit script upon fail, error if variable undefined, print each command
set -euxo pipefail

# Update installed packages
sudo pacman -Syu --noconfirm

# Install yay package manager
mkdir -p ~/aur
cd ~/aur && git clone https://aur.archlinux.org/yay.git
cd ~/aur/yay && makepkg -sic
cd ~

# Install packages if they do not already exist, default "y"
yay -S --noconfirm --needed tmux git dhcpcd networkmanager openssl ufw pkg-config base-devel intelucode openssh mkpkg clang

# X and  i3 Windows Manager Enviornment
yay -S --noconfirm --needed xorg-server xorg-xinit dmenu i3status i3-gaps slock xclip xorg-xeyes

# General Enviornment Tools
yay -S --noconfirm --needed unzip clang feh firefox okular alacritty lolcat alsa-utils lastpass-cli watchexec wget socat netcat unzip ngrep tree inkscape
yay -S --noconfirm --needed dbus bluez bluez-utils pulseaudio-bluetooth alsa-plugins pulseaudio pulseaudio-alsa ponymix

# Vulkan
yay -S --noconfirm --needed vulkan-tools vulkan-dev vulkan-intel

# GLFW to manage windows for my Vulkan apps, install glfw-x11 for when I use i3wm, and glfw-wayland for when I use sway
yay -S --noconfirm --needed glfw-x11 glfw-wayland

# GLM - linear algebra lib for my Vulkan apps
yay -S --noconfirm --needed glm

# Shader tools, lib, and tests for shader compiler
yay -S --noconfirm --needed shaderc

# LaTeX Development
yay -S --noconfirm --needed texlive-most biber r

# Install Rust
curl -sSf https://sh.rustup.rs | sh
source ~/.profile
rustup install nightly
rustup component add rustfmt
rustup component add clippy
cargo install cargo-edit

# DotBot Setup
git clone https://github.com/rrybarczyk/dots.git ~/.dots
cd ~/.dots && git submodule update --init --recursive .
$(SHELL)=sh ./submodules/dotbot/bin/dotbot -c default.yaml
cd ~/.dots && just

# Force symlink bash scripts
source ~/.bashrc

# Install aur packages
# Chat apps
yay -S --needed --noconfirm signal-desktop-bin discord

# Make DRM work on firefox
yay -S --needed --noconfirm hal-info hal

# GLFW
yay -S --needed --noconfirm glfw-x11 glew

yay -S --needed --noconfirm spotify

yay -Syu

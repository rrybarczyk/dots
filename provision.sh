# exit script upon fail, error if variable undefined, print each command
set -euxo pipefail

pacman -S --noconfirm sudo 

# Update installed packages
sudo pacman -Syu --noconfirm

# Install packages if they do not already exist, default "y"
sudo pacman -S --noconfirm --needed vim tmux git bash dhcpcd networkmanager netctl less tree make gnu-netcat ngrep openssl make gcc cmake ufw

# Enviornment
sudo pacman -S --noconfirm --needed dmenu i3status i3-gaps intelucode slock terminus-font xclip wget xorg-server unzip

# To enable audio
sudo pacman -S --noconfirm --needed alsa-utils

# Fun sounds
sudo pacman -S --noconfirm --needed soundfont-fluid fluidsynth vmpk

# sudo pacman -S --noconfirm --needed nvidia cuda pkg-config clang

# Install rust
curl https://sh.rustup.rs -sSf | sh

# Install global rust crates
cargo install just ripgrep fd-find exa xargo strs





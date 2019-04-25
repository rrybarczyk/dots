#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# https://wiki.archlinux.org/index.php/XDG_Base_Directory
export XDG_DATA_HOME="$HOME"/.local/share
export XDG_CONFIG_HOME="$HOME"/.config
export XDG_CACHE_HOME="$HOME"/.cache
export XDG_DATA_DIRS=/usr/local/share:/usr/share
export XDG_CONFIG_DIRS=/etc/xdg

# Auto sign git commits
export GPG_TTY=$(tty)

# Rust
# export PATH="/home/rj/.local/share/cargo/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/usr/local/bin/aarch64-none-elf/bin:$PATH"

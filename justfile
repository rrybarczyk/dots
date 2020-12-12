default:
	git submodule update --init --recursive .
	SHELL=sh ./submodules/dotbot/bin/dotbot -c default.yaml

monitors-bigbeefy:
  xrandr --output DisplayPort-0 --auto --rotate normal --output HDMI-A-0 --auto --left-of DisplayPort-0

# `"DP-1" left`, `"HDMI-2 right"`
t480-monitors DISPLAY SIDE:
  xrandr --output eDP-1 --auto --rotate normal --output {{DISPLAY}} --auto --{{SIDE}}-of eDP-1

three-monitors:
  xrandr --output eDP-1 --auto --output HDMI-2 --auto --right-of eDP-1 --output DP-1 --auto --left-of eDP-1

# Turn keyboard backlight on
bl-on:
  echo 2 | sudo tee /sys/class/leds/tpacpi\:\:kbd_backlight/brightness 

# Turn keyboard backlight off
bl-off:
  echo 0 | sudo tee /sys/class/leds/tpacpi\:\:kbd_backlight/brightness 

# Adjust screen brightness levels
b BRIGHTNESS:
  echo -n {{BRIGHTNESS}} > /sys/class/backlight/intel_backlight/brightness

b-low:
  echo -n 100 > /sys/class/backlight/intel_backlight/brightness

b-mid:
  echo -n 500 > /sys/class/backlight/intel_backlight/brightness

b-high:
  echo -n 999 > /sys/class/backlight/intel_backlight/brightness

which-gpu:
  lspci -k | grep -A 2 -E "(VGA|3D)"

# SSH into big beefy boi
remote BIG-BEEFY-BOI-USER IP:
  ssh {{BIG-BEEFY-BOI-USER}}@{{IP}} -p 49666

local BIG-BEEFY-BOI-USER:
  ssh {{BIG-BEEFY-BOI-USER}}@192.168.1.167 -p 49666

# Start Matlab without the desktop environment
mlab:
  matlab -nodesktop -nosplash

# Take a screenshot with ImageMagick (i3)
sshot IMAGE:
  import {{IMAGE}}

# Take a screenshot (sway)
# sshot:
#   slurp | grim -g - /home/rj/Pictures/ScreenShots/$(date +'%s_grim.png')

# Show all devices connected to my network
network-devices:
  sudo nmap -sP -PS22 192.168.1.160/24

# Pass in youtube link
# Ex: $ just yt-to-wave "https://youtu.be/IF7wc5Le-4g"
# Source: https://ma.ttias.be/youtube-dl-download-audio-files-youtube-mac
yt-to-wav YT_LINK:
  youtube-dl --extract-audio --audio-format wav --prefer-ffmpeg {{YT_LINK}}

# Pass in path to .mp3 or .mp4
# Ex: $ just mpx-to-wav
# Source: https://github.com/lbgists/audio-spectrum-matplotlib/blob/master/merge.sh
mpx-to-wav MPX:
  ffmpeg -i temp.mp4 -i temp.wav -vcodec copy -acodec libmp3lame {{MPX}}

nmap-ip:
  sudo nmap -sP -PS22 192.168.1.0/24

figlet-clock:
  while true; do tput clear; date +"%H : %M : %S" | figlet ; sleep 1; done

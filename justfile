default:
	git submodule update --init --recursive .
	SHELL=sh ./submodules/dotbot/bin/dotbot -c default.yaml

monitors-bigbeefy:
  xrandr --output DisplayPort-0 --auto --rotate normal --output HDMI-A-0 --auto --left-of DisplayPort-0

monitors-t480:
  xrandr --output eDP-1 --auto --rotate normal --output HDMI-2 --auto --right-of eDP-1

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

# SSH into big beefy boi
remote BIG-BEEFY-BOI-USER IP:
  ssh {{BIG-BEEFY-BOI-USER}}@{{IP}} -p 49666

local BIG-BEEFY-BOI-USER:
    ssh {{BIG-BEEFY-BOI-USER}}@192.168.1.167 -p 49666

# Start Matlab without the desktop environment
mlab:
  matlab -nodesktop -nosplash

# Take a screenshot
sshot:
    slurp | grim -g - /home/rj/Pictures/ScreenShots/$(date +'%s_grim.png')

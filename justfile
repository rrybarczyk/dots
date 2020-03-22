default:
	git submodule update --init --recursive .
	SHELL=sh ./submodules/dotbot/bin/dotbot -c default.yaml

monitors-bigbeefy:
  xrandr --output DisplayPort-0 --auto --rotate normal --output HDMI-A-0 --auto --left-of DisplayPort-0

montiors-t480:
  xrandr --output eDP-1 --auto --rotate normal --output HDMI-2 --auto --right-of eDP-1

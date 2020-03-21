default:
	git submodule update --init --recursive .
	SHELL=sh ./submodules/dotbot/bin/dotbot -c default.yaml

orient-monitors:
  xrandr --output DisplayPort-0 --auto --rotate normal --output HDMI-A-0 --auto --left-of DisplayPort-0

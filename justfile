default:
	git submodule update --init --recursive .
	SHELL=sh ./submodules/dotbot/bin/dotbot -c default.yaml

open-connection:
  ngrok tcp 22

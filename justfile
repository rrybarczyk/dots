default:
	git submodule update --init --recursive .
	./dotbot/bin/dotbot -c install.conf.yaml

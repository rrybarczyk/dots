default:
	git submodule update --init --recursive .
	SHELL=sh ./submodules/dotbot/bin/dotbot -c default.yaml


rustup:
	curl -sSf https://sh.rustup.rs | sh

rust:
	rustup install nightly
	rustup component add rustfmt
	rustup component add clippy

crates:
	cargo install --force ripgrep 
	cargo install --force exa
	cargo install --force bat
	cargo install --force fd-find
	cargo install --force just
	cargo install --force cargo-watch
	cargo install --force cargo-check
	cargo install --force cargo-outdated
	cargo install --force cargo-edit
	cargo install --force quick-calc
	cargo install --force strs
